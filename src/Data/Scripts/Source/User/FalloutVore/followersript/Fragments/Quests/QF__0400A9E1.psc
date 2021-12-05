;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname FalloutVore:followersript:Fragments:Quests:QF__0400A9E1 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
;Set when the player enters the trigger volume, representing
;the guarded/checkpoint area.
if (!GetStageDone(40))
     SetStage(50)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE FV_REChokepointFOV01_Script
Quest __temp = self as Quest
FV_REChokepointFOV01_Script kmyQuest = __temp as FV_REChokepointFOV01_Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.RegisterEvents()

Actor Raider1 = VoreRaiderFemale.GetActorReference()
Actor Raider2 = VoreRaiderMale.GetActorReference()
Actor Raider3 = VoreRaiderRandom.GetActorReference()

;disable player movement in CSR
Quest _temp = ConsumptionRegistry as Quest
FV_ConsumptionRegistryScript kmyQuestA = _temp as FV_ConsumptionRegistryScript

kmyQuestA.DisablePlayerMovement()

If(Raider3.GetValue(FV_HasHadNukaAcid) == 1)
Raider3.SetValue(FV_TicksTillEscapePerk, 999)
Raider3.SetValue(StomachStrength,12)
SetStage(31)
Raider3.EvaluatePackage()
ElseIf(Raider1.GetValue(FV_HasHadNukaAcid) == 1)
Raider1.SetValue(FV_TicksTillEscapePerk, 999)
Raider1.SetValue(StomachStrength,12)
SetStage(32)
Raider1.EvaluatePackage()
ElseIf(Raider2.GetValue(FV_HasHadNukaAcid) == 1)
Raider2.SetValue(FV_TicksTillEscapePerk, 999)
Raider2.SetValue(StomachStrength,12)
SetStage(33)
Raider2.EvaluatePackage()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Player angers/attacks guards
Actor player = Game.GetPlayer()
Actor Raider1 = VoreRaiderFemale.GetActorRef()
Actor Raider2 = VoreRaiderMale.GetActorRef()
Actor Raider3 = VoreRaiderRandom.GetActorRef()
Raider1.StartCombat(player)
Raider2.StartCombat(player)
Raider3.StartCombat(player)
Raider1.EvaluatePackage()
Raider2.EvaluatePackage()
Raider3.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
Quest _temp1 = self as Quest
FV_REChokepointFOV01_Script kmyQuestA = _temp1 as FV_REChokepointFOV01_Script
kmyQuestA.UnregisterEvents()

debug.trace(self + " STOPPING")
(Alias_Trigger.GetRef() as RETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

ReferenceAlias Property VoreRaiderFemale Auto Const

ReferenceAlias Property VoreRaiderMale Auto Const

ReferenceAlias Property VoreRaiderRandom Auto Const

ActorValue Property FV_HasHadNukaAcid Auto Const

Quest Property ConsumptionRegistry Auto Const

ActorValue Property StomachStrength Auto Const

ActorValue Property FV_TicksTillEscapePerk Auto Const
