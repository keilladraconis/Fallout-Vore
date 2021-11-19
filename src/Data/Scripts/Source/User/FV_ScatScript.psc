Scriptname FV_ScatScript extends activemagiceffect

;ConsumptionRegistryScript Property Manager Auto
FV_ScatManagerScript Property FV_ScatManager Auto
;ScriptObject Property game Auto
Potion Property FV_Scatpotion Auto
;Spell Property ReadyForScatSpell Auto

ObjectReference Property FV_BellyContainer Auto

;ActorValue Property CurrentInStomach Auto
ActorValue Property FV_Scatready Auto

;Sound Property Scatsound Auto

;LeveledActor Property Scatlootlist Auto
;ActorBase Property scatlootactor Auto
;Activator Property Shitheap Auto
;Activator Property VM_ScatBones Auto
GlobalVariable Property FV_ScatEnabled Auto
GlobalVariable Property FV_ScatBool Auto
;GlobalVariable Property VM_ScatType Auto
Faction Property CurrentCompanionFaction Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	If(akCaster == Game.GetPlayer() && FV_ScatEnabled.GetValue() == 1 && akcaster.getValue(FV_Scatready) >= 1)
		FV_ScatManager.PlayerScat(akCaster)
	ElseIf(akCaster == Game.GetPlayer() && FV_ScatEnabled.GetValue() == 0)
		FV_BellyContainer.Activate(Game.GetPlayer(), false)
	ElseIf(akCaster.IsInFaction(CurrentCompanionFaction) && akcaster.getValue(FV_Scatready) >= 1)
		FV_ScatManager.CompanionScat(akCaster)
	EndIf	
	If(akCaster == Game.GetPlayer() && akCaster.GetItemCount(FV_Scatpotion) == 0 && FV_ScatBool.GetValue() == 0)
		akCaster.AddItem(FV_Scatpotion, 1, true) 
	EndIf
	If(akCaster == Game.GetPlayer() && FV_ScatBool.GetValue() == 1)
		FV_ScatBool.SetValue(0)
	EndIf
EndEvent