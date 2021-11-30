Scriptname FV_VoreSurvivalScript extends Quest conditional


;**************************************************************************************************
;**************************************    SUSTENANCE EFFECTS  *******************************
;**************************************************************************************************


Hardcore:HC_ManagerScript Property HC_Manager Auto Const Mandatory
FV_ConsumptionRegistryScript Property FV_ConsumptionRegistry Auto Const Mandatory
FV_ActorDataScript Property FV_ActorData Auto Const Mandatory

float Property DiseaseRiskVoreAmount = 0.05 auto
{how much % chance does this event add to the DiseaseRiskPool}

Actor Property PlayerRef Auto Const Mandatory
GlobalVariable Property FV_VoreCoreToggle Auto Const Mandatory
{GAZ: Determines if Vore affects Survival mode or not. Not sure why you'd turn this off, but you can.}
Perk Property FV_VoreRegen02 Auto Const Mandatory
Perk Property FV_VoreRegen03 Auto Const Mandatory
	
int FoodPoolPerSlot
int iHealthToRestore = 0
int iRegenID = 1
float fBaseHealthRegen = 0.0

;GAZ: We have no OnInit or PlayerLoadGame events here, because the registry calls this script instead. I did this because there is no advantage to this script beginning operations before Registry and it saves two registers.

Function RegisterForVoreSurvival(Bool abRegister)
{GAZ: I wrote this so that I could maybe make a single On/Off switch for the mod in the future. The boolean is not "If Survival is on", this is "If the mod is on."}

	If abRegister
		RegisterForRemoteEvent(PlayerRef, "OnPlayerLoadGame")
		RegisterForCustomEvent(FV_ConsumptionRegistry, "OnDigest")
		RegisterForPlayerSleep()
		RegisterForPlayerWait()
		SetMCMVariables()
	Else
		UnregisterForRemoteEvent(PlayerRef, "OnPlayerLoadGame")
		UnregisterForCustomEvent(FV_ConsumptionRegistry, "OnDigest")
		UnregisterForPlayerSleep()
		UnregisterForPlayerWait()
	EndIf

EndFunction

Function SetMCMVariables()
	FoodPoolPerSlot = MCM.GetModSettingInt("FalloutVore", "iFoodPoolPerSlot:Hardcore")
EndFunction

Event FV_ConsumptionRegistryScript.OnDigest(FV_ConsumptionRegistryScript akSender, Var[] akArgs)			;akArgs[0] = CurrentPred [1] = digestion stage (0- start) [2] CurrentPrey
	
	If(akArgs[0] as actor == PlayerRef && akArgs[1] as int == 0 && Game.GetDifficulty() == 6)		;Check for player, a prey has just died, and that HC is set to on
		HC_Manager.trace(self, " Player has begun to digest someone and is in Survival. Giving RiskEvent and FoodPool.")
		If FV_VoreCoreToggle.GetValue() as Int == 1
			HC_Manager.ModFoodPoolAndUpdateHungerEffects(FV_ActorData.EvaluateSlots(akArgs[2] as Actor)*FoodPoolPerSlot)
			HC_Manager.HandleDiseaseRiskEvent(DiseaseRiskVoreAmount)
		EndIf
	ElseIf(akArgs[0] as actor == PlayerRef && akArgs[1] as int == 3 && Game.GetDifficulty() == 6)
		If(PlayerRef.HasPerk(FV_VoreRegen03))
			iHealthToRestore += (PlayerRef.GetBaseValue(Game.GetHealthAV())*0.1) as int
		ElseIf(PlayerRef.HasPerk(FV_VoreRegen02))
			iHealthToRestore += (PlayerRef.GetBaseValue(Game.GetHealthAV())*0.06) as int
		EndIf
		If(iHealthToRestore > 0)
			fBaseHealthRegen = iHealthToRestore as float
			;start timer to restore the health over 10 seconds.  Timer will add one health everytime it fires
			StartTimer(10/fBaseHealthRegen, iRegenID)
		EndIf
	EndIf
EndEvent

Event OnPlayerWaitStart(float afWaitStartTime, float afDesiredWaitEndTime)
	If(iHealthToRestore > 0)
		PlayerRef.RestoreValue(Game.GetHealthAV(), iHealthToRestore)
		CancelTimer(iRegenID)
		iHealthToRestore = 0
	EndIf
EndEvent

Event OnPlayerSleepStart(float afSleepStartTime, float afDesiredSleepEndTime, ObjectReference akBed)
	If(iHealthToRestore > 0)
		PlayerRef.RestoreValue(Game.GetHealthAV(), iHealthToRestore)
		CancelTimer(iRegenID)
		iHealthToRestore = 0
	EndIf
EndEvent

Event OnTimerGameTime(Int aiTimerID)
	If(aiTimerID == iRegenID && iHealthToRestore > 0)
		PlayerRef.RestoreValue(Game.GetHealthAV(), 1)
		iHealthToRestore -= 1
		If(iHealthToRestore > 0)
			StartTimerGameTime(10/fBaseHealthRegen, iRegenID)
		EndIf
	EndIf
EndEvent