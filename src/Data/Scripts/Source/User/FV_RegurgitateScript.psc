Scriptname FV_RegurgitateScript extends activemagiceffect
{Throw up any live prey script.}

FV_ConsumptionRegistryScript Property FV_ConsumptionRegistry Auto 
Potion Property FV_RegurgitatePotion Auto
Message Property FV_NoPreyInStomachMessage Auto
GlobalVariable Property FV_VomitBool Auto
ActorValue Property FV_RegurgitateBool Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	
	If(FV_ConsumptionRegistry.HasLivePrey(akCaster) == true)

		If(akCaster.GetValue(FV_RegurgitateBool) == 0)
			akCaster.SetValue(FV_RegurgitateBool, 1)
		Else
			Debug.Notification("You are already regurgetating.")
		EndIf
	
	Else
		FV_NoPreyInStomachMessage.Show()
	EndIf
	
	;add potion back to pred
	If(akCaster == Game.GetPlayer() && akCaster.GetItemCount(FV_RegurgitatePotion) == 0 && FV_VomitBool.GetValue() == 0)
		akCaster.additem(FV_RegurgitatePotion, 1, true)
	EndIf
	If(akCaster == Game.GetPlayer() && FV_VomitBool.GetValue() == 1)
		FV_VomitBool.SetValue(0)
	EndIf
EndEvent

