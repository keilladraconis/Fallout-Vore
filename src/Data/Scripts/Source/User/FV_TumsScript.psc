Scriptname FV_TumsScript extends ActiveMagicEffect

ActorValue Property FV_IndigestionSeverityFlag Auto
;ActorValue Property FV_BlockSwallowFlag Auto
ActorValue Property FV_HasBloating Auto

Int Property SeverityMax Auto

Spell Property FV_spIndigestion Auto

Event OnEffectStart(actor akTarget, actor akCaster)
	If(akCaster.GetValue(FV_IndigestionSeverityFlag) <= SeverityMax)
		akCaster.SetValue(FV_IndigestionSeverityFlag, 0)
		akCaster.SetValue(FV_HasBloating, 0)
		;akCaster.SetValue(FV_BlockSwallowFlag, 0)
		akCaster.DispelSpell(FV_spIndigestion)
	EndIf
EndEvent