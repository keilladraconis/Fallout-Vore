;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname followersript:Fragments:Quests:QF_VM_ContextDialogue_0400222A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE FV_ContextVoreQuestScript
Quest __temp = self as Quest
FV_ContextVoreQuestScript kmyQuest = __temp as FV_ContextVoreQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.EndDialogue()
SetStage(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN AUTOCAST TYPE FV_ContextVoreQuestScript
Quest __temp = self as Quest
FV_ContextVoreQuestScript kmyQuest = __temp as FV_ContextVoreQuestScript
;END AUTOCAST
;BEGIN CODE
ContextNPC.GetActorReference().SetValue(VM_ContextPreyAnnoyed, 3)
kmyQuest.NPCDeclines(ContextNPC.GetActorReference())
Setstage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE FV_ContextVoreQuestScript
Quest __temp = self as Quest
FV_ContextVoreQuestScript kmyQuest = __temp as FV_ContextVoreQuestScript
;END AUTOCAST
;BEGIN CODE
VM_SwallowNonLethalSpell.cast(game.getplayer(), ContextNPC.GetActorReference())
Utility.wait(0.5)
kmyQuest.EndDialogue()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN AUTOCAST TYPE FV_ContextVoreQuestScript
Quest __temp = self as Quest
FV_ContextVoreQuestScript kmyQuest = __temp as FV_ContextVoreQuestScript
;END AUTOCAST
;BEGIN CODE
VM_SwallowNonLethalSpell.cast(game.getplayer(), ContextNPC.GetActorReference())
Utility.wait(0.5)
kmyQuest.EndDialogue(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE FV_ContextVoreQuestScript
Quest __temp = self as Quest
FV_ContextVoreQuestScript kmyQuest = __temp as FV_ContextVoreQuestScript
;END AUTOCAST
;BEGIN CODE
Utility.Wait(0.5)

Actor akNPC = ContextNPC.GetActorReference()

VM_SwallowNonLethalSpell.Cast(akNPC, Game.GetPlayer())
PlayersPredAlias.ForceRefTo(akNPC)

If akNPC.GetValue(VM_ContextPreyAnnoyed) == 4
kmyQuest.RevengeTimer()
EndIf

ContextNPC.GetActorReference().SayCustom(VM_ContextDialogueSwallow)

SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN AUTOCAST TYPE FV_ContextVoreQuestScript
Quest __temp = self as Quest
FV_ContextVoreQuestScript kmyQuest = __temp as FV_ContextVoreQuestScript
;END AUTOCAST
;BEGIN CODE
Utility.Wait(0.5)

Actor akNPC = ContextNPC.GetActorReference()
VM_SwallowNonLethalSpell.Cast(akNPC, Game.GetPlayer())
PlayersPredAlias.ForceRefTo(akNPC)

If akNPC.GetValue(VM_ContextPreyAnnoyed) == 4
kmyQuest.RevengeTimer()
EndIf

SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN AUTOCAST TYPE FV_ContextVoreQuestScript
Quest __temp = self as Quest
FV_ContextVoreQuestScript kmyQuest = __temp as FV_ContextVoreQuestScript
;END AUTOCAST
;BEGIN CODE
Actor TempActor = VM_Prey.GetActorReference()

kmyQuest.FinishedContext(TempActor, true, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN AUTOCAST TYPE FV_ContextVoreQuestScript
Quest __temp = self as Quest
FV_ContextVoreQuestScript kmyQuest = __temp as FV_ContextVoreQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.FinishedContext(Game.GetPlayer(), true, true)
VM_ContextPredAnnoyed.SetValue(3)
kmyQuest.EndDialogue(EnablePerk = false)
SetStage(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE FV_ContextVoreQuestScript
Quest __temp = self as Quest
FV_ContextVoreQuestScript kmyQuest = __temp as FV_ContextVoreQuestScript
;END AUTOCAST
;BEGIN CODE
Actor TempActor = VM_Prey.GetActorReference()

kmyQuest.FinishedContext(TempActor, RestartTimer = true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN AUTOCAST TYPE FV_ContextVoreQuestScript
Quest __temp = self as Quest
FV_ContextVoreQuestScript kmyQuest = __temp as FV_ContextVoreQuestScript
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().SetValue(VM_RegurgitateBool, 1)
Actor TempActor = VM_Prey.GetActorReference()
kmyQuest.FinishedContext(TempActor, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
If VM_ContextPredAnnoyed.GetValue() < 2
VM_ContextPredAnnoyed.SetValue(VM_ContextPredAnnoyed.GetValue() + 1)
endIf
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Actor TempActor = VM_Prey.GetActorReference()

;If TempActor.GetValue(VM_ContextPreyAnnoyed) < 1
TempActor.SetValue(VM_ContextPreyAnnoyed, 1)
;EndIf

SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN CODE
Actor TempActor = VM_Prey.GetActorReference()

;If TempActor.GetValue(VM_ContextPreyAnnoyed) < 2
TempActor.SetValue(VM_ContextPreyAnnoyed, 2)
;EndIf

SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Actor TempActor = ContextNPC.GetActorReference()
If TempActor != NONE
TempActor.SetValue(VM_RegurgitateBool, 1)
VM_ContextPredAnnoyed.SetValue(3)
Else
debug.trace("ContextDialogue Bug.  TempActor == none  Stage 200")
endIf
;utility.wait(1.0)
;SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0205_Item_00
Function Fragment_Stage_0205_Item_00()
;BEGIN CODE
Actor TempActor = ContextNPC.GetActorReference()
If TempActor != NONE
TempActor.SetValue(VM_RegurgitateBool, 1)
Else
debug.trace("ContextDialogue Bug.  TempActor == none  Stage 205")
endIf
utility.wait(1.0)
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN AUTOCAST TYPE FV_ContextVoreQuestScript
Quest __temp = self as Quest
FV_ContextVoreQuestScript kmyQuest = __temp as FV_ContextVoreQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.DigestPlayer()
kmyQuest.FinishedContext(Game.GetPlayer(), true, true)
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE FV_ContextVoreQuestScript
Quest __temp = self as Quest
FV_ContextVoreQuestScript kmyQuest = __temp as FV_ContextVoreQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.DebugReset()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property ContextNPC Auto Const

SPELL Property VM_SwallowNonLethalSpell Auto Const

Keyword Property VM_ContextDialogueSwallow Auto Const

ReferenceAlias Property VM_Prey Auto Const

GlobalVariable Property RegurgetateBool Auto Const

ActorValue Property VM_ContextPreyAnnoyed Auto Const

ActorValue Property VM_RegurgitateBool Auto Const

GlobalVariable Property VM_ContextPredAnnoyed Auto Const

ReferenceAlias Property PlayersPredAlias Auto Const
