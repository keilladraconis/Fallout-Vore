Scriptname FV_ChangeCapacityGlobalScript extends ActiveMagicEffect

GlobalVariable Property FV_MaxCapacity Auto
Int Property FortifyAmount Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	If(akCaster==Game.GetPlayer())
		FV_MaxCapacity.Mod(FortifyAmount)
	EndIf
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	If(akCaster==Game.GetPlayer())
		FV_MaxCapacity.Mod(0-FortifyAmount)
	EndIf
EndEvent