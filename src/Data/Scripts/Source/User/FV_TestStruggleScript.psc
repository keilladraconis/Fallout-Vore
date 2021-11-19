Scriptname FV_TestStruggleScript Extends ActiveMagicEffect

FV_ConsumptionRegistryScript Property FV_ConsumptionRegistry Auto

Event OnEffectStart(actor akTarget, actor akCaster)
	FV_ConsumptionRegistry.PerformVoreEvent(akTarget, akCaster, true)
EndEvent