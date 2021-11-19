Scriptname FV_PredHandlerScript extends ActiveMagicEffect

FV_ConsumptionRegistryScript Property FV_ConsumptionRegistry Auto

Actor PlayerRef


Event OnEffectStart()
	PlayerRef = Game.GetPlayer()
EndEvent

Event OnTimer(int aiTimerID)
	;trace(self, "Tick: " + aiTimerID)
	GotoState("OnTimerState")	
	
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
	
	FV_ConsumptionRegistryScript:VoreData data = FV_ConsumptionRegistry.GetPreyAndPredFromIndex(aiTimerID)
	If(data == None)
		trace(self, "[BUG] Tick " + aiTimerID)
		GotoState("")	
		Return
	EndIf
	trace(self, "OnTimer() Tick: " + aiTimerID + " TimerState: " + data.TimerState)
	Actor currentPrey = data.Prey
	Actor currentPred = data.Pred
	
	If(data.TimerState == 100)
		OnTimerDecreaseTicks(aiTimerID, data)
	
	;ElseIf(data.TimerState == 101)
	;	...
	;	...
		
	ElseIf (data.TimerState >= 12 && data.TimerState < 99)
		If(data.TimerState == 12 && currentPred.HasKeyword(FV_ColdSteelBody))
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
			StartTimer((FV_DigestTickRate.GetValue() as float)/ColdSteelCounts, aiTimerID)
		Else
			trace(self, "OnTimer() state < 99 && >= 12 aiTimerID: " + aiTimerID + " currentPred: " + currentPred + " TimerState: " + data.TimerState)
			If(currentPred.HasKeyword(FV_ColdSteelBody))
				FV_ColdSteelBellyQuest.ChangeColdSteelDigestFullness(currentPred, data.TimerState as float)
			Else
				ChangeDigestFullnessArmor(currentPred, data.TimerState)
			EndIf
			FV_ConsumptionRegistry.UpdateTimerState(aiTimerID, data.TimerState-1)
			OnTimerPlaySound(data)
		
			currentPred.SetValue(FV_DigestionStage, data.TimerState-1)
			UpdateDigestionPreyCount(aiTimerID)
			StartTimer(FV_DigestTickRate.GetValue(), aiTimerID)
		EndIf
	ElseIf (data.TimerState >= 1 && data.TimerState <= 11)
		If(currentPred.HasKeyword(FV_ColdSteelBody) && data.ColdSteelCounter > 0)
			FV_ColdSteelBellyQuest.ChangeColdSteelDigestFullness(currentPred, data.TimerState as float)
			UpdateColdSteelCounter(aiTimerID, data.ColdSteelCounter - 1)
			StartTimer((FV_DigestTickRate.GetValue() as float)/ColdSteelCounts, aiTimerID)
		Else
			trace(self, "OnTimer() ColdSteelCounter == 0 aiTimerID: " + aiTimerID + " currentPred: " + currentPred + " TimerState: " + data.TimerState)
			; more FV_IndigestionSeverityFlag is high, more belly has chance to grow ( max 6 times )
			int indig = currentPred.GetValue(FV_IndigestionSeverityFlag) as int
			int indigFactor = -1
			currentPred.SetValue(FV_HasBloating, 0)
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
			If(currentPred.HasKeyword(FV_ColdSteelBody))
				UpdateColdSteelCounter(aiTimerID, ColdSteelCounts as int)
				StartTimer((FV_DigestTickRate.GetValue() as float)/ColdSteelCounts, aiTimerID)
			Else
				ChangeDigestFullnessArmor(currentPred, newStage + 1)
				StartTimer(FV_DigestTickRate.GetValue(), aiTimerID)
			EndIf
			UpdateDigestionPreyCount(aiTimerID)
			EndIf
	ElseIf (data.TimerState == 0)
		If(currentPred.HasKeyword(FV_ColdSteelBody))
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

function OnTimerDecreaseTicks(int aiTimerID, FV_ConsumptionRegistryScript:VoreData data)

	if(AllowPredReEatPrey && data.IsPredator)
		If(data.Tick < 0 && Utility.RandomInt()> 90)
			trace(self, "Tick RandomInt > 0 ")
			Int[] children = new Int[0]
			children.Clear()
			GetchildrenAsSameLevelAndCheckFirstParent(children, data.parentIndex, data.Index)
			trace(self, "Tick children " + children)
			if(children.Length > 0)
				int i = children[Utility.RandomInt(0,children.Length-1)]
				FV_ConsumptionRegistryscript:VoreData tdata = FV_ConsumptionRegistry.GetFromIndex(i)
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
		StartTimer(FV_DamageTickRate.GetValue(), aiTimerID)
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
			StartTimer(FV_DamageTickRate.GetValue(), aiTimerID)
		EndIf
		Return
	EndIf
	
	Actor currentPrey = data.Prey
	Actor currentPred = data.Pred
	
	currentPrey.ModValue(FV_TicksTillEscape, -1)
	;Int escapeChance
	
	float DamageDealt = (Math.pow(currentPred.GetValue(FV_VoreLevel) as float, 0.65)*(1 + (currentPred.GetValue(FV_AcidStrength) as float)/100)*(1 + (currentPred.GetLevel() as float)/100))*(1-(currentPrey.GetValue(FV_AcidResistance) as float)/100)
	;trace(self, "Pred " + currentPred + " dealt " + DamageDealt + " to prey " + currentPrey + " this tick.")
	trace(self, "damage calculated")
	
	If((currentPrey.GetValue(Health) as float) - DamageDealt <= 0)										;Check if prey will die from damage.  If so, perform special handling
		trace(self, "damage greater than current health of enemny")
		If(currentPrey == PlayerRef)

			;we kill the player but have to make sure the triggerdigestionsequence is passed early enough, to prevent regurgitation of half dead player
			if((currentPrey.GetValue(Health)) > (currentPrey.getBaseValue(Health) * 0.5)); - (currentPrey.getBaseValue(Health) * 0.25)) > 0 )
				currentPrey.DamageValue(Health, ((currentPrey.getBaseValue(Health) * 0.2)))
				Debug.Notification("Your predator enjoys feeling you struggle in their stomach.")
				FV_FXBurp.Play(currentPred)
			else
				Debug.Notification("You cease the futile escape attempts and succumb to your predator's stomach.")
				;currentPrey.DamageValue(Health, ((currentPrey.getValue(Health) * 0.5)))
				;Utility.Wait(4 as float)
				KillPlayerAsPrey = true
				;OnTimerTriggerDigestionSequence(aiTimerID, data)
				PlayerRef.RemovePerk(FV_StruggleActivation)
				PlayerRef.RemovePerk(FV_ContextVorePerk)
				PlayerRef.AddPerk(FV_QuitToMenu)
				;currentPrey.DamageValue(Health, ((currentPrey.getValue(Health) * 0.5)))
				;Utility.Wait(3 as float)
				FV_FXBurp.Play(currentPred)
				;playerLayer.EnablePlayerControls()
				;Debug.EnableDetection(True)																		;Re-Enables detection				
				;currentPred.MoveTo(currentPrey)
				;currentPrey.TranslateToRef(currentPred, 25000)
				
				;currentPrey.DamageValue(Health, ((currentPrey.getBaseValue(Health) * 2)))
				OnTimerPerformDigestion(aiTimerID, data)
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
				currentPrey.DamageValue(Health, DamageDealt)														;Put companions in bleed out and then vomit them up
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
		currentPrey.DamageValue(Health, DamageDealt)															;if prey was not meant to die, deal damage to it now
	EndIf
	
	Int EscapeRoll = Utility.RandomInt()
	
	If(FV_PlayerStruggled.GetValue()==1 && currentPrey == PlayerRef)										;Prevent other prey from firing this if player is not only prey in system
		PlayerTryToEscape += 3
		FV_PlayerStruggled.SetValue(0)
		debug.notification("You feel rested enough to try escaping again.")
	EndIf
	
	Int EscapeCheck = 0
	
	If(currentPrey == PlayerRef)
		EscapeCheck = 12 - CurrentPred.GetValue(FV_StomachStrength) as int + currentPrey.GetValue(FV_EscapeChance) as int + PlayerTryToEscape
	Else
		EscapeCheck = 12 - CurrentPred.GetValue(FV_StomachStrength) as int + currentPrey.GetValue(FV_EscapeChance) as int
	EndIf
	If(!data.isLethal)																							;set escape roll higher than escape chance is expected to happen to prevent accident escaping of non-lethal prey
		EscapeRoll = 999
	EndIf
	If(currentPrey.IsDead())
		OnTimerPerformDigestion(aiTimerID, data)
	ElseIf((EscapeRoll < EscapeCheck && data.Tick <= 0 ) || currentPred.GetValue(FV_RegurgitateBool) == 1 || currentPrey.GetValue(FV_TicksTillEscape) <= 0)
		;deal damage if prey is escaping
		Float fEscapeDamage = currentPrey.GetValue(FV_EscapeDamage) as float
		If(fEscapeDamage > 0 && currentPred.GetValue(FV_RegurgitateBool) == 0)
			Float EscapeDamageValue = currentPred.GetBaseValue(Health)*fEscapeDamage/100
			currentPred.DamageValue(Health, EscapeDamageValue)
		EndIf
		data.Pred.SetValue(FV_RegurgitateBool, 0)
		;vomit
		trace(self, " OnTimerDecreaseTicks() Prey escaped - EscapeCheck: " + EscapeCheck + " EscapeRoll: " + EscapeRoll)
		OnTimerPerformVomit(aiTimerID, data)
	Else
		;restart timer					
		StartTimer(FV_DamageTickRate.GetValue(), aiTimerID)
	EndIf
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