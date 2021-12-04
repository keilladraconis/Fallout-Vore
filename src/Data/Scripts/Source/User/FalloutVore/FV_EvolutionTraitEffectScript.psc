Scriptname FalloutVore:FV_EvolutionTraitEffectScript extends ActiveMagicEffect

Perk Property EvolutionaryTrait Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akCaster.AddPerk(EvolutionaryTrait)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	akCaster.RemovePerk(EvolutionaryTrait)
EndEvent