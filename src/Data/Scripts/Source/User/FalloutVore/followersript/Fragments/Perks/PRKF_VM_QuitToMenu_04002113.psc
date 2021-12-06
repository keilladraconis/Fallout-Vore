;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname FalloutVore:followersript:Fragments:Perks:PRKF_VM_QuitToMenu_04002113 Extends Perk Hidden Const

;BEGIN FRAGMENT Fragment_Entry_00
Function Fragment_Entry_00(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Quest temp = FV_ConsumptionRegistry as Quest
FalloutVore:FV_ConsumptionRegistryScript kmyQuest = temp as FalloutVore:FV_ConsumptionRegistryScript

; kmyQuest.ReloadGame() KEILLA TODO: Who is responsible for reload game?
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property FV_ConsumptionRegistry Auto Const
