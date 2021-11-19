;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_VM_COMBriaRecruit_01000F9C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
aBria.GetActorRef().SetAvailableToBeCompanion()
aBria.GetActorRef().EvaluatePackage()

;update objectives

SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
(pFollowers as FollowersScript).SetCompanion(aBria.GetActorRef())

;also set her to be available as a companion later
qCOMBriaAffinity.SetStage(10)
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property aBria Auto Const

Quest Property pFollowers Auto Const

Quest Property qCOMBriaAffinity Auto Const


Potion Property pBriaStatPot Auto Const

ActorValue Property pHasHadNukaAcid Auto Const
