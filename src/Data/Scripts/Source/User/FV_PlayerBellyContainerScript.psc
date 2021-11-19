ScriptName FV_PlayerBellyContainerScript extends ObjectReference

GlobalVariable Property FV_PlayerBellyWeightPerks Auto
GlobalVariable Property FV_PlayerBellyWeight Auto
GlobalVariable Property FV_MaxBellyWeight Auto
GlobalVariable Property FV_CalculatedMaxWeight Auto
ActorValue Property FV_BellyCapacity Auto
ActorValue Property FV_BlockSwallowFlag Auto
ActorValue Property FV_IndigestionSeverityFlag Auto
Message Property FV_PlayerVorecumbered Auto
Float Property WeightPerCapacity = 2.0 Auto

Event OnInit()
	AddInventoryEventFilter(NONE)
EndEvent

Event OnActivate(ObjectReference akActionRef)
	debug.trace("FV_BellyContainer OnActivate akActionref: " + akActionRef)
	AddInventoryEventFilter(NONE)
	FV_CalculatedMaxWeight.SetValue(FV_MaxBellyWeight.GetValue() + FV_PlayerBellyWeightPerks.GetValue() + ((Game.GetPlayer().GetValue(FV_BellyCapacity)-2.0)*WeightPerCapacity))
	FalloutVore.LoadBellyContainer(FV_PlayerBellyWeight.GetValue() as int, FV_CalculatedMaxWeight.GetValue() as int)
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	debug.trace("FV_BellyContainer OnItemAdded() akBaseItem: " + akBaseItem + " aiItemCount: " + aiItemCount + " akItemReference: " + akItemReference + " akSourceContainer: " + akSourceContainer)
	If(akSourceContainer == Game.GetPlayer())
		Form ItemAdded = akBaseItem
		If akItemReference != NONE
			ItemAdded = akItemReference
		EndIf
		RemoveItem(ItemAdded, aiItemCount, false, Game.GetPlayer())
	Else
		SetInventoryWeight()
	EndIf
EndEvent

Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	debug.trace("FV_BellyContainer OnItemRemoved() akBaseItem: " + akBaseItem + " aiItemCount: " + aiItemCount + " akItemReference: " + akItemReference + " akDestContainer: " + akDestContainer)
	SetInventoryWeight()
EndEvent

Function SetInventoryWeight()
	FV_PlayerBellyWeight.SetValue(self.GetInventoryWeight())
	FV_CalculatedMaxWeight.SetValue(FV_MaxBellyWeight.GetValue() + FV_PlayerBellyWeightPerks.GetValue() + ((Game.GetPlayer().GetValue(FV_BellyCapacity)-2.0)*WeightPerCapacity))
	FalloutVore.BellyItemChanged(FV_PlayerBellyWeight.GetValue() as int, FV_CalculatedMaxWeight.GetValue() as int)
	If(FV_PlayerBellyWeight.GetValue() > FV_CalculatedMaxWeight.GetValue() && Game.GetPlayer().GetValue(FV_BlockSwallowFlag) < 2)
		;Player is over weight limit.  Push message and block swallow
		Game.GetPlayer().SetValue(FV_BlockSwallowFlag, 2)
		FV_PlayerVorecumbered.show()
	ElseIf(FV_PlayerBellyWeight.GetValue() <= FV_CalculatedMaxWeight.GetValue())
		If(Game.GetPlayer().GetValue(FV_IndigestionSeverityFlag) > 0)
			Game.GetPlayer().SetValue(FV_BlockSwallowFlag, 1)
		Else
			Game.GetPlayer().SetValue(FV_BlockSwallowFlag, 0)
		EndIf
	EndIf
	
EndFunction
