Scriptname FV_CompanionListTrackerScript extends Quest

FollowersScript Property Followers Auto
FormList Property FV_ActiveCompanionList Auto
FormList Property FV_InactiveCompanionList Auto
Faction Property DisallowedCompanionFaction Auto

Event OnInit()
	RegisterForCustomEvent(Followers, "CompanionChange")
EndEvent

Event FollowersScript.CompanionChange(FollowersScript akSender, Var[] akArgs)	;akArgs[0] => actor companion, akArgs[1] => bool iscompanion
	Actor companionChanged = akArgs[0] as Actor
	Bool isCompanion = akArgs[1] as bool
	debug.trace("FV_CompanionListTrackerScript Event CompanionChange companionChanged: " + companionChanged + " isCompanion: " + isCompanion)
	If(companionChanged != NONE && isCompanion)
		FV_ActiveCompanionList.AddForm(companionChanged)
		FV_InactiveCompanionList.RemoveAddedForm(companionChanged)
	ElseIf(companionChanged != NONE && !isCompanion)
		FV_ActiveCompanionList.RemoveAddedForm(companionChanged)
		If(!companionChanged.IsInFaction(DisallowedCompanionFaction))
			FV_InactiveCompanionList.AddForm(companionChanged)
		EndIf
	EndIf
EndEvent
