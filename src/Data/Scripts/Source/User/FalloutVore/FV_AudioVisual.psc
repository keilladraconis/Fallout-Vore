Scriptname FalloutVore:FV_AudioVisual Extends Quest
{Implements Audio and Visual effects immediately related to Vore. This includes:
- Gut sounds and related timers
- Gut morphs}

import FalloutVore:FV_VoreUtilityScript

Group ActorValues 
    ActorValue Property FV_CurrentPrey Auto Const Mandatory
EndGroup

Group Keywords 
    Keyword Property FV_VoreMorphKeyword Auto Const Mandatory
EndGroup

Group Scripts 
    FalloutVore:FV_ConsumptionRegistryScript Property FV_ConsumptionRegistry Auto Const Mandatory    
EndGroup

Event OnInit()
    Actor player = Game.GetPlayer()
    RegisterForRemoteEvent(player, "OnPlayerLoadGame")
    RegisterForCustomEvent(FV_ConsumptionRegistry, "OnAdd")
    RegisterForCustomEvent(FV_ConsumptionRegistry, "OnRemove")
    UpdateGutMorphs(player)
EndEvent

Event Actor.OnPlayerLoadGame(Actor akSender)
    RegisterForCustomEvent(FV_ConsumptionRegistry, "OnAdd")
    RegisterForCustomEvent(FV_ConsumptionRegistry, "OnRemove")
    UpdateGutMorphs(Game.GetPlayer())
EndEvent

Event FalloutVore:FV_ConsumptionRegistryScript.OnAdd(FalloutVore:FV_ConsumptionRegistryScript akSender, Var[] akArgs)
    Actor pred = akArgs[0] as Actor
    UpdateGutMorphs(pred)
EndEvent

Event FalloutVore:FV_ConsumptionRegistryScript.OnRemove(FalloutVore:FV_ConsumptionRegistryScript akSender, Var[] akArgs)
    Actor pred = akArgs[0] as Actor
    UpdateGutMorphs(pred)
EndEvent

Function UpdateGutMorphs(Actor akPred)
    float bigSoftBelly = akPred.GetValue(FV_CurrentPrey) as float
    if bigSoftBelly >= 0.5
        OCBP_API.SetBoneToggle(akPred, false, "Belly_skin")
    else
        OCBP_API.SetBoneToggle(akPred, true, "Belly_skin")

    endif
    BodyGen.SetMorph(akPred, true, "Big Soft Belly", FV_VoreMorphKeyword, bigSoftBelly)
    BodyGen.UpdateMorphs(akPred)
EndFunction