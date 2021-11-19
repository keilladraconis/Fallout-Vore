Scriptname FV_NukaAcidScript extends activemagiceffect

GlobalVariable Property FV_PlayerIsPred Auto
GlobalVariable Property FV_FemaleVoreEnabled Auto
GlobalVariable Property FV_MaleVoreEnabled Auto
Perk Property FV_PredMelee Auto
Perk Property FV_BellyCapacityPerk Auto
Weapon Property FV_SwallowNPC Auto
ActorValue Property FV_HasHadNukaAcid Auto

FV_ConsumptionRegistryScript Property FV_ConsumptionRegistry Auto

Event OnEffectStart(actor akTarget, actor akCaster)
	
	If(akCaster.GetValue(FV_HasHadNukaAcid) == 0)
		akCaster.SetValue(FV_HasHadNukaAcid, 1)
		akCaster.AddPerk(FV_BellyCapacityPerk)
		If(akCaster == Game.GetPlayer())
			FV_PlayerIsPred.SetValue(0)
			FV_ConsumptionRegistry.MakePlayerPred()	
		EndIf
		Bool MakeNPCPred = false
		If(akCaster.GetLeveledActorBase().GetSex() == 1 && FV_FemaleVoreEnabled.GetValue() == 1)
			MakeNPCPred = true
		EndIf
		If(akCaster.GetLeveledActorBase().GetSex() == 0 && FV_MaleVoreEnabled.GetValue() == 1)
			MakeNPCPred = true
		EndIf
		If(MakeNPCPred && akCaster != Game.GetPlayer())
			akCaster.AddItem(FV_SwallowNPC)
			akCaster.EquipItem(FV_SwallowNPC)
			akCaster.AddPerk(FV_PredMelee)
		EndIf
	EndIf

EndEvent
