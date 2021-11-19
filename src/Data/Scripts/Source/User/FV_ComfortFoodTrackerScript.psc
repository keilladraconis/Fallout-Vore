ScriptName FV_ComfortFoodTrackerScript extends Quest

GlobalVariable Property FV_ComfortFoodGlobal Auto

Faction Property GunnerFaction Auto
Faction Property RaiderFaction Auto

Perk Property FV_ComfortFood01 Auto
Perk Property FV_ComfortFood02 Auto
Perk Property FV_ComfortFood03 Auto
Race Property HumanRace Auto

FV_ConsumptionRegistryScript Property FV_ConsumptionRegistry Auto

Int iHumansEaten = 0

Event OnInit()
	RegisterForCustomEvent(FV_ConsumptionRegistry, "OnDigest")
	RegisterForCustomEvent(FV_ConsumptionRegistry, "OnSwallow")
EndEvent

Event FV_ConsumptionRegistryScript.OnDigest(FV_ConsumptionRegistryScript akSender, Var[] akArgs)
	Int DigestionEvent = akArgs[1] as Int			;event 0 is when a prey dies.  event 1 is end of digestion
	Actor Pred = akArgs[0] as Actor
	If(DigestionEvent == 0 && Pred == Game.GetPlayer())
		Actor Prey = akArgs[2] as Actor
		ProcessComfortFood(Pred, Prey)
	EndIf
EndEvent

Event FV_ConsumptionRegistryScript.OnSwallow(FV_ConsumptionRegistryScript akSender, Var[] akArgs)
	Bool LethalFlag = akArgs[1] as Bool
	Actor Pred = akArgs[0] as Actor
	If(Pred == Game.GetPlayer() && LethalFlag)
		Actor Prey = akArgs[2] as Actor
		DealComfortDamage(Pred, Prey)
	EndIf
EndEvent

Function ProcessComfortFood(Actor akPred, Actor akPrey)
	
	If(akPred.HasPerk(FV_ComfortFood03) && akPrey.GetRace() == HumanRace)
		iHumansEaten += 1
	Else
		If(akPred.HasPerk(FV_ComfortFood01) && akPrey.IsInFaction(RaiderFaction))
			iHumansEaten += 1
		EndIf
		If(akPred.HasPerk(FV_ComfortFood02) && akPrey.IsInFaction(GunnerFaction))
			iHumansEaten += 1
		EndIf
	EndIf
	
	If(iHumansEaten > Math.pow(FV_ComfortFoodGlobal.GetValue(),2))
		FV_ComfortFoodGlobal.SetValue(FV_ComfortFoodGlobal.GetValue() + 1)
	EndIf
EndFunction

Function DealComfortDamage(Actor akPred, Actor akPrey)
	Bool DealDamage = false
	If(akPred.HasPerk(FV_ComfortFood03) && akPrey.GetRace() == HumanRace)
		DealDamage = true
	Else
		If(akPred.HasPerk(FV_ComfortFood01) && akPrey.IsInFaction(RaiderFaction))
			DealDamage = true
		EndIf
		If(akPred.HasPerk(FV_ComfortFood02) && akPrey.IsInFaction(GunnerFaction))
			DealDamage = true
		EndIf
	EndIf
	
	If(DealDamage)
		If(akPrey.GetValue(Game.GetHealthAV()) > FV_ComfortFoodGlobal.GetValue())
			;Deal damage to the prey
			akPrey.DamageValue(Game.GetHealthAV(), FV_ComfortFoodGlobal.GetValue())
		Else
			;If the damage would kill them, do enough damage that the prey will die on the next tick
			akPrey.DamageValue(Game.GetHealthAV(), akPrey.GetValue(Game.GetHealthAV()) - 1)
		EndIf
	EndIf
EndFunction