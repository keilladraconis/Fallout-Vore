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
	ActorValue Property EnduranceAV Auto Const Mandatory
	ActorValue Property HealthAV Auto Const Mandatory
	ActorValue Property FV_AcidDamage Auto Const Mandatory
	ActorValue Property FV_AcidResistance Auto Const Mandatory
	ActorValue Property FV_AcidStrengthValue Auto Const Mandatory
	ActorValue Property FV_BlockSwallowFlag Auto Const Mandatory
	ActorValue Property FV_CurrentAlivePrey Auto Const Mandatory
	ActorValue Property FV_DigestionSpeed Auto Const Mandatory
	ActorValue Property FV_DigestionStage Auto Const Mandatory
	ActorValue Property FV_DigestionStarted Auto Const Mandatory
	ActorValue Property FV_EscapeChance Auto Const Mandatory
	ActorValue Property FV_EscapeDamage Auto Const Mandatory
	ActorValue Property FV_HasBloating Auto Const Mandatory
	ActorValue Property FV_HasHadNukaAcid Auto Const Mandatory
	ActorValue Property FV_HumanPreyCount Auto Const Mandatory
	ActorValue Property FV_IndigestionChanceOnNextDigest Auto Const Mandatory
	ActorValue Property FV_IndigestionResistance Auto Const Mandatory
	ActorValue Property FV_IndigestionSeverityFlag Auto Const Mandatory
	ActorValue Property FV_ReadyToDigest Auto Const Mandatory
	ActorValue Property FV_ReformChance Auto Const Mandatory
	ActorValue Property FV_Scatready Auto Const Mandatory
	ActorValue Property FV_BellyCapacity Auto Const Mandatory
	ActorValue Property FV_StomachStrength Auto Const Mandatory
	ActorValue Property FV_TicksTillEscape Auto Const Mandatory
	ActorValue Property FV_Entrapment Auto Const Mandatory
	ActorValue Property FV_TicksTillEscapeStart Auto Const Mandatory
	ActorValue Property FV_RegurgitateBool Auto Const Mandatory
EndGroup

Group Ammo
	Ammo Property AmmoFusionCell Auto Const Mandatory
EndGroup

Group Armor
	VoreArmor[] Property VoreBellyArray Auto
	Armor[] Property DigestionArmor Auto
EndGroup

Group Cells
	ObjectReference Property FV_BellyContainer  Auto
	ObjectReference Property FV_CompanionBellyContainer Auto
	Container Property FV_NPCBellyContainer Auto Const Mandatory
	ObjectReference Property FV_StomachCellMarker Auto Const Mandatory
EndGroup

Group Factions
	Faction Property CurrentCompanionFaction Auto Const Mandatory
	Faction Property FV_PredPreyFaction Auto
	Faction Property HasBeenCompanionFaction Auto Const Mandatory
	Faction Property WorkshopDialogueFaction Auto Const Mandatory
	Faction Property WorkshopNPCFaction Auto Const Mandatory
EndGroup

Group Formlists
	FormList Property FV_PredPreyFormList Auto
EndGroup

Group Globals
	GlobalVariable Property FV_NPCScatEnabled Auto
	GlobalVariable Property FV_ClothesRipChance Auto
	GlobalVariable Property FV_DigestCompanionProtection Auto
	GlobalVariable Property FV_HasItemsInBellyBool Auto
	GlobalVariable Property FV_IndigestionChanceBase Auto
	GlobalVariable Property FV_KillEssentialEnabled Auto
	GlobalVariable Property FV_PerkPoints Auto
	GlobalVariable Property FV_ScatEnabled Auto
	GlobalVariable Property FV_SwallowCommentChance Auto
	GlobalVariable Property FV_DigestionSpeedBase Auto
	GlobalVariable Property TimeScale Auto
	GlobalVariable Property FV_AllowHeavyPred Auto
	GlobalVariable Property FV_CompanionScat Auto
	GlobalVariable Property FV_PlayerAsPreyContext Auto ; Magic Number. 2 = lethal, 1 = non-lethal
	GlobalVariable Property FV_ManualDigestionEnabled Auto
	GlobalVariable Property FV_VoreLevelPoints Auto
EndGroup

Group Holotapes
	Holotape Property FV_FalloutVoreHolotape Auto Const Mandatory
EndGroup

Group Keywords
	Keyword Property ActorTypeRobot Auto Const Mandatory
EndGroup

Group Messages
	Message Property FV_CannotSwallowCapacityMessage Auto Const Mandatory
	Message Property FV_CannotSwallowIndigestionMessage Auto Const Mandatory
	Message Property FV_ClothesRipMessage Auto Const Mandatory
	Message Property FV_GainedAPerkMessage Auto Const Mandatory
	Message Property FV_IndigestionMinorMessage Auto Const Mandatory
	Message Property FV_IndigestionNormalMessage Auto Const Mandatory
	Message Property FV_IndigestionMajorMessage Auto Const Mandatory
	Message Property FV_IndigestionSevereMessage Auto Const Mandatory
	Message Property FV_LevelUpMessage Auto Const Mandatory
	Message Property FV_ReadyToDigestMessage Auto Const Mandatory
	Message Property FV_ReadyToScatMessage Auto Const Mandatory
	Message Property FV_SleepWaitDisruptMessage Auto Const Mandatory
	Message Property FV_TooFullMessage Auto Const Mandatory
	Message Property FV_TheHungerMessage Auto Const Mandatory
EndGroup

Group Misc
	EffectShader Property ReformFXS_FV_ Auto Const Mandatory
	ActorBase Property FV_ScatLootCorpse Auto Const Mandatory
	Actor Property PlayerRef Auto Const Mandatory
EndGroup

Group Perks
	Perk Property FV_CauseIndigestion01 Auto Const Mandatory
	Perk Property FV_CauseIndigestion02 Auto Const Mandatory
	Perk Property FV_CauseIndigestion03 Auto Const Mandatory
	Perk Property FV_ContextVorePerk Auto Const Mandatory
	Perk Property FV_DigestInvulnerability Auto Const Mandatory
	Perk Property FV_HighIronDiet03  Auto Const Mandatory
	Perk Property FV_HeavyPredNPC Auto Const Mandatory
	Perk Property FV_HeavyPredPlayer Auto Const Mandatory
	Perk Property FV_PlayerSwallowAbility Auto Const Mandatory
	Perk Property FV_PredSneakDebuff Auto Const Mandatory
	Perk Property FV_QuitToMenu Auto Const Mandatory
	Perk Property FV_ReformPerk01 Auto Const Mandatory
	Perk Property FV_ReformPerk02 Auto Const Mandatory
	Perk Property FV_ReformPerk03 Auto Const Mandatory
EndGroup

Group Potions
	Potion Property FV_RegurgitatePotion Auto Const Mandatory
	Potion Property FV_DigestPotion Auto Const Mandatory
	Potion Property FV_ScatPotion Auto Const Mandatory
	Potion Property FV_ContextPreyPotion Auto Const Mandatory
	Potion Property FV_IndigestionEffect Auto Const Mandatory
	Potion Property FV_RemoveSwallowProtection Auto Const Mandatory
EndGroup

Group Scripts
	FalloutVore:FV_ActorDataScript Property FV_ActorData Auto Const Mandatory
	FalloutVore:FV_ColdSteelBellyScript Property FV_ColdSteelBellyQuest Auto Const Mandatory
	FalloutVore:FV_PlayerStruggleScript Property FV_PlayerStruggle Auto Const Mandatory
	FalloutVore:FV_ScatManagerScript Property FV_ScatManager Auto Const Mandatory
	FalloutVore:FV_VoreSurvivalScript Property FV_VoreSurvival Auto Const Mandatory
	FalloutVore:FV_StomachSimScript Property FV_StomachSim Auto Const Mandatory
EndGroup

Group Sounds
	Sound Property FV_FXBurp Auto Const Mandatory
	Sound Property FV_FXClothesRip Auto Const Mandatory
	Sound Property FV_FXStomachGurgle Auto Const Mandatory
	Sound Property FV_FXVomit Auto Const Mandatory
	Sound Property FV_NPCDigestSuccess Auto Const Mandatory
	Sound Property FV_NPCSwallowAttempt Auto Const Mandatory
	Sound Property FV_NPCSwallowFail Auto Const Mandatory
	Sound Property FV_NPCSwallowSuccess Auto Const Mandatory
	Sound Property FV_PlayerDigestSuccess Auto Const Mandatory
	Sound Property FV_PlayerPostSwallowComment Auto Const Mandatory
	Sound Property FV_PlayerSwallowAttempt Auto Const Mandatory
	Sound Property FV_PlayerSwallowFail Auto Const Mandatory
	Sound Property FV_PlayerSwallowSuccess Auto Const Mandatory
EndGroup

Group Spells
	Spell Property FV_spIndigestion Auto Const Mandatory
EndGroup

Group VEVItems
	LeveledItem Property LLD_VEV_Crystals_Prey_FV_ Auto Const Mandatory
EndGroup

Group Weapons
	Weapon Property FV_Swallow Auto Const Mandatory
	Weapon Property FV_SwallowNonLethal Auto Const Mandatory
EndGroup
;end values to be entered through creation kit

inputenablelayer playerLayer
int PreviousPlayerPOV

Bool KillPlayerAsPrey = false
Bool DLC03Patched = False	;Far Harbor
Bool DLC06Patched = False	;Nuka-World
string sCBBEGiantbelly = "Giant belly (coldsteelj)"
string sCBBEVorePreyBelly = "Vore prey belly"

CustomEvent VoreLevelUp
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



; constants
int GhostTimerRemovalID				= 9999999 const	; used to remove Ghost invulnerability from player
int ReformTimerID					= 10000000 const
int DigestTimerID					= 1001			; Single master digestion ticking timer.
Float ColdSteelCounts				= 18.0 const

; Options
int StomachCapacityOverload 		= 2 const   	; max stomach overload, when a predator eat another predator
int StomachCapacityMax		 		= 125 const		; If you increase this value, you must change functions 'ChangeFullnessArmor' 'ChangeDigestFullnessArmor'
bool DigestionAllowsBloating		= True const	; during an indigestion, allows the belly to randomly grow
bool AllowPredReEatPrey				= True const
float DigestionSpeed 				= 1.0 			; Digest ticks once per second.

float Property fCameraDistanceSwallow Auto Hidden
float Property fCameraDistanceVomit Auto Hidden


float PlayerSize = 1.0

; This is for the Gat bellies.
Struct VoreArmor
	Armor HumanVoreBelly
	Armor NonHumanVoreBelly
	Int PreyCount
EndStruct

;Initialise mod
Event OnInit()
	PlayerRef.AddPerk(FV_ContextVorePerk)
	RegisterForRemoteEvent(PlayerRef, "OnPlayerLoadGame")
	RegisterForPlayerSleep()
	RegisterForPlayerWait()
	FV_VoreSurvival.RegisterForVoreSurvival(True)
	RunDLCPatches()
EndEvent

Event Actor.OnPlayerLoadGame(Actor akSender)
	FV_VoreSurvival.RegisterForVoreSurvival(True)
	RunDLCPatches()
EndEvent

Function RunDLCPatches()
;GAZ: Function to detect DLC and add DLC Races to ActorData if present. Should check each time incase user buys DLC and continues save.
;This way is slightly uglier and more script-intensive on first run, but prevents us from needing to make patch-plugins that confuse and clutter load orders.
;I handle this patching here because there's no benefit to patch things before the Registry is fully ready to go.

	IF Game.IsPluginInstalled("DLCCoast.esm") && !DLC03Patched
		
		Perk pApexPredator = Game.GetFormFromFile(0x0000F8EC, "FalloutVore.esm") as Perk Const	;GAZ: Used ofte, so cache here!

		FalloutVore:FV_ActorDataScript:SlotData DLC03Payload = new FalloutVore:FV_ActorDataScript:SlotData
		DLC03Payload.ActorRace = Game.GetFormFromFile(0x000247C1, "DLCCoast.esm") as Race	;GAZ: Gulpers!
		DLC03Payload.IndigestionChanceIncrease = 20
		DLC03Payload.Slots = 12
		DLC03Payload.SwallowMessageToPlay = Game.GetFormFromFile(0x0000C384, "FalloutVore.esm") as Message
		DLC03Payload.SwallowPerkRequired = pApexPredator
		FV_ActorData.InjectAddedInfo(DLC03Payload)

		DLC03Payload = new FalloutVore:FV_ActorDataScript:SlotData
		DLC03Payload.ActorRace = Game.GetFormFromFile(0x000180A8, "DLCCoast.esm") as Race	;GAZ: Hermit Crabs!
		DLC03Payload.IndigestionChanceIncrease = 20
		DLC03Payload.Slots = 12
		DLC03Payload.SwallowMessageToPlay = Game.GetFormFromFile(0x0000C385, "FalloutVore.esm") as Message
		DLC03Payload.SwallowPerkRequired = pApexPredator
		FV_ActorData.InjectAddedInfo(DLC03Payload)

		DLC03Payload = new FalloutVore:FV_ActorDataScript:SlotData
		DLC03Payload.ActorRace = Game.GetFormFromFile(0x0004E28E, "DLCCoast.esm") as Race	;GAZ: Small Gulpers!
		DLC03Payload.CanAlwaysSwallow = True
		DLC03Payload.IndigestionChanceIncrease = 5
		DLC03Payload.Slots = 3
		FV_ActorData.InjectAddedInfo(DLC03Payload)

		DLC03Payload = new FalloutVore:FV_ActorDataScript:SlotData
		DLC03Payload.ActorRace = Game.GetFormFromFile(0x0000FEEA, "DLCCoast.esm") as Race	;GAZ: Anglers!
		DLC03Payload.CanAlwaysSwallow = True
		DLC03Payload.IndigestionChanceIncrease = 5
		DLC03Payload.Slots = 4
		FV_ActorData.InjectAddedInfo(DLC03Payload)

		DLC03Payload = new FalloutVore:FV_ActorDataScript:SlotData
		DLC03Payload.ActorRace = Game.GetFormFromFile(0x00014174, "DLCCoast.esm") as Race	;GAZ: Fog Crawlers!
		DLC03Payload.IndigestionChanceIncrease = 20
		DLC03Payload.Slots = 12
		DLC03Payload.SwallowMessageToPlay = Game.GetFormFromFile(0x0000C386, "FalloutVore.esm") as Message
		DLC03Payload.SwallowPerkRequired = pApexPredator
		FV_ActorData.InjectAddedInfo(DLC03Payload)

		DLC03Payload = new FalloutVore:FV_ActorDataScript:SlotData
		DLC03Payload.ActorRace = Game.GetFormFromFile(0x0003FD66, "DLCCoast.esm") as Race	;GAZ: Rad Chickens!
		DLC03Payload.CanAlwaysSwallow = True
		DLC03Payload.Slots = 1
		FV_ActorData.InjectAddedInfo(DLC03Payload)

		DLC03Payload = new FalloutVore:FV_ActorDataScript:SlotData
		DLC03Payload.ActorRace = Game.GetFormFromFile(0x0003DDDE, "DLCCoast.esm") as Race	;GAZ: Rad Rabbits!
		DLC03Payload.CanAlwaysSwallow = True
		DLC03Payload.Slots = 1
		FV_ActorData.InjectAddedInfo(DLC03Payload)

		Debug.Notification("FalloutVore detected Far Harbor DLC and patched it.")	;GAZ: Feedback is important so the player knows it's working.
		DLC03Patched = True

	EndIf

	IF Game.IsPluginInstalled("DLCNukaWorld.esm") && !DLC06Patched
		
		Perk pApexPredator = Game.GetFormFromFile(0x0000F8EC, "FalloutVore.esm") as Perk Const	;GAZ: Used ofte, so cache here!

		FalloutVore:FV_ActorDataScript:SlotData DLC06Payload = new FalloutVore:FV_ActorDataScript:SlotData
		DLC06Payload.ActorRace = Game.GetFormFromFile(0x0003637A, "DLCNukaWorld.esm") as Race	;GAZ: Gatorclaws!
		DLC06Payload.IndigestionChanceIncrease = 20
		DLC06Payload.Slots = 12
		DLC06Payload.SwallowMessageToPlay = Game.GetFormFromFile(0x0000C383, "FalloutVore.esm") as Message
		DLC06Payload.SwallowPerkRequired = pApexPredator
		FV_ActorData.InjectAddedInfo(DLC06Payload)

		DLC06Payload = new FalloutVore:FV_ActorDataScript:SlotData
		DLC06Payload.ActorRace = Game.GetFormFromFile(0x0000AAFE, "DLCNukaWorld.esm") as Race	;GAZ: Cave Crickets!
		DLC06Payload.CanAlwaysSwallow = True
		DLC06Payload.IndigestionChanceIncrease = 5
		DLC06Payload.Slots = 2
		FV_ActorData.InjectAddedInfo(DLC06Payload)

		DLC06Payload = new FalloutVore:FV_ActorDataScript:SlotData
		DLC06Payload.ActorRace = Game.GetFormFromFile(0x0004CBCE, "DLCNukaWorld.esm") as Race	;GAZ: Ghoulrillas!
		DLC06Payload.IndigestionChanceIncrease = 20
		DLC06Payload.Slots = 9
		DLC06Payload.SwallowMessageToPlay = Game.GetFormFromFile(0x0000C383, "FalloutVore.esm") as Message
		DLC06Payload.SwallowPerkRequired = pApexPredator
		FV_ActorData.InjectAddedInfo(DLC06Payload)

		FormList BlockedList = Game.GetFormFromFile(0x0000E1A8, "FalloutVore.esm") as FormList
		BlockedList.AddForm(Game.GetFormFromFile(0x0000B028, "DLCNukaWorld.esm") as Race)	;GAZ: Add Ant-Swarms to the Block-List. They cause crashes when swallowed.

		Debug.Notification("FalloutVore detected Nuka-World DLC and patched it.")	;GAZ: Feedback is important so the player knows it's working.
		DLC06Patched = True

	EndIf

EndFunction

; Makes the player a predator.
Function MakePlayerPred()
	PlayerRef.AddPerk(FV_PlayerSwallowAbility)
	PlayerRef.AddPerk(FV_PredSneakDebuff)
	PlayerRef.AddItem(FV_FalloutVoreHolotape, 1, true)
	PlayerRef.AddItem(FV_RegurgitatePotion, 1, true)
	PlayerRef.AddItem(FV_SwallowNonLethal, 1, true)
	PlayerRef.AddItem(FV_DigestPotion,1,true)
	PlayerRef.AddItem(FV_ScatPotion,1,true)
	PlayerRef.AddItem(FV_ContextPreyPotion, 1, true)
	FV_TheHungerMessage.Show()
EndFunction

;******************************************************************************
; CONSUMPTION REGISTRY
; Tracks which actor ate each prey.
;*****************************
Struct PreyData
	Actor Pred
	Actor Prey
	Int Tick	; To create a delay between 'transfer' 'swallow' 'vomit'
	ObjectReference BellyContainer
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

	ObjectReference bellyContainer
	If(akPred == PlayerRef)
		bellyContainer = FV_BellyContainer
	ElseIf(akPred.IsInFaction(CurrentCompanionFaction))
		bellyContainer = FV_CompanionBellyContainer
	EndIf

	akPrey.SetValue(FV_DigestionStage, 100) ; Set prey digestion stage to 100.

	PreyData data = new PreyData
	data.Pred = akPred
	data.Prey = akPrey
	data.BellyContainer = bellyContainer
	data.IsLethal = abIsLethal
	ConsumptionRegistry.Add(data)
	Var[] args = new Var[2]
	args[0] = akPred
	args[1] = akPrey
	SendCustomEvent("OnAdd", args)
	StartTimer(DigestionSpeed, DigestTimerID) ; Start the digestion timer.
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

	; akPred.SetValue(FV_CurrentPrey, preys.Length)
	akPred.SetValue(FV_CurrentAlivePrey, alivePrey)
	akPred.SetValue(FV_HumanPreyCount, humanPrey)

	; Updates the belly appearance
	; if(updateFullness)
	; 	ChangeFullnessArmor(akPred, preys.Length)
	; EndIf
	
	; TODO: Manage heavy pred elsewhere
	; Apply heavy pred perks
	If(FV_AllowHeavyPred.GetValue() == 1)
		If(preys.Length > 0)
			If(akPred == PlayerRef && !akPred.HasPerk(FV_HeavyPredPlayer))
				akPred.AddPerk(FV_HeavyPredPlayer)
			ElseIf(akPred != PlayerRef && !akPred.HasPerk(FV_HeavyPredNPC))
				akPred.AddPerk(FV_HeavyPredNPC)
			Endif
		Else
			If(akPred == PlayerRef && akPred.HasPerk(FV_HeavyPredPlayer))
				akPred.RemovePerk(FV_HeavyPredPlayer)
			ElseIf(akPred != PlayerRef && akPred.HasPerk(FV_HeavyPredNPC))
				akPred.RemovePerk(FV_HeavyPredNPC)
			Endif
		Endif
	Endif
EndFunction

; Based on the CurrentPrey and DigestionStage AVs, decides how many child nodes to drop out of the buffer, and iterates through them.
; KEILLA: I am not sure how important this is or what it really does. Pretty much it looks cosmetic. Let's cut it for now.
; Function UpdateDigestionPreyCount(Actor akPred)
	; trace("UpdateDigestionPreyCount()", akPred)
; 	int currentSize = (((akPred.GetValue(FV_CurrentPrey)/2-1) * 3) + 6) as int
; 	int digestionStage = akPred.GetValue(FV_DigestionStage) as int
; 	If(currentSize > digestionStage)
; 		int slotsToDelete = currentSize - digestionStage
; 		bool keepSearching = true

; 		Actor[] preys = GetAllPrey(akPred)
; 		int i = 0
; 		While i < preys.Length && keepSearching && i < 128
; 			int slotSize = FV_ActorData.EvaluateSlots(preys[i])
; 			slotSize = (((slotSize/2-1) * 3) + 3) as int
; 			If(slotSize < 3)
; 				slotSize = 3	;set to be minimum of 3.  2, 2 slot prey == 9 in timerstage space.  single slot prey are leading to very low
; 			Endif
; 			If(slotSize <= SlotsToDelete)
; 				Remove(preys[i])
; 				SlotsToDelete -= slotSize
; 			Else
; 				keepSearching = false
; 			Endif
				
; 			i += 1
; 		EndWhile
; 		; UpdateCurrentInStomach(akPred)
; 	Endif
	
; EndFunction

;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; Public functions

;Calculate chance of indigestion occurring
float Function CalculateIndigestionChance(Actor akPred, Actor akPrey)
	
	;chance variable
	float chance = FV_IndigestionChanceBase.GetValue() * (FV_ActorData.EvaluateSlots(akPrey) as float)
	
	chance += FV_ActorData.EvaluateIndigestionChance(akPred)
	
	;Minus preds resistance
	If((1.0 - (akPred.GetValue(FV_IndigestionResistance) as float)/100) < 0)
		chance = 0.0
	Else
		chance = chance * (1.0 - (akPred.GetValue(FV_IndigestionResistance) as float)/100)
	EndIf
	;Return calculated value
	; trace("CalculateIndigestionChance()", "Indigestion chance of " + chance + " has been calculated for prey " + akPrey)
	return chance
	
EndFunction

;Vomits up the prey
function PerformVomit(Actor akPrey)
	PreyData data = GetDataByPrey(akPrey)
	Actor pred = data.Pred
	
	; ;Play vomit audio
	; int instanceID = FV_FXVomit.Play(currentPred) 	
	; Sound.SetInstanceVolume(instanceID, 0.25)					
	
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

; If predator doesn't have the nuka acid, set it.
Function ForceNukaAcidOnNPCPred(Actor akPred)
	If(akPred != PlayerRef)
		akPred.SetValue(FV_HasHadNukaAcid, 1)
	EndIf
EndFunction

Function DropCombatOnPlayerPrey(Actor akPred, Actor akPrey)
	; KEILLA: This is all RPG and game mechanical stuff related to being vored. Extract.
	; trace("DropCombatOnPlayerPrey()", "Player is prey.  Adding local combatants to faction list to end combat against player.")
	Actor[] AllCombatNPC = akPrey.GetAllCombatTargets()
	PlayerRef.AddToFaction(FV_PredPreyFaction)
	PlayerRef.StopCombatAlarm()
	int i = 0
	While i < AllCombatNPC.length && i < 128
		AllCombatNPC[i].AddToFaction(FV_PredPreyFaction)
		FV_PredPreyFormList.AddForm(AllCombatNPC[i])
		AllCombatNPC[i].EvaluatePackage(true)
		i += 1
	EndWhile
	If(!FV_PredPreyFormList.HasForm(akPred))
		;Make sure the pred is in the combat stop faction.  Sometimes they seem to slip by
		; KEILLA: What is this buggy code? Figure out a better way.
		akPred.AddToFaction(FV_PredPreyFaction)
		FV_PredPreyFormList.AddForm(akPred)
		akPred.EvaluatePackage(true)
	EndIf
EndFunction

; Does a lot of game mechanics stuff to handle a swallow. Everything from setting AVs, messing with the camera and belly, and manipulating player input. Way too much.
int Function ProcessSingleSwallow(Actor akPred, Actor akPrey, bool abLethalFlag)
	; Trace("ProcessSingleSwallow()")
	int consumeIndex = Add(akPred, akPrey, abLethalFlag)
	If(consumeIndex < 0)
		; Trace("ProcessSingleSwallow()", "Unable to Add")
		Return consumeIndex
	EndIf
	
	ForceNukaAcidOnNPCPred(akPred)

	; TODO: Test player being prey.
	If (akPrey == PlayerRef) ; Player is being vored
		akPrey.setAlpha(0, false)	;makes player invisible
		akPrey.setGhost(true)		;makes player invincible to ennemy's damage	
		If(!playerLayer)
			playerLayer = inputenablelayer.Create()
		EndIf
		
		If(abLethalFlag)
			FV_PlayerAsPreyContext.SetValue(2)
		Else
			FV_PlayerAsPreyContext.SetValue(1)
		EndIf

		playerLayer.EnableFighting(false) ; No fighting
		FixCamera(akPred)
		playerLayer.EnableLooking(True)
		; Fucks with the camera using INI manipulations. Probably looks cool?
		Utility.SetINIBool("bApplyCameraNodeAnimations:Camera", 0)
		Utility.SetINIFloat("fVertibirdVanityModeMaxDist:Camera", fCameraDistanceSwallow)
	Else
		akPrey.MoveTo(FV_StomachCellMarker)
		; Trace("ProcessSingleSwallow()", "MoveTO")
	EndIf

	FV_StomachSim.AddIndigestible(akPred, FV_ActorData.EvaluateSlots(akPrey))
	; Trace("ProcessSingleSwallow()", "AddIndigestible")

	Var[] akArgs = new Var[3]
	akArgs[0] = akPred
	akArgs[1] = abLethalFlag
	akArgs[2] = akPrey
	SendCustomEvent("OnSwallow", akArgs)
	
	; VORE SUCCESS
	; PerformVoreEventAccept(akPred, akPrey, abLethalFlag)
	; Trace("ProcessSingleSwallow()", "Finished")
	Return consumeIndex
EndFunction

; Adds the prey to the PPA. Also performs accounting for many mod values and runs some game mechanics besides. KEILLA: Extract stuff.
; Function PerformVoreEventAccept(Actor akPred, Actor akPrey, bool bLethalFlag)
; 	; Start indigestion behaviors. Extract/Delete
; 	If(akPrey.HasPerk(FV_CauseIndigestion01) && bLethalFlag)
; 		Int CauseIndigestion = Utility.RandomInt()
; 		If(akPrey.HasPerk(FV_CauseIndigestion03))
; 			akPred.SetValue(FV_IndigestionSeverityFlag, Utility.RandomInt(3,4))
; 			akPred.EquipItem(FV_IndigestionEffect , true, true)
; 		ElseIf(akPrey.HasPerk(FV_CauseIndigestion02) && CauseIndigestion <= 50)
; 			akPred.SetValue(FV_IndigestionSeverityFlag, Utility.RandomInt(2,4))
; 			akPred.EquipItem(FV_IndigestionEffect , true, true)
; 		ElseIf(CauseIndigestion <= 20)
; 			akPred.SetValue(FV_IndigestionSeverityFlag, Utility.RandomInt(1,4))
; 			akPred.EquipItem(FV_IndigestionEffect , true, true)
; 		EndIf
; 	EndIf
; 	;Chance of clothes ripping off
; 	; KEILLA: Extract to visuals/audios scripts.
; 	If(FV_ClothesRipChance.GetValue() > Utility.RandomInt())
	
; 		;Unequip (3 is the body slot for normal cloths)
; 		akPred.UnequipItemSlot(3)
		
; 		;Show clothes rip message
; 		FV_ClothesRipMessage.Show()
	
; 		;Sound of ripping
; 		FV_FXClothesRip.Play(akPred) ;GAZ: Don't use PlayAndWaits, this stalls the system.
; 	EndIf
	
; 	;Add prey to the prey array
; 	int PreyIndex = Add(akPred, akPrey)
	
; 	;Reset manual digestion
; 	If(akPred.GetValue(FV_ReadyToDigest) == 1)
; 		akPred.SetValue(FV_ReadyToDigest, 0)
; 	Endif
	
; 	;Mod tracking values
; 	; UpdateCurrentInStomach(akPred)
	
; 	akPrey.ModValue(FV_TicksTillEscapeStart, akPred.GetValue(FV_Entrapment))
; 	akPrey.ModValue(FV_TicksTillEscape, akPrey.GetValue(FV_TicksTillEscapeStart))
	
; 	; TODO: broken until VoreHud can accept actors
; 	; If(akPred == PlayerRef)
; 		; FV_VoreHud.UpdateHealthBar(PreyIndex, akPrey) 
; 	; EndIf

; 	;Start vore timer
; 	If akPrey.IsDead()
; 		akPrey.SetValue(FV_DigestionStage, 99)
; 	ElseIf akPrey == PlayerRef && bLethalFlag
; 		FV_PlayerStruggle.BeginStruggleMechanic(akPred, preyIndex)
; 	Else
		; trace("PerformVoreEventAccept()", "Start vore timer: " + PreyIndex)
; 		StartTimer(DigestionSpeed, DigestTimerID)
; 	EndIf
; 	ChangeFullnessArmor(akPred, akPred.GetValue(FV_CurrentPrey) as int)
	
; 	;Play swallow success audio
; 	var[] akArgs = new var[1]
; 	akArgs[0] = akPred
; 	CallFunctionNoWait("PlayAcceptSounds", akArgs)
; EndFunction

bool bPlayingAcceptSounds = false
int iPlayerSoundID = -1

; Plays some vore sound effects. Has a debounce to avoid repeated overplay. This probably would work better as an event on a sound script.
Function PlayAcceptSounds(Actor akPred)
	If(bPlayingAcceptSounds)
		return
	EndIf
	; trace("PlayAcceptSounds()", "Test point 1")
	bPlayingAcceptSounds = true
	If(akPred == PlayerRef)
		Sound.StopInstance(iPlayerSoundID)
		If(Utility.RandomInt() as float < FV_SwallowCommentChance.GetValue())
			iPlayerSoundID = FV_PlayerPostSwallowComment.Play(akPred)
		Else
			iPlayerSoundID = FV_PlayerSwallowSuccess.Play(akPred)
		EndIf
	Else
		FV_NPCSwallowSuccess.Play(akPred)
	EndIf
	
	bPlayingAcceptSounds = false
EndFunction

; Frees player if they are prey, otherwise returns prey to the world.
Function PerformVoreEventReject(Actor akPred, Actor akPrey)
	;Swallow failed
	
	;Play failed to swallow sound
	; KEILLA: Extract to a sound script and event.
	Var[] soundArgs = new var[1]
	soundArgs[0] = akPred
	CallFunctionNoWait("PlayFailSounds", soundArgs)
	
	Var[] akArgs = new Var[3]
	akArgs[0] = akPred
	akArgs[1] = akPrey
	SendCustomEvent("OnVomit", akArgs)
	
	;Small delay to let audio to get to the appropriate point 
	; TODO: Spilt audio into two sections with one to be triggered after move thus making this hack to be redundant.
	Utility.Wait(2)
	
	If (akPrey == PlayerRef)	;If the prey is player
		; trace("PerformVoreEventReject()", "player failed to be swallowed.  Vore event rejection")
		akPrey.TranslateToRef(akPred, 25000)
		akPrey.setAlpha(1 as float, False)	;Make player visible again
		playerLayer.Reset()		;Enable player controls.  No need to list all trues.  All passes default to true
		FixCamera(akPrey)

		ClearPredPreyFaction()
		
		FV_PlayerAsPreyContext.SetValue(0)
		Utility.SetINIFloat("fVertibirdVanityModeMaxDist:Camera", fCameraDistanceVomit)
		Utility.SetINIBool("bApplyCameraNodeAnimations:Camera", 1)
		
		StartTimer(4.0, GhostTimerRemovalID)
	Else
		akPrey.MoveTo(akPred)	; Move prey to pred
	EndIf
	akPrey.EquipItem(FV_RemoveSwallowProtection, true, true) ; Forces prey to consume a swallow protection potion so they can't just be reswallowed.
EndFunction

bool bPlayingFailSounds = false

; Plays vore failure sounds.
Function PlayFailSounds(Actor akPred)
	If(bPlayingFailSounds)
		return
	EndIf
	bPlayingFailSounds = true
	If(akPred == PlayerRef)
		FV_PlayerSwallowFail.PlayandWait(akPred)	;GAZ: These are fine to stay as PlayAndWaits, since they are run on a parralel execution called by CallFunctionNoWait() and it relies on a bool mutex.
	Else
		FV_NPCSwallowFail.PlayandWait(akPred)
	EndIf
	
	bPlayingFailSounds = false
EndFunction

;************************************************************************************
;************************************************************************************
; Digestion events

;Timers for timing vore events
Event OnTimer(int aiTimerID)
	GotoState("OnTimerState") ; Defer other timers.
		
	If (aiTimerID == GhostTimerRemovalID)
		; trace("OnTimer()", "aiTimerID: " + GhostTimerRemovalID + " player invulnerability remove.")
		PlayerRef.setGhost(False)
	ElseIf (aiTimerID == ReformTimerID)
		; trace("OnTimer()", "aiTimerID: " + ReformTimerID + " player reformed.")
		OnTimerReformPlayerFinish()
	ElseIf (aiTimerID == DigestTimerID)
		; trace("OnTimer()", "DigestTimer CR: " + ConsumptionRegistry)
		int i = 0
		PreyData data
		Actor pred
		Actor prey
		While i < ConsumptionRegistry.Length && i < 128
			data = ConsumptionRegistry[i]
			DigestionDamage(data)
			i += 1
		EndWhile
		
		If ConsumptionRegistry.Length > 0
			StartTimer(DigestionSpeed, DigestTimerID)
		EndIf
	EndIf
	GotoState("")
EndEvent

; prevent multiple call ( specially with Sound.PlayAndWait)
state OnTimerState
	Event OnTimer(int aiTimerID)
		; trace("OnTimer", "Deferred OnTimerState: " + aiTimerID)
		StartTimer(0.25, aiTimerID)
	EndEvent
endState

; Plays stomach noise sounds.
function OnTimerPlaySound(PreyData data)
	int instanceID = FV_FXStomachGurgle.Play(data.Pred) 	
	Sound.SetInstanceVolume(instanceID, 0.5)
EndFunction

; Tracks the mortality of prey by timer ID. Many triggers for the prey to be vomited for many reasons, protection against death, and eventually AV damage to prey and in the case of escape, the pred.
function DigestionDamage(PreyData data)
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
		Else
			If(prey == PlayerRef && PlayerRef.GetDistance(pred) > 4000) 
				; If the player is the prey, keep moving their invisible ghost closer to the predator so they don't get too far and unload or something.
				; KEILLA: This is absolutely besides the point of this function. Should be managed elsewhere.
				PlayerRef.TranslateToRef(pred, 25000)
			Endif
		EndIf
		Return
	EndIf
	
	prey.ModValue(FV_TicksTillEscape, -1) ; KEILLA TODO: Um, seems important I guess. When should this be set?
	
	; Calculate the belly acid damage.
	Float DamageDealt = (pred.GetValue(FV_AcidDamage)+pred.GetValue(EnduranceAV))*(1-(prey.GetValue(FV_AcidResistance)-pred.GetValue(FV_AcidStrengthValue))/100)
	DamageDealt = 1.0
	Trace("DigestionDamage()", prey + " HP: " + prey.GetValue(HealthAV) + " DD: " + DamageDealt)
	; If we might kill the prey
	If(prey.GetValue(HealthAV) - DamageDealt <= 0)										;Check if prey will die from damage.  If so, perform special handling
		; trace("DigestionDamage()", "damage greater than current health of enemny")
		If(prey == PlayerRef) ; If player is the prey
			;we kill the player but have to make sure the triggerdigestionsequence is passed early enough, to prevent regurgitation of half dead player
			if(prey.GetValuePercentage(HealthAV) > 0.5)
				prey.DamageValue(HealthAV, ((prey.getBaseValue(HealthAV) * 0.2)))
				Debug.Notification("Your predator enjoys feeling you struggle in their stomach.")
				FV_FXBurp.Play(pred)
			else
				Debug.Notification("You cease the futile escape attempts and succumb to your predator's stomach.")
				PlayerDies(prey)
				return
			EndIf
		ElseIf(prey.HasPerk(FV_DigestInvulnerability)) ; If invulnerable to digestion, force vomit the prey
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
	PreyData data = GetDataByPrey(akPrey)
	Actor pred = data.Pred

	int instanceID = FV_FXBurp.Play(pred) 	
	Sound.SetInstanceVolume(instanceID, 0.5)					
	
	;Increase the chance of indigestion
	; pred.ModValue(FV_IndigestionChanceOnNextDigest, CalculateIndigestionChance(pred, akPrey))
	
	;Stats stuff
	If (pred == PlayerRef || pred.IsInFaction(HasBeenCompanionFaction))
		FV_ActorData.UpdateDigestCount(pred, akPrey)
	EndIf
	
	; OH HEY, if you ate a robot, you get some fusion cells! Isn't this a good place to do that? KEILLA: It is not.
	If(akPrey.HasKeyword(ActorTypeRobot) && pred.HasPerk(FV_HighIronDiet03))		
		pred.Additem(AmmoFusionCell, akPrey.GetLevel()/2 as int, false)		
	EndIf
	
	If(akPrey != PlayerRef)
		FV_ScatManager.ProcessPreyItems(akPrey, pred)
	EndIf
	akPrey.AddItem(LLD_VEV_Crystals_Prey_FV_, 1, true)
	akPrey.RemoveAllItems(data.BellyContainer)
		
	; Handle scat availability.
	If(pred == PlayerRef)
		If(FV_ScatEnabled.GetValue() == 1)
			If(pred.getValue(FV_Scatready) == 0)
				pred.SetValue(FV_Scatready, 1)
				FV_ReadyToScatMessage.show()
			EndIf
		EndIf
	;Activate belly container for player if they are not a pred and an ally has finished digestion
	ElseIf(pred.IsInFaction(CurrentCompanionFaction) && FV_CompanionScat.GetValue() == 1)
		pred.SetValue(FV_Scatready, 1)
	ElseIf(FV_ScatEnabled.GetValue() == 1 && FV_NPCScatEnabled.GetValue() == 1 && !pred.IsInFaction(CurrentCompanionFaction))
		FV_ScatManager.NPCScat(pred) ; NPCs autoscat
	ElseIf(PlayerRef.GetValue(FV_HasHadNukaAcid) == 0 && (pred.IsInFaction(WorkshopNPCFaction) || pred.IsInFaction(WorkshopDialogueFaction) || pred.IsInFaction(CurrentCompanionFaction)))
		FV_BellyContainer.Activate(PlayerRef, false) ; Auto-open belly container if you don't have nukaacid and you're in some workshop faction thing
	EndIf

	;eliminate corpse and move back to original spawn location for cell reset
	If(akPrey != PlayerRef)
		akPrey.SetCriticalStage(4) ; The prey corpse is vaporized so it does not render.
		akPrey.MoveToMyEditorLocation()
		; trace("DigestionComplete()", "Prey NPC has been moved back to original editor location")
	EndIf
	
	Remove(akPrey)
	FV_StomachSim.ShiftIndigestibleToDigestiblePrey(pred, FV_ActorData.EvaluateSlots(akPrey), akPrey)
	Var[] args = new Var[1]
	args[0] = akPrey
	SendCustomEvent("OnDigestionComplete", args)
	; trace("DigestionComplete()", "PerformDigestion - Done")
EndFunction
	
; Reenable the player when the player's time as prey is up.
Function OnTimerReformPlayerFinish()
	; trace("OnTimerReformPlayerFinish()")
	
	PlayerRef.setAlpha(1, False)																			;Make player visible again
	playerLayer.Reset()																		;Enable player controls
	FV_PlayerAsPreyContext.SetValue(0)
	
	ClearPredPreyFaction()

	StartTimer(4, GhostTimerRemovalID)	
EndFunction

; Change digest fullness armor
function ChangeDigestFullnessArmor(Actor currentDigester, int item = -1) ; item 0 - 99 or -1 to remove laa
	; trace("ChangeDigestFullnessArmor()", ": " + currentDigester + ", " + item)

	if(item == -1)
		int i = 1
		While (i < DigestionArmor.Length && i < 128)
			currentDigester.UnequipItem (DigestionArmor[i], true, true)
			currentDigester.RemoveItem (DigestionArmor[i], 1, true, None)
			i += 1
		EndWhile
		Return
	EndIf
	
	if(item == 0)
		currentDigester.UnequipItem (DigestionArmor[1], true, true)
		currentDigester.RemoveItem (DigestionArmor[1], 1, true, None)
	Elseif(item >= 12)
		currentDigester.EquipItem  (DigestionArmor[12]  , true, true)
		currentDigester.UnequipItem (DigestionArmor[11], true, true)
		currentDigester.RemoveItem (DigestionArmor[11], 1, true, None)
	Elseif(item == 1)
		currentDigester.EquipItem  (DigestionArmor[item]  , true, true)
		currentDigester.UnequipItem (DigestionArmor[item+1], true, true)
		currentDigester.RemoveItem (DigestionArmor[item+1], 1, true, NONE)
	Else
		currentDigester.EquipItem  (DigestionArmor[item]  , true, true)
		currentDigester.UnequipItem (DigestionArmor[item+1], true, true)
		currentDigester.UnequipItem (DigestionArmor[item-1], true, true)
		currentDigester.RemoveItem (DigestionArmor[item+1], 1, true, None)
		currentDigester.RemoveItem (DigestionArmor[item-1], 1, true, None)
	endif
EndFunction

; Attaches the camera to the predator when player is consumed.
Function FixCamera(Actor akActor)
	If(akActor != PlayerRef)
		; trace("FixCamer()", "Player swallowed.  Switching camera to NPC pred")
		If(PlayerRef.GetAnimationVariableBool("IsFirstPerson"))
			PreviousPlayerPOV = 1
		Else
			PreviousPlayerPOV = 3
		EndIf
		If PlayerRef.GetScale() != 1.0
			PlayerSize = PlayerRef.GetScale()
			PlayerRef.SetScale(1.0)
		EndIf
	EndIf
		
	Game.SetCameraTarget(akActor)
	Game.ForceFirstPerson()
	Utility.wait(0.2)
	Game.ForceThirdPerson()
	
	If(akActor == PlayerRef)
		If(PreviousPlayerPOV == 1)
			Game.ForceFirstPerson()
		Else
			Game.ForceThirdPerson()
		EndIf
		If PlayerSize != 1.0
			PlayerRef.SetScale(PlayerSize)
			PlayerSize = 1.0
		EndIf
	EndIf
EndFunction

; Remoes actors from the PredPrey faction and resets them so they resume fighting.
Function ClearPredPreyFaction()
	int i = 0
	While(i < FV_PredPreyFormList.GetSize() && i < 128)
		If((FV_PredPreyFormList.GetAt(i) as Actor).IsInFaction(FV_PredPreyFaction))
			(FV_PredPreyFormList.GetAt(i) as Actor).RemoveFromFaction(FV_PredPreyFaction)
			(FV_PredPreyFormList.GetAt(i) as Actor).EvaluatePackage(true)
		EndIf
		i += 1
	EndWhile
	PlayerRef.RemoveFromFaction(FV_PredPreyFaction)
	FV_PredPreyFormList.Revert()
EndFunction

bool ModResetting = false

; Reset everything that is happening, including all timers and other modifications of state.
; to use this Function
; open the console
;    type: 'help ConsumptionRegi 0' to get the quest Id  (xx004c90)
;    type: 'CallQuestFunction xx004c90 ResetVoreMod'
; OR type: 'CallQuestFunction xx004c90 ResetVoreMod True'     to also do a reset of the player
; wait
; KEILLA: Can't this be called from MCM? Also this is a great summary of all the shit that is happening in here.
Function ResetVoreMod(Bool abResetPlayer = False)
	If(ModResetting)
		return
	EndIf
	ModResetting = true
	GotoState("OnTimerState")	
		
	; trace("ResetVoreMod()")
	Utility.Wait(4 as float)																					
	; trace("ResetVoreMod()", "CancelTimer")
	CancelTimer(DigestTimerID)

	PreyData data = GetDataByPrey(PlayerRef)
	Actor pred = data.Pred
	Actor prey = data.Prey
	if(data != NONE || abResetPlayer)
		; trace("ResetVoreMod()", "Reset player")
		PlayerRef.setAlpha(1, False)
		if(playerLayer)	
			playerLayer.Reset()		
		EndIf
		FixCamera(PlayerRef)
		Utility.SetINIFloat("fVertibirdVanityModeMaxDist:Camera", fCameraDistanceVomit)
		Utility.SetINIBool("bApplyCameraNodeAnimations:Camera", 1)

		ClearPredPreyFaction()
		PlayerRef.setGhost(False)
		PlayerRef.MoveTo(pred)		;Move the player to their pred
		PlayerRef.EquipItem(FV_RemoveSwallowProtection, true, true)
		Remove(PlayerRef)
		Utility.Wait(4 as float)
	EndIf
	; ChangeFullnessArmor(PlayerRef,0)
	ChangeDigestFullnessArmor(PlayerRef)
	
	; PlayerRef.SetValue(FV_CurrentPrey, 0)
	PlayerRef.SetValue(FV_CurrentAlivePrey, 0)
	PlayerRef.SetValue(FV_TicksTillEscape, 0)
	PlayerRef.SetValue(FV_TicksTillEscapeStart, 0)
	PlayerRef.SetValue(FV_IndigestionChanceOnNextDigest, 0)
	PlayerRef.SetValue(FV_HumanPreyCount, 0)
	If(PlayerRef.GetValue(FV_BlockSwallowFlag) == 2)
		PlayerRef.SetValue(FV_BlockSwallowFlag, 1)
	Else
		PlayerRef.SetValue(FV_BlockSwallowFlag, 0)
	EndIf
	PlayerRef.SetValue(FV_DigestionStage, 0)
	PlayerRef.SetValue(FV_ReadyToDigest, 0)
	PlayerRef.SetValue(FV_IndigestionSeverityFlag, 0)
	PlayerRef.SetValue(FV_HasBloating, 0)
	If(PlayerRef.HasPerk(FV_HeavyPredPlayer))
		PlayerRef.RemovePerk(FV_HeavyPredPlayer)
	Endif
	
	; trace("ResetVoreMod()", "Reset pred and prey")
	int i = 0
	While (i < ConsumptionRegistry.Length && i < 128)
		data = ConsumptionRegistry[i]
		pred = data.Pred
		prey = data.Prey
	
		; ChangeFullnessArmor(pred, 0)
		ChangeDigestFullnessArmor(pred)
		; pred.SetValue(FV_CurrentPrey, 0)
		pred.SetValue(FV_CurrentAlivePrey, 0)
		pred.SetValue(FV_TicksTillEscape, 0)
		pred.SetValue(FV_TicksTillEscapeStart, 0)
		pred.SetValue(FV_IndigestionChanceOnNextDigest, 0)
		pred.SetValue(FV_HumanPreyCount, 0)
		If(pred.GetValue(FV_BlockSwallowFlag) == 2)
			pred.SetValue(FV_BlockSwallowFlag, 1)
		Else
			pred.SetValue(FV_BlockSwallowFlag, 0)
		EndIf
		pred.SetValue(FV_DigestionStage, 0)
		pred.SetValue(FV_ReadyToDigest, 0)
		pred.SetValue(FV_IndigestionSeverityFlag, 0)
		pred.SetValue(FV_HasBloating, 0)
		If(pred.HasPerk(FV_HeavyPredNPC))
			pred.RemovePerk(FV_HeavyPredNPC)
		Endif
	
		
		prey.MoveTo(pred)																			
		prey.setPosition(pred.getPositionX(), pred.getPositionY(), pred.getPositionZ())	
		; ChangeFullnessArmor(prey,0)
		ChangeDigestFullnessArmor(prey)
		; prey.SetValue(FV_CurrentPrey, 0)
		prey.SetValue(FV_CurrentAlivePrey, 0)
		prey.SetValue(FV_TicksTillEscape, 0)
		prey.SetValue(FV_TicksTillEscapeStart, 0)
		prey.SetValue(FV_IndigestionChanceOnNextDigest, 0)
		prey.SetValue(FV_HumanPreyCount, 0)
		If(prey.GetValue(FV_BlockSwallowFlag) == 2)
			prey.SetValue(FV_BlockSwallowFlag, 1)
		Else
			prey.SetValue(FV_BlockSwallowFlag, 0)
		EndIf
		prey.SetValue(FV_DigestionStage, 					0)
		prey.SetValue(FV_ReadyToDigest, 					0)
		prey.SetValue(FV_IndigestionSeverityFlag, 			0)
		prey.SetValue(FV_HasBloating,						0)
		If(prey.HasPerk(FV_HeavyPredNPC))
			prey.RemovePerk(FV_HeavyPredNPC)
		Endif
		prey.EquipItem(FV_RemoveSwallowProtection, true, true)
		
		i += 1
	EndWhile
	
	ConsumptionRegistry.Clear()
	FV_ManualDigestionEnabled.SetValue(0)
	; trace("ResetVoreMod()", "Done !")
	Debug.MessageBox("ResetVoreMod, Done !")
	ModResetting = false
	GotoState("")
EndFunction

int WakeUpTick
float WakeDay
float SleepWaitStartDay
float SleepWaitStopDay

; When player waits, record the start time.
Event OnPlayerWaitStart(float afWaitStartTime, float afDesiredWaitEndTime)
	OnPlayerWaitSleepStart(afWaitStartTime, afDesiredWaitEndTime)
EndEvent

; When player is done waiting, handle it.
Event OnPlayerWaitStop(bool abInterrupted)
	PlayerSleepWaitStop()
EndEvent

; When player sleeps, record the start time.
Event OnPlayerSleepStart(float afSleepStartTime, float afDesiredSleepEndTime, ObjectReference akBed)
	OnPlayerWaitSleepStart(afSleepStartTime, afDesiredSleepEndTime)
EndEvent

; When player is done sleeping, handle it.
Event OnPlayerSleepStop(bool abInterrupted, ObjectReference akBed)
	; trace("OnPlayerSleepStop()", " WakeDay: " + WakeDay)
	PlayerSleepWaitStop()
EndEvent

; Records the sleep/wait start time.
Function OnPlayerWaitSleepStart(float afSleepWaitStartTime, float afDesiredWaitSleepEndTime)
	; trace("OnPlayerWaitSleepStart()", "afSleepWaitStartTime: " + afSleepWaitStartTime + " afDesiredSleepEndTime: " + afDesiredWaitSleepEndTime + " WakeDay: " + WakeDay)
	SleepWaitStartDay = afSleepWaitStartTime
	
	if(PlayerRef.GetValue(FV_CurrentAlivePrey) > 0)
		FV_SleepWaitDisruptMessage.Show()
		PlayerRef.Moveto(PlayerRef) ; Hack that interrupts the sleep action
	EndIF
EndFunction

; Loop all preds in the ConsumptionRegistry and run digestion for them.
Function PlayerSleepWaitStop()
	SleepWaitStopDay = Utility.GetCurrentGameTime()
	WakeDay = Utility.GetCurrentGameTime()
	int i = 0
	while (i < ConsumptionRegistry.Length && i < 128)
		HandleDigestionStage(ConsumptionRegistry[i])
		i += 1
	EndWhile
EndFunction

; This should run digestion stages for all the prey for the data pred.
; KEILLA: Needs refactoring since this handles wait/sleep digestion.
Function HandleDigestionStage(PreyData aData)
	int DigestTicksRemaining = 0
	int tempTimerState
	Actor pred = aData.Pred
	
	If pred.GetValue(FV_CurrentAlivePrey) > 0 || !aData.IsLethal
		;only handle preds that are in the digestin phase.  If they still have living prey, they can ride out the sleep cycle.
		; trace("HandleDigestionStage()", "Pred: " + pred + " FV_CurrentAlivePrey: " + pred.GetValue(FV_CurrentAlivePrey) + " IsLethal: " + aData.IsLethal)
		return
	Endif
	WakeUpTick = math.floor(((WakeDay - SleepWaitStartDay)*1440)/(aData.Prey.GetValue(FV_DigestionSpeed)*TimeScale.GetValue()/60)) as int
	
	tempTimerState = pred.GetValue(FV_DigestionStage) as int
	; trace("HandleDigestionStage()", "Pred: " + pred + " WakeUpTick: " + WakeUpTick + " tempTimerState: " + tempTimerState)
	If WakeUpTick >= tempTimerState
		;code to finish digestion and reset pred
		pred.SetValue(FV_DigestionStage, 0)
		
		DigestionComplete(aData.prey)
	Else
		float nextTimerState = tempTimerState - WakeUpTick
		aData.Prey.SetValue(FV_DigestionStage, nextTimerState)
	EndIf

EndFunction

; Reforms the player post-digestion.
Function ReformPlayer(Actor akPred)
	Actor InvisActor = akPred.PlaceActorAtMe(FV_ScatLootCorpse)
	InvisActor.killsilent()										;kill so it will be cleaned up
	InvisActor.Disable()										;disable to remove it from being seen by the player
	PlayerRef.TranslateToRef(InvisActor, 25000)
	Utility.wait(1.0)
	FixCamera(PlayerRef)
	Utility.SetINIFloat("fVertibirdVanityModeMaxDist:Camera", fCameraDistanceVomit)
	Utility.SetINIBool("bApplyCameraNodeAnimations:Camera", 1)
	ReformFXS_FV_.Play(PlayerRef, 5.0)
	Float HealthRestored
	If(PlayerRef.HasPerk(FV_ReformPerk03))
		HealthRestored = PlayerRef.GetBaseValue(HealthAV)
	ElseIf(PlayerRef.HasPerk(FV_ReformPerk02))
		HealthRestored = PlayerRef.GetBaseValue(HealthAV) * 0.5
	Else
		HealthRestored = PlayerRef.GetBaseValue(HealthAV) * 0.1
	EndIf
	PlayerRef.RestoreValue(HealthAV, HealtHRestored)
	StartTimer(6.0, ReformTimerID)
EndFunction

float fSecondWindLastTime = 0.0
; Instead of dying, there's a random chance you can attempt the struggle minigame a second time.
Function PlayerDies(Actor akPrey)

	;Bring the player to 1HP
	float RemainingHealth = (PlayerRef.GetValue(HealthAV) as float) - 1.0
	PlayerRef.DamageValue(HealthAV, RemainingHealth)
	KillPlayerAsPrey = true ; KEILLA: Why this global?
	int RandomReformKillChance = Utility.RandomInt()
	If(RandomReformKillChance > PlayerRef.GetValue(FV_ReformChance) && PlayerRef.HasPerk(FV_ReformPerk01))
		float currentGameTime = Utility.GetCurrentGameTime()
		If (currentGameTime - fSecondWindLastTime > 1.0) ; If it has been at least one day since you last reformed
			fSecondWindLastTime = currentGameTime
			FV_PlayerStruggle.SecondWind()
			return
		EndIf
		PlayerRef.RemovePerk(FV_ContextVorePerk)
		PlayerRef.AddPerk(FV_QuitToMenu) ; KEILLA: This is a weird way to quit the game.
	EndIf
	FV_FXBurp.Play(GetPred(akPrey))
	
	DigestionComplete(akPrey) ; You get digested if secondwind doesn't trigger.
EndFunction