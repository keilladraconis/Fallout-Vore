Scriptname FalloutVore:FV_RightThroughMeScript extends Quest

Perk Property FV_RightThroughMe01 Auto
Perk Property FV_RightThroughMe02 Auto

Float Property BaseChance = 2.0 Auto
string property swfName Auto

FalloutVore:FV_ConsumptionRegistryScript Property FV_ConsumptionRegistry Auto

Event OnInit()
	RegisterForCustomEvent(FV_ConsumptionRegistry, "OnSwallow")
EndEvent

Event FalloutVore:FV_ConsumptionRegistryScript.OnSwallow(FV_ConsumptionRegistryScript akSender, Var[] akArgs)
	Bool LethalFlag = akArgs[1] as Bool
	Actor Pred = akArgs[0] as Actor
	Actor Prey = akArgs[2] as Actor
	If(Pred == Game.GetPlayer() && LethalFlag && Pred.HasPerk(FV_RightThroughMe01) && !Prey.IsDead())
		CheckPreyCharmed(Pred, Prey)
	EndIf
EndEvent

Function CheckPreyCharmed(Actor akPred, Actor akPrey)
	Int charmedChance = Utility.RandomInt()
	
	If(charmedChance as float <= BaseChance + akPred.GetValue(Game.GetLuckAV())/10.0)
		Game.ShowPerkVaultboyOnHud(swfName)
		akPrey.DamageValue(Game.GetHealthAV(), akPrey.GetValue(Game.GetHealthAV()) - 1)
	EndIf
	
EndFunction