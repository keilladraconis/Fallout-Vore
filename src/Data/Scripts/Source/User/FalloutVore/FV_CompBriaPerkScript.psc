Scriptname FalloutVore:FV_CompBriaPerkScript extends ActiveMagicEffect

;update tracker global
Event OnEffectStart(Actor akTarget, Actor akCaster)

	If (!FV_CompBriaHasPerk.GetValue() && FV_PreyTracker.GetValue() < akTarget.GetValue(CurrentPrey))
		;debug.notification("You have triggered Large and In Charge perk for a short while")
		FV_PlayerTriggerPerkMessage.Show()
		game.getplayer().equipitem(FV_BriaPerkStatusEffect, false, true)
	ElseIf (FV_CompBriaHasPerk.GetValue() && FV_PreyTracker.GetValue() < FV_CompBria.GetValue(CurrentPrey))
		;debug.notification("Bria has triggered your Large and In Charge perk for a short while")
		FV_BriaTriggerPerkMessage.Show()
		game.getplayer().equipitem(FV_BriaPerkStatusEffect, false, true)
	EndIf

	If (!FV_CompBriaHasPerk.GetValue() && FV_PreyTracker.GetValue() != akTarget.GetValue(CurrentPrey))
		FV_PreyTracker.SetValue(akTarget.GetValue(CurrentPrey) as int)
	ElseIf (FV_CompBriaHasPerk.GetValue() && FV_PreyTracker.GetValue() != FV_CompBria.GetValue(CurrentPrey))
		FV_PreyTracker.SetValue(FV_CompBria.GetValue(CurrentPrey) as int)
	EndIf

EndEvent

;Perk Property FV_CompBriaPlayerPredPerk Auto Const
;Perk Property FV_CompBriaPredPerk Auto Const

Group ActorValues
	ActorValue Property CurrentPrey Auto Const
EndGroup

Group Globals
	GlobalVariable Property FV_PreyTracker Auto
	GlobalVariable Property FV_CompBriaHasPerk Auto Const
EndGroup

Group Actors
	Actor Property FV_CompBria Auto Const
EndGroup

Group Potions
	Potion Property FV_BriaPerkStatusEffect Auto Const Mandatory
EndGroup

Group Messages
	Message Property FV_BriaTriggerPerkMessage Auto
	Message Property FV_PlayerTriggerPerkMessage Auto
EndGroup