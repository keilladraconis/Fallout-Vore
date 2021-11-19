Scriptname FV_VoreRegenScript extends Quest

Group Perks
	Perk Property FV_FastMetabolism01 Auto
EndGroup

Group RegenPotion
	Potion Property FV_FastMetabolismRestore Auto
EndGroup

Group Quests
	FV_ConsumptionRegistryScript Property FV_ConsumptionRegistry Auto
EndGroup



Event OnInit()
	RegisterForCustomEvent(FV_ConsumptionRegistry, "OnDigest")
EndEvent

Event FV_ConsumptionRegistryScript.OnDigest(FV_ConsumptionRegistryScript akSender, Var[] akArgs)			;akArgs[0] = CurrentPred, akArgs[1] = 0 - begin digestion 1 - end of digestion
	Actor CurrentPred = akArgs[0] as actor
	If((akArgs[1] as int) == 0)
		If(CurrentPred.HasPerk(FV_FastMetabolism01))
			CurrentPred.equipitem(FV_FastMetabolismRestore, false, true)
		EndIf
	EndIf
EndEvent