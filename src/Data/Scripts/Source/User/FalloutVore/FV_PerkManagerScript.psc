Scriptname FalloutVore:FV_PerkManagerScript extends ActiveMagicEffect

Struct PerkArray
	Perk VorePerk
	Int VoreLevelReq = 1
EndStruct

Group Actor_Values
	ActorValue Property FV_PreyLevel Auto
	ActorValue Property FV_PreDLevel Auto
EndGroup

Group Perks
	PerkArray[] Property VorePerksArray Auto
	{All Pred perks go here}
	PerkArray[] Property PreyPerksArray Auto
	{All Prey perks go here}
	PerkArray[] Property CapacityPerksArray Auto
	{All Prey perks go here}
EndGroup

Group Quests
	FalloutVore:FV_ConsumptionRegistryScript Property FV_ConsumptionRegistry Auto
EndGroup

Group Factions
	Faction Property HasBeenCompanionFaction Auto
EndGroup

Event OnEffectStart(Actor akTarget, Actor akCaster)
	PerformLevelUp(akTarget)
EndEvent

Function PerformLevelUp(Actor ActorToLevel)
	Int i = 0
		FV_ConsumptionRegistry.trace(self, " performing level up on: " + ActorToLevel)
		int PredLevel = ActorToLevel.GetValue(FV_PredLevel) as int
		int PreyLevel = ActorToLevel.GetValue(FV_PreyLevel) as int
		While(i < VorePerksArray.Length)
			If(!ActorToLevel.HasPerk(VorePerksArray[i].VorePerk) && PredLevel >= VorePerksArray[i].VoreLevelReq)
				ActorToLevel.AddPerk(VorePerksArray[i].VorePerk)
			EndIf
			i += 1
		EndWhile
		i = 0
		While(i < PreyPerksArray.Length)
			If(!ActorToLevel.HasPerk(PreyPerksArray[i].VorePerk) && PreyLevel >= PreyPerksArray[i].VoreLevelReq)
				ActorToLevel.AddPerk(PreyPerksArray[i].VorePerk)
			EndIf
			i += 1
		EndWhile
		If(!ActorToLevel.IsInFaction(HasBeenCompanionFaction))
			i = 0
			While(i < CapacityPerksArray.Length)
				If(!ActorToLevel.HasPerk(CapacityPerksArray[i].VorePerk) && PredLevel >= CapacityPerksArray[i].VoreLevelReq)
					ActorToLevel.AddPerk(CapacityPerksArray[i].VorePerk)
				EndIf
				i += 1
			EndWhile
		EndIf
EndFunction