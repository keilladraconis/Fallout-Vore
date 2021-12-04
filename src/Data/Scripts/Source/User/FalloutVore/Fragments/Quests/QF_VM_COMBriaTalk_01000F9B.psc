;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname FalloutVore:Fragments:Quests:QF_VM_COMBriaTalk_01000F9B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Calling COMBria's dismiss stage
qCOMBria.SetStage(90)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property qCOMBria Auto Const

Potion Property pNukaAcid Auto Const

Int Property pBriaNeedsNukaAcid Auto Const

ActorValue Property BriaNeedsNukaCola Auto Const

ReferenceAlias Property pBria Auto Const
