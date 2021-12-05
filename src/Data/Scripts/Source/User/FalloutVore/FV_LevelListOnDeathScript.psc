Scriptname FalloutVore:FV_LevelListOnDeathScript extends ActiveMagicEffect

LeveledItem Property LLD_VEV_Crystals_Pred_FV_ Auto

Actor Pred

Event OnInit()
	Pred = GetTargetActor()
EndEvent

Event OnDying(Actor Killer)
	Pred.AddItem(LLD_VEV_Crystals_Pred_FV_, abSilent = true)
EndEvent