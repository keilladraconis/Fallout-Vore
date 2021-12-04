;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname FalloutVore:followersript:Fragments:Packages:PF__04002066 Extends Package Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(Actor akActor)
;BEGIN CODE
; Status 1 - chill out for awhile
pCaravanLouiseCurrentStatus.SetValue(1)

; Next time we travel go to destination 2
pCaravanLouiseCurrentDestination.SetValue(2)

Quest __temp = pVM_CaravanBase as Quest
FV_CaravanBaseScript kmyQuest = __temp as FV_CaravanBaseScript

Debug.Trace("Finished " + self)
kmyQuest.CaravanWaits(3)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pVM_CaravanBase Auto Const

GlobalVariable Property pCaravanLouiseCurrentDestination Auto Const
GlobalVariable Property pCaravanLouiseCurrentStatus Auto Const