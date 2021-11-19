;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname followersript:Fragments:Terminals:TERM__010065CA Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
(pElevatorMaster as ElevatorMasterScript).MakeElevatorFunctional()
VM_DN01_ElevatorEnabledBool.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
;lock elevator
(pElevatorMaster as ElevatorMasterScript).MakeElevatorNonFunctional()
VM_DN01_ElevatorEnabledBool.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest property DN017 auto const

ObjectReference Property pElevatorMaster Auto Const

GlobalVariable Property VM_DN01_ElevatorEnabledBool Auto Const
