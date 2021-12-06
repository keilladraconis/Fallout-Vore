Scriptname FalloutVore:FV_PrimeGrowlEffectScript Extends ActiveMagicEffect

FalloutVore:FV_FrighteningGrowlQuestScript Property FV_FrighteningGrowlQuest Auto
Potion Property FV_PrimeGrowl Auto
GlobalVariable Property FV_GrowlBool Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	FV_FrighteningGrowlQuest.PrimeGrowl()
	
	If(akCaster == Game.GetPlayer() && akCaster.GetItemCount(FV_PrimeGrowl) == 0 && FV_GrowlBool.GetValue() == 0)
		akCaster.AddItem(FV_PrimeGrowl, 1, true) 
	EndIf
	If(akCaster == Game.GetPlayer() && FV_GrowlBool.GetValue() == 1)
		FV_GrowlBool.SetValue(0)
	EndIf
EndEvent