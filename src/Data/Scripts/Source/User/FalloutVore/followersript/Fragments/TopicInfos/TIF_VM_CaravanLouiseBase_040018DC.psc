;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname FalloutVore:followersript:Fragments:TopicInfos:TIF_VM_CaravanLouiseBase_040018DC Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
If(pCaravanLuiseCurrentStatus.GetValue()==1)
Quest __temp = pVMS01_BriaQuest as Quest
FalloutVore:FVS01_QuestScript kmyQuest = __temp as FalloutVore:FVS01_QuestScript

kmyQuest.AdvanceCaravan()
EndIf

 pVMS01_BriaQuest.SetStage(71)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property pCaravanLuiseCurrentStatus Auto Const

Quest Property pVMS01_BriaQuest Auto Const
