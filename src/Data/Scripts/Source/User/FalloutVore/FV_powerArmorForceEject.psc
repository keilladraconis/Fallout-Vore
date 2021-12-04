Scriptname FalloutVore:FV_PowerArmorForceEject extends ActiveMagicEffect

Keyword Property FurnitureTypePowerArmor Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	RegisterForRemoteEvent(akTarget, "OnGetUp")
	
	If(akTarget.isInPowerArmor())																;check to ensure spell wasn't cast accidentally
		akTarget.SwitchToPowerArmor(none)
		Utility.wait(1.0)																		;wait to allow armor disembark to begin.  Will interrupt dismount animation as follow on.
		akTarget.PushActorAway(akTarget, 10.0)													;force is set to 1.0.  Experimentation needed to determine final number
		akTarget.EvaluatePackage()
	Else
		debug.trace("Target is not in Power Armor.")
	EndIf
EndEvent																						;TODO - add random chance to ejection?  Would need to pass value of magnitude for chance success

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	unRegisterForRemoteEvent(akTarget, "OnGetUp")
	akTarget.EvaluatePackage()
EndEvent

Event Actor.OnGetUp(Actor akPilot, ObjectReference PowerArmorFrame)
	;debug.notification("Setting Power Armor to no owner")
	Utility.wait(3.0)
	If(PowerArmorFrame.HasKeyword(FurnitureTypePowerArmor))
		PowerArmorFrame.SetActorOwner(Game.GetPlayer().GetActorbase())
	EndIf
EndEvent