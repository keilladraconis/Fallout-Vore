Scriptname FV_SwallowScript extends activemagiceffect
{Enchantment applied to swallow weapon. Calcs swallow chance and performs swallow if succssesful.}
Group ActorValues
	;ActorValue Property ActionPoints Auto
	;ActorValue Property Health Auto
	ActorValue Property EnduranceCondition Auto Const Mandatory
	ActorValue Property LeftAttackCondition Auto Const Mandatory
	ActorValue Property LeftMobilityCondition Auto Const Mandatory
	ActorValue Property PerceptionCondition Auto Const Mandatory
	ActorValue Property RightAttackCondition Auto Const Mandatory
	ActorValue Property RightMobilityCondition Auto Const Mandatory
	ActorValue Property FV_BlockSwallowBool Auto Const Mandatory
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
	FV_ActorDataScript Property FV_ActorData Auto Const Mandatory
	FV_ConsumptionRegistryScript Property FV_ConsumptionRegistry Auto Const Mandatory
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


Event OnEffectStart(actor akTarget, actor akCaster)
		
		;0-100 dice role
		float swallowDice = Utility.RandomFloat()
		float scale = 1.0
		float startvore = 0
		
		;Block a sex if toggled off
		If(akCaster.GetLeveledActorBase().GetSex() == 0)
			If(FV_MaleVoreEnabled.GetValue() == 1)
				startvore = 1
			else
				If(akCaster == PlayerRef)
					debug.notification("Male vore is disabled")
				EndIf
				startvore = 0
			endif
		Elseif(akCaster.GetLeveledActorBase().GetSex() == 1)
			If(FV_FemaleVoreEnabled.GetValue() == 1)
				startvore = 1
			else
				If(akCaster == PlayerRef)
					debug.notification("Female vore is disabled")
				EndIf
				startvore = 0
			endif
		Endif
		
		;Always allow Bria and frenzied actors that are normally gender blocked
		If(akCaster.GetValue(FV_CanAlwaysVore) == 1 || (akCaster.GetValue(FV_VoreFrenzied) == 1 && FV_AllGenderFrenzy.GetValue() == 1))
			startvore = 1
		EndIf
		
		;GAZ: Remove this at some point, the coprophage crowd enjoyed when we did this for Devourment Refactor.
		;Block preds from swallowing scat piles
		If(akTarget.GetActorBase() == FV_ScatLootCorpse)
			startvore = 0
		EndIf
		;Block races known to cause crashes
		int i = 0
		While(i < FV_RaceSwallowBlock.GetSize())
			If(akTarget.GetRace() == FV_RaceSwallowBlock.GetAt(i) as Race)
				startvore = 0
			EndIf
			i += 1
		EndWhile
		
		If (startvore == 1)
			;Check for non lethal vore attempts  
			If(IsNonLethalVore)
				;Make victim dissapear. Move to belly cell
				If(akTarget != PlayerRef)		
					akTarget.MoveTo(FV_StomachCellMarker)
				Else
					akTarget.setAlpha(0, false)																	;makes player invisible
					akTarget.setGhost(true)																		;makes player invincible to ennemy's damage	
				EndIf	
				;Register non lethal vore
				FV_ConsumptionRegistry.Add(akCaster, akTarget, false)
			;Lethal vore
			Else
				
				;float HealthPoints = GetActorValuePercentageEX(akTarget, Health)
				;float AP = GetActorValuePercentageEX(akTarget, ActionPoints)
				;float chance = 0
				Float preyResist = (akTarget.GetValue(FV_SwallowResistance) + 5) * GetTargetHealthDebuff(akTarget, akCaster)
				Float predSwallow = akCaster.GetValue(FV_SwallowStrength) + 5
				;chance = (1.0 + (akCaster.GetValue(FV_VoreLevel)-akTarget.GetLevel())/100.0)*Math.pow(2.71828, - HealthPoints - (0.5*AP))
				;chance = (25 + akCaster.GetValue(Game.GetPerceptionAV()) + akCaster.getValue(FV_SwallowStrength) - akTarget.GetValue(FV_SwallowResistance))/100
				
				;is pred stomach full
				If(akCaster.GetValue(FV_BellyCapacity) < akCaster.GetValue(FV_CurrentPrey) + FV_ActorData.EvaluateSlots(akTarget))
					;chance=0
					If(akCaster == PlayerRef)
						FV_TooFullMessage.Show()
					EndIf
					preyResist = predSwallow + 100.0
					;return
				EndIf
				
				If(akCaster.HasPerk(FV_Tenderizer02))
					If(akTarget.GetValue(LeftMobilityCondition) <= 0 || aktarget.GetValue(RightMobilityCondition) <= 0 || akTarget.GetValue(EnduranceCondition) <= 0 || akTarget.GetValue(LeftAttackCondition) <= 0 ||akTarget.GetValue(PerceptionCondition) <= 0 || akTarget.GetValue(RightAttackCondition) <= 0)
						preyResist = preyResist * 0.5
					EndIf
				EndIf
				
				If(!akCaster.IsDetectedBy(akTarget) && akCaster.HasPerk(FV_Prowler03))
					predSwallow = preyResist + 100.0
				EndIf		
				
				;chance = (chance*(100 + akCaster.GetValue(FV_SwallowChance) as float)/100)-akTarget.GetValue(FV_SwallowResist)/100
				
				If(akTarget.isDead() || akTarget.isBleedingOut() || akCaster.HasPerk(FV_Ravenous04))
					;Make it so the pred always wins
					predSwallow = preyResist + 100.0
				Endif
				
				If(akTarget.IsInFaction(CurrentCompanionFaction) && FV_SwallowCompanionProtection.GetValue() > 0 && akCaster == PlayerRef)
					;chance = 0
					preyResist = predSwallow + 100.0
					;return
				EndIf

				If(!FV_ActorData.GetCanSwallow(akCaster, akTarget))
					;chance = 0
					preyResist = predSwallow + 100.0
					;return
				EndIf

				If(akTarget.IsInPowerArmor() && !akCaster.HasPerk(FV_HighIronDiet02))
					;chance=0
					If(akCaster == PlayerRef)
						FV_CannotSwallowPowerArmorMessage.Show()
					EndIf
					preyResist = predSwallow + 100.0
					;return
				EndIf
				debug.trace("SwallowScript akTarget: " + akTarget + " preyResist: " + preyResist + " akCaster: " + akCaster + " predSwallow: " + predSwallow)
				If(preyResist < predSwallow)			
					int swallowedIndex = FV_ConsumptionRegistry.Add(akCaster, akTarget, true)
					If (swallowedIndex >= 0)
						HandleSwallowSuccess(akCaster, akTarget)
					EndIf
				EndIf
			EndIf
		EndIf
	
	debug.trace("SwallowScript OnEffectStart end")
	Dispel()
EndEvent

Function HandleSwallowSuccess(Actor akCaster, Actor akTarget)
	debug.trace("HandleSwallowSuccess")
	;swallow success
	If(akCaster == PlayerRef && !IsNonLethalVore)
		;Make player spend Action Points
		If(akCaster.IsSprinting() && akCaster.HasPerk(FV_DownTheHatch02))
			;do nothing
		Else
			PlayerRef.EquipItem(FV_SwallowAPCost, abSilent = true)
		EndIf
	EndIf
	
	If(akTarget != PlayerRef)		
		akTarget.MoveTo(FV_StomachCellMarker)
	Else
		akTarget.setAlpha(0, false)						;makes player invisible
		akTarget.setGhost(true)							;makes player invincible to enemy's damage	
	EndIf
	akTarget.SetValue(FV_SwallowProtectionFlag, 1)
EndFunction