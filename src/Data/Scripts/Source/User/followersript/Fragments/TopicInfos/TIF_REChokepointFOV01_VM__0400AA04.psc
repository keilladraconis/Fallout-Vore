;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname followersript:Fragments:TopicInfos:TIF_REChokepointFOV01_VM__0400AA04 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Quest _temp = ConsumptionRegistry as Quest
FV_ConsumptionRegistryScript kmyQuestA = _temp as FV_ConsumptionRegistryScript

;re-enable player movement so HUD will show
kmyQuestA.EnablePlayerMovement()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Actor Raider
If(GetOwningQuest().GetStage() == 31)
Raider = VoreRaiderRandom.GetActorReference()
ElseIf(GetOwningQuest().GetStage() == 32)
Raider = VoreRaiderFemale.GetActorReference()
ElseIf(GetOwningQuest().GetStage() == 33)
Raider = VoreRaiderMale.GetActorReference()
EndIf

GetOwningQuest().SetStage(34)

Quest _temp = ConsumptionRegistry as Quest
FV_ConsumptionRegistryScript kmyQuestA = _temp as FV_ConsumptionRegistryScript

;re-enable player movement so HUD will show
;kmyQuestA.EnablePlayerMovement()

Game.GetPlayer().setAlpha(0, false)						;makes player invisible
Game.GetPlayer().setGhost(true)
kmyQuestA.Add(Raider, Game.GetPlayer(), true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property VoreRaiderRandom Auto Const

ReferenceAlias Property VoreRaiderFemale Auto Const

ReferenceAlias Property VoreRaiderMale Auto Const

Quest Property ConsumptionRegistry Auto Const
