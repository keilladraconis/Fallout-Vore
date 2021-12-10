Scriptname FalloutVore:FV_GetInThereQuestScript extends Quest

ActorValue Property SpawnedLegendaryItem Auto
ObjectReference Property FV_BellyContainer Auto

Perk Property FV_GetInThere01 Auto
Perk Property FV_GetInThere02 Auto

LeveledItem Property LL_GetInThere_Boss_FV_ Auto
Weapon Property PipeBoltAction Auto
Weapon Property PipeGun Auto
Weapon Property PipeRevolver Auto

FalloutVore:FV_ConsumptionRegistryScript Property FV_ConsumptionRegistry Auto
LegendaryItemQuestScript Property LegendaryItemQuest Auto

Int Property LeveledGearChance = 10 Auto
Int Property LegendaryChance = 5 Auto
String Property swfName Auto
{name should include filepath and swf extension}

; Event OnInit()
; 	RegisterForCustomEvent(FV_ConsumptionRegistry, "OnDigest")
; EndEvent

; Event FalloutVore:FV_ConsumptionRegistryScript.OnDigest(FalloutVore:FV_ConsumptionRegistryScript akSender, Var[] akArgs)
; 	Int DigestionEvent = akArgs[1] as Int			;event 0 is when a prey dies.  event 1 is end of digestion
; 	Actor Pred = akArgs[0] as Actor
; 	If(DigestionEvent == 0 && Pred == Game.GetPlayer())
; 		Actor Prey = akArgs[2] as Actor
; 		HowDidThatGetInThere(Pred, Prey)
; 	EndIf
; EndEvent

Function HowDidThatGetInThere(Actor akPred, Actor akPrey)
	int randoChance = Utility.RandomInt()
	If(akPred.HasPerk(FV_GetInThere02) && randoChance <= LegendaryChance)
		;GenerateLegendaryItem()
		LegendaryItemQuest.GenerateLegendaryItem(FV_BellyContainer)
		;reset spawned legendary av so we can do this again
		FV_BellyContainer.SetValue(SpawnedLegendaryItem, 0)
		;Invoke some flash to alert the player
		Game.ShowPerkVaultboyOnHud(swfName)		;add sound if possible as second argument
	ElseIf(akPred.HasPerk(FV_GetInThere01) && randoChance <= LeveledGearChance)
		GenerateGoodItem(FV_BellyContainer)
	EndIf
EndFunction

Function GenerateGoodItem(ObjectReference ObjectToSpawnIn)
		
	ObjectReference item = ObjectToSpawnIn.PlaceAtMe(LL_GetInThere_Boss_FV_, aiCount = 1, abForcePersist = false, abInitiallyDisabled = true, abDeleteWhenAble = false)
	while(item.GetBaseObject() != PipeGun && item.GetBaseObject() != PipeBoltAction && item.GetBaseObject() != PipeRevolver)
		;Nobody wants pipe weapons.  Get something worth something
		item.delete()
		item = ObjectToSpawnIn.PlaceAtMe(LL_GetInThere_Boss_FV_, aiCount = 1, abForcePersist = false, abInitiallyDisabled = true, abDeleteWhenAble = false)
	EndWhile
	
	ObjectToSpawnIn.additem(item)

	item.enable()

EndFunction
