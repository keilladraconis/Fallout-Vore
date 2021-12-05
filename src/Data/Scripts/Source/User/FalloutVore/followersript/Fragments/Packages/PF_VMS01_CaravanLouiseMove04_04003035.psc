;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname FalloutVore:followersript:Fragments:Packages:PF_VMS01_CaravanLouiseMove04_04003035 Extends Package Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(Actor akActor)
;BEGIN CODE
; Status 1 - chill out for awhile
pCaravanLouiseCurrentStatus.SetValue(1)

; Next time we travel go to destination 5
pCaravanLouiseCurrentDestination.SetValue(5)

Quest __temp = pCaravanLouiseBase as Quest
FVS01_QuestScript kmyQuest = __temp as FVS01_QuestScript

Debug.Trace("Finished " + self)
kmyQuest.CaravanWaits(1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pCaravanLouiseBase Auto Const

GlobalVariable Property pCaravanLouiseCurrentDestination Auto Const

GlobalVariable Property pCaravanLouiseCurrentStatus Auto Const
