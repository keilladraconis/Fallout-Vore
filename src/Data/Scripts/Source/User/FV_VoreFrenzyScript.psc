Scriptname FV_VoreFrenzyScript extends ActiveMagicEffect

Weapon Property FV_SwallowFrenzy Auto
Armor Property Armor_NudewearFrenzy_FV_ Auto
GlobalVariable Property FV_VoreLevelPoints Auto
ActorValue Property FV_PredLevel Auto
ActorValue Property FV_PreyLevel Auto
ActorValue property Health Auto
ActorValue Property FV_VoreFrenzied Auto
FV_ConsumptionRegistryScript Property FV_ConsumptionRegistry Auto

EVENT OnEffectStart(Actor akTarget, Actor akCaster)

	;add all the vore stuff
	If(akTarget.IsInPowerArmor())
		akTarget.SwitchToPowerArmor(none)
	EndIf
	akTarget.equipitem(Armor_NudewearFrenzy_FV_, true, true)
	akTarget.equipitem(FV_SwallowFrenzy, true, true)
	
	akTarget.Modvalue(Health, 150)
	
	float PlayerVoreLevel = Game.GetPlayer().GetValue(FV_PredLevel) + Game.GetPlayer().GetValue(FV_PreyLevel) + FV_VoreLevelPoints.GetValue()
	float TargetVoreLevel = akTarget.GetValue(FV_PredLevel) + akTarget.GetValue(FV_PreyLevel)
	If(Game.GetPlayer().GetValue(FV_PredLevel) > 0)
		akTarget.ModValue(FV_PredLevel, PlayerVoreLevel-akTarget.GetValue(FV_PredLevel))
	ElseIf(Game.GetPlayer().GetLevel()*2 > TargetVoreLevel)
		akTarget.ModValue(FV_PredLevel, Game.GetPlayer().GetLevel()*2-akTarget.GetValue(FV_PredLevel))
	EndIf
	akTarget.SetValue(FV_VoreFrenzied, 1)	
	
	FV_ConsumptionRegistry.LevelUpNPC(akTarget)
	
	;allow the frenzy to run 121 seconds
	;Utility.wait(121)
	
ENDEVENT

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	akTarget.SetValue(FV_VoreFrenzied, 0)
	akTarget.unequipitem(FV_Swallowfrenzy, true, true)
	akTarget.unequipitem(Armor_NudewearFrenzy_FV_, true, true)
EndEvent