Scriptname FalloutVore:FV_SwallowScript extends activemagiceffect
{Enchantment applied to swallow weapon. Calcs swallow chance and performs swallow if succssesful.}

Function Trace(string asFunction, string asMessage = "") Global debugOnly
	string logName = "FalloutVore"
	Debug.OpenUserLog(logName)
    Debug.TraceUser(logName, "[FalloutVore:FV_SwallowScript] " + asFunction + " - " + asMessage)	
EndFunction

Group ActorValues
	ActorValue Property EnduranceCondition Auto Const Mandatory
	ActorValue Property LeftAttackCondition Auto Const Mandatory
	ActorValue Property LeftMobilityCondition Auto Const Mandatory
	ActorValue Property PerceptionCondition Auto Const Mandatory
	ActorValue Property RightAttackCondition Auto Const Mandatory
	ActorValue Property RightMobilityCondition Auto Const Mandatory
	ActorValue Property FV_BlockSwallowFlag Auto Const Mandatory
	ActorValue Property FV_CanAlwaysVore Auto Const Mandatory
	ActorValue Property FV_BellyCapacity Auto Const Mandatory
	ActorValue Property FV_CurrentPrey Auto Const Mandatory
	ActorValue Property FV_SwallowStrength Auto Const Mandatory
	ActorValue Property FV_SwallowResistance Auto Const Mandatory
	ActorValue Property FV_VoreFrenzied Auto Const Mandatory
	ActorValue Property FV_VoreLevel Auto Const Mandatory
	ActorValue Property FV_SwallowProtectionFlag Auto Const Mandatory
EndGroup

Group Factions
	Faction Property CurrentCompanionFaction Auto Const Mandatory
EndGroup

Group FormLists
	FormList Property FV_RaceSwallowBlock Auto
EndGroup

Group Perks
	Perk Property FV_DownTheHatch02 Auto Const Mandatory
	Perk Property FV_Ravenous04 Auto Const Mandatory
	Perk Property FV_HighIronDiet02 Auto Const Mandatory
	Perk Property FV_Prowler03 Auto Const Mandatory
	Perk Property FV_Tenderizer01 Auto Const Mandatory
	Perk Property FV_Tenderizer02 Auto Const Mandatory
	Perk Property FV_Tenderizer03 Auto Const Mandatory
EndGroup

Group Globals
	GlobalVariable Property FV_AllGenderFrenzy Auto
	GlobalVariable Property FV_SwallowCompanionProtection Auto
	GlobalVariable Property FV_FemaleVoreEnabled Auto
	GlobalVariable Property FV_MaleVoreEnabled Auto
EndGroup

Group Potions
	Potion Property FV_SwallowAPCost Auto Const Mandatory
EndGroup

Group Messages
	Message Property FV_CannotSwallowPowerArmorMessage Auto Const Mandatory
	Message Property FV_TooFullMessage Auto Const Mandatory
EndGroup

Group Markers
	ObjectReference Property FV_StomachCellMarker Auto Const Mandatory
EndGroup

Group Scripts
	FalloutVore:FV_ActorDataScript Property FV_ActorData Auto Const Mandatory
	FalloutVore:FV_ConsumptionRegistryScript Property FV_ConsumptionRegistry Auto Const Mandatory
EndGroup

Group Actors
	Actor Property PlayerRef Auto Const Mandatory	;GAZ: This script previously called Game.GetPlayer() so many times that it was worth sacrificing this small amount of script memory for a property, to scrap those calls. Documentation: http://gamesas.com/best-practices-papyrus-t291375.html
	Actorbase Property FV_ScatLootCorpse Auto Const Mandatory
EndGroup
Bool Property IsNonLethalVore = False Auto
{Set this to true for Non-lethal vore.}
Float Property NoPerkDebuffLimit = 0.6 Auto
Float Property Tenderizer01DebuffLimit = 0.4 Auto


Float Function GetTargetHealthDebuff(Actor akTarget, Actor akCaster)
	Float currentHealthPercent = akTarget.GetValuePercentage(Game.GetHealthAV())
	If(currentHealthPercent < Tenderizer01DebuffLimit && !akCaster.HasPerk(FV_Tenderizer03) && akCaster.HasPerk(FV_Tenderizer01))
		return Tenderizer01DebuffLimit
	ElseIf(currentHealthPercent < NoPerkDebuffLimit && !akCaster.HasPerk(FV_Tenderizer03))
		return NoPerkDebuffLimit
	EndIf
	return currentHealthPercent
EndFunction


Event OnEffectStart(actor akPrey, actor akPred)
	int startVore = 0
	If(akPred.GetValue(FV_BlockSwallowFlag) != 0)
		Dispel()
		Return
	EndIf

	;GAZ: Remove this at some point, the coprophage crowd enjoyed when we did this for Devourment Refactor.
	;Block preds from swallowing scat piles
	If(akPrey.GetActorBase() == FV_ScatLootCorpse)
		Dispel()
		Return
	EndIf

	If(akPrey.IsInFaction(CurrentCompanionFaction) && FV_SwallowCompanionProtection.GetValue() > 0 && akPred == PlayerRef)
		Dispel()
		Return
	EndIf

	If(akPred.GetValue(FV_BellyCapacity) < akPred.GetValue(FV_CurrentPrey) + FV_ActorData.EvaluateSlots(akPrey))
		Dispel()
		Return
	EndIf

	If(akPrey.IsInPowerArmor() && !akPred.HasPerk(FV_HighIronDiet02))
		If(akPred == PlayerRef)
			FV_CannotSwallowPowerArmorMessage.Show()
		EndIf
		Dispel()
		Return
	EndIf

	If(!FV_ActorData.GetCanSwallow(akPred, akPrey))
		Dispel()
		Return
	EndIf

	;Block races known to cause crashes
	int i = 0
	While(i < FV_RaceSwallowBlock.GetSize() && i <= 128)
		If(akPrey.GetRace() == FV_RaceSwallowBlock.GetAt(i) as Race)
			Dispel()
			Return
		EndIf
		i += 1
	EndWhile

	float preyResist = (akPrey.GetValue(FV_SwallowResistance) + 5) * GetTargetHealthDebuff(akPrey, akPred)
	float predSwallow = akPred.GetValue(FV_SwallowStrength) + 5

	If(akPred.HasPerk(FV_Tenderizer02))
		If(akPrey.GetValue(LeftMobilityCondition) <= 0 || akPrey.GetValue(RightMobilityCondition) <= 0 || akPrey.GetValue(EnduranceCondition) <= 0 || akPrey.GetValue(LeftAttackCondition) <= 0 || akPrey.GetValue(PerceptionCondition) <= 0 || akPrey.GetValue(RightAttackCondition) <= 0)
			preyResist *= 0.5
		EndIf
	EndIf
	
	If(!akPred.IsDetectedBy(akPrey) && akPred.HasPerk(FV_Prowler03))
		predSwallow += 100.0
	EndIf		
		
	If(akPrey.isDead() || akPrey.isBleedingOut() || akPred.HasPerk(FV_Ravenous04))
		predSwallow += 100.0
	Endif
	
	If(preyResist < predSwallow)			
		int swallowedIndex = FV_ConsumptionRegistry.ProcessSingleSwallow(akPred, akPrey, !IsNonLethalVore)
	EndIf
	Trace("OnEffectStart", "Finished.")
	Dispel()
EndEvent