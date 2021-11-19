Scriptname FV_DigestTriggerScript extends ActiveMagicEffect
{Triggers digestion if chosen to be toggable.}

FV_ConsumptionRegistryScript Property FV_ConsumptionRegistry Auto 
GlobalVariable Property FV_ManualDigestBool Auto
Message Property FV_HaventFinishedDigestionMessage Auto
Message Property FV_NoPreyInStomachMessage Auto

Potion Property FV_DigestPotion Auto


ActorValue Property FV_ReadyToDigest Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If(akCaster.GetValue(FV_ReadyToDigest) == 1)
		FV_ConsumptionRegistry.TriggerDigestionSequence(akCaster)
	ElseIf(FV_ConsumptionRegistry.HasLivePrey(akCaster))
		FV_HaventFinishedDigestionMessage.Show()
	Else
		FV_NoPreyInStomachMessage.Show()
	EndIf
	
	If(akCaster == Game.GetPlayer() && akCaster.GetItemCount(FV_DigestPotion) == 0 && FV_ManualDigestBool.GetValue() == 0)
		akCaster.AddItem(FV_DigestPotion, 1, true)
	EndIf
	If(akCaster == Game.GetPlayer())
		FV_ManualDigestBool.SetValue(0)
	EndIf
EndEvent