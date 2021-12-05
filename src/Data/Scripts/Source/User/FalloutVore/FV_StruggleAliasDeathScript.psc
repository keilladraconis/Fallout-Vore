Scriptname FalloutVore:FV_StruggleAliasDeathScript extends ReferenceAlias


FV_PlayerStruggleScript Property FV_PlayerStruggle Auto
Bool Property ShowTrace = false Auto



Event OnDying(Actor akKiller)
	
		If(ShowTrace)
			debug.trace("FV_StruggleAliasDeathScript: OnDeath() - Player Pred is Dead")
		EndIf
		FV_PlayerStruggle.PlayerPredDead()
	
EndEvent
