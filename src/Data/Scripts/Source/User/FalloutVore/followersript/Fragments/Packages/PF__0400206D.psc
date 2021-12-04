;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname FalloutVore:followersript:Fragments:Packages:PF__0400206D Extends Package Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(Actor akActor)
;BEGIN CODE
; Status 1 - chill out for awhile
pCaravanCricketCurrentStatus.SetValue(1)

; Next time we travel go to destination 2
pCaravanCricketCurrentDestination.SetValue(2)

Quest __temp = pCaravanBase as Quest
CaravanBaseScript kmyQuest = __temp as CaravanBaseScript

Debug.Trace("Finished " + self)
kmyQuest.CaravanWaits(3)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pCaravanBase Auto Const

GlobalVariable Property pCaravanCricketCurrentDestination Auto Const
GlobalVariable Property pCaravanCricketCurrentStatus Auto Const
