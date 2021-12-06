Scriptname FalloutVore:FV_UpdateScript extends Quest

Group Update301
	Perk Property FV_ReformPerk01 Auto
EndGroup

Group Update302
	GlobalVariable Property FV_VoreRaiderEnabled Auto
	GlobalVariable Property FV_VoreRoyaltyEnabled Auto
EndGroup

Group Update303
	RefCollectionAlias Property ActiveCompanions const auto
	ActorValue Property FV_PredLevel Auto
	Perk Property FV_CompanionSwallowAbility Auto
	Weapon Property FV_SwallowCompanion Auto
	Weapon Property FV_SwallowNPC Auto
	GlobalVariable Property FV_MaxBellyWeight Auto
	GlobalVariable Property FV_CalculatedMaxWeight Auto
	ActorValue Property FV_BellyCapacity Auto
	GlobalVariable Property FV_PlayerBellyWeightPerks Auto
	FalloutVore:FV_PlayerCapacitySystemScript Property FV_PerkQuest Auto
EndGroup

Actor PlayerRef

CustomEvent ModUpdateEvent

Bool Update301Finished = false
Bool Update302Finished = false
Bool Update303Finished = false
Bool Update304Finished = false

Event OnInit()
	PlayerRef = Game.GetPlayer()
	RegisterForRemoteEvent(PlayerRef, "OnPlayerLoadGame")
	Update302Finished = true
	Update303Finished = true
	Update304Finished = true
	FV_CalculatedMaxWeight.SetValue(FV_MaxBellyWeight.GetValue() + FV_PlayerBellyWeightPerks.GetValue() + ((Game.GetPlayer().GetValue(FV_BellyCapacity)-2.0)*2.0))
	UpdateMod()
EndEvent

Event Actor.OnPlayerLoadGame(Actor akSender)
	UpdateMod()
EndEvent

Function UpdateMod()
	If(!Update301Finished)
		If(PlayerRef.HasPerk(FV_ReformPerk01))
			PlayerRef.RemovePerk(FV_ReformPerk01)
			PlayerRef.AddPerk(FV_ReformPerk01)
		EndIf
		Update301Finished = true
	EndIf
	
	If(!Update302Finished)
		FV_VoreRaiderEnabled.SetValue(1)
		FV_VoreRoyaltyEnabled.SetValue(1)
		Update302Finished = true
	EndIf
	
	If(!Update303Finished)
		If(FV_MaxBellyWeight.GetValue() == 50)
			FV_MaxBellyWeight.SetValue(70)
		EndIf
		FV_CalculatedMaxWeight.SetValue(FV_MaxBellyWeight.GetValue() + FV_PlayerBellyWeightPerks.GetValue() + ((Game.GetPlayer().GetValue(FV_BellyCapacity)-2.0)*2.0))
		int i = 0
		While (i < ActiveCompanions.GetCount())
			If((ActiveCompanions.GetAt(i) as Actor).GetValue(FV_PredLevel) > 0)
				(ActiveCompanions.GetAt(i) as Actor).AddPerk(FV_CompanionSwallowAbility)
				If((ActiveCompanions.GetAt(i) as Actor).GetItemCount(FV_SwallowNPC) > 0)
					(ActiveCompanions.GetAt(i) as Actor).RemoveItem(FV_SwallowNPC, abSilent = true)
					(ActiveCompanions.GetAt(i) as Actor).AddItem(FV_SwallowCompanion, abSilent = true)
					(ActiveCompanions.GetAt(i) as Actor).EquipItem(FV_SwallowCompanion, abSilent = true)
				EndIf
			EndIf
			i += 1
		EndWhile
		FV_PerkQuest.RankUpCompanions()
		Update303Finished = true
	EndIf
	If(!Update304Finished)
		
		SendUpdateEvent(304)
		Update304Finished = true
	EndIf
EndFunction

Function SendUpdateEvent(int aiVersionNumber)
	Var[] akArgs = new Var[1]
	akArgs[0] = aiVersionNumber
	SendCustomEvent("ModUpdateEvent", akArgs)
EndFunction
