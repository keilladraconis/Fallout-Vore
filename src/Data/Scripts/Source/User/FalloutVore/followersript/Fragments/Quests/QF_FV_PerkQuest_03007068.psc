;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname FalloutVore:followersript:Fragments:Quests:QF_FV_PerkQuest_03007068 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
If(FV_PlayerSwallowCost.GetValue() > 20)
FV_PlayerSwallowCost.SetValue(20)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
If(FV_PlayerSwallowCost.GetValue() > 15)
FV_PlayerSwallowCost.SetValue(15)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
If(FV_PlayerSwallowCost.GetValue() > 10)
FV_PlayerSwallowCost.SetValue(10)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE FalloutVore:FV_PlayerCapacitySystemScript
Quest __temp = self as Quest
FalloutVore:FV_PlayerCapacitySystemScript kmyQuest = __temp as FalloutVore:FV_PlayerCapacitySystemScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.UpdateWhaleRank()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN AUTOCAST TYPE FalloutVore:FV_PlayerCapacitySystemScript
Quest __temp = self as Quest
FalloutVore:FV_PlayerCapacitySystemScript kmyQuest = __temp as FalloutVore:FV_PlayerCapacitySystemScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.UpdateWhaleRank()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN AUTOCAST TYPE FalloutVore:FV_PlayerCapacitySystemScript
Quest __temp = self as Quest
FalloutVore:FV_PlayerCapacitySystemScript kmyQuest = __temp as FalloutVore:FV_PlayerCapacitySystemScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.UpdateWhaleRank()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
FV_PlayerBellyWeightPerks.SetValue(FV_PlayerBellyWeightPerks.GetValue() + 25)
(FV_PlayerBellyContainer as FalloutVore:FV_PlayerBellyContainerScript).SetInventoryWeight()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
FV_PlayerBellyWeightPerks.SetValue(FV_PlayerBellyWeightPerks.GetValue() + 35)
(FV_PlayerBellyContainer as FalloutVore:FV_PlayerBellyContainerScript).SetInventoryWeight()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property FV_PlayerSwallowCost Auto Const

GlobalVariable Property FV_PlayerBellyWeightPerks Auto Const

ObjectReference Property FV_PlayerBellyContainer Auto Const
