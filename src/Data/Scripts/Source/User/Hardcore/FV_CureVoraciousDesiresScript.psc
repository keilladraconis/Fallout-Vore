Scriptname Hardcore:FV_CureVoraciousDesiresScript extends activemagiceffect Const

Hardcore:FV_VoreSurvival Property HC_VoreManager_FV_ const auto mandatory
{autofill}

Event OnEffectStart(Actor akTarget, Actor akCaster) 
	HC_VoreManager_FV_.CureVoraciousDesire()
EndEvent
