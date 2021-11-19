Scriptname FV_RefCollectionAliasAddPerkScript Extends RefCollectionAlias

ActorValue Property FV_VoreLevel Auto
ActorValue Property FV_VoreXP Auto
ActorValue Property FV_HasHadNukaAcid Auto
GlobalVariable Property FV_CompanionVoreLevel Auto
GlobalVariable Property FV_CompanionVoreXP Auto
Spell Property FV_spNPC_PerkCheck Auto

Event OnLoad(ObjectReference akSenderRef)
	Actor Companion = akSenderRef as Actor
	If(Companion.Is3dLoaded() && FV_CompanionVoreLevel.GetValue() > Companion.GetValue(FV_VoreLevel))
		Companion.ModValue(FV_VoreLevel, FV_CompanionVoreLevel.GetValue() - Companion.GetValue(FV_VoreLevel))
		Companion.ModValue(FV_VoreXP, FV_CompanionVoreXP.GetValue() - Companion.GetValue(FV_VoreXP))
		FV_spNPC_PerkCheck.Cast(Game.GetPlayer(), Companion)
	EndIf
EndEvent