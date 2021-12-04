;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname FalloutVore:followersript:Fragments:Quests:QF_VM_VoreStatsQuest_0401087D Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(AcidStrength, Game.Getplayer().GetBaseValue(AcidStrength)+0.1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
If(ThreePreyEnabled.GetValue() == 0)
Game.GetPlayer().SetValue(BellyCapacity, Game.Getplayer().GetBaseValue(BellyCapacity)+1)
Else
Game.GetPlayer().SetValue(BellyCapacity, Game.Getplayer().GetBaseValue(BellyCapacity)+3)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(StomachStrength, 10)
Game.GetPlayer().SetValue(TicksTillEscapePerk, Game.GetPlayer().GetBaseValue(TicksTillEscapePerk)+1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(StomachStrength, 8)
Game.GetPlayer().SetValue(TicksTillEscapePerk, Game.GetPlayer().GetBaseValue(TicksTillEscapePerk)+1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(StomachStrength, 5)
Game.GetPlayer().SetValue(TicksTillEscapePerk, Game.GetPlayer().GetBaseValue(TicksTillEscapePerk)+1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0330_Item_00
Function Fragment_Stage_0330_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(StomachStrength, 0)
Game.GetPlayer().SetValue(TicksTillEscapePerk, Game.GetPlayer().GetBaseValue(TicksTillEscapePerk)+1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(SwallowChance, 1.1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(SwallowChance, 1.3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(SwallowChance, 1.5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(SwallowResist, Game.GetPlayer().GetBaseValue(SwallowResist) + 0.1)
Game.GetPlayer().SetValue(EscapeChance, Game.GetPlayer().GetBaseValue(EscapeChance) + 10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(SwallowResist, Game.GetPlayer().GetBaseValue(SwallowResist) + 0.2)
Game.GetPlayer().SetValue(EscapeChance, Game.GetPlayer().GetBaseValue(EscapeChance) + 10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(VoreExpBonus, Game.GetPlayer().GetBaseValue(VoreExpBonus)+0.025)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorValue Property AcidStrength Auto Const

ActorValue Property bellycapacity Auto Const

GlobalVariable Property ThreePreyEnabled Auto Const

ActorValue Property StomachStrength Auto Const

ActorValue Property TicksTillEscapePerk Auto Const

ActorValue Property SwallowChance Auto Const

ActorValue Property SwallowResist Auto Const

ActorValue Property EscapeChance Auto Const

ActorValue Property VoreExpBonus Auto Const
