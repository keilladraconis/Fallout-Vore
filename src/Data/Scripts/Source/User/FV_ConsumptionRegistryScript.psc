Scriptname FV_ConsumptionRegistryScript extends Quest
{Registry script to store Consumption data globaly for scripts to use.}

Group ActorValues
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
Actor PlayerRef
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
int BranchTypePred 					= 1 const		; never change
int BranchTypePrey 					= 2 const		; never change
int GhostTimerRemovalID				= 9999999 const	; used to remove Ghost invulnerability from player
int ReformTimerID					= 10000000 const
Float ColdSteelCounts				= 18.0 const

; Options
int StomachCapacityOverload 		= 2 const   	; max stomach overload, when a predator eat another predator
int StomachCapacityMax		 		= 125 const		; If you increase this value, you must change functions 'ChangeFullnessArmor' 'ChangeDigestFullnessArmor'
bool DigestionAllowsBloating		= True const	; during an indigestion, allows the belly to randomly grow
bool AllowPredReEatPrey				= True const

float Property fCameraDistanceSwallow Auto Hidden
float Property fCameraDistanceVomit Auto Hidden


float PlayerSize = 1.0

; Contain information about one Prey
Struct VoreData
; Common
	Int BranchType          ; Identifies whether node is a predator branch (BranchTypePred) or prey branch (BranchTypePrey)
	Int Index				; readonly KEILLA
	Int Tick				; To create a delay between 'transfer' 'swallow' 'vomit'
	Int ParentIndex			; Parent KEILLA
	Int ParentIndexCopy		; Parent, readonly KEILLA
	Int TimerState			; 100: alive in stomach, 99-0: digesting
	Int LastIndex			; Used for the sleep/wait timers to remember the last prey that drives the digestion timer KEILLA: What the hell
	
; Pred
    Actor Pred				; Current Pred
	
; Prey
	Actor Prey				; Prey in the Pred
	Bool IsLethal   		; KEILLA Wut
	Bool IsDead				; KEILLA um, duplicate of timerstate?
	Bool IsHumanoid			;used to determine if lumpy bellies are used KEILLA: Why?
	Bool IsPredator			; KEILLA also why?
	Bool HasDigested		; Used to prevent OnTimerPerformDigestion() from firing multiple times KEILLA: Duplicate of timerstate?
	Int Slots				; Used to determine how many slots the prey use
	
; Other 
	Bool ContainAPrey		; KEILLA: Voreception?
	ObjectReference NPCBellyContainer ; KEILLA: What for?
	Int CustomVar1 ; Used for indigestion
	Int CustomVar2 ; Unused
	Int CustomVar3 ; Unused
	Int ColdSteelCounter ; KEILLA: What?
	Float DigestSpeedTime ; KEILLA: What what?
EndStruct

; KEILLA: I believe this is for the Gat bellies.
Struct VoreArmor
	Armor HumanVoreBelly
	Armor NonHumanVoreBelly
	Int PreyCount
EndStruct

; KEILLA: Is this like a duplicate of the VoreData?
Struct SlotData
	Keyword ActorType
	Race ActorRace
	Int Slots = 2
	Bool IsHuman = false
	Int IndigestionChanceIncrease = 0
	Perk IndigestionIncreaseCancelPerk = NONE
EndStruct

; Main Buffer
VoreData[] PredPreyArray

; This global tracks the "tail" of the array, returning the "index" which that slot believes it is in.
; KEILLA: What the actual fuck, why is this not just PredPreyArray.Length()?
Int CurrentVoreIndex

;Initialise mod
Event OnInit()
	PlayerRef = Game.GetPlayer() ; KEILLA: Replace with a Property
	PlayerRef.AddPerk(FV_ContextVorePerk)
	RegisterForRemoteEvent(PlayerRef, "OnPlayerLoadGame")
	;EventRegistration()
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

;************************************************************************************
; PREDATION BUFFER
; 
; This is an implementation of a data structure that tracks all predators and their prey contents
; in the game. It features a global lock to protect concurrent access. The underlying structure is
; an array, which is constrained to 128 elements. Each element is a VoreData of BranchTypePred or BranchTypePrey.Function AddInventoryEventFilter(Form akFilter)
; Each element has an index pointer to its 'parent', which for a prey element is likely a predator.

bool BufferLock = false
int iBufferLockCount = 1
; Concurrency protection. Because if this script calls out to another script or latent thread, it yields execution to other callers.
Function GetBufferLock()
	iBufferLockCount += 1
	While (BufferLock)
		Utility.Wait(0.1 * iBufferLockCount) ; Hang the thread while waiting for another thread to wakeup and release the lock.
	EndWhile
	BufferLock = true
	iBufferLockCount -= 1
EndFunction

; Insert Pred, Prey into the buffer
Int Function InsertIntoBuffer(Actor akPred, Actor akPrey, Bool bIsLethal)
	; Initialize array
	if(PredPreyArray == None)
		PredPreyArray = New VoreData[0]
		PredPreyArray.Clear()
	EndIf
	
	GetBufferLock()
	;Check if prey wasn't cleared from array before. KEILLA: How was this possible?
	; KEILLA: FindStruct is O(n) it scans the whole array.
	int oldIndex = PredPreyArray.FindStruct("Prey", akPrey)
	If oldIndex >= 0
		PredPreyArray.Remove(oldIndex)
	EndIf
	
	; Create new structure
	VoreData parentData = InsertIntoBuffer_FindParent(akPred) ; KEILLA: Scan array again, find or create pred.
	VoreData data = new VoreData
	
	data.Prey 				= akPrey
	data.Pred 				= None
	data.ParentIndex 		= parentData.Index
	data.ParentIndexCopy 	= parentData.Index ; KEILLA WHY?
	data.IsLethal 			= bIsLethal
	data.Index 				= GetNextIndex() ; KEILLA: Scan array again.
	Data.Tick 				= 2
	Data.IsDead				= akPrey.IsDead()
	Data.HasDigested		= false
	Data.BranchType  		= BranchTypePrey
	Data.TimerState			= 100	
	Data.ColdSteelCounter	= ColdSteelCounts as int
	Data.slots				= FV_ActorData.EvaluateSlots(akPrey) ; Scan the actordata array
	Data.IsHumanoid			= FV_ActorData.GetIsHumanoid(akPrey) ; Twice
	Float tempDigestSpeedTime = FV_DigestionSpeedBase.GetValue() - akPred.GetValue(FV_DigestionSpeed)
	If(tempDigestSpeedTime < 1.0)
		tempDigestSpeedTime = 1.0
	EndIf
	Data.DigestSpeedTime	= tempDigestSpeedTime
	
	If akPred.GetValue(FV_DigestionStarted) > 0
		;reset DigestionStarted to allow coldsteel bellies to update properly
		akPred.SetValue(FV_DigestionStarted, 0)
	EndIf
	
	; Search if this prey already exist in the buffer
	; WHY? Because if a pred eats you, then both you and the pred go in the buffer. But if that pred
	; gets eaten, then they are already in the buffer, but get re-parented.
	int i = PredPreyArray.FindStruct("Pred", akPrey) ; Scan array again.
	int index = -1
	if(i >= 0) ; Ok, so you ate someone you or someone else already ate.
		PredPreyArray[i].ParentIndex 	= parentData.Index
		PredPreyArray[i].IsPredator 	= True
		PredPreyArray[i].IsLethal 		= bIsLethal
		index 							= PredPreyArray[i].Index
		; Edge case: Player was predated by this prey, so the camera is following the pred which is now eaten and 
		; teleported to belly cell, which will cause the camera to go nuts.
		int j = PredPreyArray.FindStruct("Prey", PlayerRef)	;Search here if prey of this pred is the player ; KEILLA: SCAN AGAIN
		If(j >= 0)
			If(PredPreyArray[j].ParentIndex == PredPreyArray[i].Index)	;Check if the player's pred is the pred that was swallowed
				PredPreyArray[j].ParentIndex = PredPreyArray[i].ParentIndex	;Move the player up to prevent camera issues
				trace(self, "Player was prey of a pred that was swallowed.  Player has been moved to the new pred and had camera set to it.")
				Game.SetCameraTarget(akPred)
				Game.ForceFirstPerson()
				Utility.wait(0.2)
				Game.ForceThirdPerson() ; I guess sometimes the camera does not go into third person?
			EndIf
		EndIf
	Else
		PredPreyArray.Add(data)
		index = data.Index
	EndIf
	
	BufferLock = false
	return index
EndFunction


; Private
; Finds or creates the parent VoreData from the PredPreyArray.
VoreData Function InsertIntoBuffer_FindParent(Actor akPred)
	int i = PredPreyArray.FindStruct("Pred", akPred)
	if(i >= 0)
		Return PredPreyArray[i]
	EndIf
	
	VoreData parentData 		= new VoreData
	parentData.Pred 			= akPred
	parentData.BranchType 		= BranchTypePred
	parentData.Index 			= GetNextIndex() ; KEILLA: Scan array again.
	parentData.Tick 			= 2
	parentData.ParentIndex 		= -1
	parentData.ParentIndexCopy 	= -1
	parentData.TimerState		= 100	
	
	If(akPred != PlayerRef)
		parentData.NPCBellyContainer = akPred.PlaceAtMe(FV_NPCBellyContainer) ; KEILLA Where the hell are we placing these belly containers? In the belly cell?
	EndIf
	
	PredPreyArray.Add(parentData)
	
	Return parentData
EndFunction

; Private
; Scan the array for the current index. If we find it, increment the index and recurse.
; This index is not the array index. Rather, it's a monotonic ID, or it should be if it were implemented correctly.
; KEILLA: What the fuck is this, O(n^2)?
Int Function GetNextIndex()
	int result = CurrentVoreIndex
	CurrentVoreIndex += 1
	if(CurrentVoreIndex >= 999999)
		CurrentVoreIndex=0
	EndIf
	
	if(PredPreyArray.FindStruct("Index", result) >=0)
		Return GetNextIndex()
	EndIf
	
	Return result
EndFunction

; Removes a pred/prey from the buffer based on their ID. O(n)
Function RemoveFromBuffer(Int iIndex)
	int i = PredPreyArray.FindStruct("Index", iIndex)
	if(i >= 0)
		PredPreyArray.Remove(i)
	EndIf
EndFunction

; If an entry has no children, remove it by ID.
Function RemoveFromBufferIfNochildren(Int iIndex)
	int i = PredPreyArray.FindStruct("Index", iIndex)
	if(i < 0)
		Return
	EndIf
	
	int j = GetNumberOfPrey(iIndex)
	if(j==0)
		PredPreyArray.Remove(i)
	EndIf
EndFunction

; Scan the array and find some entry by its ID.
VoreData Function GetFromIndex(Int iIndex)
	Int i = PredPreyArray.FindStruct("Index", iIndex)
	if(i < 0) 
		trace(self, "GetFromIndex: NONE")
		Return None
	EndIf
	VoreData data = PredPreyArray[i]
	trace(self, "GetFromIndex: " + data)
	Return data
EndFunction

; retrieve the pred from prey index 
; KEILLA: Same shit as GetFromIndex, but with additional bugs.
VoreData Function GetPredFromIndex(Int iIndex)
	Int i = PredPreyArray.FindStruct("Index", iIndex)
	if(i < 0) 
		trace(self, "GetPredFromIndex: NONE")
		Return None
	EndIf
	VoreData data = PredPreyArray[i]
	if(data.Pred == None)
		trace(self, "GetPredFromIndex: This is not a pred")
	EndIf
	trace(self, "GetPredFromIndex: " + data)
	Return data
EndFunction

; retrieve the prey from prey index 
; KEILLA: Same shit as GetFromIndex, but with additional bugs.
VoreData Function GetPreyFromIndex(Int iIndex)
	Int i = PredPreyArray.FindStruct("Index", iIndex)
	if(i < 0) 
		trace(self, "GetPreyFromIndex: NONE")
		Return None
	EndIf
	VoreData data = PredPreyArray[i]
	if(data.Prey == None)
		trace(self, "GetPreyFromIndex: This is not a prey")
	EndIf
	trace(self, "GetPreyFromIndex: " + data)
	Return data
EndFunction

; KEILLA: Same shit as GetFromIndex, but calls GetFromIndex again for you.
VoreData Function GetParentFromIndex(Int iIndex)
	; Search Prey
	Int i = PredPreyArray.FindStruct("Index", iIndex)
	if(i < 0) 
		trace(self, "GetParentFromIndex: NONE")
		Return None
	EndIf
	
	; Search parent
	Int j = PredPreyArray.FindStruct("Index", PredPreyArray[i].ParentIndex)
	if(j < 0) 
		trace(self, "GetParentFromIndex: NONE 1")
		Return None
	EndIf
	VoreData data = PredPreyArray[j]
	
	trace(self, "GetParentFromIndex: " + data)
	Return data
EndFunction

; retrieve the pred and the prey from prey index 
; KEILLA: Same shit as GetFromIndex, but wastes more memory.
VoreData Function GetPreyAndPredFromIndex(Int iIndex)
	VoreData data = new VoreData

	; search prey
	Int i = PredPreyArray.FindStruct("Index", iIndex)
	if(i < 0) 
		trace(self, "GetPreyAndPredFromIndex: NONE")
		Return None
	EndIf
	
	data.Prey				= PredPreyArray[i].Prey
	data.IsLethal			= PredPreyArray[i].IsLethal
	data.Tick				= PredPreyArray[i].Tick
	data.ContainAPrey 		= PredPreyArray.FindStruct("ParentIndex", PredPreyArray[i].Index) >= 0
	PredPreyArray[i].Tick  -= 1
	data.TimerState			= PredPreyArray[i].TimerState
	data.ParentIndex		= PredPreyArray[i].ParentIndex
	data.ParentIndexCopy	= PredPreyArray[i].ParentIndexCopy
	data.Index				= PredPreyArray[i].Index
	data.IsPredator 		= PredPreyArray[i].IsPredator
	data.IsDead				= PredPreyArray[i].IsDead
	data.HasDigested		= PredPreyArray[i].HasDigested
	data.CustomVar1			= PredPreyArray[i].CustomVar1
	data.CustomVar2			= PredPreyArray[i].CustomVar2
	data.CustomVar3			= PredPreyArray[i].CustomVar3
	data.ColdSteelCounter	= PredPreyArray[i].ColdSteelCounter
	data.DigestSpeedTime	= PredPreyArray[i].DigestSpeedTime
	data.slots				= PredPreyArray[i].slots
	data.IsHumanoid			= PredPreyArray[i].IsHumanoid
	; search pred
	int j = PredPreyArray.FindStruct("Index", PredPreyArray[i].ParentIndex)
	if(j < 0) 
		trace(self, "GetPreyAndPredFromIndex: NONE")
		Return None
	EndIf
	
	data.Pred 			= PredPreyArray[j].Pred
	
	if(data.Prey == None && PredPreyArray[i].IsPredator)
		data.Prey = PredPreyArray[i].Pred ; KEILLA: What the fuck? If you find an element and it's not a prey, then prey = pred?
	EndIf
	If(!(FV_ColdSteelEnabled.GetValue() > 0 && (data.Pred.GetLeveledActorBase().GetSex() == 1 || FV_MaleColdSteelToggle.GetValue() == 1)))					;to prevent cold steel bodies from spamming the log
		trace(self, "GetPreyAndPredFromIndex: " + data)
	EndIf
	Return data
EndFunction

; Scan the entire predPrey array for a given parent index. And for every match, RECURSE and see if 
; they have any prey inside them. Voreception.
Int Function GetNumberOfPrey(int iIndex, bool GetHuman = false) ; iIndex: Pred
	int i = 0
	int result = 0;
	While (i < PredPreyArray.Length)
		if(PredPreyArray[i].ParentIndex == iIndex)
			Actor Prey = PredPreyArray[i].Prey
			if(PredPreyArray[i].Prey == None && PredPreyArray[i].IsPredator)
				Prey = PredPreyArray[i].Pred
			EndIf
			If(!GetHuman || GetHuman == PredPreyArray[i].IsHumanoid)
				result += PredPreyArray[i].slots
			EndIf
			result += GetNumberOfPrey(PredPreyArray[i].Index, GetHuman)
		endif
		i += 1
	EndWhile
	;trace(self, "GetNumberOfPrey for "+iIndex+": "+result)
	return result
EndFunction

; Same as GetNumberOfPrey, but counts differently.
Int Function GetNumberOfAlivePrey(int iIndex) ; iIndex: Pred
	int i = 0
	int result = 0
	While (i < PredPreyArray.Length)
		if(PredPreyArray[i].ParentIndex == iIndex && !PredPreyArray[i].IsDead)
			Actor Prey = PredPreyArray[i].Prey
			if(PredPreyArray[i].Prey == None && PredPreyArray[i].IsPredator)
				Prey = PredPreyArray[i].Pred
			EndIf
			If(Prey != PlayerRef || !KillPlayerAsPrey)		;This should allow all NPCs to be evaluated, and if the player is not dead yet, it will be evaluated
				result += PredPreyArray[i].slots
			EndIf
			result += GetNumberOfAlivePrey(PredPreyArray[i].Index)
		endif
		i += 1
	EndWhile
	;trace(self, "GetNumberOfAlivePrey for "+iIndex+": "+result)
	return result
EndFunction

; Gets the bellycontainer for a given predator.
ObjectReference Function FindBellyContainer(Actor akPred)
	Int i = PredPreyArray.FindStruct("Pred", akPred)
	If(i >= 0)
		If(akPred == PlayerRef)
			return FV_BellyContainer
		ElseIf(akPred.IsInFaction(CurrentCompanionFaction))
			return FV_CompanionBellyContainer
		EndIf
		return PredPreyArray[i].NPCBellyContainer
	Endif
	return NONE
EndFunction

; Scan the array for a given entry, and modify its timerstate, which is the digestion countdown.
Function UpdateTimerState(int iIndex, int value) ; iIndex: Pred
	Int i = PredPreyArray.FindStruct("Index", iIndex)
	If(i < 0) 
		return 
	EndIf
	PredPreyArray[i].TimerState = value
	trace(self, "UpdateTimerState() iIndex: " + iIndex + " TimerState: " + PredPreyArray[i].TimerState)
EndFunction

; Used once when the number of alive prey on a swallow exceeds the number of dead prey.
; KEILLA: Unknown why this is important.
Function ResetTimerState(Actor akPred)
	Int index = -1
	If(akPred != None)
		int i = PredPreyArray.FindStruct("Pred", akPred)
		If(i >= 0)
			index = PredPreyArray[i].Index
		EndIf
		Int j = 0
		GotoState("OnTimerState") ; Defer timers while we're doing this.
		While(j < PredPreyArray.Length)
			
			If(PredPreyArray[j].ParentIndex == index)
				PredPreyArray[j].TimerState = 100
				trace(self, "ResetTimerState() Index: " + PredPreyArray[j].Index + " IsDead: " + PredPreyArray[j].IsDead + " TimerState: " + PredPreyArray[j].TimerState + " State: " + GetState())
				If(PredPreyArray[j].IsDead)
					trace(self, "ResetTimerState() CancelTimer Index: " + PredPreyArray[j].Index)
					CancelTimer(PredPreyArray[j].Index)
				Endif
			EndIf
			j += 1
		EndWhile
		GotoState("")
	Else
		return
	EndIf
	
EndFunction

; set custom var 1 (Used by Indigestion)
Function setCustomVar1(int iIndex, Int v)
	Int i = PredPreyArray.FindStruct("Index", iIndex)
	If(i >= 0) 
		PredPreyArray[i].CustomVar1 = v
	EndIf
EndFunction

; set custom var 2 (UNUSED)
Function setCustomVar2(int iIndex, Int v)
	Int i = PredPreyArray.FindStruct("Index", iIndex)
	If(i >= 0) 
		PredPreyArray[i].CustomVar2 = v
	EndIf
EndFunction

; set custom var 3 (UNUSED)
Function setCustomVar3(int iIndex, Int v)
	Int i = PredPreyArray.FindStruct("Index", iIndex)
	If(i >= 0) 
		PredPreyArray[i].CustomVar3 = v
	EndIf
EndFunction

; Just scans and updates the coldsteelcounter value.
Function UpdateColdSteelCounter(int iIndex, Int value)
	Int i = PredPreyArray.FindStruct("Index", iIndex)
	If(i < 0) 
		;trace(self, "UpdateColdSteelCounter: NONE")
		return 
	EndIf
	PredPreyArray[i].ColdSteelCounter = value
EndFunction

; Use 'iPreyIndex' or 'iPredIndex' or 'akPred'
Function UpdateCurrentInStomach(int iPreyIndex = -1,int iPredIndex = -1, Actor akPred = None, bool updateFullness = false, Bool treeUp = false)
	trace(self, "UpdateCurrentInStomach() iPreyIndex: "  + iPreyIndex + " iPredIndex: " + iPredIndex + " akPred: " + akPred + " updateFullness: " + updateFullness + " treeUp: "+ treeUp)
	Int index = iPreyIndex
	Actor Pred = akPred
	
	If(akPred != None)
		int i = PredPreyArray.FindStruct("Pred", akPred)
		If(i >= 0)
			index = PredPreyArray[i].Index
		EndIf
	ElseIf (iPreyIndex != -1)
		VoreData data = GetParentFromIndex(iPreyIndex)
		Pred  = data.Pred
		index = data.Index
	ElseIf (iPredIndex != -1)
		int j = PredPreyArray.FindStruct("Index", iPredIndex)
		If(j >= 0)
			index = PredPreyArray[j].Index
			Pred  = PredPreyArray[j].Pred
		EndIf
	EndIf
	trace(self, "UpdateCurrentInStomach() FV_CurrentPrey: " + Pred.GetValue(FV_CurrentPrey) + " FV_CurrentAlivePrey: " + Pred.GetValue(FV_CurrentAlivePrey) + " FV_HumanPreyCount: " + Pred.GetValue(FV_HumanPreyCount))
	; Updates the actor values that track the number of prey based on what we have in the registry.
	Int TempNumberOfPrey = GetNumberOfPrey(index)-(Pred.GetValue(FV_CurrentPrey) as int)
	int TempNumberOfAlivePrey = GetNumberOfAlivePrey(index)-(Pred.GetValue(FV_CurrentAlivePrey) as int)
	int TempNumberOfHumanPrey = GetNumberOfPrey(index, true)-(Pred.GetValue(FV_HumanPreyCount) as int)
	
	Pred.ModValue(FV_CurrentPrey, TempNumberOfPrey)
	Pred.ModValue(FV_CurrentAlivePrey, TempNumberOfAlivePrey)
	Pred.ModValue(FV_HumanPreyCount, TempNumberOfHumanPrey)

	; Updates the belly appearance
	if(updateFullness)
		ChangeFullnessArmor(Pred, Pred.GetValue(FV_CurrentPrey) as int)
	EndIf
	
	; Apply heavy pred perks
	If(FV_AllowHeavyPred.GetValue() == 1)
		If(Pred.GetValue(FV_CurrentPrey) > 0)
			If(Pred == PlayerRef && !Pred.HasPerk(FV_HeavyPredPlayer))
				Pred.AddPerk(FV_HeavyPredPlayer)
			ElseIf(Pred != PlayerRef && !Pred.HasPerk(FV_HeavyPredNPC))
				Pred.AddPerk(FV_HeavyPredNPC)
			Endif
		Else
			If(Pred == PlayerRef && Pred.HasPerk(FV_HeavyPredPlayer))
				Pred.RemovePerk(FV_HeavyPredPlayer)
			ElseIf(Pred != PlayerRef && Pred.HasPerk(FV_HeavyPredNPC))
				Pred.RemovePerk(FV_HeavyPredNPC)
			Endif
		Endif
	Endif
	
	; Update parents too, all the way up.
	int k = PredPreyArray.FindStruct("Index", index)
	if(treeUp && PredPreyArray[k].ParentIndex>=0)
		UpdateCurrentInStomach(-1,PredPreyArray[k].ParentIndex, None,updateFullness,True)
	EndIf
	If Pred == Game.GetPlayer()
		FV_VoreHud.SendTrackerUpdate() ; Just emit an event dammit
	Endif
EndFunction

; Based on the CurrentPrey and DigestionStage AVs, decides how many child nodes to drop out of the buffer, and iterates through them.
Function UpdateDigestionPreyCount(int iPreyIndex = -1)
	If(iPreyIndex == -1)
		trace(self, " [Bug] UpdateDigestionPreyCount")
		return
	EndIf
	VoreData data = GetParentFromIndex(iPreyIndex)
	int CurrentSize = (((data.Pred.GetValue(FV_CurrentPrey)/2-1) * 3) + 6) as int
	If(CurrentSize > data.Pred.GetValue(FV_DigestionStage))
		int slotsToDelete = CurrentSize - data.Pred.GetValue(FV_DigestionStage) as int
		trace(self, "UpdateDigestionPreyCount - CurrentSize: " + CurrentSize + " FV_DigestionStage: " + data.Pred.GetValue(FV_DigestionStage) + " slotsToDelete: " + slotsToDelete)
		bool keepSearching = true
		Int[] children = new Int[0]
		children.Clear()
		
		Getchildren(children, data.Index) ; KEILLA: SCANS PPI. Also, cute it passes a mutable return var.
		trace(self, " UpdateDigestionPreyCount children: " + children)
		if(children.Length > 0)
			int i = 0
			While(i < children.Length && keepSearching)
				If(children[i] != iPreyIndex) ;Do not remove the prey used to search as it is the final prey that the timer's are calling
					VoreData tdata = GetFromIndex(children[i])
					If(tdata!= None )
						int slotSize = tdata.slots
						slotSize = (((slotSize/2-1) * 3) + 3) as int
						If(slotSize < 3)
							slotSize = 3	;set to be minimum of 3.  2, 2 slot prey == 9 in timerstage space.  single slot prey are leading to very low
						Endif
						If(slotSize <= SlotsToDelete)
							trace(self, " UpdateDigestionPreyCount - Removing child: " + tdata)
							RemoveFromBuffer(tdata.Index)
							SlotsToDelete -= slotSize
						Else
							keepSearching = false
						Endif
					EndIf
				EndIf
				i += 1
			EndWhile
			UpdateCurrentInStomach(akPred = data.Pred)
		EndIf
	Endif
	
EndFunction

; Tree sample
; [BranchType = 1, index = 29, Tick = 2, ParentIndex = -1, TimerState = 100, Pred = [Actor < (00000014)>], Prey = None, IsLethal = False, IsDead = False, IsPredator = False, ContainAPrey = False]
;     [BranchType = 1, index = 27, Tick = 1, ParentIndex = 29, TimerState = 100, Pred = [Actor < (FF0130A5)>], Prey = None, IsLethal = True, IsDead = False, IsPredator = True, ContainAPrey = False]
;         [BranchType = 2, index = 28, Tick = -3, ParentIndex = 27, TimerState = 100, Pred = None, Prey = [mirelurkqueenspawnscript < (FF014A57)>], IsLethal = True, IsDead = False, IsPredator = False, ContainAPrey = False]
;     [BranchType = 2, index = 30, Tick = 0, ParentIndex = 29, TimerState = 100, Pred = None, Prey = [Actor < (0303250A)>], IsLethal = True, IsDead = False, IsPredator = False, ContainAPrey = False]

; aiTimerID = 28
; [BranchType = 1, index = 29, Tick = 2, ParentIndex = -1, TimerState = 100, Pred = [Actor < (00000014)>], Prey = None, IsLethal = False, IsDead = False, IsPredator = False, ContainAPrey = False]
;     [BranchType = 2, index = 27, Tick = 1, ParentIndex = 29, TimerState = 100, Pred = None, Prey = [Actor < (FF0130A5)>], IsLethal = True, IsDead = False, IsPredator = false, ContainAPrey = False]
;     [BranchType = 2, index = 30, Tick = 0, ParentIndex = 29, TimerState = 100, Pred = None, Prey = [Actor < (0303250A)>], IsLethal = True, IsDead = False, IsPredator = False, ContainAPrey = False]

; Called once during OnTimerFinishDigestion. Given a particular PPA index, finds that element and all its children and removes all of them.
Function CleanUpBuffer(Int aiTimerID)
	Int root = GetRoot(aiTimerID) ; SCAN PPA
	
	int i = PredPreyArray.FindStruct("Index", root) ; KEILLA SCAN PPA
	VoreData data = PredPreyArray[i]
	trace(self, "CleanUpBuffer root: " + data)
	
	Int[] children = new Int[0]
	children.Clear()
	
	; Zero out the predator's assorted actor values.
	data.Pred.ModValue(FV_CurrentPrey, 		0-data.Pred.GetValue(FV_CurrentPrey))
	data.Pred.ModValue(FV_CurrentAlivePrey, 	0-data.Pred.GetValue(FV_CurrentAlivePrey))
	; Remove heavy pred perks
	If(data.Pred == PlayerRef && data.Pred.HasPerk(FV_HeavyPredPlayer))
		data.Pred.RemovePerk(FV_HeavyPredPlayer)
	ElseIf(data.Pred != PlayerRef && data.Pred.HasPerk(FV_HeavyPredNPC))
		data.Pred.RemovePerk(FV_HeavyPredNPC)
	EndIf
	; If the element has no parent and it is a pred, add self to the children array.
	if(data.ParentIndex == -1 && data.BranchType == BranchTypePred)
		children.Add(root)
	Else
		data.IsPredator = false
		data.BranchType = BranchTypePrey
		data.Prey = data.Pred
		data.Pred = None
	EndIf
	; Get all the children
	Getchildren(children,root) ; SCAN PPA
	trace(self, "CleanUpBuffer children: " + children)
	
	i = 0
	Int j = 0
	While (i < children.Length)
		j = PredPreyArray.FindStruct("Index", children[i]) ; SCAN PPA
		PredPreyArray.Remove(j)
		i += 1
	EndWhile
	
EndFunction

; Tree sample
; [BranchType = 1, index = 29, Tick = 2, ParentIndex = -1, TimerState = 100, Pred = [Actor < (00000014)>], Prey = None, IsLethal = False, IsDead = False, IsPredator = False, ContainAPrey = False]
;     [BranchType = 1, index = 27, Tick = 1, ParentIndex = 29, TimerState = 100, Pred = [Actor < (FF0130A5)>], Prey = None, IsLethal = True, IsDead = False, IsPredator = True, ContainAPrey = False]
;         [BranchType = 2, index = 28, Tick = -3, ParentIndex = 27, TimerState = 100, Pred = None, Prey = [mirelurkqueenspawnscript < (FF014A57)>], IsLethal = True, IsDead = False, IsPredator = False, ContainAPrey = False]
;     [BranchType = 2, index = 30, Tick = 0, ParentIndex = 29, TimerState = 100, Pred = None, Prey = [Actor < (0303250A)>], IsLethal = True, IsDead = False, IsPredator = False, ContainAPrey = False]

; Return all children. (Recursive, SCAN PPA a lot.)
; iIndex = 27, return 28
; iIndex = 29, return 27,28,30
Function Getchildren(Int[] children, int iIndex, int level = 0)
	int i = 0
	if(level !=0)
		children.Add(iIndex)
	EndIf
	While (i < PredPreyArray.Length)
		if(PredPreyArray[i].ParentIndex == iIndex)
			Getchildren(children,PredPreyArray[i].Index,level+1)
		EndIf
		i += 1
	EndWhile
EndFunction

; Tree sample
; [BranchType = 1, index = 29, Tick = 2, ParentIndex = -1, TimerState = 100, Pred = [Actor < (00000014)>], Prey = None, IsLethal = False, IsDead = False, IsPredator = False, ContainAPrey = False]
;     [BranchType = 1, index = 27, Tick = 1, ParentIndex = 29, TimerState = 100, Pred = [Actor < (FF0130A5)>], Prey = None, IsLethal = True, IsDead = False, IsPredator = True, ContainAPrey = False]
;         [BranchType = 2, index = 28, Tick = -3, ParentIndex = 27, TimerState = 100, Pred = None, Prey = [mirelurkqueenspawnscript < (FF014A57)>], IsLethal = True, IsDead = False, IsPredator = False, ContainAPrey = False]
;     [BranchType = 2, index = 30, Tick = 0, ParentIndex = 29, TimerState = 100, Pred = None, Prey = [Actor < (0303250A)>], IsLethal = True, IsDead = False, IsPredator = False, ContainAPrey = False]

; Return all children. Almost the exact same thing as getchildren
; iIndex = 27, return 28
; iIndex = 29, return 27,30
Function GetchildrenAsSameLevel(Int[] children, int iIndex, int level = 0)
	int i = 0
	if(level == 1)
		children.Add(iIndex)
	EndIf
	While (i < PredPreyArray.Length)
		if(PredPreyArray[i].ParentIndex == iIndex)
			GetchildrenAsSameLevel(children,PredPreyArray[i].Index,level+1)
		EndIf
		i += 1
	EndWhile
EndFunction

; Almost the exact same thing as getchildren
Function GetchildrenAsSameLevelAndCheckFirstParent(Int[] children, int iIndex, int firstParent, int level = 0)
	int i = 0
	if(level == 1)
		children.Add(iIndex)
	EndIf
	While (i < PredPreyArray.Length)
		if(PredPreyArray[i].ParentIndex == iIndex && PredPreyArray[i].ParentIndexCopy == firstParent)
			GetchildrenAsSameLevel(children,PredPreyArray[i].Index,level+1)
		EndIf
		i += 1
	EndWhile
EndFunction

; Exact same thing as getchildren, but instead of returning them, helpfully throws the rest out and returns only the first.
; Only called once.
Int Function GetOneChild(int iIndex)
	Int[] children = new Int[0]
	children.Clear()
	Getchildren(children, iIndex)
	if(children.Length>0)
		Return children[0]
	EndIf
	Return -1
EndFunction

; Tree sample
; [BranchType = 1, index = 29, Tick = 2, ParentIndex = -1, TimerState = 100, Pred = [Actor < (00000014)>], Prey = None, IsLethal = False, IsDead = False, IsPredator = False, ContainAPrey = False]
;     [BranchType = 1, index = 27, Tick = 1, ParentIndex = 29, TimerState = 100, Pred = [Actor < (FF0130A5)>], Prey = None, IsLethal = True, IsDead = False, IsPredator = True, ContainAPrey = False]
;         [BranchType = 2, index = 28, Tick = -3, ParentIndex = 27, TimerState = 100, Pred = None, Prey = [mirelurkqueenspawnscript < (FF014A57)>], IsLethal = True, IsDead = False, IsPredator = False, ContainAPrey = False]
;     [BranchType = 2, index = 30, Tick = 0, ParentIndex = 29, TimerState = 100, Pred = None, Prey = [Actor < (0303250A)>], IsLethal = True, IsDead = False, IsPredator = False, ContainAPrey = False]

; Get root from index, if 'stopAtParent' stop at the first parent. Scans PPA.
; iIndex = 28, stopAtParent = False, return 29
; iIndex = 28, stopAtParent = True , return 27
; iIndex = 27, stopAtParent = xxxx , return -1
Int Function GetRoot(int iIndex, Bool stopAtParent = True) 
	Int i = PredPreyArray.FindStruct("Index", iIndex)
	If(i < 0)
		Return -1
	EndIf
	If(PredPreyArray[i].ParentIndex == -1)
		Return -1
	EndIf
	
	Return GetRoot1(PredPreyArray[i].ParentIndex, stopAtParent)
EndFunction

; Actually scans the PPA... recursively. Finds the ultimate parent of a given PPA id.
Int Function GetRoot1(int iIndex, Bool stopAtParent) 
	int i = 0
	int result = iIndex;
	If(stopAtParent)
		While (i < PredPreyArray.Length)
			if(PredPreyArray[i].index == iIndex && PredPreyArray[i].ParentIndex == -1 && PredPreyArray[i].BranchType == BranchTypePrey)
				Return result
			elseif (PredPreyArray[i].index == iIndex && PredPreyArray[i].BranchType == BranchTypePrey)
				result = GetRoot1(PredPreyArray[i].ParentIndex, stopAtParent)
			endif
			i += 1
		EndWhile
	Else
		While (i < PredPreyArray.Length)
			if(PredPreyArray[i].index == iIndex && PredPreyArray[i].ParentIndex == -1)
				Return result
			elseif (PredPreyArray[i].index == iIndex)
				result = GetRoot1(PredPreyArray[i].ParentIndex, stopAtParent)
			endif
			i += 1
		EndWhile
	EndIf
	return result
EndFunction

; Tree sample
; [BranchType = 1, index = 29, Tick = 2, ParentIndex = -1, TimerState = 100, Pred = [Actor < (00000014)>], Prey = None, IsLethal = False, IsDead = False, IsPredator = False, ContainAPrey = False]
;     [BranchType = 1, index = 27, Tick = 1, ParentIndex = 29, TimerState = 100, Pred = [Actor < (FF0130A5)>], Prey = None, IsLethal = True, IsDead = False, IsPredator = True, ContainAPrey = False]
;         [BranchType = 2, index = 28, Tick = -3, ParentIndex = 27, TimerState = 100, Pred = None, Prey = [mirelurkqueenspawnscript < (FF014A57)>], IsLethal = True, IsDead = False, IsPredator = False, ContainAPrey = False]
;     [BranchType = 2, index = 30, Tick = 0, ParentIndex = 29, TimerState = 100, Pred = None, Prey = [Actor < (0303250A)>], IsLethal = True, IsDead = False, IsPredator = False, ContainAPrey = False]

; iIndex = 28, result:
; [BranchType = 1, index = 29, Tick = 2, ParentIndex = -1, TimerState = 100, Pred = [Actor < (00000014)>], Prey = None, IsLethal = False, IsDead = False, IsPredator = False, ContainAPrey = False]
;     [BranchType = 2, index = 28, Tick =-3, ParentIndex = 29, TimerState = 100, Pred = None, Prey = [mirelurkqueenspawnscript < (FF014A57)>], IsLethal = True, IsDead = False, IsPredator = False, ContainAPrey = False]
;     [BranchType = 2, index = 27, Tick = 1, ParentIndex = 29, TimerState = 100, Pred = [Actor < (FF0130A5)>], Prey = None, IsLethal = True, IsDead = False, IsPredator = True, ContainAPrey = False]
;     [BranchType = 2, index = 30, Tick = 0, ParentIndex = 29, TimerState = 100, Pred = None, Prey = [Actor < (0303250A)>], IsLethal = True, IsDead = False, IsPredator = False, ContainAPrey = False]
;
; return: parent or -1 if error
; KEILLA: I don't know what the fuck this is for. It gets called exactly once in OnTimerPerformVomit, so I guess it's to bring a node to the top of the tree.
Int Function TreeMoveUp(int iIndex)
	trace(self, "TreeMoveUp: " + iIndex)
	Int result = -1
	int currentBranch = PredPreyArray.FindStruct("Index", iIndex) ; SCAN PPA
	if(currentBranch<0)	
		Return -1
	EndIf
	
	VoreData currentBranchdata = PredPreyArray[currentBranch]
	if(currentBranchdata.ParentIndex == -1) ; It has no parent, it's already the top of the tree, why are we here?
		Return -1
	EndIf

	int root = GetRoot(currentBranchdata.ParentIndex) ; SCAN PPA
	int root1 = GetRoot(currentBranchdata.Index) ; SCAN PPA. KEILLA: Root1 should be the same fuckin' thing as root.
	result = currentBranchdata.ParentIndex ; KEILLA: are all assignments by reference?
	
	currentBranchdata.ParentIndex = root ; KEILLA: Wat? Just puts this node up to be the first ancestor of the local root?
	
	Int[] children = new Int[0]
	Getchildren(children,iIndex) ; SCAN PPA
	
	if(children.Length == 0)
		currentBranchdata.BranchType = BranchTypePrey
	Else
		currentBranchdata.BranchType = BranchTypePred
	EndIf
	
	children.Clear()
	Getchildren(children,root1) ; SCAN PPA
	int i = PredPreyArray.FindStruct("Index", root1) ; SCAN PPA
	
	if(children.Length == 0)
		PredPreyArray[i].BranchType = BranchTypePrey
	Else
		PredPreyArray[i].BranchType = BranchTypePred
	EndIf
	
	Return result
EndFunction

; Tree sample
; [BranchType = 1, index = 29, Tick = 2, ParentIndex = -1, TimerState = 100, Pred = [Actor < (00000014)>], Prey = None, IsLethal = False, IsDead = False, IsPredator = False, ContainAPrey = False]
;     [BranchType = 2, index = 28, Tick =-3, ParentIndex = 29, TimerState = 100, Pred = None, Prey = [mirelurkqueenspawnscript < (FF014A57)>], IsLethal = True, IsDead = False, IsPredator = False, ContainAPrey = False]
;     [BranchType = 2, index = 27, Tick = 1, ParentIndex = 29, TimerState = 100, Pred = [Actor < (FF0130A5)>], Prey = None, IsLethal = True, IsDead = False, IsPredator = True, ContainAPrey = False]
;     [BranchType = 2, index = 30, Tick = 0, ParentIndex = 29, TimerState = 100, Pred = None, Prey = [Actor < (0303250A)>], IsLethal = True, IsDead = False, IsPredator = False, ContainAPrey = False]

; iRoot = 27, iIndex= 28 result:
; [BranchType = 1, index = 29, Tick = 2, ParentIndex = -1, TimerState = 100, Pred = [Actor < (00000014)>], Prey = None, IsLethal = False, IsDead = False, IsPredator = False, ContainAPrey = False]
;     [BranchType = 1, index = 28, Tick =-3, ParentIndex = 29, TimerState = 100, Pred = None, Prey = [mirelurkqueenspawnscript < (FF014A57)>], IsLethal = True, IsDead = False, IsPredator = False, ContainAPrey = False]
;         [BranchType = 1, index = 27, Tick = 1, ParentIndex = 28, TimerState = 100, Pred = [Actor < (FF0130A5)>], Prey = None, IsLethal = True, IsDead = False, IsPredator = True, ContainAPrey = False]
;     [BranchType = 2, index = 30, Tick = 0, ParentIndex = 29, TimerState = 100, Pred = None, Prey = [Actor < (0303250A)>], IsLethal = True, IsDead = False, IsPredator = False, ContainAPrey = False]

; Moves the sibling iIndex of the iRoot down into the children of iRoot.
bool Function TreeMoveDown(int iRoot, int iIndex)
	trace(self, "TreeMoveDown: "+iRoot+ " " +iIndex)
	int bRoot = PredPreyArray.FindStruct("index", iRoot) ; SCAN PPA
	int bIndex= PredPreyArray.FindStruct("index", iIndex) ; SCAN PPA

	Int[] children = new Int[0]
	GetchildrenAsSameLevel(children, PredPreyArray[bRoot].parentIndex) ; SCAN PPA
	
	int i = 0
	bool found = false
	while (i < children.Length)
		if (children[i] == iRoot)
			children.Remove(i)
			i = 9999;
		EndIf
		i += 1;
	EndWhile

	i = 0
	while (i < children.Length)
		if (children[i] == iIndex)
			found = true
			i = 9999
		EndIf
		i += 1
	EndWhile
	
	if (!found)
		return false
	EndIf

	PredPreyArray[bIndex].parentIndex = iRoot

	children.Clear()
	Getchildren(children, iRoot) ; SCAN PPA

	if (children.Length != 0) ; If we did it right, then the bRoot should always become a pred branch.
		PredPreyArray[bRoot].branchType = BranchTypePred
	else
		PredPreyArray[bRoot].branchType = BranchTypePrey
	EndIf
	return true

EndFunction

; Called a few times after a vomit or transfer. Probably can just inline this if we have the data.
Function resetTick(int iIndex)
	Int i = PredPreyArray.FindStruct("Index", iIndex) ; Scan PPA
	If(i >= 0)
		PredPreyArray[i].Tick = 2
	EndIf
EndFunction

;************************************************************************************
;************************************************************************************
; Debug functions

; Print debug info
Function PrintInfos()
	int i = 0
	trace(self, "          ")
	trace(self, "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
	trace(self, "PrintInfos")
	trace(self, "----------")
	trace(self, "CurrentVoreIndex: " + CurrentVoreIndex)
	
	while i < PredPreyArray.Length
		VoreData data = PredPreyArray[i]
		trace(self, "    " + data)
		trace(self, "        GetNumberOfPrey: 		(Pred) " + GetNumberOfPrey(data.Index))
		trace(self, "        GetNumberOfAlivePrey: 	(Pred) " + GetNumberOfAlivePrey(data.Index))
		if(data.Pred!=None)
			trace(self, "        FV_CurrentAlivePrey: (Pred) " + data.Pred.GetValue(FV_CurrentAlivePrey))
			trace(self, "        FV_CurrentPrey:      (Pred) " + data.Pred.GetValue(FV_CurrentPrey))
		EndIf
		if(data.Prey!=None)
			trace(self, "        FV_CurrentAlivePrey: (Prey) " + data.Prey.GetValue(FV_CurrentAlivePrey))
			trace(self, "        FV_CurrentPrey:      (Prey) " + data.Prey.GetValue(FV_CurrentPrey))
			trace(self, "        FV_TicksTillEscapeStart:   (Prey) " + data.Prey.GetValue(FV_TicksTillEscapeStart))
			trace(self, "        FV_TicksTillEscape:        (Prey) " + data.Prey.GetValue(FV_TicksTillEscape))
		EndIf
		
		i += 1
	endWhile

	PrintTree()
	trace(self, "---------------------------------------------------------")
	trace(self, "          ")
	
EndFunction

Function PrintTree()
	trace(self, "          ")
	trace(self, " -- Tree --")
	int i = 0
	While (i < PredPreyArray.Length)
		if(PredPreyArray[i].ParentIndex == -1)
			PrintTree1(PredPreyArray[i].Index, "")
		endif
		i += 1
	EndWhile
EndFunction

Function PrintTree1(int Index, String s)
	int i = PredPreyArray.FindStruct("Index", Index)
	trace(self, s + PredPreyArray[i])
	
	i = 0
	While (i < PredPreyArray.Length)
		if(PredPreyArray[i].ParentIndex == Index)
			PrintTree1(PredPreyArray[i].Index, s + "    ")
		EndIf
		i += 1
	EndWhile
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
	
	; get pred from buffer
	int i = PredPreyArray.FindStruct("Pred", currentPred) ; SCAN PPA
	if(i<0)
		trace(self, "TriggerDigestionSequence pred " + currentPred + " not found")
		PrintTree()
		Return
	EndIf
	
	; get the children
	; KEILLA: Why do we get the children, then just toss all but the first one?
	Int[] children = new Int[0]
	GetchildrenAsSameLevel(children, PredPreyArray[i].Index)
	
	if(children.Length == 0)
		Return
	EndIf
	
	VoreData data = GetPreyAndPredFromIndex(children[0]) ; SCAN PPA
	OnTimerTriggerDigestionSequence(data.Index , data)
EndFunction

;Vomits up the prey
function PerformVomit(Actor currentPred)
	
	; get pred from buffer
	int i = PredPreyArray.FindStruct("Pred", currentPred) ; SCAN PPA
	if(i<0)
		trace(self, "PerformVomit pred " + currentPred + " not found")
		PrintTree()
		Return
	EndIf
	
	; get it's children
	Int[] children = new Int[0]
	GetchildrenAsSameLevel(children, i)
	
	; nothing found
	if(children.Length == 0)
		trace(self, "PerformVomit pred " + currentPred + " not child")
		PrintTree()
		Return
	EndIf
	
	; randomly select a child
	i = children[Utility.RandomInt(0,children.Length-1)]
	VoreData data = GetPreyAndPredFromIndex(i) ; SCAN PPA
	
	CancelTimer(i) ; Stop timer for the prey
	OnTimerPerformVomit(i , data) ; Do it now
	
EndFunction

;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; Private functions


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

; Does a lot of game mechanics stuff to handle a swallow. Everything from setting AVs, messing with the camera and belly, and manipulating player input. Way too much.
Function ProcessSingleSwallow(Actor akPred, Actor akPrey, bool bLethalFlag)
	If(akPred != PlayerRef && akPred.GetValue(FV_HasHadNukaAcid) == 0)
		akPred.SetValue(FV_HasHadNukaAcid, 1) ; If the pred isn't player and isn't pred, make them pred? I guess for forced-feeding scenarios.
	EndIf

	int indexCheck = PredPreyArray.FindStruct("Prey", akPrey) ; SCAN PPA
	If(indexCheck > -1)
		;prey alreay exists in buffer.  First, check if orphaned and allow this pred to take the prey IF the previous pred was already cleaned up.  Otherwise, bail out
		int predCheck = PredPreyArray.FindStruct("Index", PredPreyArray[indexCheck].ParentIndex) ; SCAN PPA
		If(predCheck < 0)
			;pred's index was unreturnable, meaning it was cleaned up but the prey was orphaned
			canceltimer(PredPreyArray[indexCheck].Index)
			PredPreyArray.remove(indexCheck)
		Else
			return
		EndIf
		
	EndIf
	
	;save Giant Belly value if this is the first prey pred is eating.  Prevents accidentally saving GiantBelly to 0 on subsequent prey
	; KEILLA: Seems like a presentational concern that should be cleaned up with better comms.
	If(FV_ColdSteelEnabled.GetValue() > 0 && akPred.GetValue(FV_CurrentPrey) as int == 0)
		FV_ColdSteelBellyQuest.SaveBelly(akPred)
	EndIf

	bool preyIsAPred = (akPrey.GetValue(FV_CurrentPrey) > 0)
	
	If(akPrey==PlayerRef)
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
	EndIf
	
	trace(self, "PerformVoreEvent: " + akPrey)
	
	; WIKI: Arrays that are created by scripts via the New operation or Add() function are limited to 128 elements.
	; Determines whether there is free space in the buffer. 
	If(PredPreyArray != None && PredPreyArray.Length > 125)
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
	if(preyIsAPred)
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
	Int PreyIndex = InsertIntoBuffer(akPred, akPrey, bLethalFlag)
	
	;Reset manual digestion
	If(akPred.GetValue(FV_ReadyToDigest) == 1)
		akPred.SetValue(FV_ReadyToDigest, 0)
	Endif
	
	;Mod tracking values
	UpdateCurrentInStomach(PreyIndex,-1,None)
	trace(self, "PerformVoreEventAccept() akPred: " + akPred + " FV_CurrentPrey: " + akPred.GetValue(FV_CurrentPrey) + " FV_CurrentAlivePrey: " + akPred.GetValue(FV_CurrentAlivePrey))
	If((akPred.GetValue(FV_CurrentPrey) as int) > (akPred.GetValue(FV_CurrentAlivePrey)))
		;Reset timers if there are more dead prey than live prey.  This will reset the belly when swallowing after digestion has begun (timerstates have been set during digestion)
		;Impact to damage stage should be 0.  All prey already at timerstate 100
		ResetTimerState(akPred)
	EndIf
	
	akPrey.ModValue(FV_TicksTillEscapeStart, akPred.GetValue(FV_Entrapment))
	akPrey.ModValue(FV_TicksTillEscape, akPrey.GetValue(FV_TicksTillEscapeStart))
	trace(self, "Ticks till escape: " + akPrey.GetValue(FV_TicksTillEscapeStart))
	;Start vore timer
	VoreData data = GetPreyAndPredFromIndex(preyIndex) ; SCAN PPA
	If(akPred == PlayerRef)
		FV_VoreHud.UpdateHealthBar(PreyIndex, akPrey)
	EndIf
	If data.IsDead
		trace(self, "PerformVoreEventAccept() data.Index: " + data.Index + " data.IsDead: " + data.IsDead + " Perform OnTimerPerformDigestion")
		OnTimerPerformDigestion(data.Index, data)
	ElseIf akPrey == PlayerRef && bLethalFlag
		FV_PlayerStruggle.BeginStruggleMechanic(akPred, preyIndex)
	Else
		trace(self, "PerformVoreEventAccept() Start vore timer: " + PreyIndex)
		StartTimer(data.DigestSpeedTime, PreyIndex)
	EndIf
	ChangeFullnessArmor(akPred, akPred.GetValue(FV_CurrentPrey) as int)
	
	;Play swallow success audio
	var[] akArgs = new var[1]
	akArgs[0] = akPred
	CallFunctionNoWait("PlayAcceptSounds", akArgs)
	PrintInfos()
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
	
	If (akPrey == PlayerRef)																			;If the prey is player
		trace(self, "player failed to be swallowed.  Vore event rejection")
		akPrey.TranslateToRef(akPred, 25000)
		akPrey.setAlpha(1 as float, False)																	;Make player visible again
		playerLayer.Reset()																	;Enable player controls.  No need to list all trues.  All passes default to true
		FixCamera(akPrey)

		ClearPredPreyFaction()
		
		FV_PlayerAsPreyContext.SetValue(0)
		Utility.SetINIFloat("fVertibirdVanityModeMaxDist:Camera", fCameraDistanceVomit)
		Utility.SetINIBool("bApplyCameraNodeAnimations:Camera", 1)
		
		StartTimer(4.0, GhostTimerRemovalID)
	Else
		akPrey.MoveTo(akPred)																				;Move prey to pred
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

	;trace(self, "Tick: " + aiTimerID)
	GotoState("OnTimerState") ; Defer other timers.
	
	;++
	If(aiTimerID < -1000)
		trace(self, "[BUG] Tick " + aiTimerID)
		GotoState("")	
		Return
	EndIf
	
	If(aiTimerID == GhostTimerRemovalID)
		trace(self, "OnTimer() aiTimerID: " + GhostTimerRemovalID + " player invulnerability remove.")
		PlayerRef.setGhost(False)
		GotoState("")
		Return
	EndIf
	If(aiTimerID == ReformTimerID)
		trace(self, "OnTimer() aiTimerID: " + ReformTimerID + " player reformed.")
		OnTimerReformPlayerFinish()
		GotoState("")
		Return
	EndIf
	VoreData data = GetPreyAndPredFromIndex(aiTimerID) ; SCAN PPA
	If(data == None)
		trace(self, "[BUG] Tick " + aiTimerID)
		GotoState("")	
		Return
	EndIf
	trace(self, "OnTimer() Tick: " + aiTimerID + " TimerState: " + data.TimerState)
	Actor currentPrey = data.Prey
	Actor currentPred = data.Pred
	
	If(data.TimerState == 100) ; Prey is alive, taking damage
		OnTimerDecreaseTicks(aiTimerID, data)
	
	ElseIf (data.TimerState >= 12 && data.TimerState < 99) ; Prey is being turned into mush, but not yet able to cause gas
		; Do a bunch of accounting for coldsteel belly.
		If((FV_ColdSteelEnabled.GetValue() > 0 && (currentPred.GetLeveledActorBase().GetSex() == 1 || FV_MaleColdSteelToggle.GetValue() == 1))) 
			UpdateColdSteelCounter(aiTimerID, data.ColdSteelCounter - 1)
			FV_ColdSteelBellyQuest.ChangeColdSteelDigestFullness(currentPred, data.TimerState as float)
			If(data.ColdSteelCounter == 0)
				trace(self, "OnTimer() ChangeColdSteelDigestFullness() aiTimerID: " + aiTimerID + " currentPred: " + currentPred + " TimerState: " + data.TimerState)
				UpdateColdSteelCounter(aiTimerID, ColdSteelCounts as int)
				UpdateTimerState(aiTimerID, data.TimerState-1)
				OnTimerPlaySound(data)
				currentPred.SetValue(FV_DigestionStage, data.TimerState-1)
				UpdateDigestionPreyCount(aiTimerID)
			EndIf
			StartTimer(data.DigestSpeedTime/ColdSteelCounts, aiTimerID)
		Else ; Accounting for Equippable belly
			trace(self, "OnTimer() state < 99 && >= 12 aiTimerID: " + aiTimerID + " currentPred: " + currentPred + " TimerState: " + data.TimerState)
			ChangeDigestFullnessArmor(currentPred, data.TimerState)
			UpdateTimerState(aiTimerID, data.TimerState-1)
			OnTimerPlaySound(data)
			currentPred.SetValue(FV_DigestionStage, data.TimerState-1)
			UpdateDigestionPreyCount(aiTimerID)
			StartTimer(data.DigestSpeedTime, aiTimerID)
		EndIf
	ElseIf (data.TimerState >= 1 && data.TimerState <= 11) ; Prey causing gas/indigestion
		; More accounting for ColdSteel belly
		If(data.ColdSteelCounter > 0 && (FV_ColdSteelEnabled.GetValue() > 0 && (currentPred.GetLeveledActorBase().GetSex() == 1 || FV_MaleColdSteelToggle.GetValue() == 1))) 
			FV_ColdSteelBellyQuest.ChangeColdSteelDigestFullness(currentPred, data.TimerState as float)
			UpdateColdSteelCounter(aiTimerID, data.ColdSteelCounter - 1)
			StartTimer((data.DigestSpeedTime)/ColdSteelCounts, aiTimerID)
		Else
			trace(self, "OnTimer() ColdSteelCounter == 0 aiTimerID: " + aiTimerID + " currentPred: " + currentPred + " TimerState: " + data.TimerState)
			; more FV_IndigestionSeverityFlag is high, more belly has chance to grow ( max 6 times )
			int indig = currentPred.GetValue(FV_IndigestionSeverityFlag) as int
			int indigFactor = -1
			currentPred.SetValue(FV_HasBloating, 0)
			; Some rather detailed mechanical behavior about indigestion bloating.
			if(!DigestionAllowsBloating || data.TimerState < 3 || data.CustomVar1 > 6 )
				indigFactor = -1
			ElseIf(indig == 1)
				indigFactor = 6
			ElseIf(indig == 2)
				indigFactor = 12
			ElseIf(indig == 3)
				indigFactor = 15
			ElseIf(indig == 4)
				indigFactor = 19
			EndIf
			
			int newStage = data.TimerState
			if(Utility.RandomInt() < indigFactor)
				newStage += 1
				setCustomVar1(aiTimerID, data.CustomVar1 + 1)
				currentPred.SetValue(FV_HasBloating, 1)
			Else
				newStage -= 1
			EndIf
			UpdateTimerState(aiTimerID, newStage)
			OnTimerPlaySound(data)
			currentPred.SetValue(FV_DigestionStage, newStage)
			If((FV_ColdSteelEnabled.GetValue() > 0 && (currentPred.GetLeveledActorBase().GetSex() == 1 || FV_MaleColdSteelToggle.GetValue() == 1)))
				UpdateColdSteelCounter(aiTimerID, ColdSteelCounts as int)
				StartTimer((data.DigestSpeedTime)/ColdSteelCounts, aiTimerID)
			Else
				ChangeDigestFullnessArmor(currentPred, newStage + 1)
				StartTimer(data.DigestSpeedTime, aiTimerID)
			EndIf
			UpdateDigestionPreyCount(aiTimerID)
			EndIf
	ElseIf (data.TimerState == 0) ; Prey digestion complete.
		If((FV_ColdSteelEnabled.GetValue() > 0 && (currentPred.GetLeveledActorBase().GetSex() == 1 || FV_MaleColdSteelToggle.GetValue() == 1))) ;currentPred.HasKeyword(FV_ColdSteelBody))
			FV_ColdSteelBellyQuest.ChangeColdSteelDigestFullness(currentPred, data.TimerState as float)
		Else
			ChangeDigestFullnessArmor(currentPred, data.TimerState)
		EndIf
		UpdateTimerState(aiTimerID, data.TimerState-1)
		OnTimerPlaySound(data)
		
		currentPred.SetValue(FV_DigestionStage, data.TimerState-1)
		OnTimerFinishedDigestion(aiTimerID, data)
		
	else
		trace(self, "Tick BUG" + aiTimerID)
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
function OnTimerPlaySound(VoreData data)
	int root = GetRoot(data.Index, false)
	if(root == data.ParentIndex)
		FV_FXStomachGurgle.Play(data.Pred)
	Else
		int instanceID = FV_FXStomachGurgle.Play(GetFromIndex(root).Pred) 	; remove
		Sound.SetInstanceVolume(instanceID, 0.5)						; remove
	EndIf
EndFunction

function OnTimerDecreaseTicks(int aiTimerID, VoreData data)

	if(AllowPredReEatPrey && data.IsPredator)
		If(data.Tick < 0 && Utility.RandomInt()> 90)
			trace(self, "Tick RandomInt > 0 ")
			Int[] children = new Int[0]
			children.Clear()
			GetchildrenAsSameLevelAndCheckFirstParent(children, data.parentIndex, data.Index) ; SCAN PPA
			trace(self, "Tick children " + children)
			if(children.Length > 0)
				int i = children[Utility.RandomInt(0,children.Length-1)]
				VoreData tdata = GetFromIndex(i) ; SCAN PPA
				if(tdata!= None && tdata.Tick < 0 && !tdata.IsDead && tdata.TimerState >= 100)
					OnTimerTransfer(aiTimerID, i, data)
				EndIf
			EndIf
		EndIf
	EndIf
	
	; do nothing if the prey is also a pred
	if(data.ContainAPrey)
		;check if pred should regurgitate nested pred
		If(data.Pred.GetValue(FV_RegurgitateBool) == 1)
			data.Pred.SetValue(FV_RegurgitateBool, 0)
			OnTimerPerformVomit(aiTimerID, data)
			Return
		Endif
		StartTimer(data.DigestSpeedTime, aiTimerID)
		Return
	EndIf

	
	if(data.Pred.IsDead())
		trace(self, "Tick Pred: " + data.Pred + " IsDead: " + aiTimerID)
		OnTimerPerformVomit(aiTimerID, data)
		Return
	EndIf
	
	trace(self, "OnTimerDecreaseTicks() data.index: " + data.index + " data.IsDead: " + data.IsDead)
	If(data.IsDead)
		;if prey is dead, there's no point in calculating damage.  Go ahead and kill it and move on.
		OnTimerPerformDigestion(aiTimerID, data)
		return
	EndIf
	
	if(!data.IsLethal)
		If(data.Pred.GetValue(FV_RegurgitateBool) == 1)
		
			;Reset regurgetate bool
			data.Pred.SetValue(FV_RegurgitateBool, 0)
			
			;Vomit
			OnTimerPerformVomit(aiTimerID, data)
		Else
			If(data.Prey == PlayerRef && PlayerRef.GetDistance(data.Pred) > 4000)
				;move player in case pred gets nearly a cell away.  A cell is 4096x4096 units
				PlayerRef.TranslateToRef(data.Pred, 25000)
			Endif
			;restart timer
			trace(self, "OnTimerDecreaseTicks() prey is non-lethal.  Restart timer")
			StartTimer(data.DigestSpeedTime, aiTimerID)
		EndIf
		Return
	EndIf
	
	Actor currentPrey = data.Prey
	Actor currentPred = data.Pred
	
	currentPrey.ModValue(FV_TicksTillEscape, -1)
	
	Float DamageDealt = (currentPred.GetValue(FV_AcidDamage)+currentPred.GetValue(Game.GetEnduranceAV()))*(1-(currentPrey.GetValue(FV_AcidResistance)-currentPred.GetValue(FV_AcidStrengthValue))/100)
	trace(self, "damage calculated " + DamageDealt + " prey health: " + currentPrey.GetValue(Game.GetHealthAV()))
	
	If((currentPrey.GetValue(Game.GetHealthAV()) as float) - DamageDealt <= 0)										;Check if prey will die from damage.  If so, perform special handling
		trace(self, "damage greater than current health of enemny")
		If(currentPrey == PlayerRef)

			;we kill the player but have to make sure the triggerdigestionsequence is passed early enough, to prevent regurgitation of half dead player
			if((currentPrey.GetValue(Game.GetHealthAV())) > (currentPrey.getBaseValue(Game.GetHealthAV()) * 0.5)); - (currentPrey.getBaseValue(Game.GetHealthAV()) * 0.25)) > 0 )
				currentPrey.DamageValue(Game.GetHealthAV(), ((currentPrey.getBaseValue(Game.GetHealthAV()) * 0.2)))
				Debug.Notification("Your predator enjoys feeling you struggle in their stomach.")
				FV_FXBurp.Play(currentPred)
			else
				Debug.Notification("You cease the futile escape attempts and succumb to your predator's stomach.")
				PlayerDies(aiTimerID, data)
				return
			EndIf
		ElseIf(currentPrey.HasPerk(FV_DigestInvulnerability))
			Var[] kArgs = new Var[2]
			kArgs[0] = CurrentPred
			kArgs[1] = CurrentPrey
			SendCustomEvent("OnDigestProtection", kArgs)
			OnTimerPerformVomit(aiTimerID, data)
			return
		ElseIf(currentPrey.IsInFaction(HasBeenCompanionFaction))
			If(FV_DigestCompanionProtection.GetValue()>0)
				currentPrey.DamageValue(Game.GetHealthAV(), DamageDealt)														;Put companions in bleed out and then vomit them up
				OnTimerPerformVomit(aiTimerID, data)
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
		currentPrey.DamageValue(Game.GetHealthAV(), DamageDealt)															;if prey was not meant to die, deal damage to it now
	EndIf
	If(currentPred == PlayerRef)
		FV_VoreHud.UpdateHealthBar(aiTimerID, currentPrey)
	EndIf
	
	Int EscapeRoll = Utility.RandomInt()
	
	int EscapeCheck = 12 + currentPrey.GetValue(FV_EscapeChance) as int - CurrentPred.GetValue(FV_StomachStrength) as int
	
	If(!data.isLethal)																							;set escape roll higher than escape chance is expected to happen to prevent accident escaping of non-lethal prey
		EscapeRoll = 999
	EndIf
	If(currentPrey.IsDead())
		OnTimerPerformDigestion(aiTimerID, data)
	ElseIf((EscapeRoll < EscapeCheck && data.Tick <= 0 ) || currentPred.GetValue(FV_RegurgitateBool) == 1 || currentPrey.GetValue(FV_TicksTillEscape) <= 0)
		;deal damage if prey is escaping
		Float fEscapeDamage = currentPrey.GetValue(FV_EscapeDamage) as float
		If(fEscapeDamage > 0 && currentPred.GetValue(FV_RegurgitateBool) == 0)
			Float EscapeDamageValue = currentPred.GetBaseValue(Game.GetHealthAV())*fEscapeDamage/100
			currentPred.DamageValue(Game.GetHealthAV(), EscapeDamageValue)
		EndIf
		data.Pred.SetValue(FV_RegurgitateBool, 0)
		;vomit
		trace(self, " OnTimerDecreaseTicks() Prey escaped - EscapeCheck: " + EscapeCheck + " EscapeRoll: " + EscapeRoll)
		OnTimerPerformVomit(aiTimerID, data)
	Else
		;restart timer					
		StartTimer(data.DigestSpeedTime, aiTimerID)
	EndIf
EndFunction

;End of lethal vore. Clears up variables and runs post vore actions TODO: Scat + other post vore options
function OnTimerPerformDigestion(int aiTimerID, VoreData data)
	trace(self, "OnTimerPerformDigestion: " + data)
	if(data == None)
		trace(self, "[BUG] OnTimerPerformDigestion")
		Return
	EndIf
	PrintInfos()
	
	If(data.HasDigested)
		trace(self, "OnTimerPerformDigestion() HasDigested: " + data.HasDigested + data)
		Return
	EndIf
	
	Actor currentPred = data.Pred
	Actor currentPrey = data.Prey
	
	Var[] kArgs = new Var[4]
	kArgs[0] = CurrentPred
	kArgs[1] = 0
	kArgs[2] = CurrentPrey
	kArgs[3] = FindBellyContainer(CurrentPred)
	SendCustomEvent("OnDigest", kArgs)
	
	If(CurrentPred == PlayerRef)
		FV_VoreHud.RemoveHealthBar(aiTimerID)
	EndIf

	data.IsDead = true
	UpdateCurrentInStomach(aiTimerID)
	
	int root = GetRoot(data.Index, false)
	if(root == data.ParentIndex)
		If(Utility.RandomInt() > 75)
			If(currentPred == PlayerRef)
				FV_PlayerDigestSuccess.Play(currentPred)	;GAZ: Changed more PlayAndWait spam. Changing these to use .Play instead may cause issues with multiple sounds playing over the top of each other. If this happens, switch to using CallFunctionNoWait method.
			Else
				FV_NPCDigestSuccess.Play(currentPred)
			EndIf
		Else
			FV_FXBurp.Play(currentPred)
		EndIf
	Else
		;TODOSound: 
		;PreyDeadSound1.Play(PredPreyArray[root].Pred)					; add
		int instanceID = FV_FXBurp.Play(GetFromIndex(root).Pred) 	; remove
		Sound.SetInstanceVolume(instanceID, 0.5)						; remove
	EndIf
	
	;Increase the chance of indigestion
	currentPred.ModValue(FV_IndigestionChanceOnNextDigest, CalculateIndigestionChance(currentPred, currentPrey))
	
	;Stats stuff
	
	If (CurrentPred == PlayerRef || CurrentPred.IsInFaction(HasBeenCompanionFaction))
		FV_ActorData.UpdateDigestCount(CurrentPred, CurrentPrey)
	EndIf
	
	If(currentPrey.HasKeyword(ActorTypeRobot) && currentPred.HasPerk(FV_HighIronDiet03))		
		currentPred.Additem(AmmoFusionCell, currentPrey.GetLevel()/2 as int, false)		
	EndIf
	
	;Add XP
	;CalculateVoreXP(CurrentPred, CurrentPrey)
	If(CurrentPrey != PlayerRef)
		FV_ScatManager.ProcessPreyItems(CurrentPrey, CurrentPred)
	EndIf
	CurrentPrey.AddItem(LLD_VEV_Crystals_Prey_FV_, 1, true)
	
	;If the pred is the player
	If(currentPred == PlayerRef)
	
		;Move all items into the belly container
		currentPrey.RemoveAllItems(FV_BellyContainer)
	
		;Set bool to say there are items in the belly to be true (used in holotape)
		FV_HasItemsInBellyBool.SetValue(1)
	
	; no, transfer prey items to pred
	ElseIf(CurrentPrey == PlayerRef)
		;do nothing
	ElseIf(CurrentPred.IsInFaction(CurrentCompanionFaction) && FV_CompanionScat.GetValue() == 1)
		CurrentPrey.RemoveAllItems(FV_CompanionBellyContainer)
	ElseIf(FV_ScatEnabled.GetValue() == 1 && FV_NPCScatEnabled.GetValue() == 1 && !CurrentPred.IsInFaction(CurrentCompanionFaction))
		ObjectReference PredContainer = FindBellyContainer(CurrentPred)
		CurrentPrey.RemoveAllItems(PredContainer)
	ElseIf(currentpred.isinfaction(WorkshopNPCFaction) || currentpred.isinfaction(WorkshopDialogueFaction) || currentpred.isinfaction(CurrentCompanionFaction))
		currentPrey.RemoveAllItems(FV_BellyContainer)
	Else
		currentPrey.RemoveAllItems(currentPred)
	EndIf
	
	;eliminate corpse and move back to original spawn location for cell reset
	If(currentPrey != PlayerRef)
		currentPrey.SetCriticalStage(4)
		currentPrey.MoveToMyEditorLocation()
		trace(self, "Prey NPC has been moved back to original editor location")
	EndIf
	
	;Update if prey has previously digested.  Will prevent additional XP calculations and timer restarts
	data.HasDigested = true
		
	;Was that the last prey in the stomach of the pred? 
	If((currentPred.GetValue(FV_CurrentAlivePrey) <= 0 && currentPred != PlayerRef) || (currentPred.GetValue(FV_CurrentAlivePrey) <= 0 && FV_ManualDigestionEnabled.GetValue() == 0))
		;Trigger digestion as set to auto digest
		trace(self, "Start TriggerDigestionSequence")
		OnTimerTriggerDigestionSequence(aiTimerID, data)
	ElseIf(currentPred.GetValue(FV_CurrentAlivePrey) <= 0)
		;TODO: Play sounds
		currentPred.SetValue(FV_ReadyToDigest, 1)
		If(currentPred == Game.GetPlayer())
			FV_ReadyToDigestMessage.Show()
		EndIf
	EndIf
	
	trace(self, "PerformDigestion - Done")
	PrintInfos()
EndFunction

Function OnTimerTriggerDigestionSequence(int aiTimerID, VoreData data)
	if(data == None)
		trace(self, "[BUG] OnTimerTriggerDigestionSequence")
		Return
	EndIf
	Actor currentPred = data.Pred
	Actor currentPrey = data.Prey
	If(currentPred == PlayerRef)
		FV_VoreHud.ClearHealthBars()
	EndIf
	;Get chance of getting indigestion from actor value
	float indigestionChance = currentPred.GetValue(FV_IndigestionChanceOnNextDigest)
	
	;0-100 chance diceroll	
	int diceRoll = Utility.RandomInt()
	
	trace(self, "Indigestion Chance: " + indigestionChance)
	trace(self, "Dice Roll: " + diceRoll)
	
	currentPred.SetValue(FV_ReadyToDigest, 0)
	
	;Play digesting sound if triggered
	If(FV_ManualDigestionEnabled.GetValue() == 1)
		FV_FXBurp.Play(currentPred)
	EndIf
	
	;Check for indigestion
	If(indigestionChance > diceRoll)

		;Work out how bad the indigestion is.
		If(indigestionChance - diceRoll <= 20)
			;Minor
			If(currentPred == PlayerRef)
				FV_IndigestionMinorMessage.Show()
			EndIf
			currentPred.SetValue(FV_IndigestionSeverityFlag, 1)
		ElseIf(indigestionChance - diceRoll <= 35)
			;Normal
			If(currentPred == PlayerRef)
				FV_IndigestionNormalMessage.Show()
			EndIf
			currentPred.SetValue(FV_IndigestionSeverityFlag, 2)
		ElseIf(indigestionChance - diceRoll <= 60)
			;Major
			If(currentPred == PlayerRef)
				FV_IndigestionMajorMessage.Show()
			EndIf
			currentPred.SetValue(FV_IndigestionSeverityFlag, 3)
		Else
			;Severe
			If(currentPred == PlayerRef)
				FV_IndigestionSevereMessage.Show()
			EndIf
			currentPred.SetValue(FV_IndigestionSeverityFlag, 4)
		EndIf	
		
		;Cause Indigestion
		currentPred.EquipItem(FV_IndigestionEffect , true, true)
		
	EndIf
	
	;Mod the chance of indigestion to zero for next digest
	currentPred.ModValue(FV_IndigestionChanceOnNextDigest, -1*currentPred.GetValue(FV_IndigestionChanceOnNextDigest))
	
	trace(self, "Reset indigestion chance: " + currentPred.GetValue(FV_IndigestionChanceOnNextDigest))
		
	;Remove bulge belly
	ChangeFullnessArmor(currentPred, -1)				;changed pass value from 0 to -1 to avoid resetting ColdSteel Giant Belly
	
	int CurrentInStomach = (((currentPred.GetValue(FV_CurrentPrey)/2-1) * 3) + 6) as int
	currentPred.SetValue(FV_DigestionStage, CurrentInStomach)
	UpdateTimerState(aiTimerID, CurrentInStomach)
	trace(self, "OnTimerTriggerDigestionSequence() CurrentInStomach: " + CurrentInStomach + " currentPred: " + currentPred)
	Var[] kArgs = new Var[4]
	kArgs[0] = CurrentPred
	kArgs[1] = 3
	kArgs[2] = CurrentPrey
	kArgs[3] = FindBellyContainer(CurrentPred)
	SendCustomEvent("OnDigest", kArgs)
	
	VoreData predData = GetPredFromIndex(data.ParentIndex)
	If(predData != NONE)
		predData.LastIndex = aiTimerID
	EndIf
	
	If((FV_ColdSteelEnabled.GetValue() > 0 && (currentPred.GetLeveledActorBase().GetSex() == 1 || FV_MaleColdSteelToggle.GetValue() == 1))); currentPred.HasKeyword(FV_ColdSteelBody))
		UpdateColdSteelCounter(aiTimerID, ColdSteelCounts as int)
		FV_ColdSteelBellyQuest.ChangeColdSteelDigestFullness(currentPred, (CurrentInStomach as float))
		StartTimer((data.DigestSpeedTime)/ColdSteelCounts, aiTimerID)
	Else
		;Start digestion timer
		ChangeDigestFullnessArmor(currentPred,CurrentInStomach)
		StartTimer(data.DigestSpeedTime, aiTimerID)
	EndIf
EndFunction

Function OnTimerFinishedDigestion(int aiTimerID, VoreData data)
	trace(self, "OnTimerFinishedDigestion: " + data)
	if(data == None)
		trace(self, "[BUG] OnTimerFinishedDigestion")
		Return
	EndIf
	PrintInfos()

	Actor soundActor 		= data.Pred ; TODO get the top level 
	Actor akCurrentPred		= data.Pred
	Actor akCurrentPrey		= data.Prey

	;Play finished sound
	;Search the top most parent
	int root = GetRoot(data.Index, false)
	if(root == data.ParentIndex)
		FV_FXBurp.Play(data.Pred)
	Else
		;TODOSound 
		;FV_FXBurp1.Play(PredPreyArray[root].Pred)					; add
		int instanceID = FV_FXBurp.Play(GetFromIndex(root).Pred) 	; remove
		Sound.SetInstanceVolume(instanceID, 0.5)							; remove
	EndIf

    ;End of digestions
    akCurrentPred.SetValue(FV_DigestionStage, 0)
	
	;Only activate for the prey. Prevents crash TODO: Other methods of item retrival.
	If(akCurrentPred == PlayerRef)
		
		If(FV_ScatEnabled.GetValue() == 1)
			If(akCurrentPred.getValue(FV_Scatready) == 0)
				akCurrentPred.SetValue(FV_Scatready, 1)
				;Debug.Notification("You feel the pressure of your preys' remains build in your bowels.")
				FV_ReadyToScatMessage.show()
			EndIf
		Else
			;Open belly
			;FV_BellyContainer.Activate(akCurrentPred, false)
		EndIf
	;Activate belly container for player if they are not a pred and an ally has finished digestion
	ElseIf(akCurrentPred.IsInFaction(CurrentCompanionFaction) && FV_CompanionScat.GetValue() == 1)
		akCurrentPred.SetValue(FV_Scatready, 1)
	ElseIf(FV_ScatEnabled.GetValue() == 1 && FV_NPCScatEnabled.GetValue() == 1 && !akCurrentPred.IsInFaction(CurrentCompanionFaction))
		FV_ScatManager.NPCScat(akCurrentPred)
	ElseIf(PlayerRef.GetValue(FV_HasHadNukaAcid) == 0 && (akCurrentpred.IsInFaction(WorkshopNPCFaction) || akCurrentpred.IsInFaction(WorkshopDialogueFaction) || akCurrentpred.IsInFaction(CurrentCompanionFaction)))
		FV_BellyContainer.Activate(PlayerRef, false)
	EndIf
	
	PrintInfos()	
	
	; update stomach and armor only if the pred is in another pred
	int p = GetRoot(aiTimerID)
	VoreData dataRoot = GetParentFromIndex(p)
	if(dataRoot != None)
		p = dataRoot.Index
	Else
		p = -1
	EndIf
	
	CleanUpBuffer(aiTimerID)
	
	if(akCurrentPred == PlayerRef)
		FV_VoreHud.SendTrackerUpdate()
	Endif
	
	If(akCurrentPrey == PlayerRef && PlayerRef.HasPerk(FV_ReformPerk01))
		ReformPlayer(akCurrentPred)	;may need to add ways to keep player as last prey no matter what.  Potential for player to get lost in prey heirarchy
	EndIf
	
	if(p>=0)
		UpdateCurrentInStomach(-1,p,None,true,True)
	EndIf
	
	PrintInfos()
	
	;Custom event transmission
	Var[] kArgs = new Var[4]
	kArgs[0] = akCurrentPred
	kArgs[1] = 1
	kArgs[2] = NONE
	kArgs[3] = FindBellyContainer(akCurrentPred)
	SendCustomEvent("OnDigest", kArgs)
	
EndFunction
	
Function OnTimerReformPlayerFinish()
	trace(self, "OnTimerReformPlayerFinish()")
	
	PlayerRef.setAlpha(1, False)																			;Make player visible again
	playerLayer.Reset()																		;Enable player controls
	;playerLayer.EnableJumping(true)
	;playerLayer.EnableFighting(true)
	FV_PlayerAsPreyContext.SetValue(0)
	
	ClearPredPreyFaction()

	StartTimer(4, GhostTimerRemovalID)	
EndFunction

;************************************************************************************
;************************************************************************************
; Vomit events
	
;Vomits up the prey
function OnTimerPerformVomit(int aiTimerID, VoreData data)
	trace(self, "OnTimerPerformVomit: " + data)
	PrintInfos()
	if(data == None)
		trace(self, "[BUG] OnTimerPerformVomit")
		Return
	EndIf
	
	Actor currentPrey = data.Prey
	Actor currentPred = data.Pred
	If(currentPred == PlayerRef)
		FV_VoreHud.RemoveHealthBar(aiTimerID)
	EndIf
	
	int root = GetRoot(data.Index, false)
	
	; move up the prey
	Int parentPred = TreeMoveUp(aiTimerID)

	resetTick(aiTimerID)
	; read the new data for the prey
	VoreData newData = GetPreyFromIndex(aiTimerID)
	PrintInfos()
	trace(self, "OnTimerPerformVomit() ParentPred: " + ParentPred)
	;Play vomit audio
	if(root == data.ParentIndex)
		FV_FXVomit.PlayAndWait(currentPred)
	else
		;TODOSound 
		;VomitSound1.Play(PredPreyArray[root].Pred)					; add
		int instanceID = FV_FXVomit.Play(GetFromIndex(root).Pred) 	; remove
		Sound.SetInstanceVolume(instanceID, 0.25)					; remove
	EndIf

	; if prey has no parent 
	if(newData.ParentIndex == -1)
		; regurgitates the prey
		
		;Set values back to 0
		CurrentPrey.ModValue(FV_TicksTillEscapeStart, -1*CurrentPrey.GetValue(FV_TicksTillEscapeStart))
		CurrentPrey.ModValue(FV_TicksTillEscape, -1*CurrentPrey.GetValue(FV_TicksTillEscape))
		
		;Reset prey size
		currentPrey.SetScale(1)
		
		If (currentPrey == PlayerRef)																		;If current prey is player
			trace(self, "OnTimerPerformVomit() Player was prey - pred: " + CurrentPred + ", prey: " + CurrentPrey)
			;currentPred.MoveTo(currentPrey)																			;Move the pred to player
			CurrentPrey.TranslateToRef(currentPred, 25000)
			currentPrey.setAlpha(1, False)																			;Make player visible again
			playerLayer.Reset()																		;Enable player controls
			;Debug.EnableDetection(True)																				;Re-Enables detection
			
			FixCamera(currentPrey)

			FV_PlayerAsPreyContext.SetValue(0)

			Utility.SetINIFloat("fVertibirdVanityModeMaxDist:Camera", fCameraDistanceVomit)
			Utility.SetINIBool("bApplyCameraNodeAnimations:Camera", 1)
			

			ClearPredPreyFaction()
			
			StartTimer(4, GhostTimerRemovalID)																		;allow player to remain ghosted for 4 seconds.  Timer will remove
		Else
			currentPrey.MoveTo(currentPred)																			;Move prey to pred	
			currentPrey.PushActorAway(currentPrey, 0)																;moved this to only happen to NPC actors.  Delayed ragdoll to player is problematic
		EndIf
		currentPrey.EquipItem(FV_RemoveSwallowProtection, true, true)
	Else
	
		; continue digestion
		StartTimer(data.DigestSpeedTime, aiTimerID)
	EndIf
	
	; update stomach value and update armor
	UpdateCurrentInStomach(-1,-1, currentPred, true,True)
	
	Var[] kArgs = new Var[2]
	kArgs[0] = currentPred	
	kArgs[1] = currentPrey
	SendCustomEvent("OnVomit", kArgs)
	
	; call OnTimerTriggerDigestionSequence if needed
	if(parentPred >= 0 && currentPred.GetValue(FV_CurrentAlivePrey) <= 0 && currentPred.GetValue(FV_CurrentPrey) > 0)
		Int child = GetOneChild(parentPred)
		if(child >= 0)
			OnTimerTriggerDigestionSequence(child, GetPreyAndPredFromIndex(child))
		EndIf
	EndIf
	
	; remove the prey from buffer
	if(newData.ParentIndex == -1)
		RemoveFromBufferIfNochildren(aiTimerID)
	EndIf	
	
	; remove also the pred if needed
	if(parentPred >= 0 && currentPred.GetValue(FV_CurrentPrey) <= 0)
		newData = GetFromIndex(parentPred)
		if(newData != None && newData.ParentIndex == -1)
			RemoveFromBufferIfNochildren(parentPred)
		EndIf
	EndIf
	
	trace(self, "OnTimerPerformVomit() - PerformVomit Done")
	PrintInfos()
EndFunction


; KEILLA: I don't know exactly. 
function OnTimerTransfer(int aiTimerID, int child, VoreData data)
	trace(self, "OnTimerTransfer: " + data)
	PrintInfos()
	if(data == None)
		trace(self, "[BUG] OnTimerTransfer")
		Return
	EndIf

	Actor currentPrey = data.Prey
	Actor currentPred = data.Pred
	
	int root = GetRoot(data.Index, false)

	TreeMoveDown(aiTimerID , child)
	UpdateCurrentInStomach(-1, aiTimerID, None, true)
	resetTick(aiTimerID)
	resetTick(child)	
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

Function ReloadGame()
	If(KillPlayerAsPrey)
		;Bye bye player
		KillPlayerAsPrey = false
		playerLayer.Reset()
		Game.QuitToMainMenu()
	EndIf
EndFunction

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

; to use this Function
; open the console
;    type: 'help ConsumptionRegi 0' to get the quest Id  (xx004c90)
;    type: 'CallQuestFunction xx004c90 ResetVoreMod'
; OR type: 'CallQuestFunction xx004c90 ResetVoreMod True'     to also do a reset of the player
; wait
; 

bool ModResetting = false

Function ResetVoreMod(Bool resetPlayer = False)
	If(ModResetting)
		return
	EndIf
	ModResetting = true
	GotoState("OnTimerState")	
	int i = 0
	Actor a = 		PlayerRef
	Actor player = 	PlayerRef
	
	trace(self, "          ResetVoreMod")
	PrintInfos()
	Utility.Wait(4 as float)																					
	trace(self, "          CancelTimer")
	While (i < PredPreyArray.Length)
		CancelTimer(PredPreyArray[i].Index)
		i += 1
	EndWhile
	
	i = PredPreyArray.FindStruct("Prey", player)
	if(i >= 0 || resetPlayer)
		trace(self, "          Reset player")
		a.setAlpha(1, False)
		if(playerLayer)	
			playerLayer.Reset()		
		EndIf
		FixCamera(a)
		Utility.SetINIFloat("fVertibirdVanityModeMaxDist:Camera", fCameraDistanceVomit)
		Utility.SetINIBool("bApplyCameraNodeAnimations:Camera", 1)

		ClearPredPreyFaction()
		a.setGhost(False)
		a.MoveTo(a)																				;Move the pred to the player
		a.EquipItem(FV_RemoveSwallowProtection, true, true)
		Utility.Wait(4 as float)
	EndIf
	If((FV_ColdSteelEnabled.GetValue() > 0 && (a.GetLeveledActorBase().GetSex() == 1 || FV_MaleColdSteelToggle.GetValue() == 1))) ;a.HasKeyword(FV_ColdSteelBody))
		FV_ColdSteelBellyQuest.ResetMorphs(a)
	EndIf
	ChangeFullnessArmor(a,0)
	ChangeDigestFullnessArmor(a)
	
	
	a.ModValue(FV_CurrentPrey, 						0-a.GetValue(FV_CurrentPrey))
	a.ModValue(FV_CurrentAlivePrey, 				0-a.GetValue(FV_CurrentAlivePrey))
	a.ModValue(FV_TicksTillEscape, 					0-a.GetValue(FV_TicksTillEscape))
	a.ModValue(FV_TicksTillEscapeStart, 			0-a.GetValue(FV_TicksTillEscapeStart))
	a.ModValue(FV_IndigestionChanceOnNextDigest, 	0-a.GetValue(FV_IndigestionChanceOnNextDigest))
	a.ModValue(FV_HumanPreyCount,					0-a.GetValue(FV_HumanPreyCount))
	If(a.GetValue(FV_BlockSwallowFlag) == 2)
		a.SetValue(FV_BlockSwallowFlag, 1)
	Else
		a.SetValue(FV_BlockSwallowFlag, 0)
	EndIf
	a.SetValue(FV_DigestionStage, 					0)
	a.SetValue(FV_ReadyToDigest, 					0)
	a.SetValue(FV_IndigestionSeverityFlag, 			0)
	a.SetValue(FV_HasBloating, 						0)
	If(a.HasPerk(FV_HeavyPredPlayer))
		a.RemovePerk(FV_HeavyPredPlayer)
	Endif
	
	trace(self, "          Reset pred and prey")
	i=0
	While (i < PredPreyArray.Length)
		VoreData d = PredPreyArray[i]
		a = d.pred
		If(a != None && a != player)
			a.MoveTo(player)																			
			a.setPosition(player.getPositionX(), player.getPositionY(), player.getPositionZ())	
			ChangeFullnessArmor(a,0)
			ChangeDigestFullnessArmor(a)
			If((FV_ColdSteelEnabled.GetValue() > 0 && (a.GetLeveledActorBase().GetSex() == 1 || FV_MaleColdSteelToggle.GetValue() == 1))) ;a.HasKeyword(FV_ColdSteelBody))
				FV_ColdSteelBellyQuest.ResetMorphs(a)
			EndIf
			a.ModValue(FV_CurrentPrey, 						0-a.GetValue(FV_CurrentPrey))
			a.ModValue(FV_CurrentAlivePrey, 				0-a.GetValue(FV_CurrentAlivePrey))
			a.ModValue(FV_TicksTillEscape, 					0-a.GetValue(FV_TicksTillEscape))
			a.ModValue(FV_TicksTillEscapeStart, 			0-a.GetValue(FV_TicksTillEscapeStart))
			a.ModValue(FV_IndigestionChanceOnNextDigest, 	0-a.GetValue(FV_IndigestionChanceOnNextDigest))
			a.ModValue(FV_HumanPreyCount,					0-a.GetValue(FV_HumanPreyCount))
			If(a.GetValue(FV_BlockSwallowFlag) == 2)
				a.SetValue(FV_BlockSwallowFlag, 1)
			Else
				a.SetValue(FV_BlockSwallowFlag, 0)
			EndIf
			a.SetValue(FV_DigestionStage, 					0)
			a.SetValue(FV_ReadyToDigest, 					0)
			a.SetValue(FV_IndigestionSeverityFlag, 			0)
			a.SetValue(FV_HasBloating,						0)
			If(a.HasPerk(FV_HeavyPredNPC))
				a.RemovePerk(FV_HeavyPredNPC)
			Endif
		EndIf
		
		a = d.prey
		If(a != None && a != player)
			a.MoveTo(player)																			
			a.setPosition(player.getPositionX(), player.getPositionY(), player.getPositionZ())	
			ChangeFullnessArmor(a,0)
			ChangeDigestFullnessArmor(a)
			If((FV_ColdSteelEnabled.GetValue() > 0 && (a.GetLeveledActorBase().GetSex() == 1 || FV_MaleColdSteelToggle.GetValue() == 1))) ;a.HasKeyword(FV_ColdSteelBody))
				FV_ColdSteelBellyQuest.ResetMorphs(a)
			EndIf
			a.ModValue(FV_CurrentPrey, 						0-a.GetValue(FV_CurrentPrey))
			a.ModValue(FV_CurrentAlivePrey, 				0-a.GetValue(FV_CurrentAlivePrey))
			a.ModValue(FV_TicksTillEscape, 					0-a.GetValue(FV_TicksTillEscape))
			a.ModValue(FV_TicksTillEscapeStart, 			0-a.GetValue(FV_TicksTillEscapeStart))
			a.ModValue(FV_IndigestionChanceOnNextDigest, 	0-a.GetValue(FV_IndigestionChanceOnNextDigest))
			a.ModValue(FV_HumanPreyCount,					0-a.GetValue(FV_HumanPreyCount))
			If(a.GetValue(FV_BlockSwallowFlag) == 2)
				a.SetValue(FV_BlockSwallowFlag, 1)
			Else
				a.SetValue(FV_BlockSwallowFlag, 0)
			EndIf
			a.SetValue(FV_DigestionStage, 					0)
			a.SetValue(FV_ReadyToDigest, 					0)
			a.SetValue(FV_IndigestionSeverityFlag, 			0)
			a.SetValue(FV_HasBloating,						0)
			;a.DispelSpell(FV_spIndigestion)
			;a.DispelSpell(NoNameSpell) ; TODO2
			If(a.HasPerk(FV_HeavyPredNPC))
				a.RemovePerk(FV_HeavyPredNPC)
			Endif
			a.EquipItem(FV_RemoveSwallowProtection, true, true)
		EndIf
		
		i += 1
	EndWhile
	
	PredPreyArray.Clear()
	a.SetValue(FV_RegurgitateBool, 0)
	FV_ManualDigestionEnabled.SetValue(0)
	trace(self, "          Done !")
	Debug.MessageBox("ResetVoreMod, Done !")
	GotoState("")
	ModResetting = false
EndFunction

bool Function trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, VoreData data = NONE) debugOnly
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

int[] EscapedPreyIndices
int WakeUpTick
float WakeDay
bool bSleepInterrupted = false
float SleepWaitStartDay
float SleepWaitStopDay

Event OnPlayerWaitStart(float afWaitStartTime, float afDesiredWaitEndTime)
	OnPlayerWaitSleepStart(afWaitStartTime, afDesiredWaitEndTime)
EndEvent

Event OnPlayerWaitStop(bool abInterrupted)
	bSleepInterrupted = abInterrupted
	PlayerSleepWaitStop()
EndEvent

Event OnPlayerSleepStart(float afSleepStartTime, float afDesiredSleepEndTime, ObjectReference akBed)
	OnPlayerWaitSleepStart(afSleepStartTime, afDesiredSleepEndTime)
EndEvent

Event OnPlayerSleepStop(bool abInterrupted, ObjectReference akBed)
	trace(self, " OnPlayerSleepStop() WakeDay: " + WakeDay)
	bSleepInterrupted = abInterrupted
	PlayerSleepWaitStop()
EndEvent

Function OnPlayerWaitSleepStart(float afSleepWaitStartTime, float afDesiredWaitSleepEndTime)
	trace(self, " OnPlayerWaitSleepStart() afSleepWaitStartTime: " + afSleepWaitStartTime + " afDesiredSleepEndTime: " + afDesiredWaitSleepEndTime + " WakeDay: " + WakeDay)
	bSleepInterrupted = false
	SleepWaitStartDay = afSleepWaitStartTime
	
	If(!GetIfPlayerCanSleepWait())
		;"wake up" the player
		PlayerRef.Moveto(PlayerRef)
	EndIf

EndFunction

Bool Function GetIfPlayerCanSleepWait()
	if(PlayerRef.GetValue(FV_CurrentAlivePrey) > 0)
		FV_SleepWaitDisruptMessage.Show()
		return false
	EndIf
	return true
EndFunction

Function PlayerSleepWaitStop()
	
	SleepWaitStopDay = Utility.GetCurrentGameTime()
	WakeDay = Utility.GetCurrentGameTime()
	int i = predpreyarray.FindStruct("Pred", PlayerRef)
	If(i >= 0 && PredPreyArray[i].Pred == PlayerRef)
		HandleDigestionStage(PredPreyArray[i])
	Endif
	i = 0
	
	;now search for the other preds
	while i < predpreyarray.Length
		if(predpreyarray[i].pred != NONE && predpreyarray[i].pred != PlayerRef)
			;we have a pred!  Let's handle its prey
			HandleDigestionStage(predpreyarray[i])
		EndIf
		i += 1
	EndWhile
EndFunction

Function HandleDigestionStage(Voredata data)
	
	int DigestTicksRemaining = 0
	VoreData preyData
	int tempTimerState = 0
	
	int k = predpreyarray.FindStruct("Index", data.lastIndex)
	;let's convert the remaining ticks over to the digest tick rate
	
	if k >= 0
		;preyData.clear()
		preyData = predpreyarray[k]
		If data.pred.GetValue(FV_CurrentAlivePrey) > 0 || !preyData.IsLethal
			;only handle preds that are in the digestin phase.  If they still have living prey, they can ride out the sleep cycle.
			trace(self, "  HandleDigestionStage() Pred: " + data.pred + " FV_CurrentAlivePrey: " + data.pred.GetValue(FV_CurrentAlivePrey) + " IsLethal: " + data.IsLethal)
			return
		Endif
		WakeUpTick = math.floor(((WakeDay - SleepWaitStartDay)*1440)/(preyData.DigestSpeedTime*TimeScale.GetValue()/60)) as int
		trace(self, "HandleDigestionStage() WakeDay: " + WakeDay + " SleepWaitStartDay: " + SleepWaitStartDay + " DigestSpeedTime: " + data.DigestSpeedTime + " TimeScale: " + TimeScale.GetValue())
		canceltimer(preyData.Index)
		preyData.pred = data.pred
		
		tempTimerState = preyData.timerstate
		trace(self, " HandleDigestionStage() Pred: " + preyData.pred + " WakeUpTick: " + WakeUpTick + " tempTimerState: " + tempTimerState)
		If WakeUpTick >= tempTimerState
			;code to finish digestion and reset pred
			;preyData.TimerState = 0
			UpdateTimerState(preyData.Index, 0)
			
			If((FV_ColdSteelEnabled.GetValue() > 0 && (preyData.Pred.GetLeveledActorBase().GetSex() == 1 || FV_MaleColdSteelToggle.GetValue() == 1))); preyData.Pred.HasKeyword(FV_ColdSteelBody))
				FV_ColdSteelBellyQuest.ChangeColdSteelDigestFullness(preyData.Pred, 0.0)
			Else
				ChangeDigestFullnessArmor(preyData.Pred, 0)
			EndIf
			OnTimerFinishedDigestion(preyData.index, preyData)
		Else
			;the pred couldn't finish digesting ALL OF THAT DELICIOUS Prey  Let's set timerstates, equip some armors, and then start some timers
			;preyData.timerstate = tempTimerState - WakeUpTick
			UpdateTimerState(preyData.Index, tempTimerState - WakeUpTick)
			preyData.Pred.SetValue(FV_DigestionStage, preyData.timerstate)
			UpdateDigestionPreyCount(preyData.Index)
			;UpdateCurrentInStomach(akPred = preyData.Pred)
			If((FV_ColdSteelEnabled.GetValue() > 0 && (preyData.Pred.GetLeveledActorBase().GetSex() == 1 || FV_MaleColdSteelToggle.GetValue() == 1))); preyData.Pred.HasKeyword(FV_ColdSteelBody))
				FV_ColdSteelBellyQuest.ChangeColdSteelDigestFullness(preyData.Pred, preyData.TimerState as float)
			Else
				ChangeDigestFullnessArmor(preyData.Pred, preyData.TimerState)
			EndIf
			OnTimerTriggerDigestionSequence(preyData.Index, preyData)
		EndIf
	EndIf
EndFunction

Function MakeLethal(Actor akPrey)
	Int i = PredPreyArray.FindStruct("Prey", akPrey)
	If(i < 0)
		trace(self, " MakeLethal() Bug.  akPrey not found: " + akPrey)
		return 
	EndIf
	trace(self, " MakeLethal() set IsLethal true for akPrey: " + akPrey )
	PredPreyArray[i].IsLethal = true
	
EndFunction

Function MakeNonLethal(Actor akPrey)
	Int i = PredPreyArray.FindStruct("Prey", akPrey)
	If(i < 0)
		trace(self, " MakeNonLethal() Bug.  akPrey not found: " + akPrey)
		return
	EndIf
	trace(self, " MakeNonLethal() set IsLethal false for akPrey: " + akPrey)
	PredPreyArray[i].IsLethal = false
EndFunction

Function DisablePlayerMovement()
	;This is used to disable the player movement externally to allow NPCs to eat the player without the player being able to kite
	If(!playerLayer)
		playerLayer = inputenablelayer.Create()
	EndIf
	
	playerLayer.EnableMovement(false)
	playerLayer.EnableJumping(false)
EndFunction

Function EnablePlayerMovement()
	;Obviously, we need to re-enable player movement
	If(playerLayer)
		playerLayer.EnableMovement(true)
		playerLayer.EnableJumping(true)
	Endif
EndFunction

Function PlayerEscapes(int aiIndex)
	int i = PredPreyArray.FindStruct("Prey", PlayerRef)
	
	If(i > -1)
		Voredata data = GetPreyAndPredFromIndex(aiIndex)
		OnTimerPerformVomit(data.index, data)
	EndIf
EndFunction

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
		HealthRestored = PlayerRef.GetBaseValue(Game.GetHealthAV())
	ElseIf(PlayerRef.HasPerk(FV_ReformPerk02))
		HealthRestored = PlayerRef.GetBaseValue(Game.GetHealthAV()) * 0.5
	Else
		HealthRestored = PlayerRef.GetBaseValue(Game.GetHealthAV()) * 0.1
	EndIf
	PlayerRef.RestoreValue(Game.GetHealthAV(), HealtHRestored)
	StartTimer(6.0, ReformTimerID)
EndFunction

float fSecondWindLastTime = 0.0

Function PlayerDies(int aiIndex, VoreData aData = NONE)
	Int i = PredPreyArray.FindStruct("Prey", PlayerRef)
	
	If(i > -1)
		If(aData == NONE)
			aData = GetPreyAndPredFromIndex(aiIndex)
		EndIf
		;Bring the player to 1HP
		float RemainingHealth = (PlayerRef.GetValue(Game.GetHealthAV()) as float) - 1.0
		PlayerRef.DamageValue(Game.GetHealthAV(), RemainingHealth)
		Actor currentPred = aData.Pred
		KillPlayerAsPrey = true
		int RandomReformKillChance = Utility.RandomInt()
		If(RandomReformKillChance > PlayerRef.GetValue(FV_ReformChance))
			float currentGameTime = Utility.GetCurrentGameTime()
			If((currentGameTime-fSecondWindLastTime) > 1.0 && PlayerRef.HasPerk(FV_ReformPerk01))
				fSecondWindLastTime = currentGameTime
				FV_PlayerStruggle.SecondWind()
				return
			EndIf
			PlayerRef.RemovePerk(FV_ContextVorePerk)
			PlayerRef.AddPerk(FV_QuitToMenu)
		EndIf
		FV_FXBurp.Play(currentPred)
		
		OnTimerPerformDigestion(aiIndex, aData)
		
	EndIf
EndFunction

Function UpdateCameraSwallowDistance(Float afValue)
	fCameraDistanceSwallow = afValue
EndFunction

Function UpdateCameraVomitDistance(Float afValue)
	fCameraDistanceVomit = afValue
EndFunction