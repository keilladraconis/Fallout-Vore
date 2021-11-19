;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname followersript:Fragments:Quests:QF_FV_NukaAcidInjector_03001A86 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE FV_NukaAcidInjectionScript
Quest __temp = self as Quest
FV_NukaAcidInjectionScript kmyQuest = __temp as FV_NukaAcidInjectionScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartPlayerColdOne()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
