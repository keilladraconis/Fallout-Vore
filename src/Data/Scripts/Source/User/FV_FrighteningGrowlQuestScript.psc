Scriptname FV_FrighteningGrowlQuestScript Extends Quest

FV_ConsumptionRegistryScript Property FV_ConsumptionRegistry Auto
Potion Property FV_GrowlVictim Auto
Message Property FV_GrowlNotReady Auto
Message Property FV_GrowlReady Auto
Perk Property FV_FrighteningGrowl01 Auto
ObjectReference Property FV_StomachCellMarker Auto

;float[] StartingConfidence
Float GrowlAvailableHour
Float OneHour

Bool GrowlPrimed = false

Event OnInit()
	OneHour = 1.0/24.0
	RegisterForCustomEvent(FV_ConsumptionRegistry, "OnDigest")
EndEvent

Event FV_ConsumptionRegistryScript.OnDigest(FV_ConsumptionRegistryScript akSender, Var[] akArgs)
	Actor pred = akArgs[0] as Actor
	If(GrowlPrimed && pred == Game.GetPlayer() && pred.hasPerk(FV_FrighteningGrowl01))
		StartGrowl(pred, akArgs[1] as Int)
	EndIf
EndEvent

Function StartGrowl(Actor akPred, Int aiType)
	If(aiType == 0)
		debug.Notification("Growled.")
		;player has killed a prey.  Grab surrounding hostiles
		Actor[] AllCombatNPC = akPred.GetAllCombatTargets()
		int i = 0
		While(i<AllCombatNPC.length)
			AllCombatNPC[i].EquipItem(FV_GrowlVictim, abSilent = false)
			i += 1
		EndWhile
		GrowlPrimed = false
	EndIf
EndFunction

Function PrimeGrowl()
	If(Utility.GetCurrentGameTime() >= GrowlAvailableHour && !GrowlPrimed)
		GrowlPrimed = true
		FV_GrowlReady.Show()
		GrowlAvailableHour = Utility.GetCurrentGameTime() + OneHour
	ElseIf(!GrowlPrimed)
		FV_GrowlNotReady.Show()
	EndIf
EndFunction

Function SwallowDesire(Actor akVictim)
	akVictim.MoveTo(FV_StomachCellMarker)
	FV_ConsumptionRegistry.Add(Game.GetPlayer(), akVictim, true)
EndFunction