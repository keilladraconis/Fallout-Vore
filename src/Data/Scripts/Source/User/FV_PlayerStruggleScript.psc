Scriptname FV_PlayerStruggleScript extends Quest

ActorValue Property Health Auto
ActorValue Property FV_AcidResistance Auto
ActorValue Property FV_AcidStrength Auto
ActorValue Property FV_BonusPreyXP Auto
ActorValue Property FV_EscapeChance Auto
ActorValue Property FV_PreyLevel Auto
ActorValue Property FV_PredLevel Auto
ActorValue Property FV_StomachStrength Auto

Float Property BaseTimerTime = 10.0 AutoReadOnly
Float Property BaseXPGain = 15.0 AutoReadOnly

GlobalVariable Property FV_VoreLevelPoints Auto

Message Property FV_HelpStruggleMessage Auto

Perk Property FV_GetOutofHere01 Auto
Perk Property FV_GetOutofHere02 Auto
Perk Property FV_GetOutofHere03 Auto

ReferenceAlias Property FV_PlayersPredAlias Auto

String[] Property BeginNotifications Auto
String[] Property SuccessNotifications Auto
String[] Property FailNotifications Auto
String[] Property FailLowLevelNotification Auto
String[] Property DeathNotifications Auto
String[] Property EscapeNotifications Auto
String[] Property PredDeadNotifications Auto
String[] Property SecondWindNotifications Auto

FV_ConsumptionRegistryScript Property FV_ConsumptionRegistry Auto
FV_VoreHudScript Property FV_VoreHud Auto
FV_LevelUpManagerScript Property FV_LevelUpManager Auto

Actor ActorPred
Actor PlayerRef

Bool bProcessingControl = false
Bool bAllowInput = false
Bool bHasPlayedHelp = false
Bool bHudActive

Float fEncounterDifficulty = 1.0	;difficulty should always be a 1 star minimum
Float fPredAcidDamage
Int iCurrentSequence
Int iLevel
Int iLevelEscape
Int iLevelReached
Int ilevelZeroFailed
Int iNumberCorrect
Int iPlayerIndex
;struggle timer IDs
Int iStruggleTimerID = 1
Int iStruggleDelayID = 2
Int iStruggleCountDownID = 3
Int iStruggleAttemptHUDdelayID = 4
Int iStruggleStartStageID = 5
Int iSecondWindID = 6

;These Stage values are keyed to identical IDs in Vore Hud actionscript.  Any update here must be updated in the actionscript
Int iStruggleStageBegin = 0
Int iStruggleStageFinished = 1
Int iStruggleStageCleanUp = 2
Int iStruggleStageDisplaySequence = 3
;these are deprecated and unnecessary.  Remove before release
Int iStruggleStageAdvancedLevel = 4
Int iStruggleStageRecededLevel = 5

;Flag values for when the HUD is delayed during stage changed
Int iHudDelayFlag = -1
Int iDelayHudStageAlive = 0
Int iDelayHudStageEscape = 1
Int iDelayHudStageDead = 2

String sBack = "Back"
String sForward = "Forward"
String sStrafeLeft = "StrafeLeft"
String sStrafeRight = "StrafeRight"
String sJump = "Jump"
String sSneak = "Sneak"
String sQuickKeyUp = "QuickkeyUp"
String sQuickKeyDown = "QuickkeyDown"
String sQuickKeyLeft = "QuickkeyLeft"
String sQuickKeyRight = "QuickkeyRight"
String sUp = "Up"
String sDown = "Down"
String sLeft = "Left"
String sRight = "Right"

Struct BoundKeys
	Int iAltKeyID
	Int iKeyID
	Float fDifficultyRequired
	String sKeyName
	String sAltKeyName		;used for controller inputs
EndStruct

String[] ControlString
BoundKeys[] ControlBindings
String[] KeySequence
String[] QuickKeyCheat

Event OnInit()
	PlayerRef = Game.GetPlayer()
	;KeySequence = new BoundKeys[0]
	KeySequence = new String[0]
	KeySequence.clear()
	ControlString = new String[0]
	ControlString.clear()
	QuickKeyCheat = new String[4]
	QuickKeyCheat.add(sUp)
	QuickKeyCheat.add(sDown)
	QuickKeyCheat.add(sLeft)
	QuickKeyCheat.add(sRight)
	InitializeKeyArray()
	;RegisterForMenuOpenCloseEvent("PauseMenu")
EndEvent

;Event OnMenuOpenCloseEvent(string asMenuName, bool abOpening)
;	If(asMenuName == "PauseMenu" && !abOpening)
		;UpdateMappedKeys()
;	EndIf
;EndEvent

Function InitializeKeyArray()
	;ANY CHANGE TO THESE WILL REQUIRE UPDATING ACTIONSCRIPT CODE IN VORE HUD
	ControlBindings = new BoundKeys[0]
	ControlBindings.clear()
	UpdateControlBindings(sBack, 0, sQuickKeyDown, 6)
	UpdateControlBindings(sForward, 1, sQuickKeyUp, 7)
	UpdateControlBindings(sStrafeLeft, 2, sQuickKeyLeft, 8)
	UpdateControlBindings(sStrafeRight, 3, sQuickKeyRight, 9)
	UpdateControlBindings(sJump, 4, sJump, 4, 3.5)
	UpdateControlBindings(sSneak, 5, sSneak, 5, 4.5)
	debug.trace(ControlBindings)
	;UpdateMappedKeys()
	;debug.trace(ControlBindings)
EndFunction

Function SecondWind()
	SecondWind_int()
EndFunction

Function SecondWind_int()
	debug.trace("Player earned a second wind")
	SendMessage(6)
	StartTimer(4.0, iSecondWindID)
EndFunction

Function UpdateControlBindings(String asName, Int aiKeyID, String asAltKeyName = "", Int aiAltKeyID = 0, Float afDifficulty = 0.0)
	;int i = ControlBindings.FindStruct("sKeyName", asName)
	If(ControlBindings.FindStruct("sKeyName", asName) < 0)
	;If(ControlBindings.Find(asName) < 0)
		BoundKeys TempKey = new BoundKeys
		TempKey.sKeyName = asName
		TempKey.iKeyID = aiKeyID
		If(asAltKeyName != "")
			TempKey.sAltKeyName = asAltKeyName
			TempKey.iAltKeyID = aiAltKeyID
		Else
			TempKey.sAltKeyName = asName
			TempKey.iAltKeyID = aiKeyID
		EndIf
		TempKey.fDifficultyRequired = afDifficulty
		ControlBindings.add(TempKey)
	EndIf
EndFunction

; Function UpdateMappedKeys()
	; int i = 0
	; int keyReturn
	; While (i<ControlBindings.length)
		; keyReturn = Input.GetMappedKey(ControlBindings[i].sKeyName)
		; debug.trace("struggle: updating binding. keyreturn: " + keyReturn + " sKeyName: " + ControlBindings[i].sKeyName)
		; ControlBindings[i].iKeyID = Input.GetMappedKey(ControlBindings[i].sKeyName)
		; i += 1
	; EndWhile
; EndFunction

Function BeginStruggleMechanic(Actor akPred, int aiIndex)
	
	If(!bHasPlayedHelp)
		bHasPlayedHelp = true
		FV_HelpStruggleMessage.show()
	EndIf
	bHudActive = FV_VoreHud.GetHudActive()
	;store the player's PredPreyArray index for recall during vomit and death calls
	iPlayerIndex = aiIndex
	;Level disparity will be used to determine the difficulty required of player struggle
	
	Float levelDisparity = PlayerRef.GetValue(FV_PreyLevel) + PlayerRef.GetValue(FV_EscapeChance) - akPred.GetValue(FV_PredLevel) - akPred.GetValue(FV_StomachStrength)
	debug.trace("FV_PlayerStruggleScript BeginStruggleMechanic() " + levelDisparity + " " + PlayerRef.GetValue(FV_PreyLevel) + " " + PlayerRef.GetValue(FV_EscapeChance) + " " + akPred.GetValue(FV_PredLevel) + " " + akPred.GetValue(FV_StomachStrength))
	
	If(levelDisparity <= -37)
		fEncounterDifficulty = 5.0
	ElseIf(levelDisparity <= -31)
		fEncounterDifficulty = 4.5
	ElseIf(levelDisparity <= -24)
		fEncounterDifficulty = 4.0
	ElseIf(levelDisparity <= -17)
		fEncounterDifficulty = 3.5
	ElseIf(levelDisparity <= -10)
		fEncounterDifficulty = 3.0
	ElseIf(levelDisparity > -3 && levelDisparity <= 3)
		fEncounterDifficulty = 2.5
	ElseIf(levelDisparity >= 38)
		fEncounterDifficulty = 0.0
	ElseIf(levelDisparity >= 31)
		fEncounterDifficulty = 0.5
	ElseIf(levelDisparity >= 24)
		fEncounterDifficulty = 1.0
	ElseIf(levelDisparity >= 10)
		fEncounterDifficulty = 1.5
	ElseIf(levelDisparity > 3)
		fEncounterDifficulty = 2.0
	EndIf
	
	If(Game.GetPlayer().HasPerk(FV_GetOutofHere03))
		fEncounterDifficulty = fEncounterDifficulty- 3
	ElseIf(Game.GetPlayer().HasPerk(FV_GetOutofHere02))
		fEncounterDifficulty = fEncounterDifficulty - 2
	ElseIf(Game.GetPlayer().HasPerk(FV_GetOutofHere01))
		fEncounterDifficulty = fEncounterDifficulty - 1
	EndIf
	
	If(fEncounterDifficulty < 0)
		fEncounterDifficulty = 0
	EndIf
	
	iLevel = 0
	iLevelReached = 0
	
	If(fEncounterDifficulty < 1)
		iLevelEscape = 1
	Else
		iLevelEscape = ((fEncounterDifficulty + 1.0)/2.0) as int + 2
	EndIf
	ActorPred = akPred
	FV_PlayersPredAlias.ForceRefTo(akPred)
	;SetSequence()
	RegisterKeyEvents()
	SetTimers()
EndFunction

Function SetSequence()
	KeySequence.clear()
	int i = 0
	int randomKey
	int maxSequence = 4 + (((fEncounterDifficulty + 1.0)/2.0) as int)
	While (i < maxSequence)
		randomKey = Utility.RandomInt(0,ControlBindings.length - 1)
		debug.trace("FV_PlayerStruggleScript SetSequence() afDifficultyRequired: " + ControlBindings[randomKey].fDifficultyRequired + " fEncounterDifficulty: " + fEncounterDifficulty)
		If(ControlBindings[randomKey].fDifficultyRequired <= fEncounterDifficulty)
			If(Game.UsingGamepad())
				KeySequence.add(ControlBindings[randomKey].sAltKeyName)
			Else
				KeySequence.add(ControlBindings[randomKey].sKeyName)
			EndIf
			debug.trace("Struggle: Adding to KeySequence Array: " + KeySequence[i] + " randomKey: " + randomKey)
			i += 1
		EndIf
	EndWhile
	iNumberCorrect = 0
	iCurrentSequence = 0
EndFunction

Function RegisterKeyEvents()
	int i = 0
	While(i < ControlBindings.length)
		;RegisterForKey(ControlBindings[i].iKeyID)
		If(Game.UsingGamepad())
			RegisterForControl(ControlBindings[i].sAltKeyName)
		Else
			RegisterForControl(ControlBindings[i].sKeyName)
		EndIf
		i += 1
	EndWhile
	If(Game.UsingGamepad())
		i = 0
		While(i < QuickKeyCheat.length)
			RegisterForControl(QuickKeyCheat[i])
			i += 1
		EndWhile
	EndIf
EndFunction

Function UnregisterKeyEvents()
	int i = 0
	While(i < ControlBindings.length)
		;UnregisterForKey(ControlBindings[i].iKeyID)
		If(Game.UsingGamepad())
			UnregisterForControl(ControlBindings[i].sAltKeyName)
		Else
			UnregisterForControl(ControlBindings[i].sKeyName)
		EndIf
		i += 1
	EndWhile
	If(Game.UsingGamepad())
		i = 0
		While(i < QuickKeyCheat.length)
			UnregisterForControl(QuickKeyCheat[i])
			i += 1
		EndWhile
	EndIf
EndFunction

Function SetTimers(Int iTypeFlag = -1)
	SetSequence()

	If(bHudActive)
		FV_VoreHud.StruggleInitialize(fEncounterDifficulty, KeySequence)
		;FV_VoreHud.StrugglePushMessage("Now you're trapped in my gut.")
		SendMessage(0)
		StartTimer(6.0, iStruggleDelayID)
	Else
		string displayMessage
		If(iTypeFlag == iStruggleStageRecededLevel)
			displayMessage = displayMessage + "You failed to escape.\n\n"
		ElseIf(iTypeFlag == iStruggleStageAdvancedLevel)
			displayMessage = displayMessage + "You get closer to escaping\n\n"
		EndIf
		displayMessage = displayMessage + "Press the following controls in sequence to escape.\n\n"
		
		int i = 0
		While(i < KeySequence.length)
			displayMessage = displayMessage + KeySequence[i] + " " 	;.sKeyName + " "
			i += 1
		EndWhile
		debug.messagebox(displayMessage)
		StartTimers()
	EndIf
EndFunction

Function StartTimers()
		float fTimerTime = BaseTimerTime - fEncounterDifficulty/2.0
		bAllowInput = true
		StartTimer(fTimerTime, iStruggleTimerID)
EndFunction

Function PlayerEscape()
	CalculateXP(BaseXPGain, 2.0)
	FV_PlayersPredAlias.Clear()
	FV_ConsumptionRegistry.PlayerEscapes(iPlayerIndex)
EndFunction

Function CalculateXP(Float afXPGain = 0.0, Float afDifficultyMult = 1.0)
	float VoreLevel = PlayerRef.GetValue(FV_PredLevel) + PlayerRef.GetValue(FV_PreyLevel) + 13 + FV_VoreLevelPoints.GetValue()
	Float LevelReq = Math.Ceiling(Math.Pow(VoreLevel/2, 1.7))
	Float XPGain = (LevelReq*(afXPGain + fEncounterDifficulty*afDifficultyMult)/100) * (100+PlayerRef.GetValue(FV_BonusPreyXP))/100
	If(XPGain < 1.0)
		XPGain = 1.0
	EndIf
	
	FV_LevelUpManager.CheckLevelUp(XPGain, PlayerRef, VoreLevel)
EndFunction

Function PlayerDead()
	FV_PlayersPredAlias.Clear()
	FV_ConsumptionRegistry.PlayerDies(iPlayerIndex)
EndFunction

Function PlayerPredDead()
	CancelTimer(iStruggleTimerID)
	CancelTimer(iStruggleDelayID)
	CancelTimer(iStruggleCountDownID)
	CancelTimer(iStruggleAttemptHUDdelayID)
	CancelTimer(iStruggleStartStageID)
	iHudDelayFlag = iDelayHudStageEscape
	FV_VoreHud.StruggleResult(1, 1.0)
	SendMessage(5)
	FV_PlayersPredAlias.Clear()
	FV_ConsumptionRegistry.PlayerEscapes(iPlayerIndex)
EndFunction

;Event OnKeyDown(int keyCode)
Event OnControlDown(string control)
	If(bAllowInput)
		InputEnableLayer PlayerController = InputEnableLayer.create()
		PlayerController.EnableFavorites(false)
		PlayerController.EnableFavorites(true)
		PlayerController.delete()
		ControlString.add(control)
		CallFunctionNoWait("ProcessControlDown", new var[0])
	EndIf
EndEvent

Function ProcessControlDown()
	debug.trace("FV_PlayerStruggleScript ProcessControlDown() Processing " + ControlString.length + " Control Items...")
	If(bProcessingControl)
		return
	EndIf
	
	bProcessingControl = true
	while ControlString.length > 0
		ProcessSingleControl(ControlString[0])
		ControlString.remove(0)
		debug.trace("FV_PlayerStruggleScript ProcessControlDown() " + ControlString.length + " remaining...")
		utility.WaitMenuMode(0.1)
	endwhile
	
	; We out. Peace.
	bProcessingControl = false
EndFunction

Function ProcessSingleControl(String asControl)

		Bool isGamePadUsed = Game.UsingGamepad()
		If(isGamePadUsed)
			debug.trace("FV_PlayerStruggleScript OnControlDown() Converting asControl: " + asControl)
			If(asControl == sUp)
				asControl = sQuickKeyUp
			ElseIf(asControl == sDown)
				asControl = sQuickKeyDown
			ElseIf(asControl == sLeft)
				asControl = sQuickKeyLeft
			ElseIf(asControl == sRight)
				asControl = sQuickKeyRight
			EndIf
		EndIf
		;Only track key presses while timer is running.  If the key pressed is correct, increment tracker.
		If(asControl == KeySequence[iCurrentSequence])
			iNumberCorrect += 1
		EndIf
		debug.trace("FV_PlayerStruggleScript OnControlDown() isGamePadUsed: " + isGamePadUsed + " asControl: " + asControl + " iCurrentSequence: " + iCurrentSequence + " KeySequence[iCurrentSequence]: " + KeySequence[iCurrentSequence])
		
		int i = -1
		
		If(isGamePadUsed)
			i = ControlBindings.FindStruct("sAltKeyName", asControl)
		Else
			i = ControlBindings.FindStruct("sKeyName", asControl)
		EndIf
		
		If(i > -1)
		;If(ControlBindings.Find(asControl) > -1)
			If(bHudActive)
				If(isGamePadUsed)
					FV_VoreHud.StruggleKeyPress(ControlBindings[i].iAltKeyID, iCurrentSequence)
				Else
					FV_VoreHud.StruggleKeyPress(ControlBindings[i].iKeyID, iCurrentSequence)
				EndIf
			Else
				debug.notification("Pressed " + asControl)
			EndIf
		Else
			debug.notification("Key press " + asControl + " not recognized")
		EndIf
		
		iCurrentSequence += 1
		If(iCurrentSequence >= KeySequence.length && bAllowInput)	;by conditioning bAllowInput, this will help prevent double calling the handler
			CancelTimer(iStruggleTimerID)
			HandleSequenceCleanUp()
		EndIf
	
EndFunction

int iCountDown = 3

Event OnTimer(Int aiTimerID)
	If(aiTimerID == iStruggleTimerID)
		debug.trace("FV_PlayerStruggleScript Timer Expired")
		HandleSequenceCleanUp()
	ElseIf(aiTimerID == iStruggleDelayID || (aiTimerID == iStruggleCountDownID && iCountDown > 0))
		;FV_VoreHud.StruggleBegin()
		debug.trace("FV_PlayerStruggleScript Timer Begin Struggle in " + iCountDown)
		FV_VoreHud.StrugglePushMessage("Begin Struggle in " + iCountDown as String, 1)
		iCountDown -= 1
		StartTimer(1.0, iStruggleCountDownID)
	ElseIf(aiTimerID == iStruggleCountDownID && iCountDown <= 0)
		debug.trace("FV_PlayerStruggleScript Timer Struggle begins!")
		FV_VoreHud.StruggleStageChange(iStruggleStageBegin)
		iCountDown = 3
		StartTimers()
	ElseIf(aiTimerID == iStruggleAttemptHUDdelayID)
		debug.trace("FV_PlayerStruggleScript Timer HUD Delay Clean Up iHudDelayFlag: " + iHudDelayFlag)
		If(iHudDelayFlag == iDelayHudStageAlive)
			FV_VoreHud.StruggleStageChange(iStruggleStageCleanUp)
			StartTimer(4.0, iStruggleStartStageID)
		ElseIf(iHudDelayFlag == iDelayHudStageEscape)
			FV_VoreHud.StruggleStageChange(iStruggleStageFinished)
			PlayerEscape()
		ElseIf(iHudDelayFlag == iDelayHudStageDead)
			FV_VoreHud.StruggleStageChange(iStruggleStageFinished)
			PlayerDead()
		EndIf
		iHudDelayFlag = -1
	ElseIf(aiTimerID == iStruggleStartStageID)
		SetTimers()
	ElseIf(aiTimerID == iSecondWindID)
		debug.trace("FV_PlayerStruggleScript Timer Second Wind.  Reduce iLevelZeroFailed from " + iLevelZeroFailed)
		ilevelZeroFailed -= 1
		SetTimers()
	EndIf
EndEvent

Function HandleSequenceCleanUp()
	bAllowInput = false
	int iStruggleFlag = -1
	debug.trace("FV_PlayerStruggleScript HandleSequenceCleanUp() iNumberCorrect: " + iNumberCorrect + " KeySequence.length: " + KeySequence.length)
	If(iNumberCorrect != KeySequence.length)
		debug.trace("FV_PlayerStruggleScript HandleSequenceCleanUp() Player Unsuccessfully struggled iLevel: " + iLevel + " iLevelEscape: " + iLevelEscape)
		float fDamage = 0
		;The player didn't complete the sequence in time or correctly.
		iStruggleFlag = iStruggleStageRecededLevel

		If(iLevel <= 0 && ilevelZeroFailed >= 1)
			If(bHudActive)
				SendMessage(3)
			Else
				PlayerDead()
			EndIf
			iHudDelayFlag = iDelayHudStageDead
		Else
			;damage of player health as 20% plus pred's stats and minus the player's resistance
			;Move player down one level
			fDamage = PlayerRef.GetValue(Health)*(20 + ActorPred.GetValue(Game.GetEnduranceAV()) + ActorPred.GetValue(FV_AcidStrength)- PlayerRef.GetValue(FV_AcidResistance))/100
			If(PlayerRef.GetValue(Health)-fDamage <= 0)
				If(bHudActive)
					SendMessage(3)
				Else
					PlayerDead()
				EndIf
				iHudDelayFlag = iDelayHudStageDead
			Else
				if(bHudActive)
					If(iLevel == 0)
						SendMessage(6)
					Else
						SendMessage(2)
					EndIf
				EndIf
				PlayerRef.DamageValue(Health, fDamage)
				iHudDelayFlag = iDelayHudStageAlive
				debug.trace("FV_PlayerStruggleScript HandleSequenceCleanUp() Player was dealt " + fDamage + " damage")
			EndIf
			If(iLevelZeroFailed < 1 && iLevel <= 0)
				;Level is at 0, set flags to prepare killing player should they fail a second time
				iLevelZeroFailed +=1
			Else
				iLevel -= 1
			EndIf
		EndIf
	ElseIf(iNumberCorrect == KeySequence.length)
		iLevelZeroFailed = 0	;reset level 0 tracker
		iLevel += 1
		debug.trace("FV_PlayerStruggleScript HandleSequenceCleanUp() Player Successfully struggled iLevel: " + iLevel + " iLevelEscape: " + iLevelEscape)
		If(iLevel < iLevelEscape)
			debug.trace("FV_PlayerStruggleScript HandleSequenceCleanUp() iLevel < iLevelEscape  Restarting Timers")
			;the player hasn't escaped
			If(iLevelReached < iLevel)
				;Give the player some XP for reaching a new level
				iLevelReached += 1
				CalculateXP()
			EndIf
			If(bHudActive)
				SendMessage(1)
			EndIf
			iHudDelayFlag = iDelayHudStageAlive
			iStruggleFlag = iStruggleStageAdvancedLevel
		Else
			;the player has escaped!
			debug.trace("FV_PlayerStruggleScript HandleSequenceCleanUp() iLevel >= iLevelEscape")
			If(bHudActive)
				SendMessage(4)
			Else
				debug.notification("You escaped!")
				PlayerEscape()
			EndIf
			;bail out at this point
			iHudDelayFlag = iDelayHudStageEscape
		EndIf
	EndIf
	;Restart timers
	If(bHudActive)
		FV_VoreHud.StruggleResult(iStruggleFlag, (iLevel as float)/(iLevelEscape as float))
		FV_VoreHud.StruggleStageChange(iStruggleStageDisplaySequence)
		StartTimer(2.0, iStruggleAttemptHUDdelayID)
	ElseIf(iHudDelayFlag == iDelayHudStageAlive)
		;restart timers if no HUD detected AND the player has not escaped or died
		SetTimers(iStruggleFlag)
	EndIf
EndFunction

Function SendMessage(Int MessageFlag)
	String MessageToShow
	If(MessageFlag == 0)
		MessageToShow = BeginNotifications[Utility.RandomInt(0, BeginNotifications.length-1)]
	ElseIf(MessageFlag == 1)
		MessageToShow = SuccessNotifications[Utility.RandomInt(0, SuccessNotifications.length-1)]
	ElseIf(MessageFlag == 2)
		MessageToShow = FailNotifications[Utility.RandomInt(0, FailNotifications.length-1)]
	ElseIf(MessageFlag == 3)
		MessageToShow = DeathNotifications[Utility.RandomInt(0, DeathNotifications.length-1)]
	ElseIf(MessageFlag == 4)
		MessageToShow = EscapeNotifications[Utility.RandomInt(0, EscapeNotifications.length-1)]
	ElseIf(MessageFlag == 5)
		MessageToShow = PredDeadNotifications[Utility.RandomInt(0, PredDeadNotifications.length-1)]
	ElseIf(MessageFlag == 6)
		MessageToShow = FailLowLevelNotification[Utility.RandomInt(0, FailLowLevelNotification.length-1)]
	ElseIf(MessageFlag == 7)
		MessageToShow = SecondWindNotifications[Utility.RandomInt(0, SecondWindNotifications.length-1)]
	EndIf
	FV_VoreHud.StrugglePushMessage(MessageToShow)
EndFunction