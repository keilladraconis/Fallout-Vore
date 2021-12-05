;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname FalloutVore:followersript:Fragments:Perks:PRKF_VM_StruggleActivation_04008BBC Extends Perk Hidden Const

;BEGIN FRAGMENT Fragment_Entry_00
Function Fragment_Entry_00(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
If VM_PlayerStruggled.GetValue() == 0
VM_PlayerStruggled.SetValue(1)
debug.notification("You struggle to escape the confines of your pred's stomach.")
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property VM_PlayerStruggled Auto Const

Quest Property VM_ContextDialogue Auto Const
