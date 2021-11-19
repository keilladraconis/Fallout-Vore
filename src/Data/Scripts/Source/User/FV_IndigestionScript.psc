Scriptname FV_IndigestionScript extends ActiveMagicEffect
{Causes indigestion detrimental effects}

Actor Digester

Sound Property FV_PlayerDigestFail  Auto
Sound Property FV_NPCDigestFail  Auto
Sound Property FV_FXIndigestionGurgle  Auto

Idle Property Idle1stPJumpImpactLand Auto

ActorValue Property FV_IndigestionSeverityFlag Auto
ActorValue Property FV_BlockSwallowFlag Auto
ActorValue Property FV_HasBloating Auto

Perk Property FV_IndigestionSpeedPerk Auto


Event OnEffectStart(Actor akTarget, Actor akCaster)
	If(akCaster.GetValue(FV_BlockSwallowFlag) < 1)
		akCaster.SetValue(FV_BlockSwallowFlag, 1)
	EndIf
	FV_FXIndigestionGurgle.Play(akCaster)

	Digester = akCaster

	akCaster.PlayIdle(Idle1stPJumpImpactLand)
	akCaster.AddPerk(FV_IndigestionSpeedPerk)
	If(akCaster.GetValue(FV_IndigestionSeverityFlag) == 1.0)
		StartTimer(8,1)	
	ElseIf(akCaster.GetValue(FV_IndigestionSeverityFlag) == 2.0)
		StartTimer(7,2)			
	ElseIf(akCaster.GetValue(FV_IndigestionSeverityFlag) == 3.0)
		StartTimer(6,3)	
	ElseIf(akCaster.GetValue(FV_IndigestionSeverityFlag) == 4.0)
		StartTimer(3,4)	
	EndIf

EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	If(akCaster == Game.GetPlayer())
		Debug.Notification("You've recovered from your indigestion.")
	EndIf
	If(akCaster.GetValue(FV_BlockSwallowFlag) == 2)
		akCaster.SetValue(FV_BlockSwallowFlag, 1)
	Else
		akCaster.SetValue(FV_BlockSwallowFlag, 0)
	EndIf
	;Reset indigestion flag
	akCaster.SetValue(FV_IndigestionSeverityFlag, 0)
	akCaster.SetValue(FV_HasBloating, 0)									;Reset bloating flag

	;Remove block on swallowing
	
	akCaster.RemovePerk(FV_IndigestionSpeedPerk)
	CancelTimer(1)
	CancelTimer(2)
	CancelTimer(3)
	CancelTimer(4)

EndEvent


Event OnTimer(int aiTimerID)

	Debug.trace("Indigestion Tick: " + aiTimerID)

	If(aiTimerID == 1)

		If(Utility.RandomInt() < 5)
			If(Digester == Game.GetPlayer())
				FV_PlayerDigestFail.Play(Digester)
			Else
				FV_NPCDigestFail.Play(Digester)
			EndIf
		EndIf
	StartTimer(5,1)	

	ElseIf(aiTimerID == 2)

		If(Utility.RandomInt() < 10)
			If(Digester == Game.GetPlayer())
				FV_PlayerDigestFail.Play(Digester)
			Else
				FV_NPCDigestFail.Play(Digester)
			EndIf
		EndIf
	StartTimer(5,2)
	ElseIf(aiTimerID == 3)

		If(Utility.RandomInt() < 20)
			If(Digester == Game.GetPlayer())
				FV_PlayerDigestFail.Play(Digester)
			Else
				FV_NPCDigestFail.Play(Digester)
			EndIf
		EndIf
	StartTimer(5,3)
	ElseIf(aiTimerID == 4)

		If(Utility.RandomInt() < 30)
			If(Digester == Game.GetPlayer())
				FV_PlayerDigestFail.Play(Digester)
			Else
				FV_NPCDigestFail.Play(Digester)
			EndIf
		EndIf
	StartTimer(5,4)
	EndIf

EndEvent
	