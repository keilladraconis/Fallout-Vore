;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname FalloutVore:followersript:Fragments:TopicInfos:TIF_VM_ContextDialogue_04006A4B Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE FalloutVore:FV_ContextVoreQuestScript
FalloutVore:FV_ContextVoreQuestScript kmyQuest = GetOwningQuest() as FalloutVore:FV_ContextVoreQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetTypeOfVore(2)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
 