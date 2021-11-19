Scriptname FV_TradeNukaAcid extends Quest

GlobalVariable Property FV_FemaleVoreEnabled Auto
GlobalVariable Property FV_MaleVoreEnabled Auto
Potion Property FV_NukaColaAcid Auto
Faction Property HasBeenCompanionFaction Auto
Faction Property WorkshopNPCFaction Auto

Actor PlayerRef

Event OnInit()
	PlayerRef = Game.GetPlayer()
	AddInventoryEventFilter(FV_NukaColaAcid)
	RegisterForRemoteEvent(PlayerRef, "OnItemRemoved")
EndEvent

Event ObjectReference.OnItemRemoved(ObjectReference akSource, Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	If(akSource as Actor == PlayerRef && akDestContainer != NONE && akBaseItem as Potion == FV_NukaColaAcid)
		If((akDestContainer as Actor).IsInFaction(WorkshopNPCFaction) || (akDestContainer as actor).IsInFaction(HasBeenCompanionFaction))
			Bool UseNuka = false
			If((akDestContainer as Actor).GetLeveledActorBase().GetSex() == 1 && FV_FemaleVoreEnabled.GetValue() == 1)
				UseNuka = true
			ElseIf((akDestContainer as Actor).GetLeveledActorBase().GetSex() == 0 && FV_MaleVoreEnabled.GetValue() == 1)
				UseNuka = true
			EndIf
			If(UseNuka && aiItemCount >= 1)
				(akDestContainer as Actor).EquipItem(FV_NukaColaAcid)
			EndIf
		EndIf
	EndIf
	;If(akSource as Actor == PlayerRef && akBaseItem as Potion == NukaAcidPot && (akDestContainer as actor).IsInFaction(WorkshopNPCFaction))
	;	If(aiItemCount >= 1)
	;		(akDestContainer as actor).EquipItem(NukaAcidPot)
	;	EndIf
	;EndIf
EndEvent