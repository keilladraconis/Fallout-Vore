Scriptname FalloutVore:FV_MakePlayerPredScript extends activemagiceffect

FalloutVore:FV_ConsumptionRegistryScript Property FV_ConsumptionRegistry Auto 

Event OnEffectStart(Actor akTarget, Actor akCaster)

	FV_ConsumptionRegistry.MakePlayerPred()

EndEvent