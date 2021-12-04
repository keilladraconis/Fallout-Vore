Scriptname FV_TestStruggleScript Extends ActiveMagicEffect

FV_ConsumptionRegistryScript Property FV_ConsumptionRegistry Auto

Event OnEffectStart(actor akTarget, actor akCaster)
	FV_ConsumptionRegistry.Add(akTarget, akCaster, true)
EndEvent