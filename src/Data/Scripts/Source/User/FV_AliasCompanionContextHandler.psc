ScriptName FV_AliasCompanionContextHandler extends ReferenceAlias
; Attached to FV_ContextDialogue as an alias to followers. 
; Possibly has something to do with contextual vore during command dialogue with followers.

GlobalVariable Property FV_ContextEnabled Auto

bool ContextEnabled = False

Event OnCommandModeEnter()
	If (FV_ContextEnabled.GetValue() == 1)
		ContextEnabled = True
		FV_ContextEnabled.SetValue(0)
	Else
		ContextEnabled = False
	EndIf
EndEvent

Event OnCommandModeExit()
	If (ContextEnabled && FV_ContextEnabled.GetValue() == 0)
		FV_ContextEnabled.SetValue(1)
	EndIf
EndEvent
