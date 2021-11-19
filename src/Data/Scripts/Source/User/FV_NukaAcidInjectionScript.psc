Scriptname FV_NukaAcidInjectionScript extends Quest

Potion Property FV_NukaColaAcid Auto
GlobalVariable Property FV_CrackOpenColdStarted Auto
LeveledItem Property LL_chems_NukaAcid_FV_ Auto
LeveledItem Property LL_chems_NukaAcid_Boss_FV_ Auto
LeveledItem Property LL_chems_Perk_NukaAcid_FV_ Auto
LeveledItem Property LL_Drink_NukaCola_80 Auto
ListToInject[] Property StandardInjection Auto
ListToInject[] Property CrackOpenAColdOne Auto
ListToInject[] Property CrackOpenBossList Auto
ListToInject[] Property BossListInjection Auto
{These lists will have Nuka Acid added to them once the player has the perk}

struct ListToInject
	LeveledItem InjectedList
EndStruct

Event OnInit()
	BeginBaseInjection()
EndEvent

Function BeginBaseInjection()
	int i = 0
	While(i < StandardInjection.length)
		StandardInjection[i].InjectedList.AddForm(LL_chems_NukaAcid_FV_, 1, 1)
		i += 1
	EndWhile
	i = 0
	While(i < BossListInjection.length)
		BossListInjection[i].InjectedList.AddForm(LL_chems_NukaAcid_Boss_FV_, 1, 1)
		i += 1
	EndWhile
	LL_Drink_NukaCola_80.AddForm(FV_NukaColaAcid, 1, 1)
EndFunction

Function StartPlayerColdOne()
	If(FV_CrackOpenColdStarted.GetValue() == 0)
		int i = 0
		While(i < CrackOpenAColdOne.length)
			CrackOpenAColdOne[i].InjectedList.AddForm(LL_chems_Perk_NukaAcid_FV_, 1, 1)
			i += 1
		EndWhile
		i = 0
		While(i < CrackOpenBossList.length)
			CrackOpenBossList[i].InjectedList.AddForm(LL_chems_NukaAcid_Boss_FV_, 1, 1)
			i += 1
		EndWhile
		FV_CrackOpenColdStarted.SetValue(1)
	EndIf
EndFunction