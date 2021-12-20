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
Function Setup(int aiVersion = 2) ; Increment version as needed.
    Trace("Setup()", Version)
    Actor player = Game.GetPlayer()
    if Version < aiVersion
        RegisterForRemoteEvent(player, "OnPlayerLoadGame")
        RegisterForCustomEvent(FV_StomachSim, "OnStomachChange")
        RegisterForCustomEvent(FV_ThiccVore, "OnThiccnessChange")
        If (ThiccPresets == None)
            ThiccPresets = new PresetSlider[0]
        EndIf
        LoadKeillaPreset()
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

; Private

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

    int thiccStage = Math.Floor(thiccness)
    Trace("UpdateGutMorphs()", thiccStage + " " + ThiccPresets)

    int index = 0 ; Doesn't seem to work... did the presets not get loaded, or else does the morph setting not work?
    While (index < ThiccPresets.Length && index <= 128)
        PresetSlider slider = ThiccPresets[index]

        If (thiccStage >= 0.0 && thiccStage < 1.0)
            BodyGen.SetMorph(akPred, true, slider.Name, FV_VoreMorphKeyword, thiccness * slider.Stage1)
        ElseIf (thiccStage >= 1.0 && thiccStage < 2.0)
            BodyGen.SetMorph(akPred, true, slider.Name, FV_VoreMorphKeyword, slider.Stage1 + (thiccness - thiccStage) * (slider.Stage2 - slider.Stage1))
        ElseIf (thiccStage >= 2.0 && thiccStage < 3.0)
            BodyGen.SetMorph(akPred, true, slider.Name, FV_VoreMorphKeyword, slider.Stage2 + (thiccness - thiccStage) * (slider.Stage3 - slider.Stage2))
        ElseIf (thiccStage >= 3.0 && thiccStage < 4.0)
            BodyGen.SetMorph(akPred, true, slider.Name, FV_VoreMorphKeyword, slider.Stage3 + (thiccness - thiccStage) * (slider.Stage4 - slider.Stage3))
        Else
            BodyGen.SetMorph(akPred, true, slider.Name, FV_VoreMorphKeyword, slider.Stage4)
        EndIf

        index += 1
    EndWhile
    BodyGen.UpdateMorphs(akPred)
EndFunction

PresetSlider[] ThiccPresets

Struct PresetSlider
    string Name
    float Stage1
    float Stage2
    float Stage3
    float Stage4
EndStruct

Function LoadKeillaPreset()
    PresetSlider slider = new PresetSlider
    slider.Name = "BBW"
    slider.Stage1 = 0.0
    slider.Stage2 = 0.0
    slider.Stage3 = 1.0
    slider.Stage4 = 2.0
    ThiccPresets.Add(slider)
    Trace("LoadKeillaPreset()", ThiccPresets)
EndFunction