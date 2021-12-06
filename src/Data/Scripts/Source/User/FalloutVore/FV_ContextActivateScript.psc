Scriptname FalloutVore:FV_ContextActivateScript extends activemagiceffect

FalloutVore:FV_ContextVoreQuestScript Property FV_ContextDialogue Auto

GlobalVariable Property FV_ManualPreyContext Auto
Potion Property FV_ContextPreyPotion Auto


Event OnEffectStart(Actor akTarget, Actor akCaster)
	If(FV_ManualPreyContext.GetValue() == 1)
		AkCaster.AddItem(FV_ContextPreyPotion, 1, true)
		FV_ManualPreyContext.SetValue(0)
	EndIf
	FV_ContextDialogue.PokeFriendlyPrey()
EndEvent