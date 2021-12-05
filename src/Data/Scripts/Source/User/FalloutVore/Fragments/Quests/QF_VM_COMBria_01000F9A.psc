;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname FalloutVore:Fragments:Quests:QF_VM_COMBria_01000F9A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
FollowersScript.GetScript().SetCompanion(aBria.GetActorReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
debug.trace(self + "Stage 90")
FollowersScript.GetScript().DismissCompanion(aBria.GetActorReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0091_Item_00
Function Fragment_Stage_0091_Item_00()
;BEGIN CODE
;Dismiss Bria and make it so her travel to infor doesn't show up and factions are stripped
FollowersScript.GetScript().DismissCompanion(aBria.GetActorReference(), FALSE)
aBria.GetActorRef().RemoveFromFaction(HasBeenCompanionFaction)
(aBria.GetActorReference() as CompanionActorScript).SetHasLeftPlayerPermanently()

;Disable Bria for time being
aBria.GetActorRef().disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
aBria.TryToSetActorValue(CA_WantsToTalk, 2) ;has forcegreeted
aBria.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN AUTOCAST TYPE affinityscenehandlerscript
Quest __temp = self as Quest
affinityscenehandlerscript kmyQuest = __temp as affinityscenehandlerscript
;END AUTOCAST
;BEGIN CODE
kmyquest.EndSceneHatred()
aBria.GetActorReference().DisallowCompanion(SuppressDismissMessage = true)
(aBria.GetActorReference() as CompanionActorScript).SetHasLeftPlayerPermanently()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN AUTOCAST TYPE affinityscenehandlerscript
Quest __temp = self as Quest
affinityscenehandlerscript kmyQuest = __temp as affinityscenehandlerscript
;END AUTOCAST
;BEGIN CODE
kmyquest.EndSceneHatred()
(aBria.GetActorReference() as CompanionActorScript).SetAffinityBetweenThresholds(CA_T5_Hatred, CA_T4_Disdain)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
aBria.TryToSetActorValue(CA_WantsToTalk, 2) ;has forcegreeted
aBria.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN AUTOCAST TYPE affinityscenehandlerscript
Quest __temp = self as Quest
affinityscenehandlerscript kmyQuest = __temp as affinityscenehandlerscript
;END AUTOCAST
;BEGIN CODE
kmyquest.EndSceneHatred()
FollowersScript.GetScript().DisallowCompanion(aBria.GetActorReference(), SuppressDismissMessage = true)
(aBria.GetActorReference() as CompanionActorScript).SetHasLeftPlayerPermanently()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
aBria.TryToSetActorValue(CA_WantsToTalk, 2) ;has forcegreeted
aBria.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN AUTOCAST TYPE affinityscenehandlerscript
Quest __temp = self as Quest
affinityscenehandlerscript kmyQuest = __temp as affinityscenehandlerscript
;END AUTOCAST
;BEGIN CODE
kmyquest.EndSceneDisdain()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0240_Item_00
Function Fragment_Stage_0240_Item_00()
;BEGIN CODE
aBria.TryToSetActorValue(CA_WantsToTalk, 2) ;has forcegreeted
aBria.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN AUTOCAST TYPE affinityscenehandlerscript
Quest __temp = self as Quest
affinityscenehandlerscript kmyQuest = __temp as affinityscenehandlerscript
;END AUTOCAST
;BEGIN CODE
kmyquest.EndSceneDisdain()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
aBria.TryToSetActorValue(CA_WantsToTalk, 2) ;has forcegreeted
aBria.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0330_Item_00
Function Fragment_Stage_0330_Item_00()
;BEGIN AUTOCAST TYPE affinityscenehandlerscript
Quest __temp = self as Quest
affinityscenehandlerscript kmyQuest = __temp as affinityscenehandlerscript
;END AUTOCAST
;BEGIN CODE
kmyquest.EndSceneNeutral()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
aBria.TryToSetActorValue(CA_WantsToTalk, 2) ;has forcegreeted
aBria.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0360_Item_00
Function Fragment_Stage_0360_Item_00()
;BEGIN AUTOCAST TYPE affinityscenehandlerscript
Quest __temp = self as Quest
affinityscenehandlerscript kmyQuest = __temp as affinityscenehandlerscript
;END AUTOCAST
;BEGIN CODE
kmyquest.EndSceneNeutral()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0406_Item_00
Function Fragment_Stage_0406_Item_00()
;BEGIN CODE
aBria.TryToSetActorValue(CA_WantsToTalk, 2) ;has forcegreeted
aBria.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0407_Item_00
Function Fragment_Stage_0407_Item_00()
;BEGIN AUTOCAST TYPE affinityscenehandlerscript
Quest __temp = self as Quest
affinityscenehandlerscript kmyQuest = __temp as affinityscenehandlerscript
;END AUTOCAST
;BEGIN CODE
kmyquest.EndSceneFriend()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
aBria.TryToSetActorValue(CA_WantsToTalk, 2) ;has forcegreeted
aBria.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN AUTOCAST TYPE affinityscenehandlerscript
Quest __temp = self as Quest
affinityscenehandlerscript kmyQuest = __temp as affinityscenehandlerscript
;END AUTOCAST
;BEGIN CODE
kmyquest.EndSceneAdmiration()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0440_Item_00
Function Fragment_Stage_0440_Item_00()
;BEGIN CODE
aBria.TryToSetActorValue(CA_WantsToTalk, 2) ;has forcegreeted
aBria.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN AUTOCAST TYPE affinityscenehandlerscript
Quest __temp = self as Quest
affinityscenehandlerscript kmyQuest = __temp as affinityscenehandlerscript
;END AUTOCAST
;BEGIN CODE
kmyquest.EndSceneAdmiration()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0470_Item_00
Function Fragment_Stage_0470_Item_00()
;BEGIN CODE
aBria.TryToSetActorValue(CA_WantsToTalk, 2) ;has forcegreeted
aBria.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0480_Item_00
Function Fragment_Stage_0480_Item_00()
;BEGIN AUTOCAST TYPE affinityscenehandlerscript
Quest __temp = self as Quest
affinityscenehandlerscript kmyQuest = __temp as affinityscenehandlerscript
;END AUTOCAST
;BEGIN CODE
kmyquest.EndSceneAdmiration()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0496_Item_00
Function Fragment_Stage_0496_Item_00()
;BEGIN CODE
aBria.TryToSetActorValue(CA_WantsToTalk, 2) ;has forcegreeted
aBria.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0497_Item_00
Function Fragment_Stage_0497_Item_00()
;BEGIN AUTOCAST TYPE affinityscenehandlerscript
Quest __temp = self as Quest
affinityscenehandlerscript kmyQuest = __temp as affinityscenehandlerscript
;END AUTOCAST
;BEGIN CODE
kmyquest.EndSceneConfidant()
VM_BriaConfidant.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0498_Item_00
Function Fragment_Stage_0498_Item_00()
;BEGIN CODE
COMBria_02b_ConfidantPickup.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
aBria.TryToSetActorValue(CA_WantsToTalk, 2) ;has forcegreeted
aBria.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0511_Item_00
Function Fragment_Stage_0511_Item_00()
;BEGIN CODE
pBriaHasPerk.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0515_Item_00
Function Fragment_Stage_0515_Item_00()
;BEGIN AUTOCAST TYPE affinityscenehandlerscript
Quest __temp = self as Quest
affinityscenehandlerscript kmyQuest = __temp as affinityscenehandlerscript
;END AUTOCAST
;BEGIN CODE
(aBria.GetActorRef() as CompanionActorScript).RomanceDeclined(isPermanent = false)

kmyquest.UnlockedInfatuation()

;add companion perk clean up function
if(!Game.GetPlayer().HasPerk(pCleanUpTracker))
Game.GetPlayer().AddPerk(pCleanUpTracker)
EndIf

;Swap out perks if Bria does not teach player technique
if(Game.GetPlayer().HasPerk(pCompBriaPerk) && pBriaHasPerk.GetValue())
Game.GetPlayer().RemovePerk(pCompBriaPerk)
Game.GetPlayer().AddPerk(pCompBriaPerkAlt)
endIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN AUTOCAST TYPE affinityscenehandlerscript
Quest __temp = self as Quest
affinityscenehandlerscript kmyQuest = __temp as affinityscenehandlerscript
;END AUTOCAST
;BEGIN CODE
(aBria.GetActorRef() as CompanionActorScript).RomanceFail()

kmyquest.UnlockedInfatuation()

;add companion perk clean up function
if(!Game.GetPlayer().HasPerk(pCleanUpTracker))
Game.GetPlayer().AddPerk(pCleanUpTracker)
EndIf

;Swap out perks if Bria does not teach player technique
if(Game.GetPlayer().HasPerk(pCompBriaPerk) && pBriaHasPerk.GetValue())
Game.GetPlayer().RemovePerk(pCompBriaPerk)
Game.GetPlayer().AddPerk(pCompBriaPerkAlt)
endIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0522_Item_00
Function Fragment_Stage_0522_Item_00()
;BEGIN AUTOCAST TYPE affinityscenehandlerscript
Quest __temp = self as Quest
affinityscenehandlerscript kmyQuest = __temp as affinityscenehandlerscript
;END AUTOCAST
;BEGIN CODE
(aBria.GetActorRef() as CompanionActorScript).RomanceDeclined(isPermanent = true)

kmyquest.EndSceneInfatuation()

kmyquest.UnlockedInfatuation()

;add companion perk clean up function
if(!Game.GetPlayer().HasPerk(pCleanUpTracker))
Game.GetPlayer().AddPerk(pCleanUpTracker)
EndIf

;Swap out perks if Bria does not teach player technique
if(Game.GetPlayer().HasPerk(pCompBriaPerk) && pBriaHasPerk.GetValue())
Game.GetPlayer().RemovePerk(pCompBriaPerk)
Game.GetPlayer().AddPerk(pCompBriaPerkAlt)
endIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0525_Item_00
Function Fragment_Stage_0525_Item_00()
;BEGIN AUTOCAST TYPE affinityscenehandlerscript
Quest __temp = self as Quest
affinityscenehandlerscript kmyQuest = __temp as affinityscenehandlerscript
;END AUTOCAST
;BEGIN CODE
(aBria.GetActorRef() as CompanionActorScript).RomanceSuccess()

kmyquest.EndSceneInfatuation()

kmyquest.UnlockedInfatuation()

;add companion perk clean up function
if(!Game.GetPlayer().HasPerk(pCleanUpTracker))
Game.GetPlayer().AddPerk(pCleanUpTracker)
EndIf

;Swap out perks if Bria does not teach player technique
if(Game.GetPlayer().HasPerk(pCompBriaPerk) && pBriaHasPerk.GetValue())
Game.GetPlayer().RemovePerk(pCompBriaPerk)
Game.GetPlayer().AddPerk(pCompBriaPerkAlt)
endIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0540_Item_00
Function Fragment_Stage_0540_Item_00()
;BEGIN CODE
aBria.TryToSetActorValue(CA_WantsToTalk, 2) ;has forcegreeted
aBria.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN AUTOCAST TYPE affinityscenehandlerscript
Quest __temp = self as Quest
affinityscenehandlerscript kmyQuest = __temp as affinityscenehandlerscript
;END AUTOCAST
;BEGIN CODE
kmyquest.EndSceneInfatuation()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property aBria Auto Const

ActorValue Property CA_WantsToTalk Auto Const

GlobalVariable Property CA_T5_Hatred Auto Const

GlobalVariable Property CA_T4_Disdain Auto Const

GlobalVariable Property pBriaHasPerk Auto Const

Perk Property pCleanUpTracker Auto Const

Quest Property aCompBriaPerk Auto Const

Perk Property pCompBriaPerk Auto Const

Perk Property pCompBriaPerkAlt Auto Const

Quest Property qCOMBriaQuest Auto Const

Faction Property HasBeenCompanionFaction Auto Const

Scene Property COMBria_02b_AdmirationToConfidant Auto Const

GlobalVariable Property VM_BriaConfidant Auto Const

Scene Property COMBria_02b_ConfidantPickup Auto Const
