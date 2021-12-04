Scriptname FalloutVore:FV_VoreRoyaltyCheckScript Extends ActiveMagicEffect
{This effect checks a workshop NPC and places a royalty member if allowed.  Do not use on NPCs you care about}

ActorBase Property WorkshopNPC_Queen_FV_ Auto
ActorBase Property WorkshopNPC_King_FV_ Auto
GlobalVariable Property FV_FemaleVoreEnabled Auto
GlobalVariable Property FV_MaleVoreEnabled Auto
GlobalVariable Property FV_VoreRoyaltyEnabled Auto
WorkshopParentScript Property WorkshopParent Auto

import WorkshopNPCScript

bool HasBeenChecked = false

Event OnEffectStart(Actor akCaster, Actor akTarget)
	If(!HasBeenChecked && akCaster != Game.GetPlayer())
		CheckIfAllowed(akCaster)
		HasBeenChecked = true
	EndIf
EndEvent

Function CheckIfAllowed(Actor akActor)
	
	If(FV_VoreRoyaltyEnabled.GetValue() == 0 || (FV_FemaleVoreEnabled.GetValue() == 0 && FV_MaleVoreEnabled.GetValue() == 0))
		SpawnNewActor(akActor)
		return
	EndIf
	SwapforRoyalty(akActor, akActor.GetLeveledActorBase().GetSex())
EndFunction

Function SpawnNewActor(Actor akActor)
	WorkshopScript workshopRef = WorkshopParent.GetWorkshop((akActor as WorkshopNPCScript).GetWorkshopID())
	WorkshopParent.CreateActorPUBLIC(workshopRef, akActor, true)
	WorkshopParent.RemoveActorFromWorkshopPUBLIC(akActor as WorkshopNPCScript)
	akActor.killsilent()
	akActor.disable()
EndFunction

Function SwapforRoyalty(Actor akActor, int aiGender)
	int workShopID = (akActor as WorkshopNPCScript).GetWorkshopID()
	;WorkshopScript workshopRef = WorkshopParent.GetWorkshop(workshopID)
	Actor actorToAssign 
	If(aiGender == 1 && FV_FemaleVoreEnabled.GetValue() == 0)
		actorToAssign = akActor.PlaceActorAtMe(WorkshopNPC_King_FV_)
	ElseIf(aiGender == 0 && FV_MaleVoreEnabled.GetValue() == 0)
		actorToAssign = akActor.PlaceActorAtMe(WorkshopNPC_Queen_FV_)
	ElseIf(aiGender == 0)
		actorToAssign = akActor.PlaceActorAtMe(WorkshopNPC_King_FV_)
	Else
		actorToAssign = akActor.PlaceActorAtMe(WorkshopNPC_Queen_FV_)
	EndIf
	If(workshopID > -1)
		WorkshopParent.AddPermanentActorToWorkshopPUBLIC(actorToAssign, newWorkshopID = workshopID, bAutoAssign = false)
	EndIf
	WorkshopParent.RemoveActorFromWorkshopPUBLIC(akActor as WorkshopNPCScript)
	akActor.killsilent()
	akActor.disable()
EndFunction