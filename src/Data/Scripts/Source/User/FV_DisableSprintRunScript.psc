Scriptname FV_DisableSprintRunScript Extends ActiveMagicEffect

Bool Property DisableRun = false Auto
Bool Property DisableSprint = false Auto

InputEnableLayer inputLayer

Event OnEffectStart(Actor akTarget, Actor akCaster)
	inputLayer = InputEnableLayer.Create()
	If DisableRun
		inputLayer.EnableRunning(false)
	EndIf
	If DisableSprint
		inputLayer.EnableSprinting(false)
	EndIf
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	inputLayer.EnableRunning(true)
	inputLayer.EnableSprinting(true)
EndEvent