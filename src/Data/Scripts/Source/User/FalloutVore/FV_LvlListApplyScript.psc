Scriptname FalloutVore:FV_LvlListApplyScript extends activemagiceffect

ActorValue Property FV_HasHadNukaAcid Auto
CombatStyle Property csPredMelee Auto
GlobalVariable Property FV_MaleVoreEnabled Auto
GlobalVariable Property FV_FemaleVoreEnabled Auto
Perk Property FV_PerkPredVEVLLDApply Auto

LeveledItem Property LL_Devour_Standard_FV_ Auto
;LeveledItem Property LLI_Gunner_SemiAuto Auto
LeveledItem[] Property LLI_Standard_Weapon Auto
;LeveledItem Property LLI_Gunner_SemiAuto_Boss Auto
LeveledItem[] Property LLI_Heavy_Weapon Auto
;LeveledItem Property LLI_Gunner_Weapon_High Auto
LeveledItem[] Property LLI_Boss_Weapon Auto

Int Property HeavyEnabled=0 Auto
{0=Standard Weapon List 1=Heavy Weapon List 2=Boss Weapon List}

Int Property Rarity=100 Auto
{percent rarity the pred will appear}
String Property PredName = "" Auto
{Name shown if NPC can be pred.  Defaults to editor name}

Struct LeveledItemList
	LeveledItem LevelList
EndStruct

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Bool GiveDevour = false
	
	If(akCaster.GetLeveledActorBase().GetSex()==0 && FV_MaleVoreEnabled.GetValue()==1)
		GiveDevour = true
	EndIf
	If(akCaster.GetLeveledActorBase().GetSex()==1 && FV_FemaleVoreEnabled.GetValue()==1)
		GiveDevour = true
	EndIf
	Int PredRoll = Utility.RandomInt()
	If(GiveDevour && PredRoll <= Rarity)
		;Give the pred devour and set their combat style to reduce likelihood of picking up ranged
		akCaster.AddItem(LL_Devour_Standard_FV_, abSilent=true)
		akCaster.SetValue(FV_HasHadNukaAcid, 1)
		akCaster.SetCombatStyle(csPredMelee)
		akCaster.AddPerk(FV_PerkPredVEVLLDApply)
		If(PredName != "")
			akCaster.GetLeveledActorBase().SetName(PredName)
		EndIf
	ElseIf(HeavyEnabled==1)
		Int i = Utility.RandomInt(0, LLI_Heavy_Weapon.Length-1)
		akCaster.AddItem(LLI_Heavy_Weapon[i], abSilent=true)
	ElseIf(HeavyEnabled==2)
		Int i = Utility.RandomInt(0, LLI_Boss_Weapon.Length-1)
		akCaster.AddItem(LLI_Boss_Weapon[i], abSilent=true)
	Else
		Int i = Utility.RandomInt(0, LLI_Standard_Weapon.Length-1)
		akCaster.AddItem(LLI_Standard_Weapon[i], abSilent=true)
	EndIf
	;debug.trace(akCaster + " Gender: " + akCaster.GetLeveledActorBase().GetSex() + " Female VoreL " + FV_FemaleVoreEnabled.GetValue() + " Male Vore: " + FV_MaleVoreEnabled.GetValue() + "GiveDevour: " + GiveDevour)
EndEvent