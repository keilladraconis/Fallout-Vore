;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname followersript:Fragments:Packages:PF__04003037 Extends Package Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(Actor akActor)
;BEGIN CODE
; Status 1 - chill out for awhile
pCaravanLouiseCurrentStatus.SetValue(1)

; Next time we travel go to destination 4
pCaravanLouiseCurrentDestination.SetValue(4)

Quest __temp = pCaravanLouiseBase as Quest
FVS01_QuestScript kmyQuest = __temp as FVS01_QuestScript

Debug.Trace("Finished " + self)
kmyQuest.CaravanWaits(4)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pCaravanLouiseBase Auto Const

GlobalVariable Property pCaravanLouiseCurrentDestination Auto Const

GlobalVariable Property pCaravanLouiseCurrentStatus Auto Const
