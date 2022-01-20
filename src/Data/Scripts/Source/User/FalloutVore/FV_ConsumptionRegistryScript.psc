Scriptname FalloutVore:FV_ConsumptionRegistryScript extends Quest
{Tracks who has eaten whom. Specifically monitors the Prey actors' relationship to their current predator
so that in the event of vomit or escape they can reappear at the correct location. Also facilitates looking up a prey
actor, or returning a list of prey actors given a predator actor.}

Function Trace(string asFunction, string asMessage = "") Global debugOnly
	string logName = "FalloutVore"
	Debug.OpenUserLog(logName)
    Debug.TraceUser(logName, "[FalloutVore:FV_ConsumptionRegistryScript] " + asFunction + " - " + asMessage)	
EndFunction

Group ActorValues
	ActorValue Property HealthAV Auto Const Mandatory
	ActorValue Property FV_AcidDamage Auto Const Mandatory
	ActorValue Property FV_AcidResistance Auto Const Mandatory
	ActorValue Property FV_AcidStrengthValue Auto Const Mandatory
	ActorValue Property FV_BlockSwallowFlag Auto Const Mandatory
	ActorValue Property FV_CurrentAlivePrey Auto Const Mandatory
	ActorValue Property FV_RegurgitateBool Auto Const Mandatory
EndGroup

Group Misc
	Actor Property PlayerRef Auto Const Mandatory
	Keyword Property ActorTypeRobot Auto Const Mandatory
	GlobalVariable Property FV_DigestCompanionProtection Auto
	GlobalVariable Property FV_KillEssentialEnabled Auto
	Faction Property HasBeenCompanionFaction Auto Const Mandatory
	ObjectReference Property FV_StomachCellMarker Auto Const Mandatory
	Ammo Property AmmoFusionCell Auto Const Mandatory
	Potion Property FV_RemoveSwallowProtection Auto Const Mandatory
	LeveledItem Property LLD_VEV_Crystals_Prey_FV_ Auto Const Mandatory
EndGroup

Group Perks
	Perk Property FV_ContextVorePerk Auto Const Mandatory
	Perk Property FV_DigestInvulnerability Auto Const Mandatory
	Perk Property FV_HighIronDiet03  Auto Const Mandatory
EndGroup

Group Scripts
	FalloutVore:FV_ActorDataScript Property FV_ActorData Auto Const Mandatory
	FalloutVore:FV_VoreSurvivalScript Property FV_VoreSurvival Auto Const Mandatory
	FalloutVore:FV_StomachSimScript Property FV_StomachSim Auto Const Mandatory
	FalloutVore:FV_FalloutVoreScript Property FV_FalloutVore Auto Const Mandatory
EndGroup

CustomEvent OnSwallow
CustomEvent OnVomit
CustomEvent OnDigestProtection
CustomEvent OnDigestionDamage
; Triggered whenever prey is damaged by digestion. args[0] = Actor akPred, args[1] = Actor akPrey
CustomEvent OnDigestionComplete
; Triggered whenever prey is fully digested. args[0] = Actor akPred, args[1] = Actor akPrey
CustomEvent OnAdd
; Triggered whenever prey is added to the ConsumptionRegistry. args[0] = Actor akPred, args[1] = Actor akPrey
CustomEvent OnRemove
; Triggered whenever prey is removed from the ConsumptionRegistry. args[0] = Actor akPred, args[1] = Actor akPrey

; Quest Script Setup Boilerplate
int Version = 0
Function Setup(int aiVersion = 1) ; Increment version as needed.
    if Version < aiVersion
		PlayerRef.AddPerk(FV_ContextVorePerk)
        RegisterForRemoteEvent(PlayerRef, "OnPlayerLoadGame")
		RegisterForCustomEvent(FV_FalloutVore, "VoreGameTick")
		FV_VoreSurvival.RegisterForVoreSurvival(True)
        Version = aiVersion
    EndIf
EndFunction

Event OnInit()
    Setup()
EndEvent

Event Actor.OnPlayerLoadGame(Actor akSender)
    Setup()
EndEvent

;******************************************************************************
; CONSUMPTION REGISTRY
; Tracks which actor ate each prey.
;*****************************
Struct PreyData
	Actor Pred
	Actor Prey
	Int Tick	; To create a delay between 'transfer' 'swallow' 'vomit'
	Bool IsLethal
EndStruct
PreyData[] ConsumptionRegistry

; Adds a prey to the ConsumptionRegistry
int Function Add(Actor akPred, Actor akPrey, Bool abIsLethal = false)
	if ConsumptionRegistry == None
		ConsumptionRegistry = new PreyData[0]
	EndIf

	int i = ConsumptionRegistry.FindStruct("prey", akPrey)
	If  i > 0
		Return i ; Prey already in registry.
	EndIf

	if ConsumptionRegistry.Length >= 128
		Return -1
	endif

	PreyData data = new PreyData
	data.Pred = akPred
	data.Prey = akPrey
	data.IsLethal = abIsLethal
	ConsumptionRegistry.Add(data)
	Var[] args = new Var[2]
	args[0] = akPred
	args[1] = akPrey
	SendCustomEvent("OnAdd", args)
	Return ConsumptionRegistry.Length - 1
EndFunction

; Remove a prey from the ConsumptionRegistry
bool Function Remove(Actor akPrey)
	int i = ConsumptionRegistry.FindStruct("prey", akPrey)
	if i < 0
		Return false
	else
		Actor pred = GetPred(akPrey)
		ConsumptionRegistry.Remove(i)
		Var[] args = new Var[2]
		args[0] = pred
		args[1] = akPrey
		SendCustomEvent("OnRemove", args)
		Return true
	Endif
EndFunction

; Return all prey for a given pred
Actor[] Function GetAllPrey(Actor akPred)
	Actor[] prey = new Actor[0]
	int i = 0
	While i < ConsumptionRegistry.Length && i < 128
		If ConsumptionRegistry[i].pred == akPred
			prey.Add(ConsumptionRegistry[i].prey)
		EndIf
		i += 1
	EndWhile
	Return prey
EndFunction

; Get the predator for a given prey
Actor Function GetPred(Actor akPrey)
	Return GetDataByPrey(akPrey).pred
EndFunction

Actor Function GetPrey(Actor akPred)
	Return GetDataByPred(akPred).prey
EndFunction

PreyData Function GetDataByPrey(Actor akPrey)
	int i = ConsumptionRegistry.FindStruct("prey", akPrey)
	if i < 0
		Return None
	EndIf
	Return ConsumptionRegistry[i]
EndFunction

PreyData Function GetDataByPred(Actor akPred)
	int i = ConsumptionRegistry.FindStruct("pred", akPred)
	if i < 0
		Return None
	EndIf
	Return ConsumptionRegistry[i]
EndFunction

; *******END ConsumptionRegistry ********

; Updates the AVs for current stomach contents, and also updates armor, heavy pred perks, and vore hud.
Function UpdateCurrentInStomach(Actor akPred = None, bool updateFullness = false)
	; trace("UpdateCurrentInStomach()")
	Actor[] preys = GetAllPrey(akPred)
	int alivePrey = 0
	int humanPrey = 0
	int i = 0
	While i < preys.Length && i < 128
		If (!preys[i].isDead())
			alivePrey += 1
		EndIf
		If (FV_ActorData.GetIsHumanoid(preys[i]))
			humanPrey += 1
		EndIf
		i += 1
	EndWhile

	akPred.SetValue(FV_CurrentAlivePrey, alivePrey)
EndFunction

;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; Public functions

;Vomits up the prey
function PerformVomit(Actor akPrey)
	PreyData data = GetDataByPrey(akPrey)
	Actor pred = data.Pred
	
	Var[] kArgs = new Var[2]
	kArgs[0] = pred	
	kArgs[1] = akPrey
	SendCustomEvent("OnVomit", kArgs)
	akPrey.MoveTo(pred)
	Remove(akPrey)
	FV_StomachSim.PurgeIndigestible(pred, FV_ActorData.EvaluateSlots(akPrey))
EndFunction

;************************************************************************************
;************************************************************************************
; Vore events

; Does a lot of game mechanics stuff to handle a swallow. Everything from setting AVs, messing with the camera and belly, and manipulating player input. Way too much.
int Function ProcessSingleSwallow(Actor akPred, Actor akPrey, bool abLethalFlag)
	; Trace("ProcessSingleSwallow()")
	int consumeIndex = Add(akPred, akPrey, abLethalFlag)
	If(consumeIndex < 0)
		; Trace("ProcessSingleSwallow()", "Unable to Add")
		Return consumeIndex
	EndIf
	akPrey.MoveTo(FV_StomachCellMarker)

	FV_StomachSim.AddIndigestible(akPred, FV_ActorData.EvaluateSlots(akPrey))
	; Trace("ProcessSingleSwallow()", "AddIndigestible")

	Var[] akArgs = new Var[3]
	akArgs[0] = akPred
	akArgs[1] = abLethalFlag
	akArgs[2] = akPrey
	SendCustomEvent("OnSwallow", akArgs)
	
	; Trace("ProcessSingleSwallow()", "Finished")
	Return consumeIndex
EndFunction

; returns prey to the world.
Function PerformVoreEventReject(Actor akPred, Actor akPrey)	
	akPrey.MoveTo(akPred)	; Move prey to pred
	akPrey.EquipItem(FV_RemoveSwallowProtection, true, true) ; Forces prey to consume a swallow protection potion so they can't just be reswallowed.
	Var[] akArgs = new Var[3]
	akArgs[0] = akPred
	akArgs[1] = akPrey
	SendCustomEvent("OnVomit", akArgs)
EndFunction

;************************************************************************************
;************************************************************************************
; Digestion events

Event FalloutVore:FV_FalloutVoreScript.VoreGameTick(FalloutVore:FV_FalloutVoreScript akSender, Var[] akArgs)
	DigestionDamageAll(akArgs[0] as float)
EndEvent

Function DigestionDamageAll(float afTimeDelta)
	PreyData data
	int i = 0
	While i < ConsumptionRegistry.Length && i < 128
		data = ConsumptionRegistry[i]
		DigestionDamage(data, afTimeDelta)
		i += 1
	EndWhile
EndFunction

; Deals damage to the prey based on time elapsed.
function DigestionDamage(PreyData data, float afTimeDelta)
	; trace("DigestionDamage()")
	Actor prey = data.Prey
	Actor pred = data.Pred

	; Dead pred autovomit
	if(pred.IsDead())
		PerformVomit(prey)
		Return
	EndIf
	
	; TODO: For some reason in the Museum of Freedom in Concord, all the raiders return TRUE for IsDead().
	If(prey.IsDead())
		Trace("DigestionDamage()", "Prey already dead!" + prey + " HP:" + prey.GetValue(HealthAV))
		DigestionComplete(prey)
		return
	EndIf
	
	if(!data.IsLethal)
		; trace("DigestionDamage", "Not Lethal")
		; If you set manual regurgitation, do the vomit and reset.
		If(pred.GetValue(FV_RegurgitateBool) == 1)
			;Reset regurgetate bool
			pred.SetValue(FV_RegurgitateBool, 0)
			
			;Vomit
			PerformVomit(prey)
		EndIf
		Return
	EndIf

	; TODO: AcidDamage should be DPS. If it's insanely high, go find where it is created and reduce.
	Float DamageDealt = pred.GetValue(FV_AcidDamage)*(1-prey.GetValue(FV_AcidResistance)) * afTimeDelta
	Trace("DigestionDamage()", prey + " HP: " + prey.GetValue(HealthAV) + " DD: " + DamageDealt)
	; If we might kill the prey
	If(prey.GetValue(HealthAV) - DamageDealt <= 0)										;Check if prey will die from damage.  If so, perform special handling
		; trace("DigestionDamage()", "damage greater than current health of enemny")
		If(prey.HasPerk(FV_DigestInvulnerability)) ; If invulnerable to digestion, force vomit the prey
			Var[] kArgs = new Var[2]
			kArgs[0] = pred
			kArgs[1] = prey
			SendCustomEvent("OnDigestProtection", kArgs)
			PerformVomit(prey)
			return
		ElseIf(prey.IsInFaction(HasBeenCompanionFaction)) ; If someone is digesting a companion
			If(FV_DigestCompanionProtection.GetValue()>0) ;Put companions in bleed out and then vomit them up
				prey.DamageValue(HealthAV, DamageDealt)														
				PerformVomit(prey)
				return
			ElseIf(FV_KillEssentialEnabled.GetValue() == 1)
				prey.KillEssential(pred)
			EndIf
		ElseIf(FV_KillEssentialEnabled.GetValue() == 1 && prey.IsEssential())
			prey.KillEssential(pred)
		Else
			Trace("DigestionDamage()", prey + " Lethal digestion damage")
			prey.Kill(pred)
			DigestionComplete(prey)
			Return
		EndIf
	Else
		prey.DamageValue(HealthAV, DamageDealt) ;if prey was not meant to die, deal damage to it now
		Var[] args = new Var[2]
		args[0] = pred
		args[1] = prey
		SendCustomEvent("OnDigestionDamage", args)
	EndIf
EndFunction

;End of lethal vore. Clears up variables and runs post vore actions TODO: Scat + other post vore options
; Does a lot, sounds, RPG stuff, Vore mechanics, move the inventories
function DigestionComplete(Actor akPrey)
	Trace("DigestionComplete()", akPrey)
	Actor pred = GetPred(akPrey)

	; OH HEY, if you ate a robot, you get some fusion cells! Isn't this a good place to do that? KEILLA: It is not.
	If(akPrey.HasKeyword(ActorTypeRobot) && pred.HasPerk(FV_HighIronDiet03))		
		pred.Additem(AmmoFusionCell, akPrey.GetLevel()/2 as int, false)		
	EndIf

	pred.AddItem(LLD_VEV_Crystals_Prey_FV_, 1, true)
	akPrey.RemoveAllItems(pred)

	;eliminate corpse and move back to original spawn location for cell reset
	akPrey.SetCriticalStage(4) ; The prey corpse is vaporized so it does not render.
	akPrey.MoveToMyEditorLocation()
	; trace("DigestionComplete()", "Prey NPC has been moved back to original editor location")
	
	Remove(akPrey)
	FV_StomachSim.ShiftIndigestibleToDigestiblePrey(pred, FV_ActorData.EvaluateSlots(akPrey), akPrey)
	Var[] args = new Var[1]
	args[0] = pred
	args[1] = akPrey
	SendCustomEvent("OnDigestionComplete", args)
	; trace("DigestionComplete()", "PerformDigestion - Done")
EndFunction