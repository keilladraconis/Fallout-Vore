Scriptname FalloutVore:FV_PredMeleeScript extends activemagiceffect

CombatStyle Property csPredMelee Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akCaster.SetCombatStyle(csPredMelee)
	debug.trace("Changed NPC combat style")
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	akCaster.SetCombatStyle(NONE)
	debug.trace("Reverted NPC combat style to default")
EndEvent