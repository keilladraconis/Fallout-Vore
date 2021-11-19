;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname followersript:Fragments:Quests:QF_VMS01_BriaQuest_0400872B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Actor BriaREF = BriaAlias.GetActorRef()
BriaREF.MoveTo(VMS01_Enable10)
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Actor BriaREF = BriaAlias.GetActorRef()
BriaREF.MoveTo(Game.GetPlayer())
BriaREF.SetCompanion()
SetStage(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE FVS01_QuestScript
Quest __temp = self as Quest
FVS01_QuestScript kmyQuest = __temp as FVS01_QuestScript
;END AUTOCAST
;BEGIN CODE
VMS01_Enable10.EnableNoWait()
SetObjectiveDisplayed(10,1)
;Remove Bria as companion and begin timer in FVS01_QuestScript
Actor BriaREF = BriaAlias.GetActorRef()
BriaREF.DisallowCompanion(SuppressDismissMessage=True)

;Begin package for Bria to travel to marker
VMS01_BriaQuest_VM_BriaTravelAlone.start()
BriaREF.EvaluatePackage()

;Start script function to enable game timer for Bria leaving permanently and becoming hated
kmyquest.Stage10TimerStart()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
VMS01_Enable10.EnableNoWait()
SetObjectiveDisplayed(15,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE FVS01_QuestScript
Quest __temp = self as Quest
FVS01_QuestScript kmyQuest = __temp as FVS01_QuestScript
;END AUTOCAST
;BEGIN CODE
If(isObjectiveDisplayed(10))
SetObjectiveCompleted(10)
kmyQuest.Stage20StopTimer()
EndIf
If(isObjectiveDisplayed(15))
SetObjectiveCompleted(15)
;BriaAlias.GetActorRef().MoveTo(VMS01_PorchMarker)
EndIf


;Reenable Bria if she was met in time
Actor BriaREF = BriaAlias.GetActorRef()
;If(BriaREF.IsInFaction(HasBeenCompanionFaction))
BriaREF.SetAvailableToBeCompanion()

;EndIf

VMS01_BriaWantsToTalk.SetValue(1)
BriaREF.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0021_Item_00
Function Fragment_Stage_0021_Item_00()
;BEGIN CODE
VMS01_BriaWantsToTalk.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0024_Item_00
Function Fragment_Stage_0024_Item_00()
;BEGIN CODE
BriaAlias.GetActorRef().SetCompanion()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(25,1)
SetStage(26)

VMS01_BriaWait.SetValue(1)
BriaAlias.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0026_Item_00
Function Fragment_Stage_0026_Item_00()
;BEGIN CODE
VMS01_BriaQuest_VM_Stage26.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(25)
VMS01_BriaWait.SetValue(0)
VMS01_Stage30Enable.EnableNoWait()
VMS01_BriaWantsToTalk.SetValue(1)
BriaAlias.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0031_Item_00
Function Fragment_Stage_0031_Item_00()
;BEGIN CODE
VMS01_BriaWantsToTalk.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(35,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveCompleted(35)
VMS01_Enable10.Disable()
VMS01_BriaQuest_VM_Stage40.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(40,1)
SetObjectiveDisplayed(45,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40)
SetObjectiveCompleted(45)
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0054_Item_00
Function Fragment_Stage_0054_Item_00()
;BEGIN CODE
BriaAlias.GetActorRef().SetCompanion()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)
SetObjectiveDisplayed(55)
VMS01_Stage55Enable.EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
SetObjectiveCompleted(55)
SetObjectiveDisplayed(60, 1)
SetObjectiveDisplayed(61, 1) ;optional
;VMS01_Stage60Enable.EnableNoWait()

;Move Louise to Slog and set her to path between Jill's and Slog

LouiseAlias.GetActorRef().MoveToMyEditorLocation()
AliasLunch.GetActorRef().MoveToMyEditorLocation()
AliasGuard01.GetActorRef().MoveToMyEditorLocation()
AliasGuard02.GetActorRef().MoveToMyEditorLocation()
VM_CaravanLouiseCurrentDestination.SetValue(5)
VM_CaravanLouiseCurrentStatus.SetValue(0)
;kmyQuest.CaravanWaits(4)

VMS01_Stage60Enable.EnableNoWait()
VMS01_Stage60Enable_2.EnableNoWait()
VMS01_OutpostDoorEnable.Lock(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
;Turn on transmitter
VMS01_Stage65Enable.EnableNoWait()
VMS01_Beacon_VM_.start()
SetObjectiveCompleted(60)
SetObjectiveDisplayed(65,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
SetObjectiveCompleted(61)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0071_Item_00
Function Fragment_Stage_0071_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(71,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
;Clean up optional objectives
If(IsObjectiveDisplayed(60))
  SetObjectiveDisplayed(60, false)
EndIf
If(IsObjectiveDisplayed(61))
  SetObjectiveDisplayed(61, false)
EndIf
SetObjectiveDisplayed(75,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
SetObjectiveCompleted(75)
SetObjectiveDisplayed(80,1)
VMDN01_Boss_VM_.MoveTo(BellyArea)

;clean up objectives in case they didn't clean up on previous stage
If(IsObjectiveDisplayed(60))
  SetObjectiveDisplayed(60, false)
EndIf
If(IsObjectiveDisplayed(61))
  SetObjectiveDisplayed(61, false)
EndIf

;Lock the boss door so nobody screws with Jill
VMDN01_BossDoor.Lock()
VMDN01_BossDoor.SetLockLevel(254)

;Add unique reward to boss trunk
ObjectReference oVendor = VM_DN01_Loot_TrunkMilitary_Boss
ObjectReference oItem = oVendor.PlaceAtMe(VMS01_boss_reward_CombatTorso)
oItem.AttachMod(mod_armor_Combat_Lining_Torso_Constrict2_VM_)
oItem.AttachMod(mod_armor_Combat_Lining_Torso_Slippery2_VM_)
oVendor.AddItem(oItem)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0085_Item_00
Function Fragment_Stage_0085_Item_00()
;BEGIN CODE
;Unlock boss door
VMS01_BriaQuest_VM_Stage85.Start()
BriaAlias.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0086_Item_00
Function Fragment_Stage_0086_Item_00()
;BEGIN CODE
VMDN01_BossDoor.Lock(false)
VMS01_BriaWait.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0087_Item_00
Function Fragment_Stage_0087_Item_00()
;BEGIN CODE
;disallow Bria temporarily while engaging Jill in conversation
Actor BriaREF = BriaAlias.GetActorRef()
;BriaREF.DisallowCompanion(SuppressDismissMessage=True)

;Begin Jill interaction
VMS01_BriaWait.SetValue(0)
BriaREF.EvaluatePackage()
VMS01_BriaQuest_VM_Stage87.Start()
AliasJill.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
AliasJill.GetActorRef().RemoveFromFaction(PlayerFriendFaction)
;reset Jill's AI to ensure she goes hostile
AliasJill.GetActorRef().SetValue(Game.GetAggressionAV(), 2)  ;consider this if simply resetting AI doesn't work
AliasJill.GetActorRef().EvaluatePackage(true)

SetObjectiveCompleted(80)
SetObjectiveDisplayed(90,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN CODE
SetObjectiveCompleted(90)
VMS01_BriaQuest_VM_Stage95.start()
VMS01_BriaWait.SetValue(1)
BriaAlias.GetActorRef().EvaluatePackage()
SetObjectiveDisplayed(100,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0096_Item_00
Function Fragment_Stage_0096_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(96,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0097_Item_00
Function Fragment_Stage_0097_Item_00()
;BEGIN CODE
SetObjectiveCompleted(96)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
VMS01_BriaQuest_VM_ExitOffice.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0101_Item_00
Function Fragment_Stage_0101_Item_00()
;BEGIN CODE
VMS01_BriaQuest_VM_ExitOffice.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0102_Item_00
Function Fragment_Stage_0102_Item_00()
;BEGIN CODE
;Let Bria move
VMS01_BriaWait.SetValue(0)
BriaAlias.GetActorRef().EvaluatePackage()

SetObjectiveCompleted(100)
;Clean up enable/disable
VMS01_Stage30Enable.Disable()
VMS01_Stage55Enable.Disable()
VMS01_Stage60Enable.Disable()
VMS01_Stage60Enable_2.Disable()

;Unlock Bria's affinity
Bria_AffinityCondition_PlayerCompletedQuest.SetValue(1)

VMS01_Stage65Enable.Disable()
VMS01_Beacon_VM_.stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE FVS01_QuestScript
Quest __temp = self as Quest
FVS01_QuestScript kmyQuest = __temp as FVS01_QuestScript
;END AUTOCAST
;BEGIN CODE
;Call function to eliminate Bria as a companion
kmyQuest.BriaLeavesOnTimer()

;Turn on note
VMS01_EnableBadEnd.EnableNoWait()

;Make Outpost Victor Accessible
VMS01_OutpostDoorEnable.EnableNoWait()

;Disable Jill and turn on Dungeon Boss
VMS01_DN001_DisableBoss.Disable()

;clean up
VMS01_Enable10.disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1050_Item_00
Function Fragment_Stage_1050_Item_00()
;BEGIN CODE
;Make Outpost Victor Accessible
VMS01_OutpostDoorEnable.EnableNoWait()

;Quest clean up
;Clean up enable/disable
VMS01_Stage30Enable.Disable()
VMS01_Stage55Enable.Disable()
VMS01_Stage60Enable.Disable()
VMS01_Stage60Enable_2.Disable()
VMS01_Stage65Enable.Disable()
VMS01_Beacon_VM_.stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property VMS01_Enable10 Auto Const

Scene Property VMS01_BriaQuest_VM_BriaTravelAlone Auto Const

ReferenceAlias Property BriaAlias Auto Const

Faction Property HasBeenCompanionFaction Auto Const

ObjectReference Property VMS01_Stage30Enable Auto Const

ObjectReference Property VMS01_Stage60Enable Auto Const

ObjectReference Property VMS01_Stage55Enable Auto Const

GlobalVariable Property VM_CaravanLouiseCurrentDestination Auto Const

GlobalVariable Property VM_CaravanLouiseCurrentStatus Auto Const

ReferenceAlias Property LouiseAlias Auto Const

ReferenceAlias Property AliasLunch Auto Const

ReferenceAlias Property AliasGuard01 Auto Const

ReferenceAlias Property AliasGuard02 Auto Const



Location Property TheSlogLocation Auto Const

ObjectReference Property TheSlogMapMarker Auto Const

ObjectReference Property VMS01_Stage60Enable_1 Auto Const

ObjectReference Property VMS01_Stage60Enable_2 Auto Const

ObjectReference Property VMS01_Stage65Enable Auto Const

Scene Property VMS01_BriaQuest_VM_Stage40 Auto Const

Scene Property VMS01_BriaQuest_VM_Stage26 Auto Const

GlobalVariable Property VMS01_BriaWantsToTalk Auto Const

Quest Property VMS01_Beacon_VM_ Auto Const

ObjectReference Property VMS01_BriaStandMarker Auto Const

ObjectReference Property VMS01_Testmarker Auto Const

ReferenceAlias Property AliasJill Auto Const

Scene Property VMS01_BriaQuest_VM_Stage87 Auto Const

Faction Property PlayerFriendFaction Auto Const

Scene Property VMS01_BriaQuest_VM_Stage85 Auto Const

ObjectReference Property VMS01_DN001_DisableBoss Auto Const

Scene Property VMS01_BriaQuest_VM_ExitOffice Auto Const

Actor Property VMDN01_Boss_VM_ Auto Const

ObjectReference Property BellyArea Auto Const

ObjectReference Property VMS01_EnableBadEnd Auto Const

Scene Property VMS01_BriaQuest_VM_Stage95 Auto Const

ObjectReference Property VMS01_OutpostDoorEnable Auto Const

GlobalVariable Property Bria_AffinityCondition_PlayerCompletedQuest Auto Const

GlobalVariable Property VMS01_BriaWait Auto Const

ObjectReference Property VMDN01_BossDoor Auto Const

LeveledItem Property VMS01_boss_reward_CombatTorse Auto Const

ObjectMod Property mod_armor_Combat_Lining_Limb_Slippery2_VM_ Auto Const

ObjectMod Property mod_armor_Combat_Lining_Torso_Slippery2_VM_ Auto Const

ObjectMod Property mod_armor_Combat_Lining_Torso_Constrict2_VM_ Auto Const

ObjectReference Property VM_DN01_Loot_TrunkMilitary_Boss Auto Const

LeveledItem Property VMS01_boss_reward_CombatTorso Auto Const
