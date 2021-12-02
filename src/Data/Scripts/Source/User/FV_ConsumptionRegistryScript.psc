Scriptname FV_ConsumptionRegistryScript extends Quest
{Tracks who has eaten whom. Specifically monitors the Prey actors' relationship to their current predator
so that in the event of vomit or escape they can reappear at the correct location. Also facilitates looking up a prey
actor, or returning a list of prey actors given a predator actor.}

Group ActorValues
	ActorValue Property EnduranceAV Auto Const Mandatory
	ActorValue Property HealthAV Auto Const Mandatory
	ActorValue Property FV_AcidDamage Auto Const Mandatory
	ActorValue Property FV_AcidResistance Auto Const Mandatory
	ActorValue Property FV_AcidStrengthValue Auto Const Mandatory
	ActorValue Property FV_BlockSwallowFlag Auto Const Mandatory
	ActorValue Property FV_CurrentPrey Auto Const Mandatory
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
	GlobalVariable Property FV_ColdSteelEnabled Auto
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
	GlobalVariable Property FV_MaleColdSteelToggle Auto
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
	FV_ActorDataScript Property FV_ActorData Auto Const Mandatory
	FV_ColdSteelBellyScript Property FV_ColdSteelBellyQuest Auto Const Mandatory
	FV_PlayerStruggleScript Property FV_PlayerStruggle Auto Const Mandatory
	FV_ScatManagerScript Property FV_ScatManager Auto Const Mandatory
	FV_VoreHudScript Property FV_VoreHud Auto Const Mandatory
	FV_VoreSurvivalScript Property FV_VoreSurvival Auto Const Mandatory
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
CustomEvent OnDigest
CustomEvent OnVomit
CustomEvent OnDigestProtection

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

; KEILLA: I believe this is for the Gat bellies.
Struct VoreArmor
	Armor HumanVoreBelly
	Armor NonHumanVoreBelly
	Int PreyCount
EndStruct

;Initialise mod
Event OnInit()
	PlayerRef.AddPerk(FV_ContextVorePerk)
	RegisterForRemoteEvent(PlayerRef, "OnPlayerLoadGame")
	debug.trace("Fallout Vore v3.0 initialized")
	RegisterForPlayerSleep()
	RegisterForPlayerWait()
	FV_VoreSurvival.RegisterForVoreSurvival(True)
	RunDLCPatches()
EndEvent

Event Actor.OnPlayerLoadGame(Actor akSender)
	debug.trace("Fallout Vore v3.0 loaded")
	FV_VoreSurvival.RegisterForVoreSurvival(True)
	RunDLCPatches()
EndEvent

Function RunDLCPatches()
;GAZ: Function to detect DLC and add DLC Races to ActorData if present. Should check each time incase user buys DLC and continues save.
;This way is slightly uglier and more script-intensive on first run, but prevents us from needing to make patch-plugins that confuse and clutter load orders.
;I handle this patching here because there's no benefit to patch things before the Registry is fully ready to go.

	IF Game.IsPluginInstalled("DLCCoast.esm") && !DLC03Patched
		
		Perk pApexPredator = Game.GetFormFromFile(0x0000F8EC, "FalloutVore.esp") as Perk Const	;GAZ: Used ofte, so cache here!

		FV_ActorDataScript:SlotData DLC03Payload = new FV_ActorDataScript:SlotData
		DLC03Payload.ActorRace = Game.GetFormFromFile(0x000247C1, "DLCCoast.esm") as Race	;GAZ: Gulpers!
		DLC03Payload.IndigestionChanceIncrease = 20
		DLC03Payload.Slots = 12
		DLC03Payload.SwallowMessageToPlay = Game.GetFormFromFile(0x0000C384, "FalloutVore.esp") as Message
		DLC03Payload.SwallowPerkRequired = pApexPredator
		FV_ActorData.InjectAddedInfo(DLC03Payload)

		DLC03Payload = new FV_ActorDataScript:SlotData
		DLC03Payload.ActorRace = Game.GetFormFromFile(0x000180A8, "DLCCoast.esm") as Race	;GAZ: Hermit Crabs!
		DLC03Payload.IndigestionChanceIncrease = 20
		DLC03Payload.Slots = 12
		DLC03Payload.SwallowMessageToPlay = Game.GetFormFromFile(0x0000C385, "FalloutVore.esp") as Message
		DLC03Payload.SwallowPerkRequired = pApexPredator
		FV_ActorData.InjectAddedInfo(DLC03Payload)

		DLC03Payload = new FV_ActorDataScript:SlotData
		DLC03Payload.ActorRace = Game.GetFormFromFile(0x0004E28E, "DLCCoast.esm") as Race	;GAZ: Small Gulpers!
		DLC03Payload.CanAlwaysSwallow = True
		DLC03Payload.IndigestionChanceIncrease = 5
		DLC03Payload.Slots = 3
		FV_ActorData.InjectAddedInfo(DLC03Payload)

		DLC03Payload = new FV_ActorDataScript:SlotData
		DLC03Payload.ActorRace = Game.GetFormFromFile(0x0000FEEA, "DLCCoast.esm") as Race	;GAZ: Anglers!
		DLC03Payload.CanAlwaysSwallow = True
		DLC03Payload.IndigestionChanceIncrease = 5
		DLC03Payload.Slots = 4
		FV_ActorData.InjectAddedInfo(DLC03Payload)

		DLC03Payload = new FV_ActorDataScript:SlotData
		DLC03Payload.ActorRace = Game.GetFormFromFile(0x00014174, "DLCCoast.esm") as Race	;GAZ: Fog Crawlers!
		DLC03Payload.IndigestionChanceIncrease = 20
		DLC03Payload.Slots = 12
		DLC03Payload.SwallowMessageToPlay = Game.GetFormFromFile(0x0000C386, "FalloutVore.esp") as Message
		DLC03Payload.SwallowPerkRequired = pApexPredator
		FV_ActorData.InjectAddedInfo(DLC03Payload)

		DLC03Payload = new FV_ActorDataScript:SlotData
		DLC03Payload.ActorRace = Game.GetFormFromFile(0x0003FD66, "DLCCoast.esm") as Race	;GAZ: Rad Chickens!
		DLC03Payload.CanAlwaysSwallow = True
		DLC03Payload.Slots = 1
		FV_ActorData.InjectAddedInfo(DLC03Payload)

		DLC03Payload = new FV_ActorDataScript:SlotData
		DLC03Payload.ActorRace = Game.GetFormFromFile(0x0003DDDE, "DLCCoast.esm") as Race	;GAZ: Rad Rabbits!
		DLC03Payload.CanAlwaysSwallow = True
		DLC03Payload.Slots = 1
		FV_ActorData.InjectAddedInfo(DLC03Payload)

		Debug.Notification("FalloutVore detected Far Harbor DLC and patched it.")	;GAZ: Feedback is important so the player knows it's working.
		DLC03Patched = True

	EndIf

	IF Game.IsPluginInstalled("DLCNukaWorld.esm") && !DLC06Patched
		
		Perk pApexPredator = Game.GetFormFromFile(0x0000F8EC, "FalloutVore.esp") as Perk Const	;GAZ: Used ofte, so cache here!

		FV_ActorDataScript:SlotData DLC06Payload = new FV_ActorDataScript:SlotData
		DLC06Payload.ActorRace = Game.GetFormFromFile(0x0003637A, "DLCNukaWorld.esm") as Race	;GAZ: Gatorclaws!
		DLC06Payload.IndigestionChanceIncrease = 20
		DLC06Payload.Slots = 12
		DLC06Payload.SwallowMessageToPlay = Game.GetFormFromFile(0x0000C383, "FalloutVore.esp") as Message
		DLC06Payload.SwallowPerkRequired = pApexPredator
		FV_ActorData.InjectAddedInfo(DLC06Payload)

		DLC06Payload = new FV_ActorDataScript:SlotData
		DLC06Payload.ActorRace = Game.GetFormFromFile(0x0000AAFE, "DLCNukaWorld.esm") as Race	;GAZ: Cave Crickets!
		DLC06Payload.CanAlwaysSwallow = True
		DLC06Payload.IndigestionChanceIncrease = 5
		DLC06Payload.Slots = 2
		FV_ActorData.InjectAddedInfo(DLC06Payload)

		DLC06Payload = new FV_ActorDataScript:SlotData
		DLC06Payload.ActorRace = Game.GetFormFromFile(0x0004CBCE, "DLCNukaWorld.esm") as Race	;GAZ: Ghoulrillas!
		DLC06Payload.IndigestionChanceIncrease = 20
		DLC06Payload.Slots = 9
		DLC06Payload.SwallowMessageToPlay = Game.GetFormFromFile(0x0000C383, "FalloutVore.esp") as Message
		DLC06Payload.SwallowPerkRequired = pApexPredator
		FV_ActorData.InjectAddedInfo(DLC06Payload)

		FormList BlockedList = Game.GetFormFromFile(0x0000E1A8, "FalloutVore.esp") as FormList
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
	; trace(self, "Player has had Nuka Acid.  Vore items have been added to inventory.")
EndFunction

;******************************************************************************
; CONSUMPTION REGISTRY
; Tracks which actor ate each prey. Upon insertion each prey actor is given a
; sequential identifier as an Actor Value. They retain this ID forever.
; IDs are assigned sequentially from 1 to 2,147,483,647. They wrap around after that.
; (IS ID really necessary for anything?)
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

	PreyData data = new PreyData
	data.Pred = akPred
	data.Prey = akPrey
	data.BellyContainer = bellyContainer
	data.IsLethal = abIsLethal
	ConsumptionRegistry.Add(data)
	Return ConsumptionRegistry.Length - 1
EndFunction

; Remove a prey from the ConsumptionRegistry
bool Function Remove(Actor akPrey)
	int i = ConsumptionRegistry.FindStruct("prey", akPrey)
	if i < 0
		Return false
	else
		ConsumptionRegistry.Remove(i)
		Return true
	Endif
EndFunction

; Return all prey for a given pred
Actor[] Function GetAllPrey(Actor akPred)
	Actor[] prey = new Actor[0]
	int i = 0
	While i < ConsumptionRegistry.Length
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
	Actor[] preys = GetAllPrey(akPred)
	int alivePrey = 0
	int humanPrey = 0
	int i = 0
	While (i < preys.Length)
		If (!preys[i].isDead())
			alivePrey += 1
		EndIf
		If (FV_ActorData.GetIsHumanoid(preys[i]))
			humanPrey += 1
		EndIf
	EndWhile

	akPred.SetValue(FV_CurrentPrey, preys.Length)
	akPred.SetValue(FV_CurrentAlivePrey, alivePrey)
	akPred.SetValue(FV_HumanPreyCount, humanPrey)

	; Updates the belly appearance
	if(updateFullness)
		ChangeFullnessArmor(akPred, preys.Length)
	EndIf
	
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
	
	If akPred == PlayerRef
		FV_VoreHud.SendTrackerUpdate() ; Just emit an event dammit
	Endif
EndFunction

; Based on the CurrentPrey and DigestionStage AVs, decides how many child nodes to drop out of the buffer, and iterates through them.
Function UpdateDigestionPreyCount(Actor akPred)
	int currentSize = (((akPred.GetValue(FV_CurrentPrey)/2-1) * 3) + 6) as int
	int digestionStage = akPred.GetValue(FV_DigestionStage) as int
	If(currentSize > digestionStage)
		int slotsToDelete = currentSize - digestionStage
		bool keepSearching = true

		Actor[] preys = GetAllPrey(akPred)
		int i = 0
		While(i < preys.Length && keepSearching)
			int slotSize = FV_ActorData.EvaluateSlots(preys[i])
			slotSize = (((slotSize/2-1) * 3) + 3) as int
			If(slotSize < 3)
				slotSize = 3	;set to be minimum of 3.  2, 2 slot prey == 9 in timerstage space.  single slot prey are leading to very low
			Endif
			If(slotSize <= SlotsToDelete)
				Remove(preys[i])
				SlotsToDelete -= slotSize
			Else
				keepSearching = false
			Endif
				
			i += 1
		EndWhile
		UpdateCurrentInStomach(akPred = akPred)
	Endif
	
EndFunction

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
	trace(self, "Indigestion chance of " + chance + " has been calculated for prey " + akPrey)
	return chance
	
EndFunction

Struct SwallowActors
	Actor Pred
	Actor Prey
	bool LethalFlag
EndStruct

SwallowActors[] SwallowBuffer
bool bProcessingSwallow = false

;Perform swallow and register for vore events	
Function PerformVoreEvent(Actor akPred, Actor akPrey, bool bLethalFlag)
	SwallowActors temp = new SwallowActors
	temp.Pred = akPred
	temp.Prey = akPrey
	temp.LethalFlag = bLethalFlag
	If(SwallowBuffer == NONE)
		SwallowBuffer = new SwallowActors[0]
	EndIf
	SwallowBuffer.add(temp)
	CallFunctionNoWait("PerformVoreEvent1", new Var[0])
EndFunction

;Called from other functions if digestion is triggered externaly rarther than after prey death.
Function TriggerDigestionSequence(Actor currentPred)
	OnTimerTriggerDigestionSequence(currentPred)
EndFunction

;Vomits up the prey
function PerformVomit(Actor currentPred)
	Actor[] preys = GetAllPrey(currentPred)
	Actor randomPrey = preys[Utility.RandomInt(0, preys.Length - 1)]
	OnTimerPerformVomit(randomPrey) ; Do it now
EndFunction

;************************************************************************************
;************************************************************************************
; Vore events


; Perform swallow and register for vore events. 
Function PerformVoreEvent1()
	trace(self, "PerformVoreEvent1() Processing " + SwallowBuffer.length + " Swallow buffer...")
	trace(self, "PerformVoreEvent1() SwallowBuffer: " + SwallowBuffer)
	If(bProcessingSwallow) ; KEILLA: Is this a shitty concurrency lock?
		return
	EndIf
	bProcessingSwallow = true
	While SwallowBuffer.length > 0
		ProcessSingleSwallow(SwallowBuffer[0].Pred, SwallowBuffer[0].Prey, SwallowBuffer[0].LethalFlag)
		SwallowBuffer.remove(0)
		trace(self, "PerformVoreEvent1() " + SwallowBuffer.length + " remaining.")
		utility.WaitMenuMode(0.1) ; KEILLA: A random sleep.
	EndWhile
	bProcessingSwallow = false
EndFunction

; If predator doesn't have the nuka acid, set it.
Function ForceNukaAcidOnNPCPred(Actor akPred)
	If(akPred != PlayerRef)
		akPred.SetValue(FV_HasHadNukaAcid, 1)
	EndIf
EndFunction

Function DropCombatOnPlayerPrey(Actor akPred, Actor akPrey)
	; KEILLA: This is all RPG and game mechanical stuff related to being vored. Extract.
	trace(self, "Player is prey.  Adding local combatants to faction list to end combat against player.")
	Actor[] AllCombatNPC = akPrey.GetAllCombatTargets()
	PlayerRef.AddToFaction(FV_PredPreyFaction)
	PlayerRef.StopCombatAlarm()
	int i = 0
	While(i < AllCombatNPC.length)
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
Function ProcessSingleSwallow(Actor akPred, Actor akPrey, bool bLethalFlag)
	ForceNukaAcidOnNPCPred(akPred)
	
	;save Giant Belly value if this is the first prey pred is eating.  Prevents accidentally saving GiantBelly to 0 on subsequent prey
	; KEILLA: Seems like a presentational concern that should be cleaned up with better comms.
	If(FV_ColdSteelEnabled.GetValue() > 0 && akPred.GetValue(FV_CurrentPrey) as int == 0)
		FV_ColdSteelBellyQuest.SaveBelly(akPred)
	EndIf
	
	If(akPrey==PlayerRef)
		DropCombatOnPlayerPrey(akPred, akPrey)
	EndIf
	
	trace(self, "PerformVoreEvent: " + akPrey)
	
	; WIKI: Arrays that are created by scripts via the New operation or Add() function are limited to 128 elements.
	; Determines whether there is free space in the buffer. 
	; KEILLA: This should be impossible at this point. Stop the vore process earlier.
	If(ConsumptionRegistry != None && ConsumptionRegistry.Length > 125)
		PerformVoreEventReject(akPred, akPrey)
		Return
	EndIf

	if(akPred == akPrey) ; Pred cannot eat themselves.
		PerformVoreEventReject(akPred, akPrey)
		Return
	EndIf
	
	; Check if swallowing is blocked for some reason and reject.
	; KEILLA: Why is it being determined at -this- point?
	if(akPred.GetValue(FV_BlockSwallowFlag) != 0)
		If(akPred == PlayerRef && akPred.GetValue(FV_BlockSwallowFlag) == 1)
			FV_CannotSwallowIndigestionMessage.Show()
		ElseIf(akPred == PlayerRef && akPred.GetValue(FV_BlockSwallowFlag) == 2)
			FV_CannotSwallowCapacityMessage.Show()
		EndIf
		PerformVoreEventReject(akPred, akPrey)
		Return
	EndIf
	
	int maxCapacity = akPred.GetValue(FV_BellyCapacity) as int
	int predInPrey = akPrey.GetValue(FV_CurrentPrey) as int
	
	; Pred can exceed capacity in case of Voreception
	if(predInPrey > 0)
		maxCapacity = maxCapacity - predInPrey + StomachCapacityOverload
	EndIf
	
	if(akPred.GetValue(FV_CurrentPrey) < maxCapacity)
		If (akPrey == PlayerRef) ; Player is being vored
			If(!playerLayer)
				playerLayer = inputenablelayer.Create()
			EndIf
			
			if(bLethalFlag)
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
		EndIf
		
		Var[] akArgs = new Var[3]
		akArgs[0] = akPred
		akArgs[1] = bLethalFlag
		akArgs[2] = akPrey
		SendCustomEvent("OnSwallow", akArgs)
		
		; VORE SUCCESS
		PerformVoreEventAccept(akPred, akPrey, bLethalFlag)
		Return
	endif
	; If we reach this point there's not enough capacity and reject vore.
	FV_TooFullMessage.Show()
	PerformVoreEventReject(akPred, akPrey)
	
EndFunction

; Adds the prey to the PPA. Also performs accounting for many mod values and runs some game mechanics besides. KEILLA: Extract stuff.
Function PerformVoreEventAccept(Actor akPred, Actor akPrey, bool bLethalFlag)
	; Start indigestion behaviors. Extract/Delete
	If(akPrey.HasPerk(FV_CauseIndigestion01) && bLethalFlag)
		Int CauseIndigestion = Utility.RandomInt()
		If(akPrey.HasPerk(FV_CauseIndigestion03))
			akPred.SetValue(FV_IndigestionSeverityFlag, Utility.RandomInt(3,4))
			akPred.EquipItem(FV_IndigestionEffect , true, true)
		ElseIf(akPrey.HasPerk(FV_CauseIndigestion02) && CauseIndigestion <= 50)
			akPred.SetValue(FV_IndigestionSeverityFlag, Utility.RandomInt(2,4))
			akPred.EquipItem(FV_IndigestionEffect , true, true)
		ElseIf(CauseIndigestion <= 20)
			akPred.SetValue(FV_IndigestionSeverityFlag, Utility.RandomInt(1,4))
			akPred.EquipItem(FV_IndigestionEffect , true, true)
		EndIf
	EndIf
	;Chance of clothes ripping off
	; KEILLA: Extract to visuals/audios scripts.
	If(FV_ClothesRipChance.GetValue() > Utility.RandomInt())
	
		;Unequip (3 is the body slot for normal cloths)
		akPred.UnequipItemSlot(3)
		
		;Show clothes rip message
		FV_ClothesRipMessage.Show()
	
		;Sound of ripping
		FV_FXClothesRip.Play(akPred) ;GAZ: Don't use PlayAndWaits, this stalls the system.
	EndIf
	
	;Add prey to the prey array
	int PreyIndex = Add(akPred, akPrey)
	
	;Reset manual digestion
	If(akPred.GetValue(FV_ReadyToDigest) == 1)
		akPred.SetValue(FV_ReadyToDigest, 0)
	Endif
	
	;Mod tracking values
	UpdateCurrentInStomach(akPred)
	
	akPrey.ModValue(FV_TicksTillEscapeStart, akPred.GetValue(FV_Entrapment))
	akPrey.ModValue(FV_TicksTillEscape, akPrey.GetValue(FV_TicksTillEscapeStart))
	
	; TODO: broken until VoreHud can accept actors
	; If(akPred == PlayerRef)
		; FV_VoreHud.UpdateHealthBar(PreyIndex, akPrey) 
	; EndIf

	;Start vore timer
	If akPrey.IsDead()
		OnTimerPerformDigestion(akPrey)
	ElseIf akPrey == PlayerRef && bLethalFlag
		FV_PlayerStruggle.BeginStruggleMechanic(akPred, preyIndex)
	Else
		trace(self, "PerformVoreEventAccept() Start vore timer: " + PreyIndex)
		StartTimer(DigestionSpeed, DigestTimerID)
	EndIf
	ChangeFullnessArmor(akPred, akPred.GetValue(FV_CurrentPrey) as int)
	
	;Play swallow success audio
	var[] akArgs = new var[1]
	akArgs[0] = akPred
	CallFunctionNoWait("PlayAcceptSounds", akArgs)
EndFunction

bool bPlayingAcceptSounds = false
int iPlayerSoundID = -1

; Plays some vore sound effects. Has a debounce to avoid repeated overplay. This probably would work better as an event on a sound script.
Function PlayAcceptSounds(Actor akPred)
	If(bPlayingAcceptSounds)
		return
	EndIf
	trace(self, "PlayAcceptSounds() Test point 1")
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
		trace(self, "player failed to be swallowed.  Vore event rejection")
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
		trace(self, "OnTimer() aiTimerID: " + GhostTimerRemovalID + " player invulnerability remove.")
		PlayerRef.setGhost(False)
	ElseIf (aiTimerID == ReformTimerID)
		trace(self, "OnTimer() aiTimerID: " + ReformTimerID + " player reformed.")
		OnTimerReformPlayerFinish()
	ElseIf (aiTimerID == DigestTimerID)
		int i = 0
		PreyData data
		While i < ConsumptionRegistry.Length
			data = ConsumptionRegistry[i]
			int digestionStage = data.Prey.getValue(FV_DigestionStage) as int
			If digestionStage == 100 ; Prey is alive, taking damage.
				OnTimerDecreaseTicks(data)
			Else
				; TODO: Actually, doing fullness armor this way probably leads to flippy-floppy digestion appearance.
				If((FV_ColdSteelEnabled.GetValue() > 0 && (data.Pred.GetLeveledActorBase().GetSex() == 1 || FV_MaleColdSteelToggle.GetValue() == 1))) 
					FV_ColdSteelBellyQuest.ChangeColdSteelDigestFullness(data.Pred, digestionStage)
				Else
					ChangeDigestFullnessArmor(data.Pred, digestionStage)
				EndIf
				
				If digestionStage > 0
					OnTimerPlaySound(data)
					data.Pred.ModValue(FV_DigestionStage, -1)
					UpdateDigestionPreyCount(data.Pred)
				Else
					OnTimerFinishedDigestion(data)
				EndIf
			EndIf
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
		trace(self, "OnTimerState: " + aiTimerID)
		StartTimer(0.25, aiTimerID)
	EndEvent
endState

; Plays stomach noise sounds.
function OnTimerPlaySound(PreyData data)
	int instanceID = FV_FXStomachGurgle.Play(data.Pred) 	
	Sound.SetInstanceVolume(instanceID, 0.5)
EndFunction

; Tracks the mortality of prey by timer ID. Many triggers for the prey to be vomited for many reasons, protection against death, and eventually AV damage to prey and in the case of escape, the pred.
function OnTimerDecreaseTicks(PreyData data)
	; Dead pred autovomit
	if(data.Pred.IsDead())
		OnTimerPerformVomit(data.Prey)
		Return
	EndIf
	
	If(data.Prey.IsDead())
		;if prey is dead, there's no point in calculating damage.  Go ahead and kill it and move on.
		OnTimerPerformDigestion(data.Prey)
		return
	EndIf
	
	if(!data.IsLethal)
		; If you set manual regurgitation, do the vomit and reset.
		If(data.Pred.GetValue(FV_RegurgitateBool) == 1)
		
			;Reset regurgetate bool
			data.Pred.SetValue(FV_RegurgitateBool, 0)
			
			;Vomit
			OnTimerPerformVomit(data.Prey)
		Else
			If(data.Prey == PlayerRef && PlayerRef.GetDistance(data.Pred) > 4000) 
				; If the player is the prey, keep moving their invisible ghost closer to the predator so they don't get too far and unload or something.
				; KEILLA: This is absolutely besides the point of this function. Should be managed elsewhere.
				PlayerRef.TranslateToRef(data.Pred, 25000)
			Endif
		EndIf
		Return
	EndIf
	
	Actor currentPrey = data.Prey
	Actor currentPred = data.Pred
	
	currentPrey.ModValue(FV_TicksTillEscape, -1)
	
	; Calculate the belly acid damage.
	Float DamageDealt = (currentPred.GetValue(FV_AcidDamage)+currentPred.GetValue(EnduranceAV))*(1-(currentPrey.GetValue(FV_AcidResistance)-currentPred.GetValue(FV_AcidStrengthValue))/100)

	; If we might kill the prey
	If((currentPrey.GetValue(HealthAV) as float) - DamageDealt <= 0)										;Check if prey will die from damage.  If so, perform special handling
		trace(self, "damage greater than current health of enemny")
		If(currentPrey == PlayerRef) ; If player is the prey
			;we kill the player but have to make sure the triggerdigestionsequence is passed early enough, to prevent regurgitation of half dead player
			if(currentPrey.GetValuePercentage(HealthAV) > 0.5)
				currentPrey.DamageValue(HealthAV, ((currentPrey.getBaseValue(HealthAV) * 0.2)))
				Debug.Notification("Your predator enjoys feeling you struggle in their stomach.")
				FV_FXBurp.Play(currentPred)
			else
				Debug.Notification("You cease the futile escape attempts and succumb to your predator's stomach.")
				PlayerDies(currentPrey)
				return
			EndIf
		ElseIf(currentPrey.HasPerk(FV_DigestInvulnerability)) ; If invulnerable to digestion, force vomit the prey
			Var[] kArgs = new Var[2]
			kArgs[0] = CurrentPred
			kArgs[1] = CurrentPrey
			SendCustomEvent("OnDigestProtection", kArgs)
			OnTimerPerformVomit(data.Prey)
			return
		ElseIf(currentPrey.IsInFaction(HasBeenCompanionFaction)) ; If someone is digesting a companion
			If(FV_DigestCompanionProtection.GetValue()>0) ;Put companions in bleed out and then vomit them up
				currentPrey.DamageValue(HealthAV, DamageDealt)														
				OnTimerPerformVomit(data.Prey)
				return
			ElseIf(FV_KillEssentialEnabled.GetValue() == 1)
				currentPrey.KillEssential(currentPred)
			EndIf
		ElseIf(FV_KillEssentialEnabled.GetValue() == 1 && currentPrey.IsEssential())
			currentPrey.KillEssential(currentPred)
		Else
			currentPrey.Kill(currentPred)
		EndIf
	ElseIf(data.isLethal)
		currentPrey.DamageValue(HealthAV, DamageDealt) ;if prey was not meant to die, deal damage to it now
	EndIf

	; TODO: Broken until VoreHud can accept Prey
	; If(currentPred == PlayerRef)
	; 	FV_VoreHud.UpdateHealthBar(aiTimerID, currentPrey)
	; EndIf
	
	Int EscapeRoll = Utility.RandomInt()
	
	int EscapeCheck = 12 + currentPrey.GetValue(FV_EscapeChance) as int - CurrentPred.GetValue(FV_StomachStrength) as int
	
	If(!data.isLethal)	;set escape roll higher than escape chance is expected to happen to prevent accident escaping of non-lethal prey
		EscapeRoll = 999
	EndIf

	; KEILLA: THis seems redundant with the above check about whether the data.isDead, though in this case we are checking the Actor
	If(currentPrey.IsDead())
		OnTimerPerformDigestion(data.Prey)
	ElseIf((EscapeRoll < EscapeCheck && data.Tick <= 0 ) || currentPred.GetValue(FV_RegurgitateBool) == 1 || currentPrey.GetValue(FV_TicksTillEscape) <= 0)
		;deal damage if prey is escaping
		Float fEscapeDamage = currentPrey.GetValue(FV_EscapeDamage) as float
		If(fEscapeDamage > 0 && currentPred.GetValue(FV_RegurgitateBool) == 0)
			Float EscapeDamageValue = currentPred.GetBaseValue(HealthAV)*fEscapeDamage/100
			currentPred.DamageValue(HealthAV, EscapeDamageValue)
		EndIf
		data.Pred.SetValue(FV_RegurgitateBool, 0)
		;vomit
		trace(self, " OnTimerDecreaseTicks() Prey escaped - EscapeCheck: " + EscapeCheck + " EscapeRoll: " + EscapeRoll)
		OnTimerPerformVomit(data.Prey)
	EndIf
EndFunction

;End of lethal vore. Clears up variables and runs post vore actions TODO: Scat + other post vore options
; Does a lot, sounds, RPG stuff, Vore mechanics, move the inventories
function OnTimerPerformDigestion(Actor akPrey)
	PreyData data = GetDataByPrey(akPrey)
	
	Var[] kArgs = new Var[4]
	kArgs[0] = data.Pred
	kArgs[1] = 0 ; KEILLA: What is this?
	kArgs[2] = akPrey
	kArgs[3] = data.BellyContainer
	SendCustomEvent("OnDigest", kArgs)

	; BROKEN until prey can be passed to FV_VoreHud functions
	; If(CurrentPred == PlayerRef)
	; 	FV_VoreHud.RemoveHealthBar(aiTimerID)
	; EndIf

	akPrey.Kill(data.Pred)
	UpdateCurrentInStomach(data.Pred)
	
	int instanceID = FV_FXBurp.Play(data.Pred) 	
	Sound.SetInstanceVolume(instanceID, 0.5)					
		Sound.SetInstanceVolume(instanceID, 0.5)					
	Sound.SetInstanceVolume(instanceID, 0.5)					
		Sound.SetInstanceVolume(instanceID, 0.5)					
	Sound.SetInstanceVolume(instanceID, 0.5)					
	; EndIf
	
	;Increase the chance of indigestion
	data.Pred.ModValue(FV_IndigestionChanceOnNextDigest, CalculateIndigestionChance(data.Pred, akPrey))
	
	;Stats stuff
	If (data.Pred == PlayerRef || data.Pred.IsInFaction(HasBeenCompanionFaction))
		FV_ActorData.UpdateDigestCount(data.Pred, akPrey)
	EndIf
	
	; OH HEY, if you ate a robot, you get some fusion cells! Isn't this a good place to do that? KEILLA: It is not.
	If(akPrey.HasKeyword(ActorTypeRobot) && data.Pred.HasPerk(FV_HighIronDiet03))		
		data.Pred.Additem(AmmoFusionCell, akPrey.GetLevel()/2 as int, false)		
	EndIf
	
	;Add XP
	;CalculateVoreXP(CurrentPred, CurrentPrey)
	If(akPrey != PlayerRef)
		FV_ScatManager.ProcessPreyItems(akPrey, data.Pred)
	EndIf
	akPrey.AddItem(LLD_VEV_Crystals_Prey_FV_, 1, true)
	
	akPrey.RemoveAllItems(data.BellyContainer)
		
	;eliminate corpse and move back to original spawn location for cell reset
	If(akPrey != PlayerRef)
		akPrey.SetCriticalStage(4) ; The prey corpse is vaporized so it does not render.
		akPrey.MoveToMyEditorLocation()
		trace(self, "Prey NPC has been moved back to original editor location")
	EndIf
	
	;Was that the last prey in the stomach of the pred? 
	If((data.Pred.GetValue(FV_CurrentAlivePrey) <= 0 && data.Pred != PlayerRef) || (data.Pred.GetValue(FV_CurrentAlivePrey) <= 0 && FV_ManualDigestionEnabled.GetValue() == 0))
		;Trigger digestion as set to auto digest
		trace(self, "Start TriggerDigestionSequence")
		OnTimerTriggerDigestionSequence(data.Pred)
	ElseIf(data.Pred.GetValue(FV_CurrentAlivePrey) <= 0)
		; You do not digest while you have alive prey
		data.Pred.SetValue(FV_ReadyToDigest, 1)
		If(data.Pred == Game.GetPlayer())
			FV_ReadyToDigestMessage.Show()
		EndIf
	EndIf
	
	trace(self, "PerformDigestion - Done")
EndFunction

; Updates the digestion stages on the predator AV, implements some indigestion stuff, and calls to update belly appearances.
Function OnTimerTriggerDigestionSequence(Actor akPred)
	If(akPred == PlayerRef)
		FV_VoreHud.ClearHealthBars()
	EndIf
	;Get chance of getting indigestion from actor value
	float indigestionChance = akPred.GetValue(FV_IndigestionChanceOnNextDigest)
	
	;0-100 chance diceroll	
	int diceRoll = Utility.RandomInt()
	
	trace(self, "Indigestion Chance: " + indigestionChance)
	trace(self, "Dice Roll: " + diceRoll)
	
	akPred.SetValue(FV_ReadyToDigest, 0)
	
	;Play digesting sound if triggered
	If(FV_ManualDigestionEnabled.GetValue() == 1)
		FV_FXBurp.Play(akPred)
	EndIf
	
	;Check for indigestion
	If(indigestionChance > diceRoll)

		;Work out how bad the indigestion is.
		If(indigestionChance - diceRoll <= 20)
			;Minor
			If(akPred == PlayerRef)
				FV_IndigestionMinorMessage.Show()
			EndIf
			akPred.SetValue(FV_IndigestionSeverityFlag, 1)
		ElseIf(indigestionChance - diceRoll <= 35)
			;Normal
			If(akPred == PlayerRef)
				FV_IndigestionNormalMessage.Show()
			EndIf
			akPred.SetValue(FV_IndigestionSeverityFlag, 2)
		ElseIf(indigestionChance - diceRoll <= 60)
			;Major
			If(akPred == PlayerRef)
				FV_IndigestionMajorMessage.Show()
			EndIf
			akPred.SetValue(FV_IndigestionSeverityFlag, 3)
		Else
			;Severe
			If(akPred == PlayerRef)
				FV_IndigestionSevereMessage.Show()
			EndIf
			akPred.SetValue(FV_IndigestionSeverityFlag, 4)
		EndIf	
		
		;Cause Indigestion
		akPred.EquipItem(FV_IndigestionEffect , true, true)
		
	EndIf
	
	;Mod the chance of indigestion to zero for next digest
	akPred.ModValue(FV_IndigestionChanceOnNextDigest, -1*akPred.GetValue(FV_IndigestionChanceOnNextDigest))
	
	trace(self, "Reset indigestion chance: " + akPred.GetValue(FV_IndigestionChanceOnNextDigest))
		
	;Remove bulge belly
	ChangeFullnessArmor(akPred, -1)				;changed pass value from 0 to -1 to avoid resetting ColdSteel Giant Belly
	
	int CurrentInStomach = (((akPred.GetValue(FV_CurrentPrey)/2-1) * 3) + 6) as int ; KEILLA: What is this magic math?
	akPred.SetValue(FV_DigestionStage, CurrentInStomach)

	trace(self, "OnTimerTriggerDigestionSequence() CurrentInStomach: " + CurrentInStomach + " currentPred: " + akPred)
	PreyData data = GetDataByPred(akPred)
	Var[] kArgs = new Var[4]
	kArgs[0] = akPred
	kArgs[1] = 3 ; KEILLA: What is this?
	kArgs[2] = data.Prey
	kArgs[3] = data.BellyContainer
	SendCustomEvent("OnDigest", kArgs)
		
	; KEILLA: More presentational stuff about the belly appearance
	If((FV_ColdSteelEnabled.GetValue() > 0 && (akPred.GetLeveledActorBase().GetSex() == 1 || FV_MaleColdSteelToggle.GetValue() == 1)))
		; UpdateColdSteelCounter(aiTimerID, ColdSteelCounts as int) KEILLA: TBD what this is
		FV_ColdSteelBellyQuest.ChangeColdSteelDigestFullness(akPred, (CurrentInStomach as float))
	Else
		ChangeDigestFullnessArmor(akPred,CurrentInStomach)
	EndIf
EndFunction

; Plays sounds, updates belly graphics, prepares scat, sends events, does player reformation....
Function OnTimerFinishedDigestion(PreyData aData)
	trace(self, "OnTimerFinishedDigestion: " + aData)
	if(aData == None)
		trace(self, "[BUG] OnTimerFinishedDigestion")
		Return
	EndIf

	Actor soundActor 		= aData.Pred 
	Actor currentPred		= aData.Pred
	Actor currentPrey		= aData.Prey

	int instanceID = FV_FXBurp.Play(aData.Pred) 	
	Sound.SetInstanceVolume(instanceID, 0.5)					

    ;End of digestions
    currentPred.SetValue(FV_DigestionStage, 0)
	
	;Only activate for the prey. Prevents crash TODO: Other methods of item retrival.
	If(currentPred == PlayerRef)
		
		If(FV_ScatEnabled.GetValue() == 1)
			If(currentPred.getValue(FV_Scatready) == 0)
				currentPred.SetValue(FV_Scatready, 1)
				FV_ReadyToScatMessage.show()
			EndIf
		EndIf
	;Activate belly container for player if they are not a pred and an ally has finished digestion
	ElseIf(currentPred.IsInFaction(CurrentCompanionFaction) && FV_CompanionScat.GetValue() == 1)
		currentPred.SetValue(FV_Scatready, 1)
	ElseIf(FV_ScatEnabled.GetValue() == 1 && FV_NPCScatEnabled.GetValue() == 1 && !currentPred.IsInFaction(CurrentCompanionFaction))
		FV_ScatManager.NPCScat(currentPred) ; NPCs autoscat
	ElseIf(PlayerRef.GetValue(FV_HasHadNukaAcid) == 0 && (currentPred.IsInFaction(WorkshopNPCFaction) || currentPred.IsInFaction(WorkshopDialogueFaction) || currentPred.IsInFaction(CurrentCompanionFaction)))
		FV_BellyContainer.Activate(PlayerRef, false) ; Auto-open belly container if you don't have nukaacid and you're in some workshop faction thing
	EndIf
	
	if(currentPred == PlayerRef)
		FV_VoreHud.SendTrackerUpdate()
	Endif
	
	If(currentPrey == PlayerRef && PlayerRef.HasPerk(FV_ReformPerk01))
		ReformPlayer(currentPred)	;may need to add ways to keep player as last prey no matter what.  Potential for player to get lost in prey heirarchy
	EndIf
	
	;Custom event transmission
	Var[] kArgs = new Var[4]
	kArgs[0] = currentPred
	kArgs[1] = 1
	kArgs[2] = NONE
	kArgs[3] = aData.BellyContainer
	SendCustomEvent("OnDigest", kArgs)

	Remove(currentPrey)
EndFunction
	
; Reenable the player when the player's time as prey is up.
Function OnTimerReformPlayerFinish()
	trace(self, "OnTimerReformPlayerFinish()")
	
	PlayerRef.setAlpha(1, False)																			;Make player visible again
	playerLayer.Reset()																		;Enable player controls
	FV_PlayerAsPreyContext.SetValue(0)
	
	ClearPredPreyFaction()

	StartTimer(4, GhostTimerRemovalID)	
EndFunction

;************************************************************************************
;************************************************************************************
; Vomit events
	
;Vomits up the prey. KEILLA: The timerID is usually the pred.
function OnTimerPerformVomit(Actor akPrey)

	
	PreyData data = GetDataByPrey(akPrey)
	Actor currentPred = data.Pred
	; TODO: Broken until VoreHud can receive a prey
	; If(currentPred == PlayerRef)
		; FV_VoreHud.RemoveHealthBar(aiTimerID) 
	; EndIf
	
	;Play vomit audio
	int instanceID = FV_FXVomit.Play(currentPred) 	
	Sound.SetInstanceVolume(instanceID, 0.25)					
	
	; update stomach value and update armor
	UpdateCurrentInStomach(currentPred, true)
	
	Var[] kArgs = new Var[2]
	kArgs[0] = currentPred	
	kArgs[1] = akPrey
	SendCustomEvent("OnVomit", kArgs)
	Remove(akPrey)
EndFunction

;************************************************************************************
;************************************************************************************
; Others

; Update Fullness Armor
Function ChangeFullnessArmor(actor ak, Int newValue)
	Bool UseColdSteel = false
	Bool[] RemoveHumanArmor = new Bool[VoreBellyArray.Length]
	Bool[] RemoveNonHumanArmor = new Bool[VoreBellyArray.Length]
	int i = 0
	Int oldValue = 0
	While(i < VoreBellyArray.Length)
		RemoveHumanArmor[i] = ak.GetItemCount(VoreBellyArray[i].HumanVoreBelly) > 0
		RemoveNonHumanArmor[i] = ak.GetItemCount(VoreBellyArray[i].NonHumanVoreBelly) > 0
		If(RemoveHumanArmor[i] || RemoveNonHumanArmor[i])
			oldValue = VoreBellyArray[i].PreyCount
		EndIf
		i += 1
	EndWhile

	trace(self, "ChangeFullnessArmor: " + ak + " From: " + oldValue + " To: " + newValue)

	If((FV_ColdSteelEnabled.GetValue() > 0 && (ak.GetLeveledActorBase().GetSex() == 1 || FV_MaleColdSteelToggle.GetValue() == 1))) ;ak.HasKeyword(FV_ColdSteelBody))
		UseColdSteel = FV_ColdSteelBellyQuest.ChangeColdSteelFullness(ak, newValue)
	EndIf
	
	If(!UseColdSteel && newValue > 0)
		If(ak.GetValue(FV_HumanPreyCount) >= ak.GetValue(FV_CurrentPrey)/2)
			If(!RemoveHumanArmor[newValue - 1])
				ak.EquipItem(VoreBellyArray[newValue - 1].HumanVoreBelly, true, true)
			EndIf
			RemoveHumanArmor[newValue - 1] = false
		Else
			If(!RemoveNonHumanArmor[newValue - 1])
				ak.EquipItem(VoreBellyArray[newValue - 1].NonHumanVoreBelly, true, true)
			EndIf
			RemoveNonHumanArmor[newValue - 1] = false
		EndIf
	EndIf
	i = 0
	While(i < VoreBellyArray.Length)
		If(RemoveHumanArmor[i])
			ak.UnEquipItem(VoreBellyArray[i].HumanVoreBelly, true, true)
			ak.RemoveItem(VoreBellyArray[i].HumanVoreBelly, 1, true, NONE)
		EndIf
		If(RemoveNonHumanArmor[i])
			ak.UnEquipItem(VoreBellyArray[i].NonHumanVoreBelly, true, true)
			ak.RemoveItem(VoreBellyArray[i].NonHumanVoreBelly, 1, true, NONE)
		EndIf
		i += 1
	EndWhile
EndFunction

; Change digest fullness armor
function ChangeDigestFullnessArmor(Actor currentDigester, int item = -1) ; item 0 - 99 or -1 to remove laa
	trace(self, "ChangeDigestFullnessArmor: " + currentDigester + ", " + item)

	if(item == -1)
		int i = 1
		While (i < DigestionArmor.Length)
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
		trace(self, "Player swallowed.  Switching camera to NPC pred")
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
	While(i<FV_PredPreyFormList.GetSize())
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
		
	trace(self, "          ResetVoreMod")
	Utility.Wait(4 as float)																					
	trace(self, "          CancelTimer")
	CancelTimer(DigestTimerID)

	PreyData data = GetDataByPrey(PlayerRef)
	if(data != NONE || abResetPlayer)
		trace(self, "          Reset player")
		PlayerRef.setAlpha(1, False)
		if(playerLayer)	
			playerLayer.Reset()		
		EndIf
		FixCamera(PlayerRef)
		Utility.SetINIFloat("fVertibirdVanityModeMaxDist:Camera", fCameraDistanceVomit)
		Utility.SetINIBool("bApplyCameraNodeAnimations:Camera", 1)

		ClearPredPreyFaction()
		PlayerRef.setGhost(False)
		PlayerRef.MoveTo(data.Pred)		;Move the player to their pred
		PlayerRef.EquipItem(FV_RemoveSwallowProtection, true, true)
		Remove(PlayerRef)
		Utility.Wait(4 as float)
	EndIf
	If((FV_ColdSteelEnabled.GetValue() > 0 && (PlayerRef.GetLeveledActorBase().GetSex() == 1 || FV_MaleColdSteelToggle.GetValue() == 1)))
		FV_ColdSteelBellyQuest.ResetMorphs(PlayerRef)
	EndIf
	ChangeFullnessArmor(PlayerRef,0)
	ChangeDigestFullnessArmor(PlayerRef)
	
	PlayerRef.SetValue(FV_CurrentPrey, 0)
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
	
	trace(self, "          Reset pred and prey")
	int i = 0
	While (i < ConsumptionRegistry.Length)
		data = ConsumptionRegistry[i]
	
		ChangeFullnessArmor(data.Pred, 0)
		ChangeDigestFullnessArmor(data.Pred)
		If((FV_ColdSteelEnabled.GetValue() > 0 && (data.Pred.GetLeveledActorBase().GetSex() == 1 || FV_MaleColdSteelToggle.GetValue() == 1))) ;data.Pred.HasKeyword(FV_ColdSteelBody))
			FV_ColdSteelBellyQuest.ResetMorphs(data.Pred)
		EndIf
		data.Pred.SetValue(FV_CurrentPrey, 0)
		data.Pred.SetValue(FV_CurrentAlivePrey, 0)
		data.Pred.SetValue(FV_TicksTillEscape, 0)
		data.Pred.SetValue(FV_TicksTillEscapeStart, 0)
		data.Pred.SetValue(FV_IndigestionChanceOnNextDigest, 0)
		data.Pred.SetValue(FV_HumanPreyCount, 0)
		If(data.Pred.GetValue(FV_BlockSwallowFlag) == 2)
			data.Pred.SetValue(FV_BlockSwallowFlag, 1)
		Else
			data.Pred.SetValue(FV_BlockSwallowFlag, 0)
		EndIf
		data.Pred.SetValue(FV_DigestionStage, 0)
		data.Pred.SetValue(FV_ReadyToDigest, 0)
		data.Pred.SetValue(FV_IndigestionSeverityFlag, 0)
		data.Pred.SetValue(FV_HasBloating, 0)
		If(data.Pred.HasPerk(FV_HeavyPredNPC))
			data.Pred.RemovePerk(FV_HeavyPredNPC)
		Endif
	
		
		data.Prey.MoveTo(data.Pred)																			
		data.Prey.setPosition(data.Pred.getPositionX(), data.Pred.getPositionY(), data.Pred.getPositionZ())	
		ChangeFullnessArmor(data.Prey,0)
		ChangeDigestFullnessArmor(data.Prey)
		If((FV_ColdSteelEnabled.GetValue() > 0 && (data.Prey.GetLeveledActorBase().GetSex() == 1 || FV_MaleColdSteelToggle.GetValue() == 1))) ;data.Prey.HasKeyword(FV_ColdSteelBody))
			FV_ColdSteelBellyQuest.ResetMorphs(data.Prey)
		EndIf
		data.Prey.SetValue(FV_CurrentPrey, 0)
		data.Prey.SetValue(FV_CurrentAlivePrey, 0)
		data.Prey.SetValue(FV_TicksTillEscape, 0)
		data.Prey.SetValue(FV_TicksTillEscapeStart, 0)
		data.Prey.SetValue(FV_IndigestionChanceOnNextDigest, 0)
		data.Prey.SetValue(FV_HumanPreyCount, 0)
		If(data.Prey.GetValue(FV_BlockSwallowFlag) == 2)
			data.Prey.SetValue(FV_BlockSwallowFlag, 1)
		Else
			data.Prey.SetValue(FV_BlockSwallowFlag, 0)
		EndIf
		data.Prey.SetValue(FV_DigestionStage, 					0)
		data.Prey.SetValue(FV_ReadyToDigest, 					0)
		data.Prey.SetValue(FV_IndigestionSeverityFlag, 			0)
		data.Prey.SetValue(FV_HasBloating,						0)
		If(data.Prey.HasPerk(FV_HeavyPredNPC))
			data.Prey.RemovePerk(FV_HeavyPredNPC)
		Endif
		data.Prey.EquipItem(FV_RemoveSwallowProtection, true, true)
		
		i += 1
	EndWhile
	
	ConsumptionRegistry.Clear()
	FV_ManualDigestionEnabled.SetValue(0)
	trace(self, "          Done !")
	Debug.MessageBox("ResetVoreMod, Done !")
	ModResetting = false
	GotoState("")
EndFunction

bool Function trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, PreyData data = NONE) debugOnly
	;we are sending callingObject so we can in the future route traces to different logs based on who is calling the function
	string logName = "FalloutVore"
	debug.OpenUserLog(logName)
	If(data != NONE)
		debug.TraceUser(logName, CallingObject + ": Outputting struct information.", aiSeverity)
		RETURN debug.TraceUser(logName, CallingObject + ": " + data, aiSeverity)
	Else
		RETURN debug.TraceUser(logName, CallingObject + ": " + asTextToPrint, aiSeverity)
	EndIf
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
	trace(self, " OnPlayerSleepStop() WakeDay: " + WakeDay)
	PlayerSleepWaitStop()
EndEvent

; Records the sleep/wait start time.
Function OnPlayerWaitSleepStart(float afSleepWaitStartTime, float afDesiredWaitSleepEndTime)
	trace(self, " OnPlayerWaitSleepStart() afSleepWaitStartTime: " + afSleepWaitStartTime + " afDesiredSleepEndTime: " + afDesiredWaitSleepEndTime + " WakeDay: " + WakeDay)
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
	while i < ConsumptionRegistry.Length
		HandleDigestionStage(ConsumptionRegistry[i])
		i += 1
	EndWhile
EndFunction

; This should run digestion stages for all the prey for the data pred.
Function HandleDigestionStage(PreyData aData)
	int DigestTicksRemaining = 0
	int tempTimerState
	
	If aData.Pred.GetValue(FV_CurrentAlivePrey) > 0 || !aData.IsLethal
		;only handle preds that are in the digestin phase.  If they still have living prey, they can ride out the sleep cycle.
		trace(self, "  HandleDigestionStage() Pred: " + aData.Pred + " FV_CurrentAlivePrey: " + aData.Pred.GetValue(FV_CurrentAlivePrey) + " IsLethal: " + aData.IsLethal)
		return
	Endif
	WakeUpTick = math.floor(((WakeDay - SleepWaitStartDay)*1440)/(aData.Prey.GetValue(FV_DigestionSpeed)*TimeScale.GetValue()/60)) as int
	
	tempTimerState = aData.Pred.GetValue(FV_DigestionStage) as int
	trace(self, " HandleDigestionStage() Pred: " + aData.Pred + " WakeUpTick: " + WakeUpTick + " tempTimerState: " + tempTimerState)
	If WakeUpTick >= tempTimerState
		;code to finish digestion and reset pred
		aData.Pred.SetValue(FV_DigestionStage, 0)
		
		If((FV_ColdSteelEnabled.GetValue() > 0 && (aData.Pred.GetLeveledActorBase().GetSex() == 1 || FV_MaleColdSteelToggle.GetValue() == 1))); preydata.Pred.HasKeyword(FV_ColdSteelBody))
			FV_ColdSteelBellyQuest.ChangeColdSteelDigestFullness(aData.Pred, 0.0)
		Else
			ChangeDigestFullnessArmor(aData.Pred, 0)
		EndIf
		OnTimerFinishedDigestion(aData)
	Else
		float nextTimerState = tempTimerState - WakeUpTick
		aData.Pred.SetValue(FV_DigestionStage, nextTimerState)
		UpdateDigestionPreyCount(aData.Pred)
		If((FV_ColdSteelEnabled.GetValue() > 0 && (aData.Pred.GetLeveledActorBase().GetSex() == 1 || FV_MaleColdSteelToggle.GetValue() == 1))); aData.Pred.HasKeyword(FV_ColdSteelBody))
			FV_ColdSteelBellyQuest.ChangeColdSteelDigestFullness(aData.Pred, nextTimerState)
		Else
			ChangeDigestFullnessArmor(aData.Pred, nextTimerState as int)
		EndIf
		OnTimerTriggerDigestionSequence(aData.Pred)
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
	
	OnTimerPerformDigestion(akPrey) ; You get digested if secondwind doesn't trigger.
EndFunction