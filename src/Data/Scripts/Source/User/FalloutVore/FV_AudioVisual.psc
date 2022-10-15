Scriptname FalloutVore:FV_AudioVisual Extends Quest
{Implements Audio and Visual effects immediately related to Vore. This includes:
- Gut sounds and related timers
- Gut morphs
- Activating/Deactivating jiggle bones}

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
Function Setup(int aiVersion = 4) ; Increment version as needed.
;    Trace("Setup()", Version)
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
    GotoState("UpdatingMorphs")
    EnqueueUpdateMorphs(player)
    StartTimer(0.1)
EndFunction

Event OnInit()
    Setup()
EndEvent

Event Actor.OnPlayerLoadGame(Actor akSender)
    Setup()
EndEvent

; Processes MCM-configured Thicc sliders and applies them.
Function CompileThiccSliders()
    ; Trace("CompileThiccSliders")
    PresetSlider slider = new PresetSlider
    ThiccPresets.Clear()
    
    slider.Name = MCM.GetModSettingString("FalloutVore", "sSlider1Name:ThiccVore") as string
    slider.Stage1 = MCM.GetModSettingFloat("FalloutVore", "fSlider1Stage1:ThiccVore") as float
    slider.Stage2 = MCM.GetModSettingFloat("FalloutVore", "fSlider1Stage1:ThiccVore") as float
    slider.Stage3 = MCM.GetModSettingFloat("FalloutVore", "fSlider1Stage1:ThiccVore") as float
    slider.Stage4 = MCM.GetModSettingFloat("FalloutVore", "fSlider1Stage1:ThiccVore") as float
    Trace("CompileThiccSliders", "Slider: " + slider)
    ThiccPresets.Add(slider)
EndFunction

; Private

Event FalloutVore:FV_StomachSimScript.OnStomachChange(FalloutVore:FV_StomachSimScript akSender, Var[] akArgs)
    GotoState("UpdatingMorphs")
    Actor pred = akArgs[0] as Actor
    ; Trace("OnStomachChange()", pred)
    EnqueueUpdateMorphs(pred)
    StartTimer(0.1)
EndEvent

Event FalloutVore:FV_ThiccVoreScript.OnThiccnessChange(FalloutVore:FV_ThiccVoreScript akSender, Var[] akArgs)
    GotoState("UpdatingMorphs")
    Actor pred = akArgs[0] as Actor
    Trace("OnThiccnessChange()", pred)
    EnqueueUpdateMorphs(pred)        
    StartTimer(0.1)
EndEvent

Event OnTimer(int aiTimerID)
    ; Does nothing
EndEvent

State UpdatingMorphs
    Event FalloutVore:FV_StomachSimScript.OnStomachChange(FalloutVore:FV_StomachSimScript akSender, Var[] akArgs)
        Actor pred = akArgs[0] as Actor
        ; Trace("OnStomachChange() [UpdatingMorphs]", pred)
        EnqueueUpdateMorphs(pred)        
    EndEvent
    
    Event FalloutVore:FV_ThiccVoreScript.OnThiccnessChange(FalloutVore:FV_ThiccVoreScript akSender, Var[] akArgs)
        Actor pred = akArgs[0] as Actor
        ; Trace("OnThiccnessChange() [UpdatingMorphs]", pred)
        EnqueueUpdateMorphs(pred)        
    EndEvent

    Event OnTimer(int aiTimerID)
        GetUpdateMorphsLock()
        If (UpdateMorphsQueue.Length == 0)
            UpdateMorphsLock = false
            GotoState("")
            ; Trace("OnTimer()", "Queue is empty")
            Return None
        EndIf
        Actor pred = UpdateMorphsQueue[0]
        UpdateMorphsLock = false
        UpdateMorphs_OnTimer(pred)
        UpdateMorphsQueue.Remove(0)
        StartTimer(0.1)
    EndEvent
EndState

Actor[] UpdateMorphsQueue
int UpdateMorphsLockWait
bool UpdateMorphsLock = false

Function GetUpdateMorphsLock()
    UpdateMorphsLockWait += 1
    While (UpdateMorphsLock)
        ; Trace("GetUpdateMorphsLock()", "Lock Wait:" + UpdateMorphsLockWait)
        Utility.Wait(0.1 * UpdateMorphsLockWait)
    EndWhile
    UpdateMorphsLock = true
    UpdateMorphsLockWait -= 1
EndFunction

; Updates all morphs for the given actor. 
; Very thread unsafe, so we queue updates and lock this function to a single thread.
Function EnqueueUpdateMorphs(Actor akPred)
    GetUpdateMorphsLock()
    If (UpdateMorphsQueue == None)
        UpdateMorphsQueue = new Actor[0]
    EndIf
    If (UpdateMorphsQueue.Find(akPred) >= 0)
        ; Trace("EnqueueUpdateMorphs()", "Pred already queued:" + akPred)
        UpdateMorphsLock = false
        Return
    Else
        ; Trace("EnqueueUpdateMorphs()", akPred)
        UpdateMorphsQueue.Add(akPred)
    EndIf
    UpdateMorphsLock = false
EndFunction

; Runs on a timer to ensure that only one is running at a time.
Function UpdateMorphs_OnTimer(Actor akPred)
    Trace("UpdateMorphs_OnTimer()", akPred)

    float bigSoftBelly = FV_StomachSim.GetBellyVolume(akPred) ; External!
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
    int index = 0 ; Doesn't seem to work... did the presets not get loaded, or else does the morph setting not work?
    Trace("UpdateMorphs", "Thicc Presets: " + ThiccPresets + " thiccStage: " + thiccStage)
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
    Trace("UpdateMorphs_1() Finished", akPred)
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
    PresetSlider slider
    ThiccPresets.Clear()
    ; THICC settings
    slider = new PresetSlider
    slider.Name = "Breasts"
    slider.Stage1 = 1.0
    slider.Stage2 = 1.0
    slider.Stage3 = 1.0
    slider.Stage4 = 1.0
    ThiccPresets.Add(slider)

    slider = new PresetSlider
    slider.Name = "Butt"
    slider.Stage1 = 1.0
    slider.Stage2 = 1.0
    slider.Stage3 = 1.0
    slider.Stage4 = 1.0
    ThiccPresets.Add(slider)

    slider = new PresetSlider
    slider.Name = "RoundAss"
    slider.Stage1 = 1.0
    slider.Stage2 = 1.0
    slider.Stage3 = 1.0
    slider.Stage4 = 1.0
    ThiccPresets.Add(slider)

    slider = new PresetSlider
    slider.Name = "Thighs"
    slider.Stage1 = 1.0
    slider.Stage2 = 1.0
    slider.Stage3 = 1.0
    slider.Stage4 = 1.0
    ThiccPresets.Add(slider)

    slider = new PresetSlider
    slider.Name = "Belly Thicc"
    slider.Stage1 = 1.0
    slider.Stage2 = 1.0
    slider.Stage3 = 1.0
    slider.Stage4 = 1.0
    ThiccPresets.Add(slider)

    slider = new PresetSlider
    slider.Name = "Thicc Knees"
    slider.Stage1 = 1.0
    slider.Stage2 = 1.0
    slider.Stage3 = 1.0
    slider.Stage4 = 1.0
    ThiccPresets.Add(slider)

    slider = new PresetSlider
    slider.Name = "ChubbyArms"
    slider.Stage1 = 1.0
    slider.Stage2 = 1.0
    slider.Stage3 = 1.0
    slider.Stage4 = 1.0
    ThiccPresets.Add(slider)
    
    ; BBW
    slider = new PresetSlider
    slider.Name = "BBW"
    slider.Stage1 = 0.0
    slider.Stage2 = 0.5
    slider.Stage3 = 1.0
    slider.Stage4 = 2.0
    ThiccPresets.Add(slider)

    slider = new PresetSlider
    slider.Name = "BreastsNewSH"
    slider.Stage1 = 0.0
    slider.Stage2 = -1.0
    slider.Stage3 = -2.0
    slider.Stage4 = -2.0
    ThiccPresets.Add(slider)

    slider = new PresetSlider
    slider.Name = "BreastTopSlope"
    slider.Stage1 = 0.0
    slider.Stage2 = 1.0
    slider.Stage3 = 2.0
    slider.Stage4 = 2.0
    ThiccPresets.Add(slider)

    slider = new PresetSlider
    slider.Name = "BreastGravity2"
    slider.Stage1 = 0.0
    slider.Stage2 = 0.0
    slider.Stage3 = 1.0
    slider.Stage4 = 1.0
    ThiccPresets.Add(slider)

    slider = new PresetSlider
    slider.Name = "NipBGone"
    slider.Stage1 = 0.0
    slider.Stage2 = 1.0
    slider.Stage3 = 2.0
    slider.Stage4 = 2.0
    ThiccPresets.Add(slider)

    slider = new PresetSlider
    slider.Name = "BreastsSmall"
    slider.Stage1 = 0.0
    slider.Stage2 = 0.0
    slider.Stage3 = 0.0
    slider.Stage4 = 2.0
    ThiccPresets.Add(slider)

    slider = new PresetSlider
    slider.Name = "BreastsSmall2"
    slider.Stage1 = 0.0
    slider.Stage2 = 0.0
    slider.Stage3 = 0.0
    slider.Stage4 = 2.0
    ThiccPresets.Add(slider)
    ; Trace("LoadKeillaPreset()", ThiccPresets)
EndFunction

