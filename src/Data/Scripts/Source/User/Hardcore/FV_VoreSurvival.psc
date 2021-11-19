Scriptname Hardcore:FV_VoreSurvival extends Quest conditional


;**************************************************************************************************
;**************************************    SUSTENANCE EFFECTS  *******************************
;**************************************************************************************************


Hardcore:HC_ManagerScript Property HC_Manager Auto
FV_ConsumptionRegistryScript Property FV_ConsumptionRegistry Auto

GlobalVariable Property HC_Rule_VoreEffects const Auto Mandatory
GlobalVariable Property FV_VoreCoreToggle Auto Mandatory

ActorValue Property HC_CannibalEffect const auto mandatory
{Autofill; 0 = normal, 1 = has ravenous hunger (recently ate a corpse)}	
ActorValue Property HC_VoreEffect_FV_ const auto mandatory
{Autofill; 0 = normal, 1 = has voracious desires (recently ate prey)}
Potion Property HC_Vore_VoraciousDesire_FV_ const auto mandatory
{Autofill; potion that has the Voracious Desire effect - conditioned on AV HC_VoreEffect being 1}

Message Property HC_Vore_Msg_VoraciousDesire_EatPrey_FV_ const auto mandatory
{autofill; message to display when eating a prey and gaining Voracious Desire}

float Property DiseaseRiskVoreAmount = 0.05 const auto
{how much % chance does this event add to the DiseaseRiskPool}

Perk Property FV_VoreRegen02 Auto
Perk Property FV_VoreRegen03 Auto

message EffectMessageToShow
	
Actor PlayerRef

bool bHardcoreIsRunning = false
bool bPlayerIsPred = false
int FoodPoolPerSlot
int iHealthToRestore = 0
int iRegenID = 1
float fBaseHealthRegen = 0.0
float reduceFactor
float fTimeInterval

Event OnInit()
	PlayerRef = Game.GetPlayer()
	RegisterForRemoteEvent(PlayerRef, "OnDifficultyChanged")
	If(Game.GetDifficulty() == 6 && FV_VoreCoreToggle.GetValue() == 1)
		HC_Manager.trace(self, "OnInit() - Difficulty is set to Survival. Starting up Vore Survival...")
		HC_Rule_VoreEffects.SetValue(1)
		StartupHardcore()
	EndIf
	
	debug.trace("Vore Survival for Fallout Vore 3.0 initialized.")
EndEvent

Event Actor.OnDifficultyChanged(actor aSender, int aOldDifficulty, int aNewDifficulty)
	HC_Manager.trace(self, "OnDifficultyChanged() aOldDifficulty, aNewDifficulty: " + aOldDifficulty + ", " + aNewDifficulty)
	if (aOldDifficulty != 6) && (aNewDifficulty == 6)
		HC_Manager.trace(self, "  Player wants hardcore mode...")
		StartupHardcore()
	elseif (aOldDifficulty == 6) && (aNewDifficulty != 6)
		HC_Manager.trace(self, "  Player no longer wants hardcore mode...")
		ShutdownHardcore()
	endif

EndEvent

Event Actor.OnPlayerLoadGame(Actor akSender)
	SetMCMVariables()
	
	debug.trace("Vore Survival for Fallout Vore 3.0 loaded.")
EndEvent

Function SetMCMVariables()
	reduceFactor = MCM.GetModSettingFloat("FalloutVore", "fReduceFactor:Hardcore")
	FoodPoolPerSlot = MCM.GetModSettingInt("FalloutVore", "iFoodPoolPerSlot:Hardcore")
EndFunction

Event FV_ConsumptionRegistryScript.OnDigest(FV_ConsumptionRegistryScript akSender, Var[] akArgs)			;akArgs[0] = CurrentPred [1] = digestion stage (0- start) [2] CurrentPrey
	
	If(akArgs[0] as actor == PlayerRef && akArgs[1] as int == 0 && Game.GetDifficulty() == 6)		;Check for player, a prey has just died, and that HC is set to on
		HC_Manager.trace(self, " Player has begun to digest someone.")
		If(PlayerRef.GetValue(HC_CannibalEffect) > 0)
			HC_Manager.CureRavenousHunger()
		EndIf
		If(PlayerRef.GetValue(HC_VoreEffect_FV_) <= 0 && FV_VoreCoreToggle.GetValue() == 1)			;If the player isn't a hardcore pred and the feature is toggled on
			bPlayerIsPred = true
			PlayerRef.SetValue(HC_VoreEffect_FV_, 1)
			HC_Vore_Msg_VoraciousDesire_EatPrey_FV_.Show()
		EndIf
		If(PlayerRef.GetValue(HC_VoreEffect_FV_) > 0)
			;modpool is increased for every slot a prey would occupy
			playerRef.EquipItem(HC_Vore_VoraciousDesire_FV_, abSilent = true) ;re-up this, it's effects last fo 9999 days but conditioned on actor value
			HC_Manager.ModFoodPoolAndUpdateHungerEffects(FV_ConsumptionRegistry.EvaluateSlotsUsed(akArgs[2] as Actor)*FoodPoolPerSlot)
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

int Function CheckBasecost(int Basecost)
	If(BaseCost > 0 && PlayerRef.GetValue(HC_VoreEffect_FV_) > 0)
		int reducecost = Math.floor(BaseCost * reduceFactor) as int
		debug.notification("This food doesn't satisfy you as much as need.")
		HC_Manager.trace(self, " Player has Voracious Desire.  Reducing basecost of food.  " + reducecost)
		return reducecost
	EndIf
	return Basecost
EndFunction

Bool Function IsPred()
	If(PlayerRef.GetValue(HC_VoreEffect_FV_) == 1)
		return true
	EndIf
	return false
EndFunction

Function StartupHardcore()
	If(FV_VoreCoreToggle.GetValue()==1)
		If(!bHardCoreIsRunning)
			HC_Manager.trace(self, "StartupHardcore() Vore Survival")
			RegisterForRemoteEvent(PlayerRef, "OnPlayerLoadGame")
			RegisterForCustomEvent(FV_ConsumptionRegistry, "OnDigest")
			RegisterForPlayerSleep()
			RegisterForPlayerWait()
			If(bPlayerIsPred)
				PlayerRef.SetValue(HC_VoreEffect_FV_, 1)
				playerRef.EquipItem(HC_Vore_VoraciousDesire_FV_, abSilent = true)
			EndIf
			HC_Manager.trace(self, "  StartupHardcore(): Vore Survival is now running.")
			SetMCMVariables()
			HC_Rule_VoreEffects.SetValue(1)
		Else	
			HC_Manager.trace(self, "  StartupHardcore(): Vore Survival was already running.")
		EndIf
		bHardcoreIsRunning = true
	Else
		HC_Manager.trace(self, "  StartupHardcore(): Vore Survival not turned on. BAIL OUT.  HC_Rule_VoreEffects: " + FV_VoreCoreToggle.GetValue() as int + "  Game Difficult: " + Game.GetDifficulty() as int)
		bHardcoreIsRunning = false
	EndIf
EndFunction

Function ShutdownHardcore()
	HC_Manager.trace(self, "ShutdownHardcore()")
	UnRegisterForRemoteEvent(PlayerRef, "OnPlayerLoadGame") ;for not disabling the sleep message.
	UnRegisterForCustomEvent(FV_ConsumptionRegistry, "OnDigest")
	UnRegisterForPlayerSleep()
	UnRegisterForPlayerWait()
	If(bPlayerIsPred)
		CureVoraciousDesire()
		bPlayerIsPred = true			;reset to true for tracking purposes.  CureVoraciousDesire will set it to false
	Else
		CureVoraciousDesire()
	EndIf
	bHardcoreIsRunning = false
	HC_Rule_VoreEffects.SetValue(0)
	HC_Manager.trace(self, "  ShutdownHardcore(): Vore Survival is no longer running.")
EndFunction

Function ResetVoreSurvival()
	Bool TurnOnHardcore = IsVoreSurvivalRunning()
	ShutdownHardcore()
	If(TurnOnHardcore)
		StartupHardcore()
		debug.messagebox("Hardcore Vore Survival Reset.")
	Else
		debug.messagebox("Hardcore not running.  All values turned to initial.")
	EndIf
EndFunction

Bool Function IsVoreSurvivalRunning()
	return bHardcoreIsRunning
EndFunction

; Called from ShutdownHardcore() and from HC_CureVoraciousDesire
Function CureVoraciousDesire()
	HC_Manager.trace(self, "CureVoraciousDesire(): Setting HC_VoreEffect_FV_ actor value to 0")
	playerRef.SetValue(HC_VoreEffect_FV_, 0)
	bPlayerIsPred = false
EndFunction

Event OnTimerGameTime(Int aiTimerID)
	If(aiTimerID == iRegenID && iHealthToRestore > 0)
		PlayerRef.RestoreValue(Game.GetHealthAV(), 1)
		iHealthToRestore -= 1
		If(iHealthToRestore > 0)
			StartTimerGameTime(10/fBaseHealthRegen, iRegenID)
		EndIf
	EndIf
EndEvent