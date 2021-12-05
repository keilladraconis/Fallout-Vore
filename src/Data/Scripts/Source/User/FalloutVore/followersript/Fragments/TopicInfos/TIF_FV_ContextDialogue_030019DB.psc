;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname FalloutVore:followersript:Fragments:TopicInfos:TIF_FV_ContextDialogue_030019DB Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Actor NewPred = ContextNPC.GetActorReference()
NewPred.SetValue(FV_HasHadNukaAcid, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property ContextNPC Auto Const

ActorValue Property FV_HasHadNukaAcid Auto Const
