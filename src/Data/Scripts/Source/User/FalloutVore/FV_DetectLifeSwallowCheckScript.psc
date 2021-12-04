Scriptname FalloutVore:FV_DetectLifeSwallowCheckScript Extends ActiveMagicEffect

ActorValue Property FV_DetectLifeSwallowCheck Auto
Perk Property FV_Ravenous04 Auto
Perk Property FV_HighIronDiet02 Auto
Perk Property FV_Prowler03 Auto
Perk Property FV_Tenderizer01 Auto
Perk Property FV_Tenderizer02 Auto
Perk Property FV_Tenderizer03 Auto
ActorValue Property FV_SwallowStrength Auto
ActorValue Property FV_SwallowResistance Auto
ActorValue Property EnduranceCondition Auto
ActorValue Property LeftAttackCondition Auto
ActorValue Property LeftMobilityCondition Auto
ActorValue Property PerceptionCondition Auto
ActorValue Property RightAttackCondition Auto
ActorValue Property RightMobilityCondition Auto
FV_ActorDataScript Property FV_ActorData Auto
Spell Property FV_DetectLifeCloakSpell Auto

Float Property NoPerkDebuffLimit = 0.6 Auto
Float Property Tenderizer01DebuffLimit = 0.4 Auto
Actor Prey
Actor Pred

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Prey = akTarget
	Pred = akCaster
	SetSwallowCheck(akTarget, akCaster)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	CancelTimer()
EndEvent

Event OnTimer(int aiTimerID)
	SetSwallowCheck(Prey, Pred)
EndEvent

Float Function GetTargetHealthDebuff(Actor akTarget, Actor akCaster)
	Float currentHealthPercent = akTarget.GetValue(Game.GetHealthAV())/akTarget.GetBaseValue(Game.GetHealthAV())
	If(currentHealthPercent < Tenderizer01DebuffLimit && !akCaster.HasPerk(FV_Tenderizer03) && akCaster.HasPerk(FV_Tenderizer01))
		return Tenderizer01DebuffLimit
	ElseIf(currentHealthPercent < NoPerkDebuffLimit && !akCaster.HasPerk(FV_Tenderizer03))
		return NoPerkDebuffLimit
	EndIf
	return currentHealthPercent
EndFunction

Function SetSwallowCheck(Actor akTarget, Actor akCaster)
	
	Float preyResist = (akTarget.GetValue(FV_SwallowResistance) + akTarget.GetValue(Game.GetAgilityAV()))*GetTargetHealthDebuff(akTarget, akCaster)
	Float predSwallow = akCaster.GetValue(FV_SwallowStrength) + akCaster.GetValue(Game.GetPerceptionAV())
	
	If(akCaster.HasPerk(FV_Tenderizer02))
		If(akTarget.GetValue(LeftMobilityCondition) <= 0 || aktarget.GetValue(RightMobilityCondition) <= 0 || akTarget.GetValue(EnduranceCondition) <= 0 || akTarget.GetValue(LeftAttackCondition) <= 0 ||akTarget.GetValue(PerceptionCondition) <= 0 || akTarget.GetValue(RightAttackCondition) <= 0)
			preyResist = preyResist * 0.5
		EndIf
	EndIf
	
	If(!akCaster.IsDetectedBy(akTarget) && akCaster.HasPerk(FV_Prowler03))
		predSwallow = preyResist + 100.0
	EndIf		
		
	If(akTarget.isBleedingOut() || akCaster.HasPerk(FV_Ravenous04))
		;Make it so the pred always wins
		predSwallow = preyResist + 100.0
	Endif
		
	
	If(!FV_ActorData.GetCanSwallow(akCaster, akTarget))
		preyResist = predSwallow + 100.0
	EndIf
		
	If(akTarget.IsInPowerArmor() && !akCaster.HasPerk(FV_HighIronDiet02))
		preyResist = predSwallow + 100.0
	EndIf
	
	If(predSwallow >= preyResist)
		debug.trace("FV_DetectLifeSwallowCheckScript SetSwallowCheck() being performed on target: " + akTarget + " caster: " + akCaster + " flag: " + akTarget.GetValue(FV_DetectLifeSwallowCheck))
		akTarget.SetValue(FV_DetectLifeSwallowCheck, 1.0)
		akTarget.dispelspell(FV_DetectLifeCloakSpell)
	Else
		akTarget.SetValue(FV_DetectLifeSwallowCheck, 0.0)
		StartTimer(1.0)
	EndIf
	debug.trace("FV_DetectLifeSwallowCheckScript SetSwallowCheck() being performed on target: " + akTarget + " caster: " + akCaster + " flag: " + akTarget.GetValue(FV_DetectLifeSwallowCheck))
	
EndFunction
