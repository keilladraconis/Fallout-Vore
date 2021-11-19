;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname followersript:Fragments:TopicInfos:TIF_VM_ContextDialogue_04001A53 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE VM_ContextVoreQuestScript
VM_ContextVoreQuestScript kmyQuest = GetOwningQuest() as VM_ContextVoreQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.RandomConvinceChance(true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property VM_ContextChance Auto Const
