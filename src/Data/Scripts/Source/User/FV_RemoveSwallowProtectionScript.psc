ScriptName FV_RemoveSwallowProtectionScript Extends ActiveMagicEffect

ActorValue Property FV_SwallowProtectionFlag Auto

Event OnEffectStart(actor akTarget, actor akCaster)
	Utility.wait(1.0)
	
	akTarget.SetValue(FV_SwallowProtectionFlag, 0)
EndEvent