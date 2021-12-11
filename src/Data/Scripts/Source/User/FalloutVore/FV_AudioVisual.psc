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
    ActorValue Property FV_Thiccness Auto Const Mandatory
EndGroup

Group Keywords 
    Keyword Property FV_VoreMorphKeyword Auto Const Mandatory
EndGroup

Group Scripts 
    FalloutVore:FV_StomachSimScript Property FV_StomachSim Auto Const Mandatory
    FalloutVore:FV_ThiccVoreScript Property FV_ThiccVore Auto Const Mandatory
EndGroup

; Quest Script Setup Boilerplate
int Version = 0
Function Setup(int aiVersion = 1) ; Increment version as needed.
    Actor player = Game.GetPlayer()
    if Version < aiVersion
        RegisterForRemoteEvent(player, "OnPlayerLoadGame")
        RegisterForCustomEvent(FV_StomachSim, "OnStomachChange")
        RegisterForCustomEvent(FV_ThiccVore, "OnThiccnessChange")
        Version = aiVersion
    EndIf
    UpdateGutMorphs(player)
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

Event FalloutVore:FV_ThiccVoreScript.OnThiccnessChange(FalloutVore:FV_ThiccVoreScript akSender, Var[] akArgs)
    Trace("OnThiccnessChange()")
    Actor pred = akArgs[0] as Actor
    UpdateGutMorphs(pred)
EndEvent

Function UpdateGutMorphs(Actor akPred)
    float bigSoftBelly = FV_StomachSim.GetBellyVolume(akPred)
    float thiccness = akPred.GetValue(FV_Thiccness)
    ; Thiccness DumbBones - TODO: Make this and the threshold MCM configurable.
    If (thiccness >= 0.5)
        OCBP_API.SetBoneToggle(akPred, false, "LButt_01_skin")
        OCBP_API.SetBoneToggle(akPred, false, "RButt_01_skin")
        OCBP_API.SetBoneToggle(akPred, false, "Belly_skin")
        OCBP_API.SetBoneToggle(akPred, false, "LLeg_Thigh_01_F_skin")
        OCBP_API.SetBoneToggle(akPred, false, "RLeg_Thigh_01_F_skin")
        OCBP_API.SetBoneToggle(akPred, false, "LLeg_Thigh_01_R_skin")
        OCBP_API.SetBoneToggle(akPred, false, "RLeg_Thigh_01_R_skin")
        OCBP_API.SetBoneToggle(akPred, false, "LLeg_Thigh_skin")
        OCBP_API.SetBoneToggle(akPred, false, "RLeg_Thigh_skin")
        OCBP_API.SetBoneToggle(akPred, false, "LLeg_Thigh_Low_skin")
        OCBP_API.SetBoneToggle(akPred, false, "RLeg_Thigh_Low_skin")
    Else
        OCBP_API.SetBoneToggle(akPred, true, "LButt_01_skin")
        OCBP_API.SetBoneToggle(akPred, true, "RButt_01_skin")
        OCBP_API.SetBoneToggle(akPred, true, "Belly_skin")
        OCBP_API.SetBoneToggle(akPred, true, "LLeg_Thigh_01_F_skin")
        OCBP_API.SetBoneToggle(akPred, true, "RLeg_Thigh_01_F_skin")
        OCBP_API.SetBoneToggle(akPred, true, "LLeg_Thigh_01_R_skin")
        OCBP_API.SetBoneToggle(akPred, true, "RLeg_Thigh_01_R_skin")
        OCBP_API.SetBoneToggle(akPred, true, "LLeg_Thigh_skin")
        OCBP_API.SetBoneToggle(akPred, true, "RLeg_Thigh_skin")
        OCBP_API.SetBoneToggle(akPred, true, "LLeg_Thigh_Low_skin")
        OCBP_API.SetBoneToggle(akPred, true, "RLeg_Thigh_Low_skin")
    EndIf
    ; Gut DumbBones
    if (bigSoftBelly >= 0.5 || !OCBP_API.GetBoneToggle(akPred, "Belly_skin"))
        OCBP_API.SetBoneToggle(akPred, false, "Belly_skin")
    else
        OCBP_API.SetBoneToggle(akPred, true, "Belly_skin")
    endif
    BodyGen.SetMorph(akPred, true, "Big Soft Belly", FV_VoreMorphKeyword, bigSoftBelly)
    BodyGen.SetMorph(akPred, true, "BBW", FV_VoreMorphKeyword, thiccness)
    BodyGen.UpdateMorphs(akPred)
EndFunction