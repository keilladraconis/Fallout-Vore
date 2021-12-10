Scriptname FalloutVore:FV_AudioVisual Extends Quest
{Implements Audio and Visual effects immediately related to Vore. This includes:
- Gut sounds and related timers
- Gut morphs}

Function Trace(string asFunction, string asMessage = "") Global debugOnly
	string logName = "FalloutVore"
	Debug.OpenUserLog(logName)
    Debug.TraceUser(logName, "[FalloutVore:FV_AudioVisual] " + asFunction + " - " + asMessage)	
EndFunction

Group ActorValues 
    ActorValue Property FV_CurrentPrey Auto Const Mandatory
EndGroup

Group Keywords 
    Keyword Property FV_VoreMorphKeyword Auto Const Mandatory
EndGroup

Group Scripts 
    FalloutVore:FV_StomachSimScript Property FV_StomachSim Auto Const Mandatory
EndGroup

; Quest Script Setup Boilerplate
int Version = 0
Function Setup(int aiVersion = 1) ; Increment version as needed.
    if Version < aiVersion
        Actor player = Game.GetPlayer()
        RegisterForRemoteEvent(player, "OnPlayerLoadGame")
        RegisterForCustomEvent(FV_StomachSim, "OnStomachChange")
        UpdateGutMorphs(player)
        Version = aiVersion
    EndIf
EndFunction

Event OnInit()
    Setup()
EndEvent

Event Actor.OnPlayerLoadGame(Actor akSender)
    Setup()
EndEvent

Event FalloutVore:FV_StomachSimScript.OnStomachChange(FalloutVore:FV_StomachSimScript akSender, Var[] akArgs)
    Trace("OnStomachChange()")
    Actor pred = akArgs[0] as Actor
    UpdateGutMorphs(pred)    
EndEvent

Function UpdateGutMorphs(Actor akPred)
    float bigSoftBelly = FV_StomachSim.GetBellyVolume(akPred)
    if bigSoftBelly >= 0.5
        OCBP_API.SetBoneToggle(akPred, false, "Belly_skin")
    else
        OCBP_API.SetBoneToggle(akPred, true, "Belly_skin")
    endif
    BodyGen.SetMorph(akPred, true, "Big Soft Belly", FV_VoreMorphKeyword, bigSoftBelly)
    BodyGen.UpdateMorphs(akPred)
EndFunction