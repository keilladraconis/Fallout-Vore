Scriptname FalloutVore:FV_PreyTrackerUpdateScript extends ActiveMagicEffect

;update tracker global
Event OnEffectStart(Actor akTarget, Actor akCaster)
	
	If (!FV_CompBriaHasPerk.GetValue() && FV_PreyTracker.GetValue() != akTarget.GetValue(FV_CurrentPrey))
		FV_PreyTracker.SetValue(akTarget.GetValue(FV_CurrentPrey) as int)
	ElseIf (FV_CompBriaHasPerk.GetValue() && FV_PreyTracker.GetValue() != CompBria.GetValue(FV_CurrentPrey))
		FV_PreyTracker.SetValue(CompBria.GetValue(FV_CurrentPrey) as int)
	EndIf

EndEvent

ActorValue Property FV_CurrentPrey Auto Const
GlobalVariable Property FV_PreyTracker Auto
GlobalVariable Property FV_CompBriaHasPerk Auto Const

Actor Property CompBria Auto Const