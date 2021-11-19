;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Perks:PRKF_000Contextvore2_01024468 Extends Perk Hidden Const

;BEGIN FRAGMENT Fragment_Entry_00
Function Fragment_Entry_00(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
vorespell.cast(Game.GetPlayer(), akTargetRef as Actor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Entry_01
Function Fragment_Entry_01(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Quest _temp = VM_ContextDialogue as Quest
FV_ContextVoreQuestScript kmyQuest = _temp as FV_ContextVoreQuestScript

kmyQuest.StartDialogue(akTargetRef as Actor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Entry_02
Function Fragment_Entry_02(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Quest _temp = VM_ContextDialogue as Quest
FV_ContextVoreQuestScript kmyQuest = _temp as FV_ContextVoreQuestScript

kmyQuest.PokeFriendlyPred(akTargetRef as Actor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Entry_03
Function Fragment_Entry_03(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Quest _temp = VM_ContextDialogue as Quest
FV_ContextVoreQuestScript kmyQuest = _temp as FV_ContextVoreQuestScript

kmyQuest.StartDialogue(akTargetRef as Actor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Entry_04
Function Fragment_Entry_04(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Quest _temp = VM_ContextDialogue as Quest
FV_ContextVoreQuestScript kmyQuest = _temp as FV_ContextVoreQuestScript

kmyQuest.PokeHostilePred(akTargetRef as Actor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Entry_05
Function Fragment_Entry_05(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
If VM_PlayerStruggled.GetValue() == 0
VM_PlayerStruggled.SetValue(1)
debug.notification("You struggle to escape the confines of your pred's stomach.")
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SPELL Property Vorespell Auto Const

Idle Property pairedvore Auto Const

Quest Property VM_ContextVoreQuest Auto Const

Quest Property VM_ContextDialogue Auto Const

GlobalVariable Property VM_PlayerStruggled Auto Const
