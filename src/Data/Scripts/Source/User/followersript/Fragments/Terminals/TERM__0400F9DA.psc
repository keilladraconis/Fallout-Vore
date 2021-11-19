;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname followersript:Fragments:Terminals:TERM__0400F9DA Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
StartMod.Cast(Game.GetPlayer())
UpdateBool.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_06
Function Fragment_Terminal_06(ObjectReference akTerminalRef)
;BEGIN CODE
Game.GetPlayer().SetValue(VM_RegurgitateBool, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_07
Function Fragment_Terminal_07(ObjectReference akTerminalRef)
;BEGIN CODE
DigestSpell.Cast(Game.GetPlayer(), Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_08
Function Fragment_Terminal_08(ObjectReference akTerminalRef)
;BEGIN CODE
DigestSound.Play(Game.GetPlayer())
BellyContainer.RemoveAllItems()
HasItemsInBellyBool.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property VRLabspace Auto Const

ObjectReference Property ReturnMarker Auto Const

SPELL Property StartMod Auto Const

GlobalVariable Property UpdateBool Auto Const

GlobalVariable Property RegurgetateBool Auto Const

SPELL Property DigestSpell Auto Const

ObjectReference Property BellyContainer Auto Const

Sound Property DigestSound Auto Const

GlobalVariable Property HasItemsInBellyBool Auto Const

ActorValue Property VM_RegurgitateBool Auto Const
