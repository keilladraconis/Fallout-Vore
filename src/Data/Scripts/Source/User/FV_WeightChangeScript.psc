Scriptname FV_WeightChangeScript extends Quest

Group ActorValues
	ActorValue Property FV_IsActivePred Auto						;defaults to 0 in CK
	ActorValue Property FV_CurrentPrey Auto
	ActorValue Property FV_FullnessMeter Auto
	ActorValue Property FV_GiantBelly Auto
	ActorValue Property FV_HasHadNukaAcid Auto
	ActorValue Property FV_IndigestionSeverityFlag Auto
	ActorValue Property FV_UseFormulaV Auto
	ActorValue Property FV_HasPlayedFormulaVMessage Auto
EndGroup

Group Companions
	FormList Property FV_ThiccExcludeList Auto
	{Companions added to this list will be ignored by Thicc Vore}
	ReferenceAlias Property CurrentCompanion Auto Const
	ReferenceAlias Property FV_ThiccCompanion Auto
EndGroup

Group Factions
	Faction Property CurrentCompanionFaction Auto
	Faction Property HasBeenCompanionFaction Auto
EndGroup

Group Keywords
	Keyword Property ActorTypeAnimal Auto
	Keyword Property ActorTypeBug Auto
	Keyword Property ActorTypeDeathclaw Auto
	Keyword Property ActorTypeFeralGhoul Auto
	Keyword Property ActorTypeGhoul Auto
	Keyword Property ActorTypeHuman Auto
	Keyword Property ActorTypeMireLurk Auto
	Keyword Property ActorTypeMireLurkKing Auto
	Keyword Property ActorTypeRadScorpion Auto
	Keyword Property ActorTypeRobot Auto
	Keyword Property ActorTypeSuperMutant Auto
	Keyword Property ActorTypeSuperMutantBehemoth Auto
	Keyword Property ActorTypeSynth Auto
	Keyword Property ActorTypeYaoGuai Auto
	Keyword Property FV_VoreMorphKeyword Auto Const Mandatory
	Keyword Property FV_ColdSteelBody Auto
EndGroup

Group Messages
	Message Property FV_HelpThiccVoreSliders Auto
	Message Property FV_ThiccFormulaVCompanionMessage Auto
	Message Property FV_ThiccFormulaVPlayerMessage Auto
	Message Property FV_ThiccVEVReactCompanionMessage Auto
	Message Property FV_ThiccVEVReactPlayerMessage Auto
	Message Property FV_ThiccNoNutritonMessage Auto
	MessageStruct[] Property ThiccMessages Auto
EndGroup

Group Perks
	Perk Property FV_HungerSpeed Auto
	Perk Property FV_HungerStaggerResist Auto
EndGroup

Group Scripts
	FV_ConsumptionRegistryScript Property FV_ConsumptionRegistry Auto
	FollowersScript Property Followers Auto
	FV_VoreHudScript Property FV_VoreHud Auto
EndGroup

Group Sounds
	Sound Property FV_FXStomachGurgle Auto
EndGroup

Int MinMeterDownCounter	
Int FullnessMeterDefault = 70
Int pShouldShowGroup2 = 1
Int NormalDownCounter = 1
Int CombatDownCounter = 2
Int FullnessMeterDecrement = 1
Int LowestMeterDownCounter = 7				;This value is the same as the the lowest allowable MCM value.  Will need updated if MCM options are changed
Int ResetHelpMessageTimerID = 999

Int AnimalMeterInc
Int DeathclawMeterInc
Int HumanMeterInc
Int MirelurkMeterInc
Int SuperMutantMeterInc

Float BodyModValue = 0.025					;2.5% per tick
Float ExcessChangeValue = 0.01				;set to 1% per tick 			
Float UpdateRate = 0.5						;play with ranges between 0.1 and 0.5  Sets how many times timer is called before an update to a meter happens  For excess, 0.1 makes best rate.

string sMaxHungerLoss = "MaxHungerLoss"
string sEnableMod = "EnableMod"
string sMeterMod = "sMeterMod"
string sBodyRate = "sBodyRate"
string sMeterRate = "sMeterRate"
string sPlayer = "Player"
string sCompanion = "Companion"
string sHUDPositionDropdown = "HUDPositionDropdown"
string sABSlim = "Slim"
string sABBreast = "Breasts_Small"
string sABThighSlim = "Thighs_Slim"
string sABNarrowWaist = "Waist_Narrow"
string sABBreastHuge = "Breasts_Huge"
string sABButtHuge = "Butt_Huge"
string sTogglePlayerAB = "TogglePlayerAB"
string sTogglePlayerCBBE = "TogglePlayerCBBE"
string sToggleCompanionAB = "ToggleCompanionAB"
string sToggleCompanionCBBE = "ToggleCompanionCBBE"

string sABBackWide = "Back_Wide"
string sABBellySize = "Belly_Size"
string sABButtFlat = "Butt_Flat"
string sABButtStretch = "Butt_Stretch"
string sABButtWide = "Butt_Wide"
string sABHipsWide = "Hips_Wide"
string sABTorsoLarge = "Torso_Large"
string sABWaistHeight = "Waist_Height"
string sABWaistSmooth = "Waist_Smooth"
string sABWaistWide = "Waist_Wide"

string sWeightLossChance = "iWeightLossChance"

string sCBBE7BUpper = "7B Upper"
string sCBBE7BLower = "7B Lower"
string sCBBEBreastsSmall = "BreastsSmall"
string sCBBEBreasts = "Breasts"
string sCBBEBreastFantasy = "BreastFantasy"
string sCBBEHips = "Hips"
string sCBBECalf = "CalfSize"
string sCBBEChubbyLegs = "ChubbyLegs"
string sCBBEButtSmall = "ButtSmall"
string sCBBESlimThighs = "SlimThighs"
string sCBBEAppleCheeks = "AppleCheeks"
string sCBBEBigButt = "BigButt"
string sCBBEBreastWidth = "BreastWidth"
string sCBBEChestDepth = "ChestDepth"
string sCBBEChubbyArms = "ChubbyArms"
string sCBBEForearmSize = "ForearmSize"
string sCBBEPushUp = "PushUp"
string sCBBEBreastPerkiness = "BreastPerkiness"
string sCBBEWaist = "Waist"
string sCBBESSBBW2 = "SSBBW2 body"
string sCBBEGiantbelly = "Giant belly (coldsteelj)"
string sCBBEUltKirBody = "SSBBW UltKir body"

string sModNameMCM = "FalloutVore"

Bool Property bEnablePlayerWeightChange = false Auto Hidden
Bool Property bEnableCompanionWeightChange = false Auto Hidden
Bool Property EnableCompanionAtomicBeauty = false Auto Hidden
Bool Property EnableCompanionCBBE = false Auto Hidden
Bool Property EnablePlayerAtomicBeauty = false Auto Hidden
Bool Property EnablePlayerCBBE = false Auto Hidden
Bool Property WeightModEnabled = false Auto Hidden

Float Property MeterRate Auto Hidden
Float Property MeterModRate Auto Hidden
Float Property BodyUpdateRate Auto Hidden

Int Property MFRatio Auto Hidden
Int Property tempMinMeterDownCounter Auto Hidden
Int Property iWeightLossChance Auto Hidden
Int Property iExcessLossAmount Auto Hidden
Int Property iPlayerSliderType Auto Hidden
Int Property iCompanionSliderType Auto Hidden

Float Property fABSlimMin Auto Hidden
Float Property fABSlimMax Auto Hidden
Float Property fABBreastMin Auto Hidden
Float Property fABBreastMax Auto Hidden
Float Property fABBreastHugeMin Auto Hidden
Float Property fABBreastHugeMax Auto Hidden
Float Property fABThighSlimMin Auto Hidden
Float Property fABThighSlimMax Auto Hidden
Float Property fABNarrowWaistMin Auto Hidden
Float Property fABNarrowWaistMax Auto Hidden
Float Property fABButtHugeMin Auto Hidden
Float Property fABButtHugeMax Auto Hidden
Float Property fABBackWideMax Auto Hidden
Float Property fABBackWideMin Auto Hidden
Float Property fABBellySizeMax Auto Hidden
Float Property fABBellySizeMin Auto Hidden
Float Property fABButtFlatMax Auto Hidden
Float Property fABButtFlatMin Auto Hidden
Float Property fABButtStretchMax Auto Hidden
Float Property fABButtStretchMin Auto Hidden
Float Property fABButtWideMax Auto Hidden
Float Property fABButtWideMin Auto Hidden
Float Property fABHipsWideMax Auto Hidden
Float Property fABHipsWideMin Auto Hidden
Float Property fABTorsoLargeMax Auto Hidden
Float Property fABTorsoLargeMin Auto Hidden
Float Property fABWaistHeightMax Auto Hidden
Float Property fABWaistHeightMin Auto Hidden
Float Property fABWaistSmoothMax Auto Hidden
Float Property fABWaistSmoothMin Auto Hidden
Float Property fABWaistWideMax Auto Hidden
Float Property fABWaistWideMin Auto Hidden

Float Property fCBBE7BUpperMin Auto Hidden
Float Property fCBBE7BUpperMax Auto Hidden
Float Property fCBBE7BLowerMin Auto Hidden
Float Property fCBBE7BLowerMax Auto Hidden
Float Property fCBBEBreastsSmallMin Auto Hidden
Float Property fCBBEBreastsSmallMax Auto Hidden
Float Property fCBBEHipsMin Auto Hidden
Float Property fCBBEHipsMax Auto Hidden
Float Property fCBBECalfMin Auto Hidden
Float Property fCBBECalfMax Auto Hidden
Float Property fCBBEChubbyLegsMin Auto Hidden
Float Property fCBBEChubbyLegsMax Auto Hidden
Float Property fCBBEButtSmallMin Auto Hidden
Float Property fCBBEButtSmallMax Auto Hidden
Float Property fCBBESlimThighsMin Auto Hidden
Float Property fCBBESlimThighsMax Auto Hidden
Float Property fCBBEAppleCheeksMin Auto Hidden
Float Property fCBBEAppleCheeksMax Auto Hidden
Float Property fCBBEBigButtMin Auto Hidden
Float Property fCBBEBigButtMax Auto Hidden
Float Property fCBBEBreastWidthMin Auto Hidden
Float Property fCBBEBreastWidthMax Auto Hidden
Float Property fCBBEChestDepthMin Auto Hidden
Float Property fCBBEChestDepthMax Auto Hidden
Float Property fCBBEChubbyArmsMin Auto Hidden
Float Property fCBBEChubbyArmsMax Auto Hidden
Float Property fCBBEForearmSizeMin Auto Hidden
Float Property fCBBEForearmSizeMax Auto Hidden
Float Property fCBBEPushUpMin Auto Hidden
Float Property fCBBEPushUpMax Auto Hidden
Float Property fCBBEBreastPerkinessMin Auto Hidden
Float Property fCBBEBreastPerkinessMax Auto Hidden
Float Property fCBBEWaistMin Auto Hidden
Float Property fCBBEWaistMax Auto Hidden
Float Property fCBBESSBBW2Min Auto Hidden
Float Property fCBBESSBBW2Max Auto Hidden
Float Property fCBBEGiantBellyMin Auto Hidden
Float Property fCBBEGiantBellyMax Auto Hidden
Float Property fCBBEBreastsMin Auto Hidden
Float Property fCBBEBreastsMax Auto Hidden
Float Property fCBBEBreastFantasyMin Auto Hidden
Float Property fCBBEBreastFantasyMax Auto Hidden
Float Property fCBBEUltKirBodyMin Auto Hidden
Float Property fCBBEUltKirBodyMax Auto Hidden

Struct WeightData
	Actor Pred
	string PredName
	
	;Weight settings
	float CurrentThin
	float CurrentMuscular
	float CurrentLarge
	float CurrentABSlim
	float CurrentABBreast
	float CurrentABBreastHuge
	float CurrentABThighSlim
	float CurrentABNarrowWaist
	float CurrentABButtHuge
	float CurrentABBackWide
	float CurrentABBellySize
	float CurrentABButtFlat
	float CurrentABButtStretch
	float CurrentABButtWide
	float CurrentABHipsWide
	float CurrentABTorsoLarge
	float CurrentABWaistHeight
	float CurrentABWaistSmooth
	float CurrentABWaistWide
	
	float CurrentCBBE7BUpper
	float CurrentCBBE7BLower
	float CurrentCBBEBreastsSmall
	float CurrentCBBEHips
	float CurrentCBBECalf
	float CurrentCBBEChubbyLegs
	float CurrentCBBEButtSmall
	float CurrentCBBESlimThighs
	float CurrentCBBEAppleCheeks
	float CurrentCBBEBigButt
	float CurrentCBBEBreastWidth
	float CurrentCBBEChestDepth
	float CurrentCBBEChubbyArms
	float CurrentCBBEForearmSize
	float CurrentCBBEPushUp
	float CurrentCBBEBreastPerkiness
	float CurrentCBBEWaist
	float CurrentCBBESSBBW2
	float CurrentCBBEGiantBelly
	float CurrentCBBEBreasts
	float CurrentCBBEBreastFantasy
	float CurrentCBBEUltKirBody
	
	;modular values
	float Excess
	int Index
	int FullnessMeter
	int MeterDownCounter
	float ThiccnessMeter

	;timer values
	int BodyUpdateCounter
	int MeterModCounter
	int FullnessMeterCounter
	int BodyDownCounter
	
	Bool AtomicBEnabled
	bool AtomicBStored
	Bool CBBEEnabled
	bool CBBEStored
	bool isDigesting
	bool HasPlayedHungerMessage1
	bool HasPlayedHungerMessage2
	bool HasPlayedHungerMessage3
	bool HasPlayedHungerMessage4
	bool HasPlayedThiccMessage1
	bool HasPlayedThiccMessage2
	bool HasPlayedThiccMessage3
	bool HasPlayedThiccMessage4
	bool HasPlayedThinMessage1
	bool HasPlayedThinMessage2
	bool HasPlayedThinMessage3
	bool HasPlayedThinMessage4
	;bool HungerSpeed
	bool CompanionLastPred
	
	;stored settings for resets
	float StoredThin
	float StoredMuscular
	float StoredLarge
	float StoredABSlim
	float StoredABBreast
	float StoredABBreastHuge
	float StoredABThighSlim
	float StoredABNarrowWaist
	float StoredABButtHuge	
	float StoredABBackWide
	float StoredABBellySize
	float StoredABButtFlat
	float StoredABButtStretch
	float StoredABButtWide
	float StoredABHipsWide
	float StoredABTorsoLarge
	float StoredABWaistHeight
	float StoredABWaistSmooth
	float StoredABWaistWide
	
	float StoredCBBE7BUpper
	float StoredCBBE7BLower
	float StoredCBBEBreastsSmall
	float StoredCBBEHips
	float StoredCBBECalf
	float StoredCBBEChubbyLegs
	float StoredCBBEButtSmall
	float StoredCBBESlimThighs
	float StoredCBBEAppleCheeks
	float StoredCBBEBigButt
	float StoredCBBEBreastWidth
	float StoredCBBEChestDepth
	float StoredCBBEChubbyArms
	float StoredCBBEForearmSize
	float StoredCBBEPushUp
	float StoredCBBEBreastPerkiness
	float StoredCBBEWaist
	float StoredCBBESSBBW2
	float StoredCBBEGiantBelly
	float StoredCBBEBreasts
	float StoredCBBEBreastFantasy
	float StoredCBBEUltKirBody
EndStruct

Struct MessageStruct
	Message PlayerMessage
	Message CompanionMessage
	Int MessageType
EndStruct

WeightData[] PredWeight

bool bUpdate303Finished = false	

Event OnInit()
	;EventRegistration()
	RegisterForRemoteEvent(Game.GetPlayer(), "OnPlayerLoadGame")
	SetInitialRates()
	SetInitialEnable()
	EventRegistration()
	ModStateChange(WeightModEnabled)
	bUpdate303Finished = true
EndEvent

Event Actor.OnPlayerLoadGame(Actor akSender)
	EventRegistration()
	SetMeterIncRates()
EndEvent

Function EventRegistration()
	RegisterForCustomEvent(FV_ConsumptionRegistry, "OnSwallow")
	RegisterForCustomEvent(FV_ConsumptionRegistry, "OnVomit")
	RegisterForCustomEvent(FV_ConsumptionRegistry, "OnDigest")
	RegisterForCustomEvent(Followers, "CompanionChange")
	RegisterForExternalEvent("OnMCMSettingChange|FalloutVore", "OnMCMSettingChange")
	RegisterForMenuOpenCloseEvent("LooksMenu")
	int i = 0
	Bool TeleportRegister = false
	While(i < PredWeight.Length)
		If(PredWeight[i].Pred.IsInFaction(CurrentCompanionFaction))
			TeleportRegister = true
		EndIf
		i += 1
	EndWhile
	If(TeleportRegister)
		RegisterForPlayerTeleport()
	Else
		UnregisterForPlayerTeleport()
	EndIf
EndFunction

Event OnMenuOpenCloseEvent(string asMenuName, bool abOpening)
	If(asMenuName == "LooksMenu" && !abOpening && PredWeight != NONE)
		int i = PredWeight.FindStruct("Pred", Game.GetPlayer())
		If i > -1
			If PredWeight[i].PredName != Game.GetPlayer().GetLeveledActorBase().GetName()
				PredWeight[i].PredName = Game.GetPlayer().GetLeveledActorBase().GetName()
				FV_VoreHud.UpdateName(PredWeight[i].PredName, PredWeight[i].index)
			EndIf
		EndIf
	EndIf
EndEvent

Function SetInitialRates()
	MeterModRate = MCM.GetModSettingFloat(sModNameMCM, "fMeterModRate:ThiccVoreMain")
	MinMeterDownCounter = MCM.GetModSettingInt(sModNameMCM, "iMeterMod:ThiccVoreMain")
	tempMinMeterDownCounter = MinMeterDownCounter+LowestMeterDownCounter	
	MeterRate = MCM.GetModSettingFloat(sModNameMCM, "fMeterRate:ThiccVoreMain")
	BodyUpdateRate = MCM.GetModSettingFloat(sModNameMCM, "fBodyRate:ThiccVoreMain")
	MFRatio = MCM.GetModSettingInt(sModNameMCM, "iMFRatio:ThiccVoreMain")
	;iHUDPosition = MCM.GetModSettingInt(sModNameMCM, "iHUDPosition:ThiccVoreMain")
	ShapeSettingReset()
	SetMeterIncRates()
	debug.trace("Fallout Vore - Thicc Vore initialization complete.")
	MCM.RefreshMenu()
EndFunction

Function UpdateScript()
	If(!bUpdate303Finished)
		ShapeSettingReset()
		bUpdate303Finished = true
	EndIf
EndFunction

Function SetInitialEnable()
	WeightModEnabled = MCM.GetModSettingBool(sModNameMCM, "bEnabledOnStart:ThiccVoreMain")
	bEnablePlayerWeightChange = MCM.GetModSettingBool(sModNameMCM, "bEnablePlayerWeightChangeOnStart:ThiccVoreMain")
	bEnableCompanionWeightChange = MCM.GetModSettingBool(sModNameMCM, "bEnableCompanionWeightChangeOnStart:ThiccVoreMain")
	iCompanionSliderType = MCM.GetModSettingInt(sModNameMCM, "iCompanionSliderTypeOnStart:ThiccVoreMain")
	iPlayerSliderType = MCM.GetModSettingInt(sModNameMCM, "iPlayerSliderTypeOnStart:ThiccVoreMain")
EndFunction

Function SetMeterIncRates()
	AnimalMeterInc = MCM.GetModSettingInt(sModNameMCM, "iAnimalMeterInc:ThiccVoreMain")
	DeathClawMeterInc = MCM.GetModSettingInt(sModNameMCM, "iDeathClawMeterInc:ThiccVoreMain")
	HumanMeterInc = MCM.GetModSettingInt(sModNameMCM, "iHumanMeterInc:ThiccVoreMain")
	MireLurkMeterInc = MCM.GetModSettingInt(sModNameMCM, "iMireLurkMeterInc:ThiccVoreMain")
	SuperMutantMeterInc = MCM.GetModSettingInt(sModNameMCM, "iSuperMutantMeterInc:ThiccVoreMain")
	iWeightLossChance = MCM.GetModSettingInt(sModNameMCM, "iWeightLossChance:ThiccVoreMain")
	iExcessLossAmount = MCM.GetModSettingInt(sModNameMCM, "iExcessLossAmount:ThiccVoreMain")
	trace(self, "  Fullness meter rates updated from INI file")
EndFunction

Function HUDLoaded()
	WeightData data
	int i = 0
	Utility.wait(2.0)
	While(i < PredWeight.Length)
		data = PredWeight[i]
		if(data.pred == Game.GetPlayer() && bEnablePlayerWeightChange)
			FV_VoreHud.UpdateThiccStats(data.index, data.ThiccnessMeter, (data.FullnessMeter as float)/100, data.MeterDownCounter, true)
			Utility.wait(0.1)
			FV_VoreHud.UpdateName(data.PredName, data.index)
		ElseIf(data.pred.IsInFaction(CurrentCompanionFaction) && bEnableCompanionWeightChange)
			FV_VoreHud.UpdateThiccStats(data.index, data.ThiccnessMeter, (data.FullnessMeter as float)/100, data.MeterDownCounter, false)
			Utility.wait(0.1)
			FV_VoreHud.UpdateName(data.PredName, data.index)
		EndIf
		i += 1
	EndWhile
EndFunction

WeightData Function AddPred(Actor CurrentPred)
	If(PredWeight==NONE)
		Predweight = new WeightData[0]
		PredWeight.clear()
	EndIf
	
	If(RetrieveFromWeightArray(0, CurrentPred)==NONE)
		trace(self, "Adding actor to pred weight array")
		ActorBase:BodyWeight CurrentWeight = GetCurrentWeight(Game.GetPlayer())
	
		WeightData data = new WeightData
	
		data.Pred = CurrentPred
		data.PredName = CurrentPred.GetLeveledActorBase().GetName()
		data.CurrentThin = CurrentWeight.Thin
		data.CurrentMuscular = CurrentWeight.Muscular
		data.CurrentLarge = CurrentWeight.Large
		
		data.isDigesting = 0
		data.FullnessMeter = FullnessMeterDefault											;default to 70 to give player a chance to eat before hunger sets in at 60
		data.Pred.SetValue(FV_FullnessMeter, data.FullnessMeter)
		data.MeterDownCounter = 0
		data.HasPlayedHungerMessage1 = False
		data.HasPlayedHungerMessage2 = False
		data.HasPlayedHungerMessage3 = False
		data.HasPlayedHungerMessage4 = False
		data.AtomicBStored = False
		data.CBBEStored = False
		;data.HungerSpeed = False
		data.BodyDownCounter=1

		;set initial counters
		data.MeterModCounter = ((MeterModRate*60)/UpdateRate) as int
		data.FullnessMeterCounter = ((MeterRate*60)/UpdateRate) as int
		data.BodyUpdateCounter = ((BodyUpdateRate*60)/UpdateRate) as int
	
		If(data.Pred == Game.GetPlayer())
			; If(EnablePlayerCBBE)
				; data.CBBEEnabled = true
				; data.AtomicBEnabled = false
			; ElseIf(EnablePlayerAtomicBeauty)
				; data.CBBEEnabled = false
				; data.AtomicBEnabled = true
			; Else
				; data.AtomicBEnabled = MCM.GetModSettingBool(sModNameMCM, "bPlayerAtomicBeautyEnabled:AtomicBeauty")
				; data.CBBEEnabled = MCM.GetModSettingBool(sModNameMCM, "bPlayerCBBEEnabled:CBBE")
			; EndIf
			bEnablePlayerWeightChange = true
			If(bEnablePlayerWeightChange)
				data.Pred.SetValue(FV_IsActivePred, 1)	
			EndIf
		ElseIf(data.Pred.IsInFaction(CurrentCompanionFaction))
			; If(EnableCompanionCBBE)
				; data.CBBEEnabled = true
				; data.AtomicBEnabled = false
			; ElseIf(EnableCompanionAtomicBeauty)
				; data.CBBEEnabled = false
				; data.AtomicBEnabled = true
			; Else
				; data.AtomicBEnabled = MCM.GetModSettingBool(sModNameMCM, "bCompanionAtomicBeautyEnabled:AtomicBeauty")
				; data.CBBEEnabled = MCM.GetModSettingBool(sModNameMCM, "bCompanionCBBEEnabled:CBBE")
			; EndIf
			bEnableCompanionWeightChange = true
			If(bEnableCompanionWeightChange)
				data.Pred.SetValue(FV_IsActivePred, 1)	
			EndIf
		EndIf
		
		int tempIndex = 0
		While(tempIndex < PredWeight.Length)
			tempIndex += 1
		EndWhile
		data.Index = tempIndex + 1															;Indexing is always non-zero.  First pred has PredWeight[] of position 0.  First index is 1, second pred will be 2, etc
	
		PredWeight.add(data)
		
		;Set body type bools.  Must wait until after data is added to predweight array
		Int SliderType = GetSliderType(data.Pred)
		If(SliderType == 0)
			StartTimer(10, ResetHelpMessageTimerID)
		EndIf
		;If(data.Pred == Game.GetPlayer())
		;	
		;	If(iPlayerSliderType == 0)
		;		AtomicBeautyEnable(sPlayer, false, true)
		;		CBBEEnable(sPlayer, false, true)
		;		FV_HelpThiccVoreSliders.ShowAsHelpMessage("Sliders", 6, 0, 0)
		;		StartTimer(10, ResetHelpMessageTimerID)
		;	EndIf
		;	SliderType = iPlayerSliderType
		;ElseIf(data.Pred.IsInFaction(CurrentCompanionFaction))
		;	If(iCompanionSliderType == 0)
		;		AtomicBeautyEnable(sCompanion, false, true)
		;		CBBEEnable(sCompanion, false, true)
		;		FV_HelpThiccVoreSliders.ShowAsHelpMessage("Sliders", 6, 0, 0)
		;		StartTimer(10, ResetHelpMessageTimerID)
		;	EndIf
		;	SliderType = iCompanionSliderType
		;EndIf
		StoreCurrentWeight(CurrentPred, false, false)											;Needs to run twice to store vanilla settings.  Second run will catch AtomicB and CBBE
		Utility.wait(0.5)
		
		StoreCurrentWeight(CurrentPred, SliderType == 1, SliderType == 2)
		SyncMessages(data)
		;SyncBodies(data)																	;Always run sync after store.  Otherwise, store will catch modified current values.
		If(WeightModEnabled==True && data.Pred.GetValue(FV_IsActivePred)==1)
			BeginTimers(data)
			FV_VoreHud.UpdateThiccStats(data.index, data.ThiccnessMeter, (data.FullnessMeter as float)/100, data.MeterDownCounter, GetIsPlayer(data.Pred))
			FV_VoreHud.UpdateName(data.PredName, data.index)
		EndIF		
		trace(self, " ", data = data)
		return data
	Else
		trace(self, "  actor already exists in PredWeight array.  Nothing has been added.")
	EndIf
EndFunction

Event OnPlayerTeleport()
	Utility.wait(1.0)				;Wait a minute to make sure companion is loaded before checking locations
	Int i = 0
	While(i < PredWeight.Length)
		If(PredWeight[i].Pred.GetCurrentLocation() != Game.GetPlayer().GetCurrentLocation() && PredWeight[i].Pred.IsInFaction(CurrentCompanionFaction) && PredWeight[i].Pred.GetValue(FV_IsActivePred) == 1)
			trace(self, " OnPlayerTeleport(): Companion " + Predweight[i].Pred + " is not in currently loaded cell.  Temporarily disabling")
			PredWeight[i].CompanionLastPred = true
			CancelTimer(PredWeight[i].Index)
			FV_VoreHud.UpdateThiccStats(PredWeight[i].index, PredWeight[i].ThiccnessMeter, (PredWeight[i].FullnessMeter as float)/100, PredWeight[i].MeterDownCounter, GetIsPlayer(PredWeight[i].Pred))
		ElseIf(PredWeight[i].Pred.GetCurrentLocation() == Game.GetPlayer().GetCurrentLocation() && PredWeight[i].Pred.IsInFaction(CurrentCompanionFaction) && PredWeight[i].Pred.GetValue(FV_IsActivePred) == 1 && PredWeight[i].CompanionLastPred)
			trace(self, " OnPlayerTeleport(): Companion " + Predweight[i].Pred + " is in currently loaded cell and was disabled.  Re-enabling.")
			PredWeight[i].CompanionLastPred = false
			BeginTimers(PredWeight[i])
			FV_VoreHud.UpdateThiccStats(PredWeight[i].index, PredWeight[i].ThiccnessMeter, (PredWeight[i].FullnessMeter as float)/100, PredWeight[i].MeterDownCounter, GetIsPlayer(PredWeight[i].Pred))
		EndIf
		i += 1
	EndWhile
EndEvent

;BEGIN MCM FUNCTIONS

Function MCMStoreWeight(string storeParam)
	If(storeParam == sPlayer)
		StoreCurrentWeight(Game.GetPlayer(), iPlayerSliderType == 1, iPlayerSliderType == 2)
	ElseIf(storeParam == sCompanion)
		WeightData data = new WeightData
		data = NONE
		int i = 0
		While(i<PredWeight.Length)
			If(PredWeight[i].Pred.IsInFaction(CurrentCompanionFaction))
				data = PredWeight[i]
			EndIf
			i += 1
		EndWhile
		If(data != NONE)
			StoreCurrentWeight(data.Pred, iCompanionSliderType == 1, iCompanionSliderType == 2)
		Else
			debug.messagebox("You do not have an active companion that is a pred.")
		EndIf		
	Else
		trace(self, "  MCM: storeParam not understood.  No values stored.")
	EndIf
EndFunction

Function MCMActorToggle(string actorParam, bool EnablePred)
	WeightData data = new WeightData
	
	If(actorParam == sPlayer)
		data = RetrieveFromWeightArray(0, Game.GetPlayer())
	ElseIf(actorParam == sCompanion)
		data = NONE
		int i = 0
		While(i<PredWeight.Length)
			If(PredWeight[i].Pred.IsInFaction(CurrentCompanionFaction))
				data = PredWeight[i]
			EndIf
			i += 1
		EndWhile
	Else
		data = NONE
	EndIf
	If(WeightModEnabled)
		If (data!= NONE)
			If(EnablePred)
				CancelTimer(data.Index)
				data.Pred.SetValue(FV_IsActivePred, 1)
				BeginTimers(data)
				If(data.FullnessMeter <= 40 && !data.Pred.HasPerk(FV_HungerSpeed))
					data.Pred.Addperk(FV_HungerSpeed)
				EndIf
				FV_VoreHud.UpdateThiccStats(data.index, data.ThiccnessMeter, (data.FullnessMeter as float)/100, data.MeterDownCounter, GetIsPlayer(data.Pred))
				;FV_VoreHud.ShowActor(data.index, GetIsPlayer(data.Pred))
			Else
				CancelTimer(data.Index)
				data.Pred.SetValue(FV_IsActivePred, 0)
				If(data.Pred.HasPerk(FV_HungerSpeed))
					data.Pred.RemovePerk(FV_HungerSpeed)
				EndIf
				FV_VoreHud.UpdateThiccStats(data.index, data.ThiccnessMeter, (data.FullnessMeter as float)/100, data.MeterDownCounter, GetIsPlayer(data.Pred))
				;FV_VoreHud.ShowActor(data.index, GetIsPlayer(data.Pred))
			EndIf
		Else
			trace(self, "  MCM: Actor not in weight array.  No actions taken.")
			;If(actorParam == sPlayer)
			;	bEnablePlayerWeightChange = false
			;	debug.messagebox("You are not a pred.")
			;	FV_VoreHud.HideThiccActor(data.index)
			;	int i = 0
			;	While(i<PredWeight.Length)
			;		If(PredWeight[i].Pred.IsInFaction(CurrentCompanionFaction))
			;			FV_VoreHud.UpdateThiccStats(data.index, data.ThiccnessMeter, (data.FullnessMeter as float)/100, data.MeterDownCounter, GetIsPlayer(data.Pred))
			;			;FV_VoreHud.ShowActor(PredWeight[i].index, GetIsPlayer(PredWeight[i].Pred))
			;		EndIf
			;		i += 1
			;	EndWhile
			;Else
			;	bEnableCompanionWeightChange = false
			;	debug.messagebox("You do not have an active companion that is a pred.")
			;	int i = 0
			;	While(i<PredWeight.Length)
			;		If(PredWeight[i].Pred == Game.GetPlayer())
			;			FV_VoreHud.UpdateThiccStats(data.index, data.ThiccnessMeter, (data.FullnessMeter as float)/100, data.MeterDownCounter, GetIsPlayer(data.Pred))
						;FV_VoreHud.ShowActor(PredWeight[i].index, GetIsPlayer(PredWeight[i].Pred))
			;		EndIf
			;		i += 1
			;	EndWhile
			;EndIf
		EndIf
	Else
		debug.messagebox("Thicc Vore is not enabled.")
	EndIf
	MCM.RefreshMenu()
EndFunction

Function MCMReset(string resetParam)
	WeightData data = new WeightData
	If(resetParam == sPlayer)
		data = RetrieveFromWeightArray(0, Game.GetPlayer())
		;If(data==None)
		;	debug.messagebox("You are not a pred.")
		;EndIf
	ElseIf(resetParam == sCompanion)
		data = NONE
		int i = 0
		While(i<PredWeight.Length)
			If(PredWeight[i].Pred.IsInFaction(CurrentCompanionFaction))
				data = PredWeight[i]
			EndIf
			i += 1
		EndWhile
		If(data == NONE)
			debug.messagebox("You do not have an active companion that is a pred.")
		EndIf
	Else
		data = NONE		
	EndIf
	
	If(data != NONE)
		data.FullnessMeter=FullnessMeterDefault
		data.Pred.SetValue(FV_FullnessMeter, data.FullnessMeter)
		data.MeterDownCounter=0
		If(data.FullnessMeter > 40 && data.Pred.HasPerk(FV_HungerSpeed))
			data.Pred.RemovePerk(FV_HungerSpeed)
		EndIf
		RestoreWeight(data)
		FV_VoreHud.UpdateThiccStats(data.index, data.ThiccnessMeter, (data.FullnessMeter as float)/100, data.MeterDownCounter)
	EndIf
EndFunction

Function ModStateChange(Bool IsEnabled)
	If(IsEnabled)
		debug.trace("Thicc Vore is enabled.")
		debug.notification("Thicc Vore is enabled.")
		;WeightModEnabled = True
		
		If(Game.GetPlayer().GetValue(FV_HasHadNukaAcid) == 1 && RetrieveFromWeightArray(0, Game.GetPlayer()) == NONE)
			AddPred(Game.GetPlayer())
		EndIf
		If(CurrentCompanion.GetActorReference() != NONE)
			If(CurrentCompanion.GetActorReference().GetValue(FV_HasHadNukaAcid) == 1 && RetrieveFromWeightArray(0, CurrentCompanion.GetActorReference()) == NONE)
				AddPred(CurrentCompanion.GetActorReference())
			EndIf
		EndIf
		Int i = 0
		While(i<PredWeight.Length)
			SetNewWeight(PredWeight[i])
			If(PredWeight[i].Pred.GetValue(FV_IsActivePred)==1)
				BeginTimers(PredWeight[i])
				FV_VoreHud.UpdateThiccStats(PredWeight[i].index, PredWeight[i].ThiccnessMeter, (PredWeight[i].FullnessMeter as float)/100, PredWeight[i].MeterDownCounter, GetIsPlayer(PredWeight[i].Pred))
				;FV_VoreHud.ShowActor(PredWeight[i].index, GetIsPlayer(PredWeight[i].Pred))
				trace(self, "Beginning timers for " + PredWeight[i].PredName)
			EndIf
			If(PredWeight[i].FullnessMeter <= 40 && !PredWeight[i].Pred.HasPerk(FV_HungerSpeed))
				PredWeight[i].Pred.AddPerk(FV_HungerSpeed)
			EndIf
			i += 1
		EndWhile
	Else
		debug.notification("Thicc Vore is disabled.  Stopping timers")
		Int i = 0
		While(i<PredWeight.Length)
			CancelTimer(PredWeight[i].Index)
			RestoreWeight(PredWeight[i])
			FV_VoreHud.HideThiccActor(PredWeight[i].index)
			If(PredWeight[i].Pred.HasPerk(FV_HungerSpeed))
				PredWeight[i].Pred.RemovePerk(FV_HungerSpeed)
			EndIf
			i += 1
		EndWhile
	EndIf
EndFunction

Function OnMCMSettingChange(string modName, string id)
	If(modName == sModNameMCM)
		trace(self, " MCM: change for Thicc Vore " + id)
		If(id == "iMFRatio:ThiccVoreMain")
			;MFRatio = MCM.GetModSettingInt(sModNameMCM, "iMFRatio:ThiccVoreMain")
		ElseIf(id == sMeterRate)
			;MeterRate = MCM.GetModSettingFloat(sModNameMCM, "fMeterRate:ThiccVoreMain")
			ResetTimers(sMeterRate)
			If(MeterRate > MeterModRate)
				MeterModRate = MeterRate
				ResetTimers(sMeterMod)
				;MCM.SetModSettingFloat(sModNameMCM, "fMeterModRate:ThiccVoreMain", MeterModRate)
			EndIf
			
			If(MeterRate > BodyUpdateRate)
				BodyUpdateRate = MeterRate
				ResetTimers(sBodyRate)
				;MCM.SetModSettingFloat(sModNameMCM, "fBodyRate:ThiccVoreMain", BodyUpdateRate)
			EndIf
			MCM.RefreshMenu()
			trace(self, " MCM: Meter Rate updated: " + MeterRate)
		ElseIf(id == sMeterMod)
			;MeterModRate = MCM.GetModSettingFloat(sModNameMCM, "fMeterModRate:ThiccVoreMain")
			ResetTimers(sMeterMod)
			If(MeterModRate > BodyUpdateRate)
				BodyUpdateRate = MeterModRate
				ResetTimers(sBodyRate)
				;MCM.SetModSettingFloat(sModNameMCM, "fBodyRate:ThiccVoreMain", BodyUpdateRate)
			EndIf
			
			If(MeterRate > MeterModRate)
				MeterRate = MeterModRate
				ResetTimers(sMeterRate)
				;MCM.SetModSettingFloat(sModNameMCM, "fMeterRate:ThiccVoreMain", MeterRate)
			EndIf
			MCM.RefreshMenu()
			trace(self, " MCM: Meter Mod Rate updated: " + MeterModRate)
		ElseIf(id == sBodyRate)
			;BodyUpdateRate = MCM.GetModSettingFloat(sModNameMCM, "fBodyRate:ThiccVoreMain")
			ResetTimers(sBodyRate)
			If(BodyUpdateRate < MeterRate)
				MeterRate = BodyUpdateRate
				ResetTimers(sMeterRate)
				;MCM.SetModSettingFloat(sModNameMCM, "fMeterRate:ThiccVoreMain", MeterRate)
			EndIf
			
			If(BodyUpdateRate < MeterModRate)
				MeterModRate = BodyUpdateRate
				ResetTimers(sMeterMod)
				;MCM.SetModSettingFloat(sModNameMCM, "fMeterModRate:ThiccVoreMain", MeterModRate)
			EndIf
			MCM.RefreshMenu()
			trace(self, " MCM: Body Rate updated: " + BodyUpdateRate)
		ElseIf(id == sMaxHungerLoss)
			trace(self, " MCM: Minimum hunger modifier updated: " + tempMinMeterDownCounter)
			MinMeterDownCounter = tempMinMeterDownCounter - LowestMeterDownCounter
			Int i = 0
			While(i < PredWeight.Length)
				If(MinMeterDownCounter > PredWeight[i].MeterDownCounter)
					PredWeight[i].MeterDownCounter = MinMeterDownCounter
				EndIf
				i += 1
			EndWhile
		ElseIf(id == "SwitchPlayerWeightChange")
			MCMActorToggle(sPlayer, bEnablePlayerWeightChange)
		ElseIf(id == "SwitchCompanionWeightChange")
			MCMActorToggle(sCompanion, bEnableCompanionWeightChange)
		ElseIf(id == sEnableMod)
			ModStateChange(WeightModEnabled)
		 ; ElseIf(id == "SetPlayerSliderType")
			; If(iPlayerSliderType == 0)
				; AtomicBeautyEnable(sPlayer, false)
				; CBBEEnable(sPlayer, true)
			; ElseIf(iPlayerSliderType == 1)
				; AtomicBeautyEnable(sPlayer, true)
			; ElseIf(iPlayerSliderType == 2)
				; CBBEEnable(sPlayer, true)
			; EndIf
		; ElseIf(id == "SetCompanionSliderType")
			; If(iCompanionSliderType == 0)
				; AtomicBeautyEnable(sCompanion, false)
				; CBBEEnable(sCompanion, false)
			; ElseIf(iCompanionSliderType == 1)
				; AtomicBeautyEnable(sCompanion, true)
			; ElseIf(iCompanionSliderType == 2)
				; CBBEEnable(sCompanion, true)
			; EndIf
		EndIf
	EndIf
EndFunction

; Function AtomicBeautyEnable(string sActor, bool isEnabled, bool suppressMessage = false)
	; WeightData data = new WeightData
	; trace(self, "received Atomic Beauty toggle request for " + sActor + " of " + isEnabled)
	; If(sActor == sPlayer)
		; data = RetrieveFromWeightArray(0, Game.GetPlayer())
		; ToggleAB(isEnabled, sActor, data, suppressMessage)
		; If(data == NONE && suppressMessage == false)
			; debug.messagebox("You are not a pred")
		; EndIf
	; ElseIf(sActor == sCompanion)
		; data = NONE
		; int i = 0
		; While(i<PredWeight.Length)
			; If(PredWeight[i].Pred.IsInFaction(CurrentCompanionFaction))
				; data = ToggleAB(isEnabled, sActor, PredWeight[i], suppressMessage)
			; EndIf
			; i += 1
		; EndWhile
		
		; If(data == NONE && suppressMessage == false)
			; debug.messagebox("You do not have an active companion that is a pred.")
		; EndIf
	; EndIf
; EndFunction
	
; WeightData Function ToggleAB(bool isEnabled, string sActor, WeightData data = NONE, bool suppressMessage = false)
	; If(isEnabled && data != NONE)
		; data.AtomicBEnabled = True
		; If(data.CBBEEnabled)
			; data.CBBEEnabled = False
			; If(sActor == sPlayer)
				; EnablePlayerCBBE = false
			; ElseIf(sActor == sCompanion)
				; EnableCompanionCBBE = false
			; EndIf
		; EndIf
		; If(!data.AtomicBStored)																	;store atomic beauty sliders if this is the first time it's been activated on this character
			; StoreCurrentWeight(data.Pred, data.AtomicBEnabled, data.CBBEEnabled)
		; EndIf
		; SyncBodies(data, isEnabled)
		; If(suppressMessage == false)
			; debug.messagebox("Atomic Beauty slider change turned on.")
		; EndIf
		; trace(self, "  AB Slider active: " + data.PredName)
		;make sure the enable bools are correctly set
		; If(!EnablePlayerAtomicBeauty && data.pred == Game.GetPlayer())
			; EnablePlayerAtomicBeauty = true
		; EndIf
		; If(!EnableCompanionAtomicBeauty && data.pred.IsInFaction(CurrentCompanionFaction))
			; EnableCompanionAtomicBeauty = true
		; EndIf
		; MCM.RefreshMenu()
	; ElseIf(!isEnabled && data != NONE)
		; SyncBodies(data, isEnabled)
		; data.AtomicBEnabled = False
		; If(sActor==sCompanion && EnableCompanionAtomicBeauty)
			; EnableCompanionAtomicBeauty = false
		; ElseIf(sActor == sPlayer && EnablePlayerAtomicBeauty)
			; EnablePlayerAtomicBeauty = false
		; EndIf
		; If(suppressMessage == false)
			; debug.notification("Atomic Beauty slider change turned off.")
		; EndIf
		; trace(self, "  AB Slider deactive: " + data.PredName)
	; Else
		; trace(self, " AB slider change did not receive a known actor.  Aborting change and setting MCM switcher to false")
		; If(sActor==sCompanion)
			; EnableCompanionAtomicBeauty = false
		; Else
			; EnablePlayerAtomicBeauty = false
		; EndIf
		; MCM.RefreshMenu()
	; EndIf
; EndFunction

; Function CBBEEnable(string sActor, bool isEnabled, bool suppressMessage = false)
	; WeightData data = new WeightData
	; trace(self, "received CBBE toggle request for " + sActor + " of " + isEnabled)
	; If(sActor == sPlayer)
		; data = RetrieveFromWeightArray(0, Game.GetPlayer())
		; ToggleCBBE(isEnabled, sActor, data, suppressMessage)
		; If(data == NONE && suppressMessage == false)
			; debug.messagebox("You are not a pred")
		; EndIf
	; ElseIf(sActor == sCompanion)
		; data = NONE
		; int i = 0
		; While(i<PredWeight.Length)
			; If(PredWeight[i].Pred.IsInFaction(CurrentCompanionFaction))
				; data = ToggleCBBE(isEnabled, sActor, PredWeight[i], suppressMessage)
			; EndIf
			; i += 1
		; EndWhile
		; If(data == NONE && suppressMessage == false)
			; debug.messagebox("You do not have an active companion that is a pred.")
		; EndIf
	; EndIf
; EndFunction

; WeightData Function ToggleCBBE(bool isEnabled, string sActor, WeightData data = NONE, bool suppressMessage = false)
	; If(isEnabled && data != NONE)
		; data.CBBEEnabled = True	
		; If(data.AtomicBEnabled)
			; data.AtomicBEnabled = False
			; If(sActor == sPlayer)
				; EnablePlayerAtomicBeauty = false
			; ElseIf(sActor == sCompanion)
				; EnableCompanionAtomicBeauty = false
			; EndIf
		; EndIf
		; If(!data.CBBEStored)
			; StoreCurrentWeight(data.Pred, data.AtomicBEnabled, data.CBBEEnabled)
		; EndIf
		; SyncBodies(data, isEnabled)
		; If(suppressMessage == false)
			; debug.messagebox("CBBE slider change turned on.")
		; EndIf
		; trace(self, "  CBBE Slider active: " + data.PredName)
		; If(!EnablePlayerCBBE && data.pred == Game.GetPlayer())
			; EnablePlayerCBBE = true
		; EndIf
		; If(!EnableCompanionCBBE && data.pred.IsInFaction(CurrentCompanionFaction))
			; EnableCompanionCBBE = true
		; EndIf
		; MCM.RefreshMenu()
	; ElseIf(!isEnabled && data != NONE)
		; SyncBodies(data, isEnabled)
		; data.CBBEEnabled = False
		; If(sActor==sCompanion && EnableCompanionCBBE)
			; EnableCompanionCBBE = false
		; ElseIf(sActor == sPlayer && EnablePlayerCBBE)
			; EnablePlayerCBBE = false
		; EndIf
		; If(suppressMessage == false)
			; debug.notification("CBBE slider change turned off.")
		; EndIf
		; trace(self, "  CBBE Slider deactive: " + data.PredName)
	; Else
		; trace(self, " CBBE slider change did not receive a known actor.  Aborting change and setting MCM switcher to false")
		; If(sActor==sCompanion)
			; EnableCompanionCBBE = false
		; Else
			; EnablePlayerCBBE = false
		; EndIf
		; MCM.RefreshMenu() 
	; EndIf
	; return data
; EndFunction

Function MCMWeightSet(String actorParam, String Extreme)
	WeightData data
	If(actorParam == sPlayer)
		data = RetrieveFromWeightArray(0, Game.GetPlayer())
	ElseIf(actorParam == sCompanion)
		data = NONE
		int i = 0
		While(i<PredWeight.Length)
			If(PredWeight[i].Pred.IsInFaction(CurrentCompanionFaction))
				data = PredWeight[i]
			EndIf
			i += 1
		EndWhile
	EndIf
	If(data != NONE)
		Int SliderType = GetSliderType(data.Pred)
		If(SliderType == 1)
			If(Extreme == "thicc")
				data.CurrentABSlim = fABSlimMax/100
				data.CurrentABBreast = fABBreastMax/100
				data.CurrentABBreastHuge = fABBreastHugeMax/100
				data.CurrentABThighSlim = fABThighSlimMax/100
				data.CurrentABNarrowWaist = fABNarrowWaistMax/100
				data.CurrentABButtHuge = fABButtHugeMax/100
				data.CurrentABBackWide = fABBackWideMax/100
				data.CurrentABBellySize = fABBellySizeMax/100
				data.CurrentABButtFlat = fABButtFlatMax/100
				data.CurrentABButtStretch = fABButtStretchMax/100
				data.CurrentABButtWide = fABButtWideMax/100
				data.CurrentABHipsWide = fABHipsWideMax/100
				data.CurrentABTorsoLarge = fABTorsoLargeMax/100
				data.CurrentABWaistHeight = fABWaistHeightMax/100
				data.CurrentABWaistSmooth = fABWaistSmoothMax/100
				data.CurrentABWaistWide = fABWaistWideMax/100
			ElseIf(Extreme == "thin")
				data.CurrentABSlim = fABSlimMin/100
				data.CurrentABBreast = fABBreastMin/100
				data.CurrentABBreastHuge = fABBreastHugeMin/100
				data.CurrentABThighSlim = fABThighSlimMax/100
				data.CurrentABNarrowWaist = fABNarrowWaistMin/100
				data.CurrentABButtHuge = fABButtHugeMin/100
				data.CurrentABBackWide = fABBackWideMin/100
				data.CurrentABBellySize = fABBellySizeMin/100
				data.CurrentABButtFlat = fABButtFlatMin/100
				data.CurrentABButtStretch = fABButtStretchMin/100
				data.CurrentABButtWide = fABButtWideMin/100
				data.CurrentABHipsWide = fABHipsWideMin/100
				data.CurrentABTorsoLarge = fABTorsoLargeMin/100
				data.CurrentABWaistHeight = fABWaistHeightMin/100
				data.CurrentABWaistSmooth = fABWaistSmoothMin/100
				data.CurrentABWaistWide = fABWaistWideMin/100
			EndIf
		ElseIf(SliderType == 2)
			If(Extreme == "thicc")
				data.CurrentCBBE7BUpper = fCBBE7BUpperMax/100
				data.CurrentCBBE7BLower = fCBBE7BLowerMax/100
				data.CurrentCBBEBreastsSmall = fCBBEBreastsSmallMax/100
				data.CurrentCBBEHips = fCBBEHipsMax/100
				data.CurrentCBBECalf = fCBBECalfMax/100
				data.CurrentCBBEChubbyLegs = fCBBEChubbyLegsMax/100
				data.CurrentCBBEButtSmall = fCBBEButtSmallMax/100
				data.CurrentCBBESlimThighs = fCBBESlimThighsMax/100
				data.CurrentCBBEAppleCheeks = fCBBEAppleCheeksMax/100
				data.CurrentCBBEBigButt = fCBBEBigButtMax/100
				data.CurrentCBBEBreastWidth = fCBBEBreastWidthMax/100
				data.CurrentCBBEChestDepth = fCBBEChestDepthMax/100
				data.CurrentCBBEChubbyArms = fCBBEChubbyArmsMax/100
				data.CurrentCBBEForearmSize = fCBBEForearmSizeMax/100
				data.CurrentCBBEPushUp = fCBBEPushUpMax/100
				data.CurrentCBBEBreastPerkiness = fCBBEBreastPerkinessMax/100
				data.CurrentCBBEWaist = fCBBEWaistMax/100
				data.CurrentCBBESSBBW2 = fCBBESSBBW2Max/100
				data.CurrentCBBEGiantBelly = fCBBEGiantBellyMax/100
				data.Pred.SetValue(FV_GiantBelly, data.CurrentCBBEGiantBelly)
				trace(self, "setting giant belly to " + data.Pred.GetValue(FV_GiantBelly))
				data.CurrentCBBEBreasts = fCBBEBreastsMax/100
				data.CurrentCBBEBreastFantasy = fCBBEBreastFantasyMax/100
				data.CurrentCBBEUltKirBody = fCBBEUltKirBodyMax/100
			ElseIf(Extreme == "thin")
				data.CurrentCBBE7BUpper = fCBBE7BUpperMin/100
				data.CurrentCBBE7BLower = fCBBE7BLowerMin/100
				data.CurrentCBBEBreastsSmall = fCBBEBreastsSmallMin/100
				data.CurrentCBBEHips = fCBBEHipsMin/100
				data.CurrentCBBECalf = fCBBECalfMin/100
				data.CurrentCBBEChubbyLegs = fCBBEChubbyLegsMin/100
				data.CurrentCBBEButtSmall = fCBBEButtSmallMin/100
				data.CurrentCBBESlimThighs = fCBBESlimThighsMin/100
				data.CurrentCBBEAppleCheeks = fCBBEAppleCheeksMin/100
				data.CurrentCBBEBigButt = fCBBEBigButtMin/100
				data.CurrentCBBEBreastWidth = fCBBEBreastWidthMin/100
				data.CurrentCBBEChestDepth = fCBBEChestDepthMin/100
				data.CurrentCBBEChubbyArms = fCBBEChubbyArmsMin/100
				data.CurrentCBBEForearmSize = fCBBEForearmSizeMin/100
				data.CurrentCBBEPushUp = fCBBEPushUpMin/100
				data.CurrentCBBEBreastPerkiness = fCBBEBreastPerkinessMin/100
				data.CurrentCBBEWaist = fCBBEWaistMin/100
				data.CurrentCBBESSBBW2 = fCBBESSBBW2Min/100
				data.CurrentCBBEGiantBelly = fCBBEGiantBellyMin/100
				data.Pred.SetValue(FV_GiantBelly, data.CurrentCBBEGiantBelly)
				trace(self, "setting giant belly to " + data.Pred.GetValue(FV_GiantBelly))
				data.CurrentCBBEBreasts = fCBBEBreastsMin/100
				data.CurrentCBBEBreastFantasy = fCBBEBreastFantasyMin/100
				data.CurrentCBBEUltKirBody = fCBBEUltKirBodyMin/100
			EndIf
		EndIf
		If(Extreme == "thicc")
			data.CurrentThin = 0
			data.CurrentMuscular = MFRatio/100
			data.CurrentLarge = 1-data.CurrentMuscular
			data.HasPlayedThinMessage1 = false
			data.HasPlayedThinMessage2 = false
			data.HasPlayedThinMessage3 = false
			data.HasPlayedThinMessage4 = false
			data.HasPlayedThiccMessage1 = true
			data.HasPlayedThiccMessage2 = true
			data.HasPlayedThiccMessage3 = true
			data.HasPlayedThiccMessage4 = true
		ElseIf(Extreme == "thin")
			data.CurrentThin = 1
			data.CurrentMuscular = 0
			data.CurrentLarge = 0
			data.HasPlayedThinMessage1 = true
			data.HasPlayedThinMessage2 = true
			data.HasPlayedThinMessage3 = true
			data.HasPlayedThinMessage4 = true
			data.HasPlayedThiccMessage1 = false
			data.HasPlayedThiccMessage2 = false
			data.HasPlayedThiccMessage3 = false
			data.HasPlayedThiccMessage4 = false
		EndIf
		SetNewWeight(data)
	EndIf
EndFunction

;End MCM functions
bool function GetIsPlayer(Actor akActor)
	if akActor == Game.GetPlayer()
		return true
	else
		return false
	EndIf
EndFunction

Int Function GetSliderType(Actor akActor)
	If(GetIsPlayer(akActor))
		return iPlayerSliderType
	Else
		return iCompanionSliderType
	EndIf
EndFunction

Function ResetTimers(string ResetType)
	Int i = 0
	If(ResetType == sMeterMod)
		While(i < PredWeight.Length)
			PredWeight[i].MeterModCounter = ((MeterModRate*60)/UpdateRate) as int
			i += 1
		EndWhile
		trace(self, "Restarted " + ResetType + " meter.")
	ElseIf(ResetType == sMeterRate)
		While(i < PredWeight.Length)
			PredWeight[i].FullnessMeterCounter = ((MeterRate*60)/UpdateRate) as int
			i += 1
		EndWhile
		trace(self, "Restarted " + ResetType + " meter.")
	ElseIf(ResetType == sBodyRate)
		While(i < PredWeight.Length)
			PredWeight[i].BodyUpdateCounter = ((BodyUpdateRate*60)/UpdateRate) as int
			i += 1
		EndWhile
		trace(self, "Restarted " + ResetType + " meter.")
	Else
		While(i < PredWeight.Length)
			CancelTimer(PredWeight[i].Index)
			i += 1
			If(WeightModEnabled==True)
				BeginTimers(PredWeight[i])
			EndIf
		EndWhile
		debug.Messagebox("Restarted all timers")
	EndIf
EndFunction

Function BeginTimers(WeightData data)
	If(data.Pred.GetValue(FV_IsActivePred)==1)
		data.MeterModCounter = ((MeterModRate*60)/UpdateRate) as int
		data.FullnessMeterCounter = ((MeterRate*60)/UpdateRate) as int
		data.BodyUpdateCounter = ((BodyUpdateRate*60)/UpdateRate) as int
		StartTimer(UpdateRate, data.Index)
		trace(self, "Starting all weight mod counters for: " + data.PredName + " UpdateRate: " + UpdateRate + " MeterModCounter: " + data.MeterModCounter + " FullnessMeterCounter: " + data.FullnessMeterCounter + " BodyUpdateCounter: " + data.BodyUpdateCounter)
	EndIf
EndFunction

Function SyncMessages(WeightData Data)
	float syncThin
	Int SliderType = GetSliderType(Data.Pred)
	If(SliderType == 2)
		syncThin = 1-data.CurrentCBBE7BUpper/((fCBBE7BUpperMax-fCBBE7BUpperMin)/100)
	ElseIf(SliderType == 1)
		syncThin = data.CurrentABSlim/((fABSlimMax-fABSlimMin)/100)
	Else
		syncThin = data.CurrentThin
	EndIf
	
	If(syncThin <= 0.05)
		data.HasPlayedThinMessage1 = true
		data.HasPlayedThinMessage2 = true
		data.HasPlayedThinMessage3 = true
		data.HasPlayedThinMessage4 = true
		data.HasPlayedThiccMessage1 = false
		data.HasPlayedThiccMessage2 = true
		data.HasPlayedThiccMessage3 = true
		data.HasPlayedThiccMessage4 = true
	ElseIf(syncThin >= 0.25 && syncThin < 0.50)
		data.HasPlayedThinMessage1 = true
		data.HasPlayedThinMessage2 = true
		data.HasPlayedThinMessage3 = true
		data.HasPlayedThinMessage4 = true
		data.HasPlayedThiccMessage1 = false
		data.HasPlayedThiccMessage2 = false
		data.HasPlayedThiccMessage3 = true
		data.HasPlayedThiccMessage4 = true
	ElseIf(syncThin >= 0.50 && syncThin < 0.75)
		data.HasPlayedThinMessage1 = true
		data.HasPlayedThinMessage2 = false
		data.HasPlayedThinMessage3 = false
		data.HasPlayedThinMessage4 = false
		data.HasPlayedThiccMessage1 = true
		data.HasPlayedThiccMessage2 = true
		data.HasPlayedThiccMessage3 = true
		data.HasPlayedThiccMessage4 = true
	ElseIf(syncThin >= 0.75 && syncThin < 0.95)
		data.HasPlayedThinMessage1 = true
		data.HasPlayedThinMessage2 = true
		data.HasPlayedThinMessage3 = false
		data.HasPlayedThinMessage4 = false
		data.HasPlayedThiccMessage1 = true
		data.HasPlayedThiccMessage2 = true
		data.HasPlayedThiccMessage3 = true
		data.HasPlayedThiccMessage4 = true
	ElseIf(syncThin >= 0.95)
		data.HasPlayedThinMessage1 = true
		data.HasPlayedThinMessage2 = true
		data.HasPlayedThinMessage3 = true
		data.HasPlayedThinMessage4 = false
		data.HasPlayedThiccMessage1 = true
		data.HasPlayedThiccMessage2 = true
		data.HasPlayedThiccMessage3 = true
		data.HasPlayedThiccMessage4 = true
	EndIf
EndFunction

Function MessagePlay(Int messageLevel, WeightData data)
	int i = ThiccMessages.FindStruct("MessageType", messageLevel)
	If(i > -1)
		If(data.Pred == Game.GetPlayer())
			ThiccMessages[i].PlayerMessage.Show()
		Else
			FV_ThiccCompanion.Clear()
			FV_ThiccCompanion.ForceRefTo(data.Pred)
			ThiccMessages[i].CompanionMessage.Show()
		EndIf
	EndIF
EndFunction

;BEGIN WEIGHT FUNCTIONS

ActorBase:BodyWeight Function GetCurrentWeight(Actor CurrentPred)
	return CurrentPred.GetLeveledActorBase().GetBodyWeight()
EndFunction

Function StoreCurrentWeight(Actor CurrentPred, Bool storeAtomicB, Bool storeCBBE)
	WeightData data = RetrieveFromWeightArray(0, CurrentPred)
	
	If(data != NONE && data.Pred == CurrentPred && storeAtomicB == false && storeCBBE == false)
		ActorBase:BodyWeight CurrentSettings = GetCurrentWeight(data.Pred)
		data.StoredThin = CurrentSettings.Thin
		data.StoredMuscular = CurrentSettings.Muscular
		data.StoredLarge = CurrentSettings.Large
		trace(self, "Storing vanilla weight settings: " + data.PredName)
	EndIf
	If(storeAtomicB && data != NONE && data.Pred == CurrentPred && data.Pred.GetLeveledActorBase().GetSex()==1)
		data.StoredABSlim = BodyGen.GetMorph(data.Pred, true, sABSlim, FV_VoreMorphKeyword)
		data.StoredABBreast = BodyGen.GetMorph(data.Pred, true, sABBreast, FV_VoreMorphKeyword)
		data.StoredABBreastHuge = BodyGen.GetMorph(data.Pred, true, sABBreastHuge, FV_VoreMorphKeyword)
		data.StoredABThighSlim = BodyGen.GetMorph(data.Pred, true, sABThighSlim, FV_VoreMorphKeyword)
		data.StoredABNarrowWaist = BodyGen.GetMorph(data.Pred, true, sABNarrowWaist, FV_VoreMorphKeyword)
		data.StoredABButtHuge = BodyGen.GetMorph(data.Pred, true, sABButtHuge, FV_VoreMorphKeyword)
		data.StoredABBackWide = BodyGen.GetMorph(data.Pred, true, sABBackWide, FV_VoreMorphKeyword)
		data.StoredABBellySize = BodyGen.GetMorph(data.Pred, true, sABBellySize, FV_VoreMorphKeyword)
		data.StoredABButtFlat = BodyGen.GetMorph(data.Pred, true, sABButtFlat, FV_VoreMorphKeyword)
		data.StoredABButtStretch = BodyGen.GetMorph(data.Pred, true, sABButtStretch, FV_VoreMorphKeyword)
		data.StoredABButtWide = BodyGen.GetMorph(data.Pred, true, sABButtWide, FV_VoreMorphKeyword)
		data.StoredABHipsWide = BodyGen.GetMorph(data.Pred, true, sABHipsWide, FV_VoreMorphKeyword)
		data.StoredABTorsoLarge = BodyGen.GetMorph(data.Pred, true, sABTorsoLarge, FV_VoreMorphKeyword)
		data.StoredABWaistHeight = BodyGen.GetMorph(data.Pred, true, sABWaistHeight, FV_VoreMorphKeyword)
		data.StoredABWaistSmooth = BodyGen.GetMorph(data.Pred, true, sABWaistSmooth, FV_VoreMorphKeyword)
		data.StoredABWaistWide = BodyGen.GetMorph(data.Pred, true, sABWaistWide, FV_VoreMorphKeyword)
		trace(self, "Storing Atomic Beauty weight settings: " + data.PredName)
		If(!data.AtomicBStored)
			data.AtomicBStored = true
		EndIf
	EndIf
	If(storeCBBE && data != NONE && data.Pred == CurrentPred && data.Pred.GetLeveledActorBase().GetSex()==1)
		data.StoredCBBE7BLower = BodyGen.GetMorph(data.Pred, true, sCBBE7BLower, FV_VoreMorphKeyword)
		data.StoredCBBE7BUpper = BodyGen.GetMorph(data.Pred, true, sCBBE7BUpper, FV_VoreMorphKeyword)
		data.StoredCBBEBreastsSmall = BodyGen.GetMorph(data.Pred, true, sCBBEBreastsSmall, FV_VoreMorphKeyword)
		data.StoredCBBEHips = BodyGen.GetMorph(data.Pred, true, sCBBEHips, FV_VoreMorphKeyword)
		data.StoredCBBECalf = BodyGen.GetMorph(data.Pred, true, sCBBECalf, FV_VoreMorphKeyword)
		data.StoredCBBEChubbyLegs = BodyGen.GetMorph(data.Pred, true, sCBBEChubbyLegs, FV_VoreMorphKeyword)
		data.StoredCBBEButtSmall = BodyGen.GetMorph(data.Pred, true, sCBBEButtSmall, FV_VoreMorphKeyword)
		data.StoredCBBESlimThighs = BodyGen.GetMorph(data.Pred, true, sCBBESlimThighs, FV_VoreMorphKeyword)
		data.StoredCBBEAppleCheeks = BodyGen.GetMorph(data.Pred, true, sCBBEAppleCheeks, FV_VoreMorphKeyword)
		data.StoredCBBEBigButt = BodyGen.GetMorph(data.Pred, true, sCBBEBigButt, FV_VoreMorphKeyword)
		data.StoredCBBEBreastWidth = BodyGen.GetMorph(data.Pred, true, sCBBEBreastWidth, FV_VoreMorphKeyword)
		data.StoredCBBEChestDepth = BodyGen.GetMorph(data.Pred, true, sCBBEChestDepth, FV_VoreMorphKeyword)
		data.StoredCBBEChubbyArms = BodyGen.GetMorph(data.Pred, true, sCBBEChubbyArms, FV_VoreMorphKeyword)
		data.StoredCBBEForearmSize = BodyGen.GetMorph(data.Pred, true, sCBBEForearmSize, FV_VoreMorphKeyword)
		data.StoredCBBEPushUp = BodyGen.GetMorph(data.Pred, true, sCBBEPushUp, FV_VoreMorphKeyword)
		data.StoredCBBEBreastPerkiness = BodyGen.GetMorph(data.Pred, true, sCBBEBreastPerkiness, FV_VoreMorphKeyword)
		data.StoredCBBEWaist = BodyGen.GetMorph(data.Pred, true, sCBBEWaist, FV_VoreMorphKeyword)
		data.StoredCBBESSBBW2 = BodyGen.GetMorph(data.Pred, true, sCBBESSBBW2, FV_VoreMorphKeyword)
		data.StoredCBBEGiantBelly = BodyGen.GetMorph(data.Pred, true, sCBBEGiantbelly, FV_VoreMorphKeyword)
		data.StoredCBBEBreasts = BodyGen.GetMorph(data.Pred, true, sCBBEBreasts, FV_VoreMorphKeyword)
		data.StoredCBBEBreastFantasy = BodyGen.GetMorph(data.Pred, true, sCBBEBreastFantasy, FV_VoreMorphKeyword)
		data.StoredCBBEUltKirBody = BodyGen.GetMorph(data.Pred, true, sCBBEUltKirBody, FV_VoreMorphKeyword)
		trace(self, " Storing CBBE weight settings: " + data.PredName)
		If(!data.CBBEStored)
			data.CBBEStored = true
		EndIf
	EndIf
	If(data == NONE)
		trace(self, " Actor not found.  Weight values not stored.")
	EndIf
EndFunction

WeightData Function RetrieveFromWeightArray(Int SearchIndex , Actor SearchActor)
	Int i=-1
	If(SearchIndex==0)
		i = PredWeight.FindStruct("Pred", SearchActor)
		If(i>=0)
			return PredWeight[i]
		EndIf
	ElseIf(SearchActor==NONE)
		i = PredWeight.FindStruct("Index", SearchIndex)
		If(i>=0)
			return PredWeight[i]
		EndIf
	EndIf
	trace(self, " Weight search returned nothing.  Returning NONE.")
	return NONE
EndFunction

Function IncreaseFullnessMeter(WeightData data, Actor Prey)
	int meterAddition = 0
	If(Prey.HasKeyword(ActorTypeYaoGuai) || Prey.HasKeyword(ActorTypeSuperMutant))
		meterAddition = SuperMutantMeterInc
	ElseIf(Prey.HasKeyword(ActorTypeAnimal) || Prey.HasKeyword(ActorTypeBug))										
		meterAddition = AnimalMeterInc
	ElseIf(Prey.HasKeyword(ActorTypeHuman) || Prey.HasKeyword(ActorTypeGhoul) || Prey.HasKeyword(ActorTypeFeralGhoul))
		meterAddition = HumanMeterInc
	ElseIf(Prey.HasKeyword(ActorTypeMireLurk) || Prey.HasKeyword(ActorTypeMireLurkKing) || Prey.HasKeyword(ActorTypeRadScorpion))
		meterAddition = MireLurkMeterInc
	ElseIf(Prey.HasKeyword(ActorTypeDeathclaw) || Prey.HasKeyword(ActorTypeSuperMutantBehemoth))
		meterAddition = DeathclawMeterInc
	ElseIf(Prey.HasKeyword(ActorTypeRobot) || Prey.HasKeyword(ActorTypeSynth))
		FV_ThiccNoNutritonMessage.Show()
		;debug.notification("Prey has no nutritional value.")
		data.isDigesting = 0													;robots and synths should not prevent weight loss  Setting to 0 will catch this
	EndIf
	
	Int TempWeightLossChance = iWeightLossChance + ((data.Pred.GetValue(FV_CurrentPrey) as int) -2)
	If(TempWeightLossChance > 15)
		TempWeightLossChance = 15
	EndIf
	trace(self, "Chance for weight loss: " + TempWeightLossChance)
	If(Utility.RandomInt() <= TempWeightLossChance)
		If(data.FullnessMeter >= 90)
			data.FullnessMeter = 70
		Else
			data.FullnessMeter -= 20
		EndIf
		data.MeterDownCounter = MinMeterDownCounter
		FV_VoreHud.UpdateThiccStats(data.index, data.ThiccnessMeter, (data.FullnessMeter as float)/100, data.MeterDownCounter)
		trace(self, " Actor: " + data.Pred + " VEV reaction.  Reducing fullness meter to " + data.FullnessMeter)
		;FV_FXStomachGurgle.Play(data.Pred)			;commenting out for the time being
		If(data.Pred == Game.GetPlayer())
			FV_ThiccVEVReactPlayerMessage.Show()
			;debug.notification("The VEV in your body reacts to your prey causing the hunger to take over.  You feel lighter and hungrier.")
		;ElseIf(data.Pred.IsInFaction(CurrentCompanionFaction) && data.Pred.GetLeveledActorBase().GetSex()==1)
			;debug.notification("The VEV in " + data.PredName + "'s body reacts to her prey causing the hunger to take over.  She looks lighter as her belly growls deeply.")
		ElseIf(data.Pred.IsInFaction(CurrentCompanionFaction))
			FV_ThiccCompanion.clear()
			FV_ThiccCompanion.ForceRefTo(data.Pred)
			FV_ThiccVEVReactCompanionMessage.Show()
			;debug.notification("The VEV in " + data.PredName + "'s body reacts to his prey causing the hunger to take over.  He looks lighter as his belly growls deeply.")
		EndIf
	ElseIf((data.FullnessMeter + meterAddition) > 100)
		If(data.Pred.GetValue(FV_IndigestionSeverityFlag) as int == 0)						;Block extra fat generation when pred has indigestion
			data.excess = data.excess + ((data.FullnessMeter + meterAddition - 100)/2)
		ElseIf(data.excess > 0)
			data.excess = 0																;Reset data excess to 0 if indigestion is occurring only if excess was generating fat.  Will allow shrinking
		EndIf
		data.FullnessMeter = 100
	Else
		data.FullnessMeter += meterAddition
	EndIf
	
	;If pred is currently digesting something that will impact their belly size, we need to update the final size so FOVore knows what to aim for during digestion phase
	;If(FV_ColdSteelEnabled.GetValue() == 1 && data.isDigesting)
	;	Float tempGiantBelly = data.CurrentCBBEGiantBelly
	;	Float excessBellyChange
	;	Float excessSSBBW2Change = ExcessChangeValue*(data.excess as float)*(fCBBESSBBW2Max-fCBBESSBBW2Min)/100
		;Float tempCBBESSBBW2 = BodyGen.GetMorph(data.Pred, true, sCBBESSBBW2, NONE)
	;	If(data.excess>0)
	;		excessBellyChange = ExcessChangeValue*(data.excess as float)*(fCBBEGiantBellyMax-fCBBEGiantBellyMin)/100
	;		If(data.CurrentCBBESSBBW2 + excessSSBBW2Change >= (fCBBESSBBW2Max-fCBBESSBBW2Min)*2/300)
	;			data.CurrentCBBEGiantBelly = tempGiantBelly+excessBellyChange
	;			If(data.CurrentCBBEGiantBelly >= fCBBEGiantBellyMax/100)
	;				data.CurrentCBBEGiantBelly = fCBBEGiantBellyMax/100
	;			EndIf
	;		EndIf
	;	ElseIf(data.excess<0)
	;		excessBellyChange = ExcessChangeValue*(data.excess as float)*(fCBBEGiantBellyMax-fCBBEGiantBellyMin)*3/100
	;		data.CurrentCBBEGiantBelly = tempGiantBelly - excessBellyChange
	;		If(tempGiantBelly - excessBellyChange <= fCBBEGiantBellyMin/100)
	;			data.CurrentCBBEGiantBelly = fCBBEGiantBellyMin/100
	;		EndIf
	;	EndIf
	;EndIf
	;data.Pred.SetValue(FV_GiantBelly, data.CurrentCBBEGiantBelly)
	;trace(self, "setting giant belly to " + data.Pred.GetValue(FV_GiantBelly) + " : " + data.PredName)
	data.Pred.SetValue(FV_FullnessMeter, data.FullnessMeter)
	If(data.Pred.HasPerk(FV_HungerSpeed) && data.FullnessMeter > 40)
		trace(self, "Actor: " + data.PredName + " : speed reset to 100.")
		data.Pred.RemovePerk(FV_HungerSpeed)
	EndIf
	If(data.Pred.HasPerk(FV_HungerStaggerResist) && data.FullnessMeter > 20)
		data.Pred.RemovePerk(FV_HungerStaggerResist)
	EndIf
	trace(self, data.PredName + "'s prey has added " + meterAddition + " to the meter for a total of " + data.FullnessMeter)
	trace(self, data.excess + " excess fat generated.")
	FV_VoreHud.UpdateThiccStats(data.index, data.ThiccnessMeter, (data.FullnessMeter as float)/100, data.MeterDownCounter)
EndFunction

Function SetNewWeight(WeightData data)	
	If(data != NONE)
		trace(self, "Setting body settings for: " + data.PredName)
		Int SliderType = GetSliderType(data.Pred)
		If(SliderType == 1 && data.Pred.GetLeveledActorBase().GetSex()==1)
			BodyGen.SetMorph(data.Pred, true, sABSlim, FV_VoreMorphKeyword, data.CurrentABSlim)
			BodyGen.SetMorph(data.Pred, true, sABThighSlim, FV_VoreMorphKeyword, data.CurrentABThighSlim)
			BodyGen.SetMorph(data.Pred, true, sABBreast, FV_VoreMorphKeyword, data.CurrentABBreast)
			BodyGen.SetMorph(data.Pred, true, sABBreastHuge, FV_VoreMorphKeyword, data.CurrentABBreastHuge)
			BodyGen.Setmorph(data.Pred, true, sABNarrowWaist, FV_VoreMorphKeyword, data.CurrentABNarrowWaist)
			BodyGen.Setmorph(data.Pred, true, sABButtHuge, FV_VoreMorphKeyword, data.CurrentABButtHuge)
			BodyGen.SetMorph(data.Pred, true, sABBackWide, FV_VoreMorphKeyword, data.CurrentABBackWide)
			BodyGen.SetMorph(data.Pred, true, sABBellySize, FV_VoreMorphKeyword, data.CurrentABBellySize)
			BodyGen.SetMorph(data.Pred, true, sABButtFlat, FV_VoreMorphKeyword, data.CurrentABButtFlat)
			BodyGen.SetMorph(data.Pred, true, sABButtStretch, FV_VoreMorphKeyword, data.CurrentABButtStretch)
			BodyGen.SetMorph(data.Pred, true, sABButtWide, FV_VoreMorphKeyword, data.CurrentABButtWide)
			BodyGen.SetMorph(data.Pred, true, sABHipsWide, FV_VoreMorphKeyword, data.CurrentABHipsWide)
			BodyGen.SetMorph(data.Pred, true, sABTorsoLarge, FV_VoreMorphKeyword, data.CurrentABTorsoLarge)
			BodyGen.SetMorph(data.Pred, true, sABWaistHeight, FV_VoreMorphKeyword, data.CurrentABWaistHeight)
			BodyGen.SetMorph(data.Pred, true, sABWaistSmooth, FV_VoreMorphKeyword, data.CurrentABWaistSmooth)
			BodyGen.SetMorph(data.Pred, true, sABWaistWide, FV_VoreMorphKeyword, data.CurrentABWaistWide)
			BodyGen.UpdateMorphs(data.Pred)
		ElseIf(SliderType == 2 && data.Pred.GetLeveledActorBase().GetSex()==1)
			BodyGen.SetMorph(data.Pred, true, sCBBE7BLower, FV_VoreMorphKeyword, data.CurrentCBBE7BLower)
			BodyGen.SetMorph(data.Pred, true, sCBBE7BUpper, FV_VoreMorphKeyword, data.CurrentCBBE7BUpper)
			BodyGen.SetMorph(data.Pred, true, sCBBEBreastsSmall, FV_VoreMorphKeyword, data.CurrentCBBEBreastsSmall)
			BodyGen.SetMorph(data.Pred, true, sCBBEHips, FV_VoreMorphKeyword, data.CurrentCBBEHips)
			BodyGen.SetMorph(data.Pred, true, sCBBECalf, FV_VoreMorphKeyword, data.CurrentCBBECalf)
			BodyGen.SetMorph(data.Pred, true, sCBBEChubbyLegs, FV_VoreMorphKeyword, data.CurrentCBBEChubbyLegs)
			BodyGen.SetMorph(data.Pred, true, sCBBEButtSmall, FV_VoreMorphKeyword, data.CurrentCBBEButtSmall)
			BodyGen.SetMorph(data.Pred, true, sCBBESlimThighs, FV_VoreMorphKeyword, data.CurrentCBBESlimThighs)
			BodyGen.SetMorph(data.Pred, true, sCBBEAppleCheeks, FV_VoreMorphKeyword, data.CurrentCBBEAppleCheeks)
			BodyGen.SetMorph(data.Pred, true, sCBBEBigButt, FV_VoreMorphKeyword, data.CurrentCBBEBigButt)
			BodyGen.SetMorph(data.Pred, true, sCBBEBreastWidth, FV_VoreMorphKeyword, data.CurrentCBBEBreastWidth)
			BodyGen.SetMorph(data.Pred, true, sCBBEChestDepth, FV_VoreMorphKeyword, data.CurrentCBBEChestDepth)
			BodyGen.SetMorph(data.Pred, true, sCBBEChubbyArms, FV_VoreMorphKeyword, data.CurrentCBBEChubbyArms)
			BodyGen.SetMorph(data.Pred, true, sCBBEForearmSize, FV_VoreMorphKeyword, data.CurrentCBBEForearmSize)
			BodyGen.SetMorph(data.Pred, true, sCBBEPushUp, FV_VoreMorphKeyword, data.CurrentCBBEPushUp)
			BodyGen.SetMorph(data.Pred, true, sCBBEBreastPerkiness, FV_VoreMorphKeyword, data.CurrentCBBEBreastPerkiness)
			BodyGen.SetMorph(data.Pred, true, sCBBEWaist, FV_VoreMorphKeyword, data.CurrentCBBEWaist)
			BodyGen.SetMorph(data.Pred, true, sCBBESSBBW2, FV_VoreMorphKeyword, data.CurrentCBBESSBBW2)
			BodyGen.SetMorph(data.Pred, true, sCBBEBreasts, FV_VoreMorphKeyword, data.CurrentCBBEBreasts)
			BodyGen.SetMorph(data.Pred, true, sCBBEBreastFantasy, FV_VoreMorphKeyword, data.CurrentCBBEBreastFantasy)
			BodyGen.SetMorph(data.Pred, true, sCBBEUltKirBody, FV_VoreMorphKeyword, data.CurrentCBBEUltKirBody)
			If(!data.isDigesting)
				BodyGen.SetMorph(data.Pred, true, sCBBEGiantBelly, FV_VoreMorphKeyword, data.CurrentCBBEGiantBelly)
			EndIf
			BodyGen.UpdateMorphs(data.Pred)
		Else
			ActorBase:BodyWeight UpdatedBodySettings = new ActorBase:BodyWeight
			UpdatedBodySettings.Thin = data.CurrentThin
			UpdatedBodySettings.Muscular = data.CurrentMuscular
			UpdatedBodySettings.Large = data.CurrentLarge
			data.Pred.GetLeveledActorBase().SetBodyWeight(UpdatedBodySettings)
			data.Pred.QueueUpdate(false, 0xC)
		EndIf
		trace(self, " ", data = data)
	Else
		trace(self, "No weightdata for indexed actor.  No changes made.")
	EndIf
EndFunction

Function RestoreWeight(WeightData data)	
	If(data != NONE)
		ActorBase:BodyWeight UpdatedBodySettings = new ActorBase:BodyWeight
		UpdatedBodySettings.Thin = data.StoredThin
		UpdatedBodySettings.Muscular = data.StoredMuscular
		UpdatedBodySettings.Large = data.StoredLarge
		trace(self, "Restoring body settings")
		data.Pred.GetLeveledActorBase().SetBodyWeight(UpdatedBodySettings)
		data.Pred.QueueUpdate(false, 0xC)
		If(data.AtomicBEnabled && data.Pred.GetLeveledActorBase().GetSex()==1)
			BodyGen.SetMorph(data.Pred, true, sABSlim, FV_VoreMorphKeyword, data.StoredABSlim)
			BodyGen.SetMorph(data.Pred, true, sABThighSlim, FV_VoreMorphKeyword, data.StoredABThighSlim)
			BodyGen.SetMorph(data.Pred, true, sABBreast, FV_VoreMorphKeyword, data.StoredABBreast)
			BodyGen.SetMorph(data.Pred, true, sABBreastHuge, FV_VoreMorphKeyword, data.StoredABBreastHuge)
			BodyGen.Setmorph(data.Pred, true, sABNarrowWaist, FV_VoreMorphKeyword, data.StoredABNarrowWaist)
			BodyGen.Setmorph(data.Pred, true, sABButtHuge, FV_VoreMorphKeyword, data.StoredABButtHuge)
			BodyGen.SetMorph(data.Pred, true, sABBackWide, FV_VoreMorphKeyword, data.StoredABBackWide)
			BodyGen.SetMorph(data.Pred, true, sABBellySize, FV_VoreMorphKeyword, data.StoredABBellySize)
			BodyGen.SetMorph(data.Pred, true, sABButtFlat, FV_VoreMorphKeyword, data.StoredABButtFlat)
			BodyGen.SetMorph(data.Pred, true, sABButtStretch, FV_VoreMorphKeyword, data.StoredABButtStretch)
			BodyGen.SetMorph(data.Pred, true, sABButtWide, FV_VoreMorphKeyword, data.StoredABButtWide)
			BodyGen.SetMorph(data.Pred, true, sABHipsWide, FV_VoreMorphKeyword, data.StoredABHipsWide)
			BodyGen.SetMorph(data.Pred, true, sABTorsoLarge, FV_VoreMorphKeyword, data.StoredABTorsoLarge)
			BodyGen.SetMorph(data.Pred, true, sABWaistHeight, FV_VoreMorphKeyword, data.StoredABWaistHeight)
			BodyGen.SetMorph(data.Pred, true, sABWaistSmooth, FV_VoreMorphKeyword, data.StoredABWaistSmooth)
			BodyGen.SetMorph(data.Pred, true, sABWaistWide, FV_VoreMorphKeyword, data.StoredABWaistWide)
			BodyGen.UpdateMorphs(data.Pred)
		EndIf
		If(data.CBBEEnabled && data.Pred.GetLeveledActorBase().GetSex()==1)
			BodyGen.SetMorph(data.Pred, true, sCBBE7BLower, FV_VoreMorphKeyword, data.StoredCBBE7BLower)
			BodyGen.SetMorph(data.Pred, true, sCBBE7BUpper, FV_VoreMorphKeyword, data.StoredCBBE7BUpper)
			BodyGen.SetMorph(data.Pred, true, sCBBEBreastsSmall, FV_VoreMorphKeyword, data.StoredCBBEBreastsSmall)
			BodyGen.SetMorph(data.Pred, true, sCBBEHips, FV_VoreMorphKeyword, data.StoredCBBEHips)
			BodyGen.SetMorph(data.Pred, true, sCBBECalf, FV_VoreMorphKeyword, data.StoredCBBECalf)
			BodyGen.SetMorph(data.Pred, true, sCBBEChubbyLegs, FV_VoreMorphKeyword, data.StoredCBBEChubbyLegs)
			BodyGen.SetMorph(data.Pred, true, sCBBEButtSmall, FV_VoreMorphKeyword, data.StoredCBBEButtSmall)
			BodyGen.SetMorph(data.Pred, true, sCBBESlimThighs, FV_VoreMorphKeyword, data.StoredCBBESlimThighs)
			BodyGen.SetMorph(data.Pred, true, sCBBEAppleCheeks, FV_VoreMorphKeyword, data.StoredCBBEAppleCheeks)
			BodyGen.SetMorph(data.Pred, true, sCBBEBigButt, FV_VoreMorphKeyword, data.StoredCBBEBigButt)
			BodyGen.SetMorph(data.Pred, true, sCBBEBreastWidth, FV_VoreMorphKeyword, data.StoredCBBEBreastWidth)
			BodyGen.SetMorph(data.Pred, true, sCBBEChestDepth, FV_VoreMorphKeyword, data.StoredCBBEChestDepth)
			BodyGen.SetMorph(data.Pred, true, sCBBEChubbyArms, FV_VoreMorphKeyword, data.StoredCBBEChubbyArms)
			BodyGen.SetMorph(data.Pred, true, sCBBEForearmSize, FV_VoreMorphKeyword, data.StoredCBBEForearmSize)
			BodyGen.SetMorph(data.Pred, true, sCBBEPushUp, FV_VoreMorphKeyword, data.StoredCBBEPushUp)
			BodyGen.SetMorph(data.Pred, true, sCBBEBreastPerkiness, FV_VoreMorphKeyword, data.StoredCBBEBreastPerkiness)
			BodyGen.SetMorph(data.Pred, true, sCBBEWaist, FV_VoreMorphKeyword, data.StoredCBBEWaist)
			BodyGen.SetMorph(data.Pred, true, sCBBESSBBW2, FV_VoreMorphKeyword, data.StoredCBBESSBBW2)
			BodyGen.SetMorph(data.Pred, true, sCBBEGiantBelly, FV_VoreMorphKeyword, data.StoredCBBEGiantBelly)
			BodyGen.SetMorph(data.Pred, true, sCBBEBreasts, FV_VoreMorphKeyword, data.StoredCBBEBreasts)
			BodyGen.SetMorph(data.Pred, true, sCBBEBreastFantasy, FV_VoreMorphKeyword, data.StoredCBBEBreastFantasy)
			BodyGen.SetMorph(data.Pred, true, sCBBEUltKirBody, FV_VoreMorphKeyword, data.StoredCBBEUltKirBody)
			data.Pred.SetValue(FV_GiantBelly, data.StoredCBBEGiantBelly)
			BodyGen.UpdateMorphs(data.Pred)
		EndIf
		trace(self, " ", data = data)
	Else
		trace(self, "No weightdata for indexed actor.  No changes made.")
	EndIf
EndFunction

Float Function UpdateAtomicB(WeightData data, Float UpdateSlim)
	Float UpdateBreast = BodyGen.GetMorph(data.Pred, true, sABBreast, FV_VoreMorphKeyword)
	Float UpdateBreastHuge = BodyGen.GetMorph(data.Pred, true, sABBreastHuge, FV_VoreMorphKeyword)	
	Float TempSlim = BodyGen.GetMorph(data.Pred, true, sABSlim, FV_VoreMorphKeyword)
	Float UpdateThighSlim = BodyGen.GetMorph(data.Pred, true, sABThighSlim, FV_VoreMorphKeyword)
	Float UpdateNarrowWaist = BodyGen.GetMorph(data.Pred, true, sABNarrowWaist, FV_VoreMorphKeyword)
	Float UpdateButtHuge = BodyGen.GetMorph(data.Pred, true, sABButtHuge, FV_VoreMorphKeyword)
	
	Float UpdateABBackWide = BodyGen.GetMorph(data.Pred, true, sABBackWide, FV_VoreMorphKeyword)
	Float UpdateABBellySize = BodyGen.GetMorph(data.Pred, true, sABBellySize, FV_VoreMorphKeyword)
	Float UpdateABButtFlat = BodyGen.GetMorph(data.Pred, true, sABButtFlat, FV_VoreMorphKeyword)
	Float UpdateABButtStretch = BodyGen.GetMorph(data.Pred, true, sABButtStretch, FV_VoreMorphKeyword)
	Float UpdateABButtWide = BodyGen.GetMorph(data.Pred, true, sABButtWide, FV_VoreMorphKeyword)
	Float UpdateABHipsWide = BodyGen.GetMorph(data.Pred, true, sABHipsWide, FV_VoreMorphKeyword)
	Float UpdateABTorsoLarge = BodyGen.GetMorph(data.Pred, true, sABTorsoLarge, FV_VoreMorphKeyword)
	Float UpdateABWaistHeight = BodyGen.GetMorph(data.Pred, true, sABWaistHeight, FV_VoreMorphKeyword)
	Float UpdateABWaistSmooth = BodyGen.GetMorph(data.Pred, true, sABWaistSmooth, FV_VoreMorphKeyword)
	Float UpdateABWaistWide = BodyGen.GetMorph(data.Pred, true, sABWaistWide, FV_VoreMorphKeyword)
	
	Float ABBreastModValue = BodyModValue*((fABBreastMax-fABBreastMin)/100)
	Bool UpdateBody = false
	If(TempSlim < UpdateSlim)
		UpdateSlim = TempSlim
	EndIf
	Float TimerChangeValue = 0
	
	If(data.excess > 0)
		TimerChangeValue = ExcessChangeValue
	ElseIf(data.excess < 0)
		TimerChangeValue = -1*ExcessChangeValue
	ElseIf(data.FullnessMeter <= 100 && data.FullnessMeter > 90)
		TimerChangeValue = BodyModValue
	ElseIf(data.FullnessMeter <= 60 && data.FullnessMeter >= 0 && !data.isDigesting)
		TimerChangeValue = -1*BodyModValue
	EndIf
	UpdateSlim = UpdateSlim+(TimerChangeValue*(fABSlimMax-fABSlimMin)/100)
	UpdateThighSlim = UpdateThighSlim+(TimerChangeValue*(fABThighSlimMax-fABThighSlimMin)/100)
	UpdateNarrowWaist = UpdateNarrowWaist+(TimerChangeValue*(fABNarrowWaistMax-fABNarrowWaistMin)/100)
	UpdateButtHuge = UpdateButtHuge + (TimerChangeValue*(fABButtHugeMax-fABButtHugeMin)/100)
	
	UpdateABBackWide = UpdateABBackWide + (TimerChangeValue*(fABBackWideMax-fABBackWideMin)/100)
	UpdateABBellySize = UpdateABBellySize + (TimerChangeValue*(fABBellySizeMax-fABBellySizeMin)/100)
	UpdateABButtFlat = UpdateABButtFlat + (TimerChangeValue*(fABButtFlatMax-fABButtFlatMin)/100)
	UpdateABButtStretch = UpdateABButtStretch + (TimerChangeValue*(fABButtStretchMax-fABButtStretchMin)/100)
	UpdateABButtWide = UpdateABButtWide + (TimerChangeValue*(fABButtWideMax-fABButtWideMin)/100)
	UpdateABHipsWide = UpdateABHipsWide + (TimerChangeValue*(fABHipsWideMax-fABHipsWideMin)/100)
	UpdateABTorsoLarge = UpdateABTorsoLarge + (TimerChangeValue*(fABTorsoLargeMax-fABTorsoLargeMin)/100)
	UpdateABWaistHeight = UpdateABWaistHeight + (TimerChangeValue*(fABWaistHeightMax-fABWaistHeightMin)/100)
	UpdateABWaistSmooth = UpdateABWaistSmooth + (TimerChangeValue*(fABWaistSmoothMax-fABWaistSmoothMin)/100)
	UpdateABWaistWide = UpdateABWaistWide + (TimerChangeValue*(fABWaistWideMax-fABWaistWideMin)/100)
	
	If(TimerChangeValue > 0)
		If(UpdateBreastHuge <= fABBreastHugeMin/100)
			UpdateBreast = UpdateBreast-(TimerChangeValue*(fABBreastMax-fABBreastMin)/100)
			If(UpdateBreast <= fABBreastMin/100)
				UpdateBreast = fABBreastMin/100
			EndIf
		EndIf
		If(UpdateBreast <= fABBreastMin/100)
			UpdateBreastHuge = UpdateBreastHuge+(TimerChangeValue*(fABBreastMax-fABBreastMin)/100)
			If(UpdateBreastHuge >= fABBreastHugeMax/100)
				UpdateBreastHuge = fABBreastHugeMax/100
			EndIf
		EndIf
	ElseIf(TimerChangeValue < 0)
		If(UpdateBreast <= fABBreastMin/100)
			UpdateBreastHuge = UpdateBreastHuge+(TimerChangeValue*(fABBreastMax-fABBreastMin)/100)
			If(UpdateBreastHuge <= fABBreastHugeMin/100)
				UpdateBreastHuge = fABBreastHugeMin/100
			EndIf
		EndIf
		If(UpdateBreastHuge <= fABBreastHugeMin/100)
			UpdateBreast = UpdateBreast-(TimerChangeValue*(fABBreastMax-fABBreastMin)/100)
			If(UpdateBreast >= fABBreastMax/100)
				UpdateBreast = fABBreastMax/100
			EndIf
		EndIf
	EndIf
	
	If((UpdateSlim >= fABSlimMax/100 && fABSlimMax >= fABSlimMin) || (UpdateSlim <= fABSlimMax/100 && fABSlimMax < fABSlimMin))
		UpdateSlim = fABSlimMax/100
	ElseIf((UpdateSlim <= fABSlimMin/100 && fABSlimMax >= fABSlimMin) || (UpdateSlim >= fABSlimMin/100 && fABSlimMax < fABSlimMin))
		UpdateSlim = fABSlimMin/100
	EndIf
	
	If((UpdateThighSlim >= fABThighSlimMax/100 && fABThighSlimMax >= fABThighSlimMin) || (UpdateThighSlim <= fABThighSlimMax/100 && fABThighSlimMax < fABThighSlimMin))
		UpdateThighSlim = fABThighSlimMax/100
	ElseIf((UpdateThighSlim <= fABThighSlimMin/100 && fABThighSlimMax >= fABThighSlimMin) || (UpdateThighSlim >= fABThighSlimMin/100 && fABThighSlimMax < fABThighSlimMin))
		UpdateThighSlim = fABThighSlimMin/100
	EndIf
	
	If((UpdateNarrowWaist >= fABNarrowWaistMax/100 && fABNarrowWaistMax >= fABNarrowWaistMin) || (UpdateNarrowWaist <= fABNarrowWaistMax/100 && fABNarrowWaistMax < fABNarrowWaistMin))
		UpdateNarrowWaist = fABNarrowWaistMax/100
	ElseIf((UpdateNarrowWaist <= fABNarrowWaistMin/100 && fABNarrowWaistMax >= fABNarrowWaistMin) || (UpdateNarrowWaist >= fABNarrowWaistMin/100 && fABNarrowWaistMax < fABNarrowWaistMin))
		UpdateNarrowWaist = fABNarrowWaistMin/100
	EndIf
	
	If((UpdateButtHuge >= fABButtHugeMax  && fABButtHugeMax >= fABButtHugeMin) || (UpdateButtHuge <= fABButtHugeMax  && fABButtHugeMax < fABButtHugeMin))
		UpdateButtHuge = fABButtHugeMax
	ElseIf((UpdateButtHuge <= fABButtHugeMin  && fABButtHugeMax >= fABButtHugeMin) || (UpdateButtHuge >= fABButtHugeMin  && fABButtHugeMax < fABButtHugeMin))
		UpdateButtHuge = fABButtHugeMin
	EndIf
	
	If((UpdateABBackWide >= fABBackWideMax && fABBackWideMax >= fABBackWideMin) || (UpdateABBackWide <= fABBackWideMax && fABBackWideMax < fABBackWideMin))
		UpdateABBackWide = fABBackWideMax
	ElseIf((UpdateABBackWide <= fABBackWideMin && fABBackWideMax >= fABBackWideMin) || (UpdateABBackWide >= fABBackWideMin && fABBackWideMax < fABBackWideMin))
		UpdateABBackWide = fABBackWideMin
	EndIf
	
	If((UpdateABBellySize >= fABBellySizeMax && fABBellySizeMax >= fABBellySizeMin) || (UpdateABBellySize <= fABBellySizeMax && fABBellySizeMax < fABBellySizeMin))
		UpdateABBellySize = fABBellySizeMax
	ElseIf((UpdateABBellySize <= fABBellySizeMin && fABBellySizeMax >= fABBellySizeMin) || (UpdateABBellySize >= fABBellySizeMin && fABBellySizeMax < fABBellySizeMin))
		UpdateABBellySize = fABBellySizeMin
	EndIf
	
	If((UpdateABButtFlat >= fABButtFlatMax && fABButtFlatMax >= fABButtFlatMin) || (UpdateABButtFlat <= fABButtFlatMax && fABButtFlatMax < fABButtFlatMin))
		UpdateABButtFlat = fABButtFlatMax
	ElseIf((UpdateABButtFlat <= fABButtFlatMin && fABButtFlatMax >= fABButtFlatMin) || (UpdateABButtFlat >= fABButtFlatMin && fABButtFlatMax < fABButtFlatMin))
		UpdateABButtFlat = fABButtFlatMin
	EndIf
	
	If((UpdateABButtStretch >= fABButtStretchMax && fABButtStretchMax >= fABButtStretchMin) || (UpdateABButtStretch <= fABButtStretchMax && fABButtStretchMax < fABButtStretchMin))
		UpdateABButtStretch = fABButtStretchMax
	ElseIf((UpdateABButtStretch <= fABButtStretchMin && fABButtStretchMax >= fABButtStretchMin) || (UpdateABButtStretch >= fABButtStretchMin && fABButtStretchMax < fABButtStretchMin))
		UpdateABButtStretch = fABButtStretchMin
	EndIf
	
	If((UpdateABButtWide >= fABButtWideMax && fABButtWideMax >= fABButtWideMin) || (UpdateABButtWide <= fABButtWideMax && fABButtWideMax < fABButtWideMin))
		UpdateABButtWide = fABButtWideMax
	ElseIf((UpdateABButtWide <= fABButtWideMin && fABButtWideMax >= fABButtWideMin) || (UpdateABButtWide >= fABButtWideMin && fABButtWideMax < fABButtWideMin))
		UpdateABButtWide = fABButtWideMin
	EndIf
		
	If((UpdateABHipsWide >= fABHipsWideMax && fABHipsWideMax >= fABHipsWideMin) || (UpdateABHipsWide <= fABHipsWideMax && fABHipsWideMax < fABHipsWideMin))
		UpdateABHipsWide = fABHipsWideMax
	ElseIf((UpdateABHipsWide <= fABHipsWideMin && fABHipsWideMax >= fABHipsWideMin) || (UpdateABHipsWide >= fABHipsWideMin && fABHipsWideMax < fABHipsWideMin))
		UpdateABHipsWide = fABHipsWideMin
	EndIf
	
	If((UpdateABTorsoLarge >= fABTorsoLargeMax && fABTorsoLargeMax >= fABTorsoLargeMin) || (UpdateABTorsoLarge <= fABTorsoLargeMax && fABTorsoLargeMax < fABTorsoLargeMin))
		UpdateABTorsoLarge = fABTorsoLargeMax
	ElseIf((UpdateABTorsoLarge <= fABTorsoLargeMin && fABTorsoLargeMax >= fABTorsoLargeMin) || (UpdateABTorsoLarge >= fABTorsoLargeMin && fABTorsoLargeMax < fABTorsoLargeMin))
		UpdateABTorsoLarge = fABTorsoLargeMin
	EndIf
	
	If((UpdateABWaistHeight >= fABWaistHeightMax && fABWaistHeightMax >= fABWaistHeightMin) || (UpdateABWaistHeight <= fABWaistHeightMax && fABWaistHeightMax < fABWaistHeightMin))
		UpdateABWaistHeight = fABWaistHeightMax
	ElseIf((UpdateABWaistHeight <= fABWaistHeightMin && fABWaistHeightMax >= fABWaistHeightMin) || (UpdateABWaistHeight >= fABWaistHeightMin && fABWaistHeightMax < fABWaistHeightMin))
		UpdateABWaistHeight = fABWaistHeightMin
	EndIf
		
	If((UpdateABWaistSmooth >= fABWaistSmoothMax && fABWaistSmoothMax >= fABWaistSmoothMin) || (UpdateABWaistSmooth <= fABWaistSmoothMax && fABWaistSmoothMax < fABWaistSmoothMin))
		UpdateABWaistSmooth = fABWaistSmoothMax
	ElseIf((UpdateABWaistSmooth <= fABWaistSmoothMin && fABWaistSmoothMax >= fABWaistSmoothMin) || (UpdateABWaistSmooth >= fABWaistSmoothMin && fABWaistSmoothMax < fABWaistSmoothMin))
		UpdateABWaistSmooth = fABWaistSmoothMin
	EndIf
	
		
	If(UpdateABWaistWide >= fABWaistWideMax)
		UpdateABWaistWide = fABWaistWideMax
	EndIf
	If(UpdateABWaistWide <= fABWaistWideMin)
		UpdateABWaistWide = fABWaistWideMin
	EndIf
	
	If(UpdateSlim != data.CurrentABSlim)
		data.CurrentABSlim = UpdateSlim
		UpdateBody = true
	EndIf
	If(UpdateThighSlim != data.CurrentABThighSlim)
		data.CurrentABThighSlim = UpdateThighSlim
		UpdateBody = true
	EndIf
	If(UpdateBreast != data.CurrentABBreast)
		data.CurrentABBreast = UpdateBreast
		UpdateBody = true
	EndIf
	If(UpdateNarrowWaist != data.CurrentABNarrowWaist)
		data.CurrentABNarrowWaist = UpdateNarrowWaist
		UpdateBody = true
	EndIf
	If(UpdateButtHuge != data.CurrentABButtHuge)
		data.CurrentABButtHuge = UpdateButtHuge
		UpdateBody = true
	EndIf
	
	If(UpdateABBackWide != data.CurrentABBackWide)
		data.CurrentABBackWide = UpdateABBackWide
		UpdateBody = true
	EndIf
	If(UpdateABBellySize != data.CurrentABBellySize)
		data.CurrentABBellySize = UpdateABBellySize
		UpdateBody = true
	EndIf
	If(UpdateABButtFlat != data.CurrentABButtFlat)
		data.CurrentABButtFlat = UpdateABButtFlat
		UpdateBody = true
	EndIf
	If(UpdateABButtStretch != data.CurrentABButtStretch)
		data.CurrentABButtStretch = UpdateABButtStretch
		UpdateBody = true
	EndIf
	If(UpdateABButtWide != data.CurrentABButtWide)
		data.CurrentABButtWide = UpdateABButtWide
		UpdateBody = true
	EndIf
	If(UpdateABTorsoLarge != data.CurrentABTorsoLarge)
		data.CurrentABTorsoLarge = UpdateABTorsoLarge
		UpdateBody = true
	EndIf
	If(UpdateABWaistHeight != data.CurrentABWaistHeight)
		data.CurrentABWaistHeight = UpdateABWaistHeight
		UpdateBody = true
	EndIf
	If(UpdateABWaistSmooth != data.CurrentABWaistSmooth)
		data.CurrentABWaistSmooth = UpdateABWaistSmooth
		UpdateBody = true
	EndIf
	If(UpdateABWaistWide != data.CurrentABWaistWide)
		data.CurrentABWaistWide = UpdateABWaistWide
		UpdateBody = true
	EndIf
	If(UpdateBody)
		SetNewWeight(data)
		UpdateThiccnessMeter(data)
	EndIf
	If(UpdateSlim < 0)
		return 0
	ElseIf(UpdateSlim > 1.0)
		return 1.0
	EndIf
	return UpdateSlim
EndFunction

Function SyncBodies(WeightData data, bool isEnabled)
	If((data.AtomicBEnabled || data.CBBEEnabled) && data.Pred.GetLeveledActorBase().GetSex()==1)
		data.CurrentThin = 0.3333
		data.CurrentMuscular = 0.3333
		data.CurrentLarge = 0.3334
	EndIf
	If(!isEnabled)
		If(data.AtomicBEnabled && data.Pred.GetLeveledActorBase().GetSex()==1)
			data.CurrentThin = data.CurrentABSlim
			data.CurrentMuscular = (1-data.CurrentThin)*MFRatio/100
			data.CurrentLarge = (1-data.CurrentThin-data.CurrentMuscular)
		ElseIf(data.CBBEEnabled && data.Pred.GetLeveledActorBase().GetSex()==1)
			data.CurrentThin = 1-data.CurrentCBBE7BUpper/((fCBBE7BUpperMax-fCBBE7BUpperMin)/100)
			data.CurrentMuscular = (1-data.CurrentThin)*MFRatio/100
			data.CurrentLarge = (1-data.CurrentThin-data.CurrentMuscular)
		EndIf
	EndIf
	ActorBase:BodyWeight UpdatedBodySettings = new ActorBase:BodyWeight
	UpdatedBodySettings.Thin = data.CurrentThin
	UpdatedBodySettings.Muscular = data.CurrentMuscular
	UpdatedBodySettings.Large = data.CurrentLarge
	data.Pred.GetLeveledActorBase().SetBodyWeight(UpdatedBodySettings)
	data.Pred.QueueUpdate(false, 0xC)
	SyncMessages(data)
EndFunction

Float Function UpdateCBBE(WeightData data, Float UpdateSlim)
	Float Update7BUpper = BodyGen.GetMorph(data.Pred, true, sCBBE7BUpper, FV_VoreMorphKeyword)
	Float Update7BLower = BodyGen.GetMorph(data.Pred, true, sCBBE7BLower, FV_VoreMorphKeyword)
	Float UpdateCBBECalf = BodyGen.GetMorph(data.Pred, true, sCBBECalf, FV_VoreMorphKeyword)
	Float UpdateCBBEChubbyLegs = BodyGen.GetMorph(data.Pred, true, sCBBEChubbyLegs, FV_VoreMorphKeyword)
	Float UpdateCBBEHips = BodyGen.GetMorph(data.Pred, true, sCBBEHips, FV_VoreMorphKeyword)
	Float UpdateCBBEAppleCheeks = BodyGen.GetMorph(data.Pred, true, sCBBEAppleCheeks, FV_VoreMorphKeyword)
	Float UpdateCBBEBigButt = BodyGen.GetMorph(data.Pred, true, sCBBEBigButt, FV_VoreMorphKeyword)
	Float UpdateCBBEBreastWidth = BodyGen.GetMorph(data.Pred, true, sCBBEBreastWidth, FV_VoreMorphKeyword)
	Float UpdateCBBEChestDepth = BodyGen.GetMorph(data.Pred, true, sCBBEChestDepth, FV_VoreMorphKeyword)
	Float UpdateCBBEForearmSize = BodyGen.GetMorph(data.Pred, true, sCBBEForearmSize, FV_VoreMorphKeyword)
	Float UpdateCBBEButtSmall = BodyGen.GetMorph(data.Pred, true, sCBBEButtSmall, FV_VoreMorphKeyword)
	Float UpdateCBBESlimThighs = BodyGen.GetMorph(data.Pred, true, sCBBESlimThighs, FV_VoreMorphKeyword)
	Float UpdateCBBEPushUp = BodyGen.GetMorph(data.Pred, true, sCBBEPushUp, FV_VoreMorphKeyword)
	Float UpdateCBBEBreastPerkiness = BodyGen.GetMorph(data.Pred, true, sCBBEBreastPerkiness, FV_VoreMorphKeyword)
	Float UpdateCBBEWaist = BodyGen.GetMorph(data.Pred, true, sCBBEWaist, FV_VoreMorphKeyword)
	Float UpdateCBBEChubbyArms = BodyGen.GetMorph(data.Pred, true, sCBBEChubbyArms, FV_VoreMorphKeyword)
	Float UpdateCBBEBreastsSmall = BodyGen.GetMorph(data.Pred, true, sCBBEBreastsSmall, FV_VoreMorphKeyword)
	Float UpdateCBBESSBBW2 = BodyGen.GetMorph(data.Pred, true, sCBBESSBBW2, FV_VoreMorphKeyword)
	Float UpdateCBBEGiantBelly = BodyGen.GetMorph(data.Pred, true, sCBBEGiantbelly, FV_VoreMorphKeyword)
	Float UpdateCBBEBreasts = BodyGen.GetMorph(data.Pred, true, sCBBEBreasts, FV_VoreMorphKeyword)
	Float UpdateCBBEBreastFantasy = BodyGen.GetMorph(data.Pred, true, sCBBEBreastFantasy, FV_VoreMorphKeyword)
	Float UpdateCBBEUltKirBody = BodyGen.GetMorph(data.Pred, true, sCBBEUltKirBody, FV_VoreMorphKeyword)
	
	Bool UpdateBody = false
	Float TimerChangeValue = 0
	
	If(data.excess > 0)
		TimerChangeValue = ExcessChangeValue
	ElseIf(data.excess < 0)
		TimerChangeValue = -1*ExcessChangeValue
	ElseIf(data.FullnessMeter <= 100 && data.FullnessMeter > 90)
		TimerChangeValue = BodyModValue
	ElseIf(data.FullnessMeter <= 60 && data.FullnessMeter >= 0 && !data.isDigesting)
		TimerChangeValue = -1*BodyModValue
	EndIf
	
	UpdateCBBEBreastsSmall = UpdateCBBEBreastsSmall + (TimerChangeValue*(fCBBEBreastsSmallMax-fCBBEBreastsSmallMin)/100)		
	Update7BUpper = Update7BUpper + (TimerChangeValue*(fCBBE7BUpperMax-fCBBE7BUpperMin)/100)
	Update7BLower = Update7BLower + (TimerChangeValue*(fCBBE7BLowerMax-fCBBE7BLowerMin)/100)	
	UpdateCBBECalf = UpdateCBBECalf + (TimerChangeValue*(fCBBECalfMax-fCBBECalfMin)/100)
	UpdateCBBEChubbyLegs = UpdateCBBEChubbyLegs + (TimerChangeValue*(fCBBEChubbyLegsMax-fCBBEChubbyLegsMin)/100)
	UpdateCBBEHips = UpdateCBBEHips + (TimerChangeValue*(fCBBEHipsMax-fCBBEHipsMin)/100)
	UpdateCBBEAppleCheeks = UpdateCBBEAppleCheeks + (TimerChangeValue*(fCBBEAppleCheeksMax-fCBBEAppleCheeksMin)/100)
	UpdateCBBEBigButt = UpdateCBBEBigButt + (TimerChangeValue*(fCBBEBigButtMax-fCBBEBigButtMin)/100)
	UpdateCBBEBreastWidth = UpdateCBBEBreastWidth + (TimerChangeValue*(fCBBEBreastWidthMax-fCBBEBreastWidthMin)/100)
	UpdateCBBEChestDepth = UpdateCBBEChestDepth + (TimerChangeValue*(fCBBEChestDepthMax-fCBBEChestDepthMin)/100)
	UpdateCBBEForearmSize = UpdateCBBEForearmSize + (TimerChangeValue*(fCBBEForearmSizeMax-fCBBEForearmSizeMin)/100)
	UpdateCBBEButtSmall = UpdateCBBEButtSmall + (TimerChangeValue*(fCBBEButtSmallMax-fCBBEButtSmallMin)/100)
	UpdateCBBESlimThighs = UpdateCBBESlimThighs + (TimerChangeValue*(fCBBESlimThighsMax-fCBBESlimThighsMin)/100)
	UpdateCBBEPushUp = UpdateCBBEPushUp + (TimerChangeValue*(fCBBEPushUpMax-fCBBEPushUpMin)/100)
	UpdateCBBEBreastPerkiness = UpdateCBBEBreastPerkiness + (TimerChangeValue*(fCBBEBreastPerkinessMax-fCBBEBreastPerkinessMin)/100)
	UpdateCBBEWaist = UpdateCBBEWaist + (TimerChangeValue*(fCBBEWaistMax-fCBBEWaistMin)/100)
	UpdateCBBEChubbyArms = UpdateCBBEChubbyArms + (TimerChangeValue*(fCBBEChubbyArmsMax-fCBBEChubbyArmsMin)/100)
	UpdateCBBEBreastFantasy = UpdateCBBEBreastFantasy + (TimerChangeValue*(fCBBEBreastFantasyMax-fCBBEBreastFantasyMin)/100)
	UpdateCBBEBreasts = UpdateCBBEBreasts + (TimerChangeValue*(fCBBEBreastsMax-fCBBEBreastsMin)/100)
	
	If(TimerChangeValue > 0)
		UpdateCBBEUltKirBody = UpdateCBBEUltKirBody + (TimerChangeValue*(fCBBEUltKirBodyMax-fCBBEUltKirBodyMin)/100)
		UpdateCBBESSBBW2 = UpdateCBBESSBBW2 + (TimerChangeValue*(fCBBESSBBW2Max-fCBBESSBBW2Min)/100)
		If(!data.isDigesting)
			If(UpdateCBBESSBBW2 >= (fCBBESSBBW2Max-fCBBESSBBW2Min)*2/300)
				UpdateCBBEGiantBelly = UpdateCBBEGiantBelly + (TimerChangeValue*(fCBBEGiantBellyMax-fCBBEGiantBellyMin)/100)
			EndIf
		EndIf
	EndIf
	If(TimerChangeValue < 0)
		UpdateCBBEGiantBelly = UpdateCBBEGiantBelly + (TimerChangeValue*(fCBBEGiantBellyMax-fCBBEGiantBellyMin)*3/100)
		If(UpdateCBBEGiantBelly <= (fCBBEGiantBellyMax-fCBBEGiantBellyMin)/300)
			UpdateCBBESSBBW2 = UpdateCBBESSBBW2 + (TimerChangeValue*(fCBBESSBBW2Max-fCBBESSBBW2Min)/100)
			UpdateCBBEUltKirBody = UpdateCBBEUltKirBody + (TimerChangeValue*(fCBBEUltKirBodyMax-fCBBEUltKirBodyMin)/100)
		EndIf
	EndIf
	
	If((UpdateCBBEBreastsSmall >= fCBBEBreastsSmallMax/100 && fCBBEBreastsSmallMax >= fCBBEBreastsSmallMin) || (UpdateCBBEBreastsSmall <= fCBBEBreastsSmallMax/100 && fCBBEBreastsSmallMax < fCBBEBreastsSmallMin))
		UpdateCBBEBreastsSmall = fCBBEBreastsSmallMax/100
	ElseIf((UpdateCBBEBreastsSmall <= fCBBEBreastsSmallMin/100 && fCBBEBreastsSmallMin <= fCBBEBreastsSmallMax) || (UpdateCBBEBreastsSmall >= fCBBEBreastsSmallMin/100 && fCBBEBreastsSmallMax < fCBBEBreastsSmallMin))
		UpdateCBBEBreastsSmall = fCBBEBreastsSmallMin/100
	EndIf
	
	If((Update7BLower >= fCBBE7BLowerMax/100 && fCBBE7BLowerMax >= fCBBE7BLowerMin) || (Update7BLower <= fCBBE7BLowerMax/100 && fCBBE7BLowerMax < fCBBE7BLowerMin))
		Update7BLower = fCBBE7BLowerMax/100
	ElseIf((Update7BLower <= fCBBE7BLowerMin/100 && fCBBE7BLowerMax >= fCBBE7BLowerMin) || (Update7BLower >= fCBBE7BLowerMin/100 && fCBBE7BLowerMax < fCBBE7BLowerMin))
		Update7BLower = fCBBE7BLowerMin/100
	EndIf
	
	If((UpdateCBBECalf >= fCBBECalfMax/100 && fCBBECalfMax >= fCBBECalfMin) || (UpdateCBBECalf <= fCBBECalfMax/100 && fCBBECalfMax < fCBBECalfMin))
		UpdateCBBECalf = fCBBECalfMax/100
	ElseIf((UpdateCBBECalf <= fCBBECalfMin/100 && fCBBECalfMax >= fCBBECalfMin) || (UpdateCBBECalf >= fCBBECalfMin/100 && fCBBECalfMax < fCBBECalfMin))
		UpdateCBBECalf = fCBBECalfMin/100
	EndIf
	
	If((UpdateCBBEChubbyLegs >= fCBBEChubbyLegsMax/100 && fCBBEChubbyLegsMax >= fCBBEChubbyLegsMin) || (UpdateCBBEChubbyLegs <= fCBBEChubbyLegsMax/100 && fCBBEChubbyLegsMax < fCBBEChubbyLegsMin))
		UpdateCBBEChubbyLegs = fCBBEChubbyLegsMax/100
	ElseIf((UpdateCBBEChubbyLegs <= fCBBEChubbyLegsMin/100 && fCBBEChubbyLegsMax >= fCBBEChubbyLegsMin) || (UpdateCBBEChubbyLegs >= fCBBEChubbyLegsMin/100 && fCBBEChubbyLegsMax < fCBBEChubbyLegsMin))
		UpdateCBBEChubbyLegs = fCBBEChubbyLegsMin/100
	EndIf
	
	If((UpdateCBBEHips >= fCBBEHipsMax/100 && fCBBEHipsMax >= fCBBEHipsMin) || (UpdateCBBEHips <= fCBBEHipsMax/100 && fCBBEHipsMax < fCBBEHipsMin))
		UpdateCBBEHips = fCBBEHipsMax/100
	ElseIf((UpdateCBBEHips <= fCBBEHipsMin/100 && fCBBEHipsMax >= fCBBEHipsMin) || (UpdateCBBEHips >= fCBBEHipsMin/100 && fCBBEHipsMax < fCBBEHipsMin))
		UpdateCBBEHips = fCBBEHipsMin/100
	EndIf
	
	If((UpdateCBBEAppleCheeks >= fCBBEAppleCheeksMax/100 && fCBBEAppleCheeksMax >= fCBBEAppleCheeksMin) || (UpdateCBBEAppleCheeks <= fCBBEAppleCheeksMax/100 && fCBBEAppleCheeksMax < fCBBEAppleCheeksMin))
		UpdateCBBEAppleCheeks = fCBBEAppleCheeksMax/100
	ElseIf((UpdateCBBEAppleCheeks <= fCBBEAppleCheeksMin/100 && fCBBEAppleCheeksMax >= fCBBEAppleCheeksMin) || (UpdateCBBEAppleCheeks >= fCBBEAppleCheeksMin/100 && fCBBEAppleCheeksMax < fCBBEAppleCheeksMin))
		UpdateCBBEAppleCheeks = fCBBEAppleCheeksMin/100
	EndIf
	If((UpdateCBBEBigButt >= fCBBEBigButtMax/100 && fCBBEBigButtMax >= fCBBEBigButtMin) || (UpdateCBBEBigButt <= fCBBEBigButtMax/100 && fCBBEBigButtMax < fCBBEBigButtMin))
		UpdateCBBEBigButt = fCBBEBigButtMax/100
	ElseIf((UpdateCBBEBigButt <= fCBBEBigButtMin/100 && fCBBEBigButtMax >= fCBBEBigButtMin) || (UpdateCBBEBigButt >= fCBBEBigButtMin/100 && fCBBEBigButtMax < fCBBEBigButtMin))
		UpdateCBBEBigButt = fCBBEBigButtMin/100
	EndIf
	
	If((UpdateCBBEBreastWidth >= fCBBEBreastWidthMax/100 && fCBBEBreastWidthMax >= fCBBEBreastWidthMin) || (UpdateCBBEBreastWidth <= fCBBEBreastWidthMax/100 && fCBBEBreastWidthMax < fCBBEBreastWidthMin))
		UpdateCBBEBreastWidth = fCBBEBreastWidthMax/100
	ElseIf((UpdateCBBEBreastWidth <= fCBBEBreastWidthMin/100 && fCBBEBreastWidthMax >= fCBBEBreastWidthMin) || (UpdateCBBEBreastWidth >= fCBBEBreastWidthMin/100 && fCBBEBreastWidthMax < fCBBEBreastWidthMin))
		UpdateCBBEBreastWidth = fCBBEBreastWidthMin/100
	EndIf
	
	If((UpdateCBBEChestDepth >= fCBBEChestDepthMax/100 && fCBBEChestDepthMax >= fCBBEChestDepthMin) || (UpdateCBBEChestDepth <= fCBBEChestDepthMax/100 && fCBBEChestDepthMax < fCBBEChestDepthMin))
		UpdateCBBEChestDepth = fCBBEChestDepthMax/100
	ElseIf((UpdateCBBEChestDepth <= fCBBEChestDepthMin/100 && fCBBEChestDepthMax >= fCBBEChestDepthMin) || (UpdateCBBEChestDepth >= fCBBEChestDepthMin/100 && fCBBEChestDepthMax < fCBBEChestDepthMin))
		UpdateCBBEChestDepth = fCBBEChestDepthMin/100
	EndIf
	
	If((UpdateCBBEForearmSize >= fCBBEForearmSizeMax/100 && fCBBEForearmSizeMax >= fCBBEForearmSizeMin) || (UpdateCBBEForearmSize <= fCBBEForearmSizeMax/100 && fCBBEForearmSizeMax < fCBBEForearmSizeMin))
		UpdateCBBEForearmSize = fCBBEForearmSizeMax/100
	ElseIf((UpdateCBBEForearmSize <= fCBBEForearmSizeMin/100 && fCBBEForearmSizeMax >= fCBBEForearmSizeMin) || (UpdateCBBEForearmSize >= fCBBEForearmSizeMin/100 && fCBBEForearmSizeMax < fCBBEForearmSizeMin))
		UpdateCBBEForearmSize = fCBBEForearmSizeMin/100
	EndIf
	
	If((UpdateCBBEButtSmall >= fCBBEButtSmallMax/100 && fCBBEButtSmallMax >= fCBBEButtSmallMin) || (UpdateCBBEButtSmall <= fCBBEButtSmallMax/100 && fCBBEButtSmallMax < fCBBEButtSmallMin))
		UpdateCBBEButtSmall = fCBBEButtSmallMax/100
	ElseIf((UpdateCBBEButtSmall <= fCBBEButtSmallMin/100 && fCBBEButtSmallMax >= fCBBEButtSmallMin) || (UpdateCBBEButtSmall >= fCBBEButtSmallMin/100 && fCBBEButtSmallMax < fCBBEButtSmallMin))
		UpdateCBBEButtSmall = fCBBEButtSmallMin/100
	EndIf
	
	If((UpdateCBBESlimThighs >= fCBBESlimThighsMax/100 && fCBBESlimThighsMax >= fCBBESlimThighsMin) || (UpdateCBBESlimThighs <= fCBBESlimThighsMax/100 && fCBBESlimThighsMax < fCBBESlimThighsMin))
		UpdateCBBESlimThighs = fCBBESlimThighsMax/100
	ElseIf((UpdateCBBESlimThighs <= fCBBESlimThighsMin/100 && fCBBESlimThighsMax >= fCBBESlimThighsMin) || (UpdateCBBESlimThighs >= fCBBESlimThighsMin/100 && fCBBESlimThighsMax < fCBBESlimThighsMin))
		UpdateCBBESlimThighs = fCBBESlimThighsMin/100
	EndIf
	
	If((UpdateCBBEPushUp >= fCBBEPushUpMax/100 && fCBBEPushUpMax >= fCBBEPushUpMin) || (UpdateCBBEPushUp <= fCBBEPushUpMax/100 && fCBBEPushUpMax < fCBBEPushUpMin))
		UpdateCBBEPushUp = fCBBEPushUpMax/100
	ElseIf((UpdateCBBEPushUp <= fCBBEPushUpMin/100 && fCBBEPushUpMax >= fCBBEPushUpMin) || (UpdateCBBEPushUp >= fCBBEPushUpMin/100 && fCBBEPushUpMax < fCBBEPushUpMin))
		UpdateCBBEPushUp = fCBBEPushUpMin/100
	EndIf
	
	If((UpdateCBBEBreastPerkiness >= fCBBEBreastPerkinessMax/100 && fCBBEBreastPerkinessMax >= fCBBEBreastPerkinessMin) || (UpdateCBBEBreastPerkiness <= fCBBEBreastPerkinessMax/100 && fCBBEBreastPerkinessMax < fCBBEBreastPerkinessMin))
		UpdateCBBEBreastPerkiness = fCBBEBreastPerkinessMax/100
	ElseIf((UpdateCBBEBreastPerkiness <= fCBBEBreastPerkinessMin/100 && fCBBEBreastPerkinessMax >= fCBBEBreastPerkinessMin) || (UpdateCBBEBreastPerkiness >= fCBBEBreastPerkinessMin/100 && fCBBEBreastPerkinessMax < fCBBEBreastPerkinessMin))
		UpdateCBBEBreastPerkiness = fCBBEBreastPerkinessMin/100
	EndIf
	
	If((UpdateCBBEWaist >= fCBBEWaistMax/100 && fCBBEWaistMax >= fCBBEWaistMin) || (UpdateCBBEWaist <= fCBBEWaistMax/100 && fCBBEWaistMax < fCBBEWaistMin))
		UpdateCBBEWaist = fCBBEWaistMax/100
	ElseIf((UpdateCBBEWaist <= fCBBEWaistMin/100 && fCBBEWaistMax >= fCBBEWaistMin) || (UpdateCBBEWaist >= fCBBEWaistMin/100 && fCBBEWaistMax < fCBBEWaistMin))
		UpdateCBBEWaist = fCBBEWaistMin/100
	EndIf
	
	If((UpdateCBBEChubbyArms >= fCBBEChubbyArmsMax/100 && fCBBEChubbyArmsMax >= fCBBEChubbyArmsMin) || (UpdateCBBEChubbyArms <= fCBBEChubbyArmsMax/100 && fCBBEChubbyArmsMax < fCBBEChubbyArmsMin))
		UpdateCBBEChubbyArms = fCBBEChubbyArmsMax/100
	ElseIf((UpdateCBBEChubbyArms <= fCBBEChubbyArmsMin/100 && fCBBEChubbyArmsMax >= fCBBEChubbyArmsMin) || (UpdateCBBEChubbyArms >= fCBBEChubbyArmsMin/100 && fCBBEChubbyArmsMax < fCBBEChubbyArmsMin))
		UpdateCBBEChubbyArms = fCBBEChubbyArmsMin/100
	EndIf
	
	If((UpdateCBBESSBBW2 >= fCBBESSBBW2Max/100 && fCBBESSBBW2Max >= fCBBESSBBW2Min) || (UpdateCBBESSBBW2 <= fCBBESSBBW2Max/100 && fCBBESSBBW2Max < fCBBESSBBW2Min))
		UpdateCBBESSBBW2 = fCBBESSBBW2Max/100
	ElseIf((UpdateCBBESSBBW2 <= fCBBESSBBW2Min/100 && fCBBESSBBW2Max >= fCBBESSBBW2Min) || (UpdateCBBESSBBW2 >= fCBBESSBBW2Min/100 && fCBBESSBBW2Max < fCBBESSBBW2Min))
		UpdateCBBESSBBW2 = fCBBESSBBW2Min/100
	EndIf
	
	If((UpdateCBBEGiantBelly >= fCBBEGiantBellyMax/100 && fCBBEGiantBellyMax >= fCBBEGiantBellyMin) || (UpdateCBBEGiantBelly <= fCBBEGiantBellyMax/100 && fCBBEGiantBellyMax < fCBBEGiantBellyMin))
		UpdateCBBEGiantBelly = fCBBEGiantBellyMax/100
	ElseIf((UpdateCBBEGiantBelly <= fCBBEGiantBellyMin/100 && fCBBEGiantBellyMax >= fCBBEGiantBellyMin) || (UpdateCBBEGiantBelly >= fCBBEGiantBellyMin/100 && fCBBEGiantBellyMax < fCBBEGiantBellyMin))
		UpdateCBBEGiantBelly = fCBBEGiantBellyMin/100
	EndIf
	
	If((Update7BUpper >= fCBBE7BUpperMax/100 && fCBBE7BUpperMax >= fCBBE7BUpperMin) || (Update7BUpper <= fCBBE7BUpperMax/100 && fCBBE7BUpperMax < fCBBE7BUpperMin))
		Update7BUpper = fCBBE7BUpperMax/100
	ElseIf((Update7BUpper <= fCBBE7BUpperMin/100 && fCBBE7BUpperMax >= fCBBE7BUpperMin) || (Update7BUpper >= fCBBE7BUpperMin/100 && fCBBE7BUpperMax < fCBBE7BUpperMin))
		Update7BUpper = fCBBE7BUpperMin/100
	EndIf
	
	If((UpdateCBBEBreasts >= fCBBEBreastsMax/100 && fCBBEBreastsMax >= fCBBEBreastsMin) || (UpdateCBBEBreasts <= fCBBEBreastsMax/100 && fCBBEBreastsMax < fCBBEBreastsMin))
		UpdateCBBEBreasts = fCBBEBreastsMax/100
	ElseIf((UpdateCBBEBreasts <= fCBBEBreastsMin/100 && fCBBEBreastsMax >= fCBBEBreastsMin) || (UpdateCBBEBreasts >= fCBBEBreastsMin/100 && fCBBEBreastsMax < fCBBEBreastsMin))
		UpdateCBBEBreasts = fCBBEBreastsMin/100
	EndIf
	
	If((UpdateCBBEBreastFantasy >= fCBBEBreastFantasyMax/100 && fCBBEBreastFantasyMax >= fCBBEBreastFantasyMin) || (UpdateCBBEBreastFantasy <= fCBBEBreastFantasyMax/100 && fCBBEBreastFantasyMax < fCBBEBreastFantasyMin))
		UpdateCBBEBreastFantasy = fCBBEBreastFantasyMax/100
	ElseIf((UpdateCBBEBreastFantasy <= fCBBEBreastFantasyMin/100 && fCBBEBreastFantasyMax >= fCBBEBreastFantasyMin) || (UpdateCBBEBreastFantasy >= fCBBEBreastFantasyMin/100 && fCBBEBreastFantasyMax < fCBBEBreastFantasyMin))
		UpdateCBBEBreastFantasy = fCBBEBreastFantasyMin/100
	EndIf
	
	If((UpdateCBBEUltKirBody >= fCBBEUltKirBodyMax/100 && fCBBEUltKirBodyMax >= fCBBEUltKirBodyMin) || (UpdateCBBEUltKirBody <= fCBBEUltKirBodyMax/100 && fCBBEUltKirBodyMax < fCBBEUltKirBodyMin))
		UpdateCBBEUltKirBody = fCBBEUltKirBodyMax/100
	ElseIf((UpdateCBBEUltKirBody <= fCBBEUltKirBodyMin/100 && fCBBEUltKirBodyMax >= fCBBEUltKirBodyMin) || (UpdateCBBEUltKirBody >= fCBBEUltKirBodyMin/100 && fCBBEUltKirBodyMax < fCBBEUltKirBodyMin))
		UpdateCBBEUltKirBody = fCBBEUltKirBodyMin/100
	EndIf
	
	If(Update7BUpper != data.CurrentCBBE7BUpper)
		data.CurrentCBBE7BUpper = Update7BUpper
		UpdateBody = true
	EndIf
	If(Update7BLower != data.CurrentCBBE7BLower)
		data.CurrentCBBE7BLower = Update7BLower
		UpdateBody = true
	EndIf
	If(UpdateCBBEHips != data.CurrentCBBEHips)
		data.CurrentCBBEHips = UpdateCBBEHips
		UpdateBody = true
	EndIf
	If(UpdateCBBEBreastsSmall != data.CurrentCBBEBreastsSmall)
		data.CurrentCBBEBreastsSmall = UpdateCBBEBreastsSmall
		UpdateBody = true
	EndIf
	If(UpdateCBBECalf != data.CurrentCBBECalf)
		data.CurrentCBBECalf = UpdateCBBEHips
		UpdateBody = true
	EndIf
	If(UpdateCBBEChubbyLegs != data.CurrentCBBEChubbyLegs)
		data.CurrentCBBEChubbyLegs = UpdateCBBEChubbyLegs
		UpdateBody = true
	EndIf
	If(UpdateCBBEButtSmall != data.CurrentCBBEButtSmall)
		data.CurrentCBBEButtSmall = UpdateCBBEButtSmall
		UpdateBody = true
	EndIf
	If(UpdateCBBESlimThighs != data.CurrentCBBESlimThighs)
		data.CurrentCBBESlimThighs = UpdateCBBESlimThighs
		UpdateBody = true
	EndIf
	If(UpdateCBBEAppleCheeks != data.CurrentCBBEAppleCheeks)
		data.CurrentCBBEAppleCheeks = UpdateCBBEAppleCheeks
		UpdateBody = true
	EndIf
	If(UpdateCBBEBigButt != data.CurrentCBBEBigButt)
		data.CurrentCBBEBigButt = UpdateCBBEBigButt
		UpdateBody = true
	EndIf
	If(UpdateCBBEBreastWidth != data.CurrentCBBEBreastWidth)
		data.CurrentCBBEBreastWidth = UpdateCBBEBreastWidth
		UpdateBody = true
	EndIf
	If(UpdateCBBEChestDepth != data.CurrentCBBEChestDepth)
		data.CurrentCBBEChestDepth = UpdateCBBEChestDepth
		UpdateBody = true
	EndIf
	If(UpdateCBBEChubbyArms != data.CurrentCBBEChubbyArms)
		data.CurrentCBBEChubbyArms = UpdateCBBEChubbyArms
		UpdateBody = true
	EndIf
	If(UpdateCBBEForearmSize != data.CurrentCBBEForearmSize)
		data.CurrentCBBEForearmSize = UpdateCBBEForearmSize
		UpdateBody = true
	EndIf
	If(UpdateCBBEPushUp != data.CurrentCBBEPushUp)
		data.CurrentCBBEPushUp = UpdateCBBEPushUp
		UpdateBody = true
	EndIf
	If(UpdateCBBEBreastPerkiness != data.CurrentCBBEBreastPerkiness)
		data.CurrentCBBEBreastPerkiness = UpdateCBBEBreastPerkiness
		UpdateBody = true
	EndIf
	If(UpdateCBBEWaist != data.CurrentCBBEWaist)
		data.CurrentCBBEWaist = UpdateCBBEWaist
		UpdateBody = true
	EndIf
	If(UpdateCBBESSBBW2 != data.CurrentCBBESSBBW2)
		data.CurrentCBBESSBBW2 = UpdateCBBESSBBW2
		UpdateBody = true
	EndIf
	If(UpdateCBBEBreasts != data.CurrentCBBEBreasts)
		data.CurrentCBBEBreasts = UpdateCBBEBreasts
		UpdateBody = true
	EndIf
	If(UpdateCBBEBreastFantasy != data.CurrentCBBEBreastFantasy)
		data.CurrentCBBEBreastFantasy = UpdateCBBEBreastFantasy
		UpdateBody = true
	EndIf
	If(UpdateCBBEUltKirBody != data.CurrentCBBEUltKirBody)
		data.CurrentCBBEUltKirBody = UpdateCBBEUltKirBody
		UpdateBody = true
	EndIf
	If(UpdateCBBEGiantBelly != data.CurrentCBBEGiantBelly)
		;If(!data.Pred.HasKeyword(FV_ColdSteelBody) || !data.isDigesting)
			;bool performBellyUpdate = false
			If(data.Pred.GetValue(FV_CurrentPrey) as int == 0)
			;	performBellyUpdate = true
			;ElseIf(!data.Pred.HasKeyword(FV_ColdSteelBody))
			;	performBellyUpdate = true
			;EndIf
			;If(performBellyUpdate)
				data.CurrentCBBEGiantBelly = UpdateCBBEGiantBelly
				data.Pred.SetValue(FV_GiantBelly, data.CurrentCBBEGiantBelly)
				trace(self, "setting giant belly to " + data.Pred.GetValue(FV_GiantBelly))
				UpdateBody = true
			EndIf
		;EndIf
	EndIf
	If(UpdateBody)
		SetNewWeight(data)
		UpdateThiccnessMeter(data)
	EndIf
	UpdateSlim = 1-((Update7BUpper+UpdateCBBESSBBW2)/2)/(((fCBBE7BUpperMax-fCBBE7BUpperMin+fCBBESSBBW2Max-fCBBESSBBW2Min)/100)/2)
	If(UpdateSlim < 0)
		return 0
	ElseIf(UpdateSlim > 1.0)
		return 1.0
	EndIf
	return UpdateSlim
EndFunction

Function UpdateThiccnessMeter(WeightData data)
	Float UpdatedThiccnessMeter
	Int UpdatedMaxThiccness = 0
	If((iPlayerSliderType==1 && data.Pred == Game.GetPlayer()) || (iCompanionSliderType == 1 && data.Pred != Game.GetPlayer()))
		If((fABSlimMin-fABSlimMax) != 0)
			UpdatedThiccnessMeter += (fABSlimMax - data.CurrentABSlim*100)/(fABSlimMin - fABSlimMax)
			UpdatedMaxThiccness += 1
		EndIf
		if((fABBreastMin-fABBreastMax) != 0)
			UpdatedThiccnessMeter += (fABBreastMin - data.CurrentABBreast*100)/(fABBreastMin - fABBreastMax)
			UpdatedMaxThiccness += 1
		EndIf
		if((fABBreastHugeMin-fABBreastHugeMax) != 0)
			UpdatedThiccnessMeter += (fABBreastHugeMin - data.CurrentABBreastHuge*100)/(fABBreastHugeMin - fABBreastHugeMax)
			UpdatedMaxThiccness += 1
		EndIf
		if((fABThighSlimMin-fABThighSlimMax) != 0)
			UpdatedThiccnessMeter += (fABThighSlimMin - data.CurrentABThighSlim*100)/(fABThighSlimMin - fABThighSlimMax) 
			UpdatedMaxThiccness += 1
		EndIf
		If((fABNarrowWaistMin-fABNarrowWaistMax) != 0)
			UpdatedThiccnessMeter += (fABNarrowWaistMin - data.CurrentABNarrowWaist*100)/(fABNarrowWaistMin - fABNarrowWaistMax)
			UpdatedMaxThiccness += 1
		EndIf
		If((fABButtHugeMin-fABButtHugeMax) != 0)
			UpdatedThiccnessMeter += (fABButtHugeMin - data.CurrentABButtHuge*100)/(fABButtHugeMin - fABButtHugeMax)
			UpdatedMaxThiccness += 1
		EndIf
		If((fABBackWideMin-fABBackWideMax) != 0)
			UpdatedThiccnessMeter += (fABBackWideMin - data.CurrentABBackWide*100)/(fABBackWideMin - fABBackWideMax)
			UpdatedMaxThiccness += 1
		EndIf
		If((fABBellySizeMin-fABBellySizeMax) != 0)
			UpdatedThiccnessMeter += (fABBellySizeMin - data.CurrentABBellySize*100)/(fABBellySizeMin - fABBellySizeMax)
			UpdatedMaxThiccness += 1
		EndIf
		If((fABButtFlatMin-fABButtFlatMax) != 0)
			UpdatedThiccnessMeter += (fABButtFlatMin - data.CurrentABButtFlat*100)/(fABButtFlatMin - fABButtFlatMax)
			UpdatedMaxThiccness += 1
		EndIf
		If((fABButtStretchMin-fABButtStretchMax) != 0)
			UpdatedThiccnessMeter += (fABButtStretchMin - data.CurrentABButtStretch*100)/(fABButtStretchMin - fABButtStretchMax)
			UpdatedMaxThiccness += 1
		EndIf
		If((fABButtWideMin-fABButtWideMax) != 0)
			UpdatedThiccnessMeter += (fABButtWideMin - data.CurrentABButtWide*100)/(fABButtWideMin - fABButtWideMax)
			UpdatedMaxThiccness += 1
		EndIf
		If((fABHipsWideMin-fABHipsWideMax) != 0)
			UpdatedThiccnessMeter += (fABHipsWideMin - data.CurrentABHipsWide*100)/(fABHipsWideMin - fABHipsWideMax)
			UpdatedMaxThiccness += 1
		EndIf
		If((fABTorsoLargeMin-fABTorsoLargeMin) != 0)
			UpdatedThiccnessMeter += (fABTorsoLargeMin - data.CurrentABTorsoLarge*100)/(fABTorsoLargeMin - fABTorsoLargeMax)
			UpdatedMaxThiccness += 1
		EndIf
		If((fABWaistHeightMin-fABWaistHeightMax) != 0)
			UpdatedThiccnessMeter += (fABWaistHeightMin - data.CurrentABWaistHeight*100)/(fABWaistHeightMin - fABWaistHeightMax)
			UpdatedMaxThiccness += 1
		EndIf
		If((fABWaistSmoothMin-fABWaistSmoothMax) != 0)
			UpdatedThiccnessMeter += (fABWaistSmoothMin - data.CurrentABWaistSmooth*100)/(fABWaistSmoothMin - fABWaistSmoothMax)
			UpdatedMaxThiccness += 1
		EndIf
		If((fABWaistWideMin-fABWaistWideMax) != 0)
			UpdatedThiccnessMeter += (fABWaistWideMin - data.CurrentABWaistWide*100)/(fABWaistWideMin - fABWaistWideMax)
			UpdatedMaxThiccness += 1
		EndIf
	ElseIf((iPlayerSliderType==2 && data.Pred == Game.GetPlayer()) || (iCompanionSliderType == 2 && data.Pred != Game.GetPlayer()))
		If((fCBBE7BUpperMin - fCBBE7BUpperMax) != 0)
			UpdatedThiccnessMeter += (fCBBE7BUpperMin-data.CurrentCBBE7BUpper*100)/(fCBBE7BUpperMin - fCBBE7BUpperMax)
			UpdatedMaxThiccness += 1
		EndIf
		If((fCBBE7BLowerMin - fCBBE7BLowerMax) != 0)
			UpdatedThiccnessMeter += (fCBBE7BLowerMin - data.CurrentCBBE7BLower*100)/(fCBBE7BLowerMin - fCBBE7BLowerMax)
			UpdatedMaxThiccness += 1
		EndIf
		If((fCBBEBreastsSmallMin - fCBBEBreastsSmallMax) != 0)
			UpdatedThiccnessMeter += (fCBBEBreastsSmallMin - data.CurrentCBBEBreastsSmall*100)/(fCBBEBreastsSmallMin - fCBBEBreastsSmallMax)
			UpdatedMaxThiccness += 1
		EndIf
		If((fCBBEHipsMin - fCBBEHipsMax) != 0)
			UpdatedThiccnessMeter += (fCBBEHipsMin - data.CurrentCBBEHips*100)/(fCBBEHipsMin-fCBBEHipsMax)
			UpdatedMaxThiccness += 1
		EndIf
		If((fCBBECalfMin - fCBBECalfMax) != 0)
			UpdatedThiccnessMeter += (fCBBECalfMin - data.CurrentCBBECalf*100)/(fCBBECalfMin-fCBBECalfMax)
			UpdatedMaxThiccness += 1
		EndIf
		If((fCBBEChubbyLegsMin - fCBBEChubbyLegsMax) != 0)
			UpdatedThiccnessMeter += (fCBBEChubbyLegsMin - data.CurrentCBBEChubbyLegs*100)/(fCBBEChubbyLegsMin - fCBBEChubbyLegsMax)
			UpdatedMaxThiccness += 1
		EndIf
		If((fCBBEButtSmallMin - fCBBEButtSmallMax) != 0)
			UpdatedThiccnessMeter += (fCBBEButtSmallMin - data.CurrentCBBEButtSmall*100)/(fCBBEButtSmallMin - fCBBEButtSmallMax)
			UpdatedMaxThiccness += 1
		EndIf
		If((fCBBESlimThighsMin - fCBBESlimThighsMax) != 0)
			UpdatedThiccnessMeter += (fCBBESlimThighsMin - data.CurrentCBBESlimThighs*100)/(fCBBESlimThighsMin - fCBBESlimThighsMax)
			UpdatedMaxThiccness += 1
		EndIf
		If((fCBBEAppleCheeksMin - fCBBEAppleCheeksMax) != 0)
			UpdatedThiccnessMeter += (fCBBEAppleCheeksMin - data.CurrentCBBEAppleCheeks*100)/(fCBBEAppleCheeksMin - fCBBEAppleCheeksMax)
			UpdatedMaxThiccness += 1
		EndIf
		If((fCBBEBigButtMin - fCBBEBigButtMax) != 0)
			UpdatedThiccnessMeter += (fCBBEBigButtMin - data.CurrentCBBEBigButt*100)/(fCBBEBigButtMin - fCBBEBigButtMax)
			UpdatedMaxThiccness += 1
		EndIf
		If((fCBBEBreastWidthMin - fCBBEBreastWidthMax) != 0)
			UpdatedThiccnessMeter += (fCBBEBreastWidthMin - data.CurrentCBBEBreastWidth*100)/(fCBBEBreastWidthMin - fCBBEBreastWidthMax)
			UpdatedMaxThiccness += 1
		EndIf
		If((fCBBEChestDepthMin - fCBBEChestDepthMax) != 0)
			UpdatedThiccnessMeter += (fCBBEChestDepthMin - data.CurrentCBBEChestDepth*100)/(fCBBEChestDepthMin - fCBBEChestDepthMax)
			UpdatedMaxThiccness += 1
		EndIf
		If((fCBBEChubbyArmsMin - fCBBEChubbyArmsMax) != 0)
			UpdatedThiccnessMeter += (fCBBEChubbyArmsMin - data.CurrentCBBEChubbyArms*100)/(fCBBEChubbyArmsMin - fCBBEChubbyArmsMax)
			UpdatedMaxThiccness += 1
		EndIf
		If((fCBBEForearmSizeMin - fCBBEForearmSizeMax) != 0)
			UpdatedThiccnessMeter += (fCBBEForearmSizeMin - data.CurrentCBBEForearmSize*100)/(fCBBEForearmSizeMin - fCBBEForearmSizeMax)
			UpdatedMaxThiccness += 1
		EndIf
		If((fCBBEPushUpMin - fCBBEPushUpMax) != 0)
			UpdatedThiccnessMeter += (fCBBEPushUpMin - data.CurrentCBBEPushUp*100)/(fCBBEPushUpMin - fCBBEPushUpMax)
			UpdatedMaxThiccness += 1
		EndIf
		If((fCBBEBreastPerkinessMin - fCBBEBreastPerkinessMax) != 0)
			UpdatedThiccnessMeter += (fCBBEBreastPerkinessMin - data.CurrentCBBEBreastPerkiness*100)/(fCBBEBreastPerkinessMin - fCBBEBreastPerkinessMax)
			UpdatedMaxThiccness += 1
		EndIf
		If((fCBBEWaistMin - fCBBEWaistMax) != 0)
			UpdatedThiccnessMeter += (fCBBEWaistMin - data.CurrentCBBEWaist*100)/(fCBBEWaistMin - fCBBEWaistMax)
			UpdatedMaxThiccness += 1
		EndIf
		If((fCBBESSBBW2Min - fCBBESSBBW2Max) != 0)
			UpdatedThiccnessMeter += (fCBBESSBBW2Min - data.CurrentCBBESSBBW2*100)/(fCBBESSBBW2Min - fCBBESSBBW2Max)
			UpdatedMaxThiccness += 1
		EndIf
		If((fCBBEGiantBellyMin - fCBBEGiantBellyMax) != 0)
			UpdatedThiccnessMeter += (fCBBEGiantBellyMin - data.CurrentCBBEGiantBelly*100)/(fCBBEGiantBellyMin - fCBBEGiantBellyMax)
			UpdatedMaxThiccness += 1
		EndIf
		If((fCBBEBreastsMin - fCBBEBreastsMax) != 0)
			UpdatedThiccnessMeter += (fCBBEBreastsMin - data.CurrentCBBEBreasts*100)/(fCBBEBreastsMin - fCBBEBreastsMax)
			UpdatedMaxThiccness += 1
		EndIf
		If((fCBBEBreastFantasyMin - fCBBEBreastFantasyMax) != 0)
			UpdatedThiccnessMeter += (fCBBEBreastFantasyMin - data.CurrentCBBEBreastFantasy*100)/(fCBBEBreastFantasyMin - fCBBEBreastFantasyMax)
			UpdatedMaxThiccness += 1
		EndIf
		If((fCBBEUltKirBodyMin - fCBBEUltKirBodyMax) != 0)
			UpdatedThiccnessMeter += (fCBBEUltKirBodyMin - data.CurrentCBBEUltKirBody*100)/(fCBBEUltKirBodyMin - fCBBEUltKirBodyMax)
			UpdatedMaxThiccness += 1
		EndIf
	EndIf
	data.ThiccnessMeter = UpdatedThiccnessMeter/(UpdatedMaxThiccness as float)
	trace(self, "UpdatedThiccnessMeter: " + UpdatedThiccnessMeter + " UpdatedMaxThiccness: " + UpdatedMaxThiccness + "ThiccnessMeter: " + data.ThiccnessMeter)
EndFunction

Function ShapeSettingReset()
	fABSlimMin = MCM.GetModSettingFloat(sModNameMCM, "fABSlimThin:AtomicBeauty")
	fABSlimMax = MCM.GetModSettingFloat(sModNameMCM, "fABSlimThicc:AtomicBeauty")
	fABBreastMin = MCM.GetModSettingFloat(sModNameMCM, "fABBreastThin:AtomicBeauty")
	fABBreastMax = MCM.GetModSettingFloat(sModNameMCM, "fABBreastThicc:AtomicBeauty")
	fABBreastHugeMin = MCM.GetModSettingFloat(sModNameMCM, "fABBreastHugeThin:AtomicBeauty")
	fABBreastHugeMax = MCM.GetModSettingFloat(sModNameMCM, "fABBreastHugeThicc:AtomicBeauty")
	fABThighSlimMin = MCM.GetModSettingFloat(sModNameMCM, "fABThighSlimThin:AtomicBeauty")
	fABThighSlimMax = MCM.GetModSettingFloat(sModNameMCM, "fABThighSlimThicc:AtomicBeauty")
	fABNarrowWaistMin = MCM.GetModSettingFloat(sModNameMCM, "fABNarrowWaistThin:AtomicBeauty")
	fABNarrowWaistMax = MCM.GetModSettingFloat(sModNameMCM, "fABNarrowWaistThicc:AtomicBeauty")
	fABButtHugeMin = MCM.GetModSettingFloat(sModNameMCM, "fABButtHugeThin:AtomicBeauty")
	fABButtHugeMax = MCM.GetModSettingFloat(sModNameMCM, "fABButtHugeThicc:AtomicBeauty")
	fABBackWideMax = MCM.GetModSettingFloat(sModNameMCM, "fABBackWideThicc:AtomicBeauty")
	fABBackWideMin = MCM.GetModSettingFloat(sModNameMCM, "fABBackWideThin:AtomicBeauty")
	fABBellySizeMax = MCM.GetModSettingFloat(sModNameMCM, "fABBellySizeThicc:AtomicBeauty")
	fABBellySizeMin = MCM.GetModSettingFloat(sModNameMCM, "fABBellySizeThin:AtomicBeauty")
	fABButtFlatMax = MCM.GetModSettingFloat(sModNameMCM, "fABButtFlatThicc:AtomicBeauty")
	fABButtFlatMin = MCM.GetModSettingFloat(sModNameMCM, "fABButtFlatThin:AtomicBeauty")
	fABButtStretchMax = MCM.GetModSettingFloat(sModNameMCM, "fABButtStretchThicc:AtomicBeauty")
	fABButtStretchMin = MCM.GetModSettingFloat(sModNameMCM, "fABButtStretchThin:AtomicBeauty")
	fABButtWideMax = MCM.GetModSettingFloat(sModNameMCM, "fABButtWideThicc:AtomicBeauty")
	fABButtWideMin = MCM.GetModSettingFloat(sModNameMCM, "fABButtWideThin:AtomicBeauty")
	fABHipsWideMax = MCM.GetModSettingFloat(sModNameMCM, "fABHipsWideThicc:AtomicBeauty")
	fABHipsWideMin = MCM.GetModSettingFloat(sModNameMCM, "fABHipsWideThin:AtomicBeauty")
	fABTorsoLargeMax = MCM.GetModSettingFloat(sModNameMCM, "fABTorsoLargeThicc:AtomicBeauty")
	fABTorsoLargeMin = MCM.GetModSettingFloat(sModNameMCM, "fABTorsoLargeThin:AtomicBeauty")
	fABWaistHeightMax = MCM.GetModSettingFloat(sModNameMCM, "fABWaistHeightThicc:AtomicBeauty")
	fABWaistHeightMin = MCM.GetModSettingFloat(sModNameMCM, "fABWaistHeightThin:AtomicBeauty")
	fABWaistSmoothMax = MCM.GetModSettingFloat(sModNameMCM, "fABWaistSmoothThicc:AtomicBeauty")
	fABWaistSmoothMin = MCM.GetModSettingFloat(sModNameMCM, "fABWaistSmoothThin:AtomicBeauty")
	fABWaistWideMax = MCM.GetModSettingFloat(sModNameMCM, "fABWaistWideThicc:AtomicBeauty")
	fABWaistWideMin = MCM.GetModSettingFloat(sModNameMCM, "fABWaistWideThin:AtomicBeauty")
	
	fCBBE7BUpperMin = MCM.GetModSettingFloat(sModNameMCM, "fCBBE7BUpperThin:CBBE")
	fCBBE7BUpperMax = MCM.GetModSettingFloat(sModNameMCM, "fCBBE7BUpperThicc:CBBE")
	fCBBE7BLowerMin = MCM.GetModSettingFloat(sModNameMCM, "fCBBE7BLowerThin:CBBE")
	fCBBE7BLowerMax = MCM.GetModSettingFloat(sModNameMCM, "fCBBE7BLowerThicc:CBBE")
	fCBBEBreastsSmallMin = MCM.GetModSettingFloat(sModNameMCM, "fCBBEBreastsSmallThin:CBBE")
	fCBBEBreastsSmallMax = MCM.GetModSettingFloat(sModNameMCM, "fCBBEBreastsSmallThicc:CBBE")
	fCBBEHipsMin = MCM.GetModSettingFloat(sModNameMCM, "fCBBEHipsThin:CBBE")
	fCBBEHipsMax = MCM.GetModSettingFloat(sModNameMCM, "fCBBEHipsThicc:CBBE")
	fCBBECalfMin = MCM.GetModSettingFloat(sModNameMCM, "fCBBECalfThin:CBBE")
	fCBBECalfMax = MCM.GetModSettingFloat(sModNameMCM, "fCBBECalfThicc:CBBE")
	fCBBEChubbyLegsMin = MCM.GetModSettingFloat(sModNameMCM, "fCBBEChubbyLegsThin:CBBE")
	fCBBEChubbyLegsMax = MCM.GetModSettingFloat(sModNameMCM, "fCBBEChubbyLegsThicc:CBBE")
	fCBBEButtSmallMin = MCM.GetModSettingFloat(sModNameMCM, "fCBBEButtSmallThin:CBBE")
	fCBBEButtSmallMax = MCM.GetModSettingFloat(sModNameMCM, "fCBBEButtSmallThicc:CBBE")
	fCBBESlimThighsMin = MCM.GetModSettingFloat(sModNameMCM, "fCBBESlimThighsThin:CBBE")
	fCBBESlimThighsMax = MCM.GetModSettingFloat(sModNameMCM, "fCBBESlimThighsThicc:CBBE")
	fCBBEAppleCheeksMin = MCM.GetModSettingFloat(sModNameMCM, "fCBBEAppleCheeksThin:CBBE")
	fCBBEAppleCheeksMax = MCM.GetModSettingFloat(sModNameMCM, "fCBBEAppleCheeksThicc:CBBE")
	fCBBEBigButtMin = MCM.GetModSettingFloat(sModNameMCM, "fCBBEBigButtThin:CBBE")
	fCBBEBigButtMax = MCM.GetModSettingFloat(sModNameMCM, "fCBBEBigButtThicc:CBBE")
	fCBBEBreastWidthMin = MCM.GetModSettingFloat(sModNameMCM, "fCBBEBreastWidthThin:CBBE")
	fCBBEBreastWidthMax = MCM.GetModSettingFloat(sModNameMCM, "fCBBEBreastWidthThicc:CBBE")
	fCBBEChestDepthMin = MCM.GetModSettingFloat(sModNameMCM, "fCBBEChestDepthThin:CBBE")
	fCBBEChestDepthMax = MCM.GetModSettingFloat(sModNameMCM, "fCBBEChestDepthThicc:CBBE")
	fCBBEChubbyArmsMin = MCM.GetModSettingFloat(sModNameMCM, "fCBBEChubbyArmsThin:CBBE")
	fCBBEChubbyArmsMax = MCM.GetModSettingFloat(sModNameMCM, "fCBBEChubbyArmsThicc:CBBE")
	fCBBEForearmSizeMin = MCM.GetModSettingFloat(sModNameMCM, "fCBBEForearmSizeThin:CBBE")
	fCBBEForearmSizeMax = MCM.GetModSettingFloat(sModNameMCM, "fCBBEForearmSizeThicc:CBBE")
	fCBBEPushUpMin = MCM.GetModSettingFloat(sModNameMCM, "fCBBEPushUpThin:CBBE")
	fCBBEPushUpMax = MCM.GetModSettingFloat(sModNameMCM, "fCBBEPushUpThicc:CBBE")
	fCBBEBreastPerkinessMin = MCM.GetModSettingFloat(sModNameMCM, "fCBBEBreastPerkinessThin:CBBE")
	fCBBEBreastPerkinessMax = MCM.GetModSettingFloat(sModNameMCM, "fCBBEBreastPerkinessThicc:CBBE")
	fCBBEWaistMin = MCM.GetModSettingFloat(sModNameMCM, "fCBBEWaistThin:CBBE")
	fCBBEWaistMax = MCM.GetModSettingFloat(sModNameMCM, "fCBBEWaistThicc:CBBE")
	fCBBESSBBW2Min = MCM.GetModSettingFloat(sModNameMCM, "fCBBESSBBW2Thin:CBBE")
	fCBBESSBBW2Max = MCM.GetModSettingFloat(sModNameMCM, "fCBBESSBBW2Thicc:CBBE")
	fCBBEGiantBellyMin = MCM.GetModSettingFloat(sModNameMCM, "fCBBEGiantBellyThin:CBBE")
	fCBBEGiantBellyMax = MCM.GetModSettingFloat(sModNameMCM, "fCBBEGiantBellyThicc:CBBE")
	fCBBEBreastsMin = MCM.GetModSettingFloat(sModNameMCM, "fCBBEBreastsThin:CBBE")
	fCBBEBreastsMax = MCM.GetModSettingFloat(sModNameMCM, "fCBBEBreastsThicc:CBBE")
	fCBBEBreastFantasyMin = MCM.GetModSettingFloat(sModNameMCM, "fCBBEBreastFantasyThin:CBBE")
	fCBBEBreastFantasyMax = MCM.GetModSettingFloat(sModNameMCM, "fCBBEBreastFantasyThicc:CBBE")
	fCBBEUltKirBodyMin = MCM.GetModSettingFloat(sModNameMCM, "fCBBEUltKirBodyThin:CBBE")
	fCBBEUltKirBodyMax = MCM.GetModSettingFloat(sModNameMCM, "fCBBEUltKirBodyThicc:CBBE")
	MCM.RefreshMenu()
EndFunction

;End weight functions

;Begin custom events

Event FV_ConsumptionRegistryScript.OnSwallow(FV_ConsumptionRegistryScript akSender, Var[] akArgs)
	If(WeightModEnabled)
		trace(self, "  Recieved a swallow event.")
		Actor actorToCheck = akArgs[0] as Actor
		bool bLethalFlag = akArgs[1] as bool
		If(!bLethalFlag)
			trace(self, "  Non-lethal event does not affect Thicc Vore.")
		Else
			WeightData data = RetrieveFromWeightArray(0, actorToCheck)
			bool isExcluded = true
			If(data==NONE && actorToCheck.IsInFaction(CurrentCompanionFaction))
				int i = FV_ThiccExcludeList.Find(actorToCheck)
				
				;int i = 0
				;While(i<FV_ThiccExcludeList.GetSize())
					
				;	If(FV_ThiccExcludeList[i].CompanionName.GetActorReference() != actorToCheck && actorToCheck.HasKeyword(ActorTypeHuman))
				If(i < 0 && actorToCheck.HasKeyword(ActorTypeHuman))
					trace(self, "Companion is eligible for thicc vore.  Adding to array.")
					isExcluded = false
				EndIf
				;	i += 1
				;EndWhile
			ElseIf(data==NONE && actorToCheck == Game.GetPlayer())
				isExcluded = false
			EndIf
			If(data == NONE && !isExcluded)
				data = AddPred(actorToCheck)
				trace(self, data.PredName + " was added as a pred to Thicc Vore with an Index of " + data.Index)
			EndIf	
			If(data!=NONE)
				;FV_VoreHud.ShowActor(data.index, GetIsPlayer(data.Pred))
				Actor prey = akArgs[2] as Actor
				If(data.MeterDownCounter < 0 && !prey.HasKeyword(ActorTypeSynth) && !prey.HasKeyword(ActorTypeRobot))
					If(data.isDigesting == 0)					;Robots and synths provide no nutrition.  Do not block weight loss while they occupy the belly
						data.isDigesting = 1
					EndIf
					data.MeterDownCounter = 0
				EndIf
				FV_VoreHud.UpdateThiccStats(data.index, data.ThiccnessMeter, (data.FullnessMeter as float)/100, data.MeterDownCounter, GetIsPlayer(data.Pred))
			EndIf
		EndIf
	EndIf
EndEvent

Event FV_ConsumptionRegistryScript.OnVomit(FV_ConsumptionRegistryScript akSender, Var[] akArgs)
	WeightData data = RetrieveFromWeightArray(0, akArgs[0] as Actor)
	If(data!=NONE)
		If(data.Pred.GetValue(FV_CurrentPrey)==0)
			trace(self, "Recieved vomit event.")
			data.isDigesting = 0
		EndIf
	EndIf
EndEvent

Event FV_ConsumptionRegistryScript.OnDigest(FV_ConsumptionRegistryScript akSender, Var[] akArgs)
	WeightData data = RetrieveFromWeightArray(0, akArgs[0] as Actor)
	trace(self, "Recieved on digestion event.")
	
	If(data != NONE)
		If(data.Pred.GetValue(FV_IsActivePred)==1)
			int DigestEvent = akArgs[1] as int
			If(DigestEvent == 0)
				trace(self, "Prey is dead.  Adding to the fullness meter.")
				data.isDigesting = 1													;should be set during OnSwallow event, but this is a check to ensure meter reductions do not take place
				IncreaseFullnessMeter(data, akArgs[2] as Actor)							;hunger meter is updated and excess fat generated
			EndIf
	
			If(DigestEvent == 1 && data.Pred.GetValue(FV_CurrentPrey)<=0)
				trace(self, data.PredName + " no longer digesting")
				data.isDigesting = 0
			EndIf
		
			If(DigestEvent == 3 && data.Pred.GetValue(FV_IndigestionSeverityFlag) > 0 && data.excess > 0)
				data.excess = 0
			EndIf
		EndIf
	Else
		trace(self, " On Digest: Actor " + akArgs[0] as Actor + " was not recognized.  Digestion event ignored.")
	EndIf
EndEvent

Event FollowersScript.CompanionChange(FollowersScript akSender, Var[] akArgs)	;akArgs[0] => actor companion, akArgs[1] => bool iscompanion
	;search array for follower.  If labeled as pred, begin timers.  Adding to array handled during successful swallow events
	Actor companionChanged = akArgs[0] as Actor
	WeightData data = RetrieveFromWeightArray(0, companionChanged)
	Bool isCompanion = akArgs[1] as bool
	
	If(companionChanged.GetValue(FV_HasHadNukaAcid) == 1 && data == NONE)
		AddPred(companionChanged)
	ElseIf(isCompanion && data != NONE && WeightModEnabled)
		trace(self, " Companion picked up.  Starting timers.")
		
		If(data.CompanionLastPred)
			data.Pred.SetValue(FV_IsActivePred, 1)
			data.CompanionLastPred = false
			bEnableCompanionWeightChange = true
			BeginTimers(data)
			FV_VoreHud.UpdateThiccStats(data.index, data.ThiccnessMeter, (data.FullnessMeter as float)/100, data.MeterDownCounter, GetIsPlayer(data.Pred))
			;FV_VoreHud.ShowActor(data.index, GetIsPlayer(data.Pred))
			; If(data.AtomicBEnabled)
				; AtomicBeautyEnable(sCompanion, true, true)
			; ElseIf(data.CBBEEnabled)
				; CBBEEnable(sCompanion, true, true)
			; Else
				; AtomicBeautyEnable(sCompanion, false, true)
				; CBBEEnable(sCompanion, false, true)
			; EndIf
		Else
			bEnableCompanionWeightChange = false
		EndIf
	ElseIf(!isCompanion && data!= NONE)
		trace(self, " Companion dismissed.  Stopping weight timers.")
		
		If(data.Pred.GetValue(FV_IsActivePred)==1)								;set the companion's last known status as pred
			data.Pred.SetValue(FV_IsActivePred, 0)
			data.CompanionLastPred = True
			bEnableCompanionWeightChange = false							;Turn off switcher.  May end up making this a hidden switcher to hide toggle when no companion present
			;AtomicBeautyEnable(sCompanion, false, true)
			;CBBEEnable(sCompanion, false, true)
			FV_VoreHud.HideThiccActor(data.index)
		Else
			data.CompanionLastPred = False
		EndIf
		CancelTimer(data.Index)
		FV_VoreHud.HideThiccActor(data.index)
	EndIf
	
	int i = 0
	Bool TeleportRegister = false
	While(i < PredWeight.Length)
		If(PredWeight[i].Pred.IsInFaction(CurrentCompanionFaction))
			TeleportRegister = true
		EndIf
		i += 1
	EndWhile
	If(TeleportRegister)
		RegisterForPlayerTeleport()
	Else
		UnregisterForPlayerTeleport()
	EndIf
EndEvent

Function UsedLoseWeight(WeightData data)
	If(data!= NONE)
		
		If(data.Pred == Game.GetPlayer() && data.Pred.GetValue(FV_HasPlayedFormulaVMessage) as int == 0)
			FV_ThiccFormulaVPlayerMessage.Show()
			;debug.notification("You feel the Formula V warm up your stomach.  As the warmth spreads to the rest of your body, you notice your body begins to slim down.")
		;ElseIf(data.Pred.IsInFaction(CurrentCompanionFaction) && data.Pred.GetLeveledActorBase().GetSex()==1  && data.Pred.GetValue(FV_HasPlayedFormulaVMessage) as int == 0)
			;debug.notification(data.PredName + " remarks at how warm the Formula V makes her feel.  You notice her clothes are already starting to drape loosely on her.")
		ElseIf(data.Pred.IsInFaction(CurrentCompanionFaction)  && data.Pred.GetValue(FV_HasPlayedFormulaVMessage) as int == 0)
			FV_ThiccCompanion.Clear()
			FV_ThiccCompanion.ForceRefTo(data.Pred)
			FV_ThiccFormulaVCompanionMessage.Show()
			;debug.notification(data.PredName + " remarks at how warm the Formula V makes hin feel.  You notice his clothes are already starting to drape loosely on him.")
		EndIf
		If(data.Pred.GetValue(FV_HasPlayedFormulaVMessage) as int == 0)  						;prevent excess spamming when consuming multiple Formula V
			data.Pred.SetValue(FV_HasPlayedFormulaVMessage, 1)
		EndIf
		If(data.excess > 0)																	;stop excess gaining
			data.excess = 0
		EndIf
		data.MeterDownCounter -= 1
		data.FullnessMeter -= 20
		data.excess += iExcessLossAmount
		FV_VoreHud.UpdateThiccStats(data.index, data.ThiccnessMeter, (data.FullnessMeter as float)/100, data.MeterDownCounter)
	EndIf
EndFunction

;End custom events

;Begin timer functions

Event OnTimer(int TimerID)
	If(WeightModEnabled==True)
		WeightData data = RetrieveFromWeightArray(TimerID, NONE)
		If(data == NONE)
			trace(self, " OnTimer(): Error.  Data == NONE, TimerID: " + TimerID)
		Else
			If(data.Pred.GetValue(FV_UseFormulaV) as int > 0)
				data.Pred.ModValue(FV_UseFormulaV, -1)
				UsedLoseWeight(data)
				If(data.Pred.GetValue(FV_UseFormulaV) as int == 0)
					data.Pred.SetValue(FV_HasPlayedFormulaVMessage, 0)
				EndIf
			EndIf
			If(data.MeterModCounter<=0)
				UpdateMeterDownCounterOnTimer(data)
			Else
				If(data.Pred.IsInCombat())
					data.MeterModCounter -= CombatDownCounter
				Else
					data.MeterModCounter -= NormalDownCounter
				EndIf
			EndIf
		
			If(data.FullnessMeterCounter<=0)
				UpdateFullnessMeterOnTimer(data)
			Else
				If(data.Pred.IsInCombat())
					data.FullnessMeterCounter += (data.MeterDownCounter*CombatDownCounter)
				Else
					data.FullnessMeterCounter += data.MeterDownCounter
				EndIf
			EndIf
		
			If(data.BodyUpdateCounter<=0)
				UpdateBodyOnTimer(data)
			Else
				If(data.Pred.IsInCombat())
					data.BodyUpdateCounter -= (data.BodyDownCounter*CombatDownCounter)
				Else
					data.BodyUpdateCounter -= data.BodyDownCounter
				EndIf
			EndIf
		
			If(data.excess>0)
				UpdateBodyOnTimer(data)
				data.excess -= 1
			ElseIf(data.excess < 0)
				UpdateBodyOnTimer(data)
				data.excess += 1
			EndIf
		
			StartTimer(UpdateRate, TimerID)
		EndIf
	EndIf
	If(TimerID == ResetHelpMessageTimerID)
		Message.ResetHelpMessage("Sliders")
	EndIf
EndEvent

Function UpdateMeterDownCounterOnTimer(WeightData data)
	If(data.Pred.GetValue(FV_IsActivePred)==1)
		If(!data.isDigesting)																							;freezes decrementing the meter modifier when pred has prey in stomach
			If(data.MeterDownCounter > MinMeterDownCounter)
				data.MeterDownCounter -= 1
				trace(self, "Pred: " + data.PredName + " : MetereDownCounter: " + data.MeterDownCounter)
				FV_VoreHud.UpdateThiccStats(data.index, data.ThiccnessMeter, (data.FullnessMeter as float)/100, data.MeterDownCounter)
			Else
				data.MeterDownCounter = MinMeterDownCounter
			EndIf
		EndIf
		data.MeterModCounter = ((MeterModRate*60)/UpdateRate) as int
	EndIf
EndFunction

Function UpdateFullnessMeterOnTimer(WeightData data)
	If(data.Pred.GetValue(FV_IsActivePred)==1)
		If(!data.isDigesting)												;meter can move up and down when not digesting
			If((data.FullnessMeter - FullnessMeterDecrement) > 100)			;should never happen.
				data.FullnessMeter = 100
			ElseIf((data.FullnessMeter - FullnessMeterDecrement) < 0)
				data.FullnessMeter = 0
			Else
				data.FullnessMeter -= FullnessMeterDecrement
				trace(self, " Pred: " + data.PredName + " : FullnessMeter: " + data.FullnessMeter)
			EndIf
			data.Pred.SetValue(FV_FullnessMeter, data.FullnessMeter)
		EndIf

		;Fullness meter messages and special effects
		If(data.FullnessMeter <= 10 && data.FullnessMeter > 0)
			data.BodyDownCounter = 4
			If(!data.Pred.HasPerk(FV_HungerStaggerResist))
				data.Pred.AddPerk(FV_HungerStaggerResist)
			EndIf
			If(Utility.RandomInt() >= 30 && data.FullnessMeter <= 10  && data.HasPlayedHungerMessage4)
				MessagePlay(4, data)
				data.HasPlayedHungerMessage4 = True
			EndIf
		EndIf
		If(data.FullnessMeter <=30 && data.FullnessMeter > 10)
			data.BodyDownCounter = 3
			If(!data.Pred.HasPerk(FV_HungerStaggerResist))
				data.Pred.AddPerk(FV_HungerStaggerResist)
			EndIf
			If(Utility.RandomInt() >= 80 && data.HasPlayedHungerMessage3)
				MessagePlay(3, data)
				data.HasPlayedHungerMessage3 = True
			EndIf
		EndIf
		If(data.FullnessMeter <= 40 && !data.Pred.HasPerk(FV_HungerSpeed))
			trace(self, "Pred: " + data.PredName + " : speed increase due to hunger.")
			data.Pred.AddPerk(FV_HungerSpeed)
		EndIf
		If(data.FullnessMeter <= 50 && data.FullnessMeter > 30)
			data.BodyDownCounter = 2
			If(Utility.RandomInt()>=90 && !data.HasPlayedHungerMessage2)
				MessagePlay(2, data)
				data.HasPlayedHungerMessage2 = True
			EndIf
			data.HasPlayedHungerMessage3 = False
			data.HasPlayedHungerMessage4 = False
		EndIf
		If(data.FullnessMeter <= 70 && data.FullnessMeter > 50)
			data.BodyDownCounter = 1
			If(!data.HasPlayedHungerMessage1)
				MessagePlay(1, data)
				data.HasPlayedHungerMessage1 = True
			EndIf
			data.HasPlayedHungerMessage2 = False
			data.HasPlayedHungerMessage3 = False
			data.HasPlayedHungerMessage4 = False
		EndIf
		If(data.MeterDownCounter > 0)
			data.BodyDownCounter += data.MeterDownCounter/2									;increase the frequency of how often the body updates as the hunger sets in.
		EndIf
		If(data.FullnessMeter > 70)
			data.BodyDownCounter = 1
		EndIf
		If(data.Pred.HasPerk(FV_HungerSpeed) && data.FullnessMeter > 40)
			data.Pred.RemovePerk(FV_HungerSpeed)
		EndIf
		If(data.Pred.HasPerk(FV_HungerStaggerResist) && data.FullnessMeter > 30)
			data.Pred.RemovePerk(FV_HungerStaggerResist)
		EndIf
		If(data.FullnessMeter>=80)
			data.HasPlayedHungerMessage1=False
			data.HasPlayedHungerMessage2=False
			data.HasPlayedHungerMessage3=False
			data.HasPlayedHungerMessage4=False
		EndIf
		
		FV_VoreHud.UpdateThiccStats(data.index, data.ThiccnessMeter, (data.FullnessMeter as float)/100, data.MeterDownCounter)
		
		data.FullnessMeterCounter = ((MeterRate*60)/UpdateRate) as int
	EndIf
EndFunction

Function UpdateBodyOnTimer(WeightData data)
	ActorBase:BodyWeight CurrentSettings = GetCurrentWeight(data.Pred)
	Float UpdateThin = CurrentSettings.Thin
	Float TimerChangeValue = 0
	Int SliderType = GetSliderType(data.Pred)
	If(data.Pred.GetValue(FV_IsActivePred)==1)
		trace(self, " UpdateBodyOnTimer: " + data.PredName)
		If(SliderType == 1 && data.Pred.GetLeveledActorBase().GetSex()==1)
			UpdateThin = UpdateAtomicB(data, UpdateThin)
		ElseIf(SliderType == 2 && data.Pred.GetLeveledActorBase().GetSex()==1)
			UpdateThin = UpdateCBBE(data, UpdateThin)
		Else
			If(data.excess > 0)
				TimerChangeValue = ExcessChangeValue
			ElseIf(data.excess < 0)
				TimerChangeValue = -1*ExcessChangeValue
			ElseIf(data.FullnessMeter <= 100 && data.FullnessMeter > 90)
				TimerChangeValue = BodyModValue
			ElseIf(data.FullnessMeter <= 60 && data.FullnessMeter >= 0)
				TimerChangeValue = -1*BodyModValue
			EndIf
			UpdateThin = UpdateThin - TimerChangeValue
		EndIf
		If(UpdateThin <= 0)
			UpdateThin = 0
		EndIf
		
		If(UpdateThin >= 1.0)
			UpdateThin = 1.0
		EndIf
	
		If(SliderType == 0 || data.Pred.GetLeveledActorBase().GetSex()==0)
			;Vanilla triangle updates
			data.CurrentThin = UpdateThin
			data.CurrentMuscular = (1-UpdateThin)*MFRatio/100
			data.CurrentLarge = (1-UpdateThin-data.CurrentMuscular)
			data.ThiccnessMeter = data.CurrentLarge
			SetNewWeight(data)
		EndIf
		FV_VoreHud.UpdateThiccStats(data.index, data.ThiccnessMeter, (data.FullnessMeter as float)/100, data.MeterDownCounter)
		If(UpdateThin <= 0.05 && !data.HasPlayedThiccMessage1)
			MessagePlay(20, data)										;play second skin thicc message
			data.HasPlayedThiccMessage1 = true
			data.HasPlayedThinMessage1 = false
		EndIf
		If(UpdateThin >= 0.25 && UpdateThin < 0.5)
			If(!data.HasPlayedThiccMessage2 && data.HasPlayedThinMessage1)
				MessagePlay(21, data)
				data.HasPlayedThiccMessage2 = true
			ElseIf(!data.HasPlayedThinMessage1 && data.HasPlayedThiccMessage2)
				MessagePlay(10, data)
				data.HasPlayedThinMessage1 = true
			EndIf
			data.HasPlayedThinMessage2 = false
			data.HasPlayedThiccMessage1 = false
		EndIf
		If(UpdateThin >= 0.5 && UpdateThin < 0.75)
			If(!data.HasPlayedThiccMessage3 && data.HasPlayedThinMessage2)
				MessagePlay(22, data)
				data.HasPlayedThiccMessage3 = true
			ElseIf(!data.HasPlayedThinMessage2 && data.HasPlayedThiccMessage3)
				MessagePlay(11, data)
				data.HasPlayedThinMessage2 = true
			EndIf
			data.HasPlayedThinMessage3 = false
			data.HasPlayedThiccMessage2 = false
		EndIf
		If(UpdateThin >= 0.75 && UpdateThin < 0.95)
			If(!data.HasPlayedThiccMessage4 && data.HasPlayedThinMessage3)
				MessagePlay(23, data)
				data.HasPlayedThiccMessage4 = true
			ElseIf(!data.HasPlayedThinMessage3 && data.HasPlayedThiccMessage4)
				MessagePlay(12, data)
				data.HasPlayedThinMessage3 = true
			EndIf
			data.HasPlayedThinMessage4 = false
			data.HasPlayedThiccMessage3 = false
		EndIf
		If(UpdateThin >= 0.95)
			If(!data.HasPlayedThinMessage4)
				MessagePlay(13, data)
				data.HasPlayedThinMessage4 = true
			EndIf
			data.HasPlayedThiccMessage4 = false
		EndIf
		If(data.BodyUpdateCounter <= 0)
			data.BodyUpdateCounter = ((BodyUpdateRate*60)/UpdateRate) as int
		EndIf
	EndIf
EndFunction

bool Function trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, WeightData data = NONE) debugOnly
	;we are sending callingObject so we can in the future route traces to different logs based on who is calling the function
	string logName = "ThiccVore"
	debug.OpenUserLog(logName)
	If(data != NONE)
		debug.TraceUser(logName, CallingObject + ": Outputting struct information.", aiSeverity)
		RETURN debug.TraceUser(logName, CallingObject + ": " + data, aiSeverity)
	Else
		RETURN debug.TraceUser(logName, CallingObject + ": " + asTextToPrint, aiSeverity)
	EndIf
EndFunction