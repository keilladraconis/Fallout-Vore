Scriptname FV_REChokepointFOV01_Script extends Quest

FV_ConsumptionRegistryScript Property CSRManager Auto

Event OnInit()
	;RegisterForCustomEvent(CSRManager, "OnVomit")
EndEvent

Function RegisterEvents()
	RegisterForCustomEvent(CSRManager, "OnVomit")
EndFunction

Function UnregisterEvents()
	UnregisterForCustomEvent(CSRManager, "OnVomit")
EndFunction

Event FV_ConsumptionRegistryScript.OnVomit(FV_ConsumptionRegistryScript akSender, Var[] akArgs)
	Actor Prey = akArgs[1] as Actor
	
	If(Prey == Game.GetPlayer() && GetStage() != 40)
		SetStage(50)
	EndIf
EndEvent