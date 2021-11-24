Scriptname AliasDeathScript extends ReferenceAlias Const
;; Used by Reference Aliases for Bria and Jill on FVS01_BriaQuest_FV_

Int Property StageToSet = -1 Auto Const
Bool Property UseOnDyingInstead = FALSE Auto Const
Bool Property ShowTrace = false Auto Const

Event OnDeath(Actor akKiller)
	If(UseOnDyingInstead == false)
		If(ShowTrace)
			debug.trace("AliasDeathScript: OnDeath() - UseOnDyingInstead " + UseOnDyingInstead)
		EndIf
		SafeStageSet(GetOwningQuest())
	EndIF
EndEvent

Event OnDying(Actor akKiller)
	If(UseOnDyingInstead == true)
		If(ShowTrace)
			debug.trace("AliasDeathScript: OnDeath() - UseOnDyingInstead " + UseOnDyingInstead)
		EndIf
		SafeStageSet(GetOwningQuest())
	EndIf
EndEvent

Function SafeStageSet(Quest myQuest)
	If(ShowTrace)
		debug.trace("AliasDeathScript: SafeStageSet - Quest " + myQuest + "; StageToSet " + StageToSet)
	EndIf
	If(StageToSet > -1)
		myQuest.SetStage(StageToSet)
	EndIf
EndFunction