;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname FalloutVore:followersript:Fragments:Terminals:TERM_VM_DN01_FacilitiesTermi_04006229 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
If(VMS01_BriaQuest_VM_.GetStage() == 95)
VMS01_BriaQuest_VM_.SetStage(96)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property VMS01_BriaQuest_VM_ Auto Const
