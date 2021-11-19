;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname followersript:Fragments:TopicInfos:TIF_VM_CaravanLouiseBase_040040EE Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
If(pCaravanLuiseCurrentStatus.GetValue()==1)
Quest __temp = pVMS01_BriaQuest as Quest
FVS01_QuestScript kmyQuest = __temp as FVS01_QuestScript

kmyQuest.AdvanceCaravan()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pCaravanLouiseBase Auto Const

Quest Property pVMS01_BriaQuest Auto Const

GlobalVariable Property pCaravanLuiseCurrentStatus Auto Const
