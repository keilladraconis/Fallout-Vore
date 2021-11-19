ScriptName FV_AliasCompanionContextHandler extends ReferenceAlias

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
