Scriptname FalloutVore:FV_AudioVisual Extends Quest
{Implements Audio and Visual effects immediately related to Vore. This includes:
- Gut sounds and related timers
- Gut morphs}

Group ActorValues Collapsed
    ActorValue Property FV_CurrentPrey Auto Const Mandatory
EndGroup

Group Keywords Collapsed
    Keyword Property FV_VoreMorphKeyword Auto Const Mandatory
EndGroup

Group Scripts Collapsed
    FalloutVore:FV_ConsumptionRegistryScript Property FV_ConsumptionRegistry Auto Const Mandatory    
EndGroup

Event OnInit()
    RegisterForRemoteEvent(Game.GetPlayer(), "OnPlayerLoadGame")
    RegisterForCustomEvent(FV_ConsumptionRegistry, "OnAdd")
    RegisterForCustomEvent(FV_ConsumptionRegistry, "OnRemove")
EndEvent

Event Actor.OnPlayerLoadGame(Actor akSender)
    RegisterForCustomEvent(FV_ConsumptionRegistry, "OnAdd")
    RegisterForCustomEvent(FV_ConsumptionRegistry, "OnRemove")
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
    BodyGen.SetMorph(akPred, true, "Big Soft Belly", FV_VoreMorphKeyword, akPred.GetValue(FV_CurrentPrey) as float)
    BodyGen.UpdateMorphs(akPred)
EndFunction