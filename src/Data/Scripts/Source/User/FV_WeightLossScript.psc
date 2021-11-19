ScriptName FV_WeightLossScript extends ActiveMagicEffect

ActorValue Property FV_UseFormulaV Auto

Event OnInit()

EndEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akCaster.ModValue(FV_UseFormulaV, 1)
EndEvent