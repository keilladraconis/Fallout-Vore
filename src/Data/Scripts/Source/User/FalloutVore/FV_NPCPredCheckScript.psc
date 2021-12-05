Scriptname FalloutVore:FV_NPCPredCheckScript extends activemagiceffect

GlobalVariable Property FV_FemaleVoreEnabled Auto
GlobalVariable Property FV_MaleVoreEnabled Auto
GlobalVariable Property PredEnabled Auto
ActorBase Property FV_NonPredActorBase Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	CheckAndRespawn(akCaster)
EndEvent

Function CheckAndRespawn(Actor akActor)
	If(PredEnabled.GetValue() == 0)
		Respawn(akActor)
	ElseIf(akActor.GetLeveledActorBase().GetSex() == 0 && FV_MaleVoreEnabled.GetValue() == 0)
		Respawn(akActor)
	ElseIf(akActor.GetLeveledActorBase().GetSex() == 1 && FV_FemaleVoreEnabled.GetValue() == 0)
		Respawn(akActor)
	EndIf
EndFunction

Function Respawn(Actor akActor)
	debug.trace("Replacing Vore Raider")
	akActor.PlaceAtMe(FV_NonPredActorBase)
	akActor.KillSilent()
	akActor.SetCriticalStage(4)
EndFunction