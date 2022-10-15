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
            CompileThiccSliders()
        EndIf
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
    PresetSlider slider

    ThiccPresets.Clear()

    slider = new PresetSlider
    slider.Name = MCM.GetModSettingString("FalloutVore", "sSlider1Name:ThiccVore")
    If (slider.Name != "")
        slider.Stage1 = MCM.GetModSettingFloat("FalloutVore", "fSlider1Stage1:ThiccVore")
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider1Stage2:ThiccVore")) > Math.abs(slider.Stage1))
            slider.Stage2 = MCM.GetModSettingFloat("FalloutVore", "fSlider1Stage2:ThiccVore")
        Else
            slider.Stage2 = slider.Stage1
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider1Stage3:ThiccVore")) > Math.abs(slider.Stage2))
            slider.Stage3 = MCM.GetModSettingFloat("FalloutVore", "fSlider1Stage3:ThiccVore")
        Else
            slider.Stage3 = slider.Stage2
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider1Stage4:ThiccVore")) > Math.abs(slider.Stage3))
            slider.Stage4 = MCM.GetModSettingFloat("FalloutVore", "fSlider1Stage4:ThiccVore")
        Else
            slider.Stage4 = slider.Stage3
        EndIf
        ThiccPresets.Add(slider)
    EndIf
    
    slider = new PresetSlider
    slider.Name = MCM.GetModSettingString("FalloutVore", "sSlider2Name:ThiccVore")
    If (slider.Name != "")
        slider.Stage1 = MCM.GetModSettingFloat("FalloutVore", "fSlider2Stage1:ThiccVore")
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider2Stage2:ThiccVore")) > Math.abs(slider.Stage1))
            slider.Stage2 = MCM.GetModSettingFloat("FalloutVore", "fSlider2Stage2:ThiccVore")
        Else
            slider.Stage2 = slider.Stage1
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider2Stage3:ThiccVore")) > Math.abs(slider.Stage2))
            slider.Stage3 = MCM.GetModSettingFloat("FalloutVore", "fSlider2Stage3:ThiccVore")
        Else
            slider.Stage3 = slider.Stage2
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider2Stage4:ThiccVore")) > Math.abs(slider.Stage3))
            slider.Stage4 = MCM.GetModSettingFloat("FalloutVore", "fSlider2Stage4:ThiccVore")
        Else
            slider.Stage4 = slider.Stage3
        EndIf
        ThiccPresets.Add(slider)
    EndIf
    
    slider = new PresetSlider
    slider.Name = MCM.GetModSettingString("FalloutVore", "sSlider3Name:ThiccVore")
    If (slider.Name != "")
        slider.Stage1 = MCM.GetModSettingFloat("FalloutVore", "fSlider3Stage1:ThiccVore")
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider3Stage2:ThiccVore")) > Math.abs(slider.Stage1))
            slider.Stage2 = MCM.GetModSettingFloat("FalloutVore", "fSlider3Stage2:ThiccVore")
        Else
            slider.Stage2 = slider.Stage1
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider3Stage3:ThiccVore")) > Math.abs(slider.Stage2))
            slider.Stage3 = MCM.GetModSettingFloat("FalloutVore", "fSlider3Stage3:ThiccVore")
        Else
            slider.Stage3 = slider.Stage2
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider3Stage4:ThiccVore")) > Math.abs(slider.Stage3))
            slider.Stage4 = MCM.GetModSettingFloat("FalloutVore", "fSlider3Stage4:ThiccVore")
        Else
            slider.Stage4 = slider.Stage3
        EndIf
        ThiccPresets.Add(slider)
    EndIf
    
    slider = new PresetSlider
    slider.Name = MCM.GetModSettingString("FalloutVore", "sSlider4Name:ThiccVore")
    If (slider.Name != "")
        slider.Stage1 = MCM.GetModSettingFloat("FalloutVore", "fSlider4Stage1:ThiccVore")
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider4Stage2:ThiccVore")) > Math.abs(slider.Stage1))
            slider.Stage2 = MCM.GetModSettingFloat("FalloutVore", "fSlider4Stage2:ThiccVore")
        Else
            slider.Stage2 = slider.Stage1
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider4Stage3:ThiccVore")) > Math.abs(slider.Stage2))
            slider.Stage3 = MCM.GetModSettingFloat("FalloutVore", "fSlider4Stage3:ThiccVore")
        Else
            slider.Stage3 = slider.Stage2
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider4Stage4:ThiccVore")) > Math.abs(slider.Stage3))
            slider.Stage4 = MCM.GetModSettingFloat("FalloutVore", "fSlider4Stage4:ThiccVore")
        Else
            slider.Stage4 = slider.Stage3
        EndIf
        ThiccPresets.Add(slider)
    EndIf
    
    slider = new PresetSlider
    slider.Name = MCM.GetModSettingString("FalloutVore", "sSlider5Name:ThiccVore")
    If (slider.Name != "")
        slider.Stage1 = MCM.GetModSettingFloat("FalloutVore", "fSlider5Stage1:ThiccVore")
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider5Stage2:ThiccVore")) > Math.abs(slider.Stage1))
            slider.Stage2 = MCM.GetModSettingFloat("FalloutVore", "fSlider5Stage2:ThiccVore")
        Else
            slider.Stage2 = slider.Stage1
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider5Stage3:ThiccVore")) > Math.abs(slider.Stage2))
            slider.Stage3 = MCM.GetModSettingFloat("FalloutVore", "fSlider5Stage3:ThiccVore")
        Else
            slider.Stage3 = slider.Stage2
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider5Stage4:ThiccVore")) > Math.abs(slider.Stage3))
            slider.Stage4 = MCM.GetModSettingFloat("FalloutVore", "fSlider5Stage4:ThiccVore")
        Else
            slider.Stage4 = slider.Stage3
        EndIf
        ThiccPresets.Add(slider)
    EndIf
    
    slider = new PresetSlider
    slider.Name = MCM.GetModSettingString("FalloutVore", "sSlider6Name:ThiccVore")
    If (slider.Name != "")
        slider.Stage1 = MCM.GetModSettingFloat("FalloutVore", "fSlider6Stage1:ThiccVore")
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider6Stage2:ThiccVore")) > Math.abs(slider.Stage1))
            slider.Stage2 = MCM.GetModSettingFloat("FalloutVore", "fSlider6Stage2:ThiccVore")
        Else
            slider.Stage2 = slider.Stage1
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider6Stage3:ThiccVore")) > Math.abs(slider.Stage2))
            slider.Stage3 = MCM.GetModSettingFloat("FalloutVore", "fSlider6Stage3:ThiccVore")
        Else
            slider.Stage3 = slider.Stage2
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider6Stage4:ThiccVore")) > Math.abs(slider.Stage3))
            slider.Stage4 = MCM.GetModSettingFloat("FalloutVore", "fSlider6Stage4:ThiccVore")
        Else
            slider.Stage4 = slider.Stage3
        EndIf
        ThiccPresets.Add(slider)
    EndIf
    
    slider = new PresetSlider
    slider.Name = MCM.GetModSettingString("FalloutVore", "sSlider7Name:ThiccVore")
    If (slider.Name != "")
        slider.Stage1 = MCM.GetModSettingFloat("FalloutVore", "fSlider7Stage1:ThiccVore")
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider7Stage2:ThiccVore")) > Math.abs(slider.Stage1))
            slider.Stage2 = MCM.GetModSettingFloat("FalloutVore", "fSlider7Stage2:ThiccVore")
        Else
            slider.Stage2 = slider.Stage1
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider7Stage3:ThiccVore")) > Math.abs(slider.Stage2))
            slider.Stage3 = MCM.GetModSettingFloat("FalloutVore", "fSlider7Stage3:ThiccVore")
        Else
            slider.Stage3 = slider.Stage2
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider7Stage4:ThiccVore")) > Math.abs(slider.Stage3))
            slider.Stage4 = MCM.GetModSettingFloat("FalloutVore", "fSlider7Stage4:ThiccVore")
        Else
            slider.Stage4 = slider.Stage3
        EndIf
        ThiccPresets.Add(slider)
    EndIf
    
    slider = new PresetSlider
    slider.Name = MCM.GetModSettingString("FalloutVore", "sSlider8Name:ThiccVore")
    If (slider.Name != "")
        slider.Stage1 = MCM.GetModSettingFloat("FalloutVore", "fSlider8Stage1:ThiccVore")
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider8Stage2:ThiccVore")) > Math.abs(slider.Stage1))
            slider.Stage2 = MCM.GetModSettingFloat("FalloutVore", "fSlider8Stage2:ThiccVore")
        Else
            slider.Stage2 = slider.Stage1
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider8Stage3:ThiccVore")) > Math.abs(slider.Stage2))
            slider.Stage3 = MCM.GetModSettingFloat("FalloutVore", "fSlider8Stage3:ThiccVore")
        Else
            slider.Stage3 = slider.Stage2
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider8Stage4:ThiccVore")) > Math.abs(slider.Stage3))
            slider.Stage4 = MCM.GetModSettingFloat("FalloutVore", "fSlider8Stage4:ThiccVore")
        Else
            slider.Stage4 = slider.Stage3
        EndIf
        ThiccPresets.Add(slider)
    EndIf
    
    slider = new PresetSlider
    slider.Name = MCM.GetModSettingString("FalloutVore", "sSlider9Name:ThiccVore")
    If (slider.Name != "")
        slider.Stage1 = MCM.GetModSettingFloat("FalloutVore", "fSlider9Stage1:ThiccVore")
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider9Stage2:ThiccVore")) > Math.abs(slider.Stage1))
            slider.Stage2 = MCM.GetModSettingFloat("FalloutVore", "fSlider9Stage2:ThiccVore")
        Else
            slider.Stage2 = slider.Stage1
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider9Stage3:ThiccVore")) > Math.abs(slider.Stage2))
            slider.Stage3 = MCM.GetModSettingFloat("FalloutVore", "fSlider9Stage3:ThiccVore")
        Else
            slider.Stage3 = slider.Stage2
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider9Stage4:ThiccVore")) > Math.abs(slider.Stage3))
            slider.Stage4 = MCM.GetModSettingFloat("FalloutVore", "fSlider9Stage4:ThiccVore")
        Else
            slider.Stage4 = slider.Stage3
        EndIf
        ThiccPresets.Add(slider)
    EndIf
    
    slider = new PresetSlider
    slider.Name = MCM.GetModSettingString("FalloutVore", "sSlider10Name:ThiccVore")
    If (slider.Name != "")
        slider.Stage1 = MCM.GetModSettingFloat("FalloutVore", "fSlider10Stage1:ThiccVore")
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider10Stage2:ThiccVore")) > Math.abs(slider.Stage1))
            slider.Stage2 = MCM.GetModSettingFloat("FalloutVore", "fSlider10Stage2:ThiccVore")
        Else
            slider.Stage2 = slider.Stage1
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider10Stage3:ThiccVore")) > Math.abs(slider.Stage2))
            slider.Stage3 = MCM.GetModSettingFloat("FalloutVore", "fSlider10Stage3:ThiccVore")
        Else
            slider.Stage3 = slider.Stage2
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider10Stage4:ThiccVore")) > Math.abs(slider.Stage3))
            slider.Stage4 = MCM.GetModSettingFloat("FalloutVore", "fSlider10Stage4:ThiccVore")
        Else
            slider.Stage4 = slider.Stage3
        EndIf
        ThiccPresets.Add(slider)
    EndIf
    
    slider = new PresetSlider
    slider.Name = MCM.GetModSettingString("FalloutVore", "sSlider11Name:ThiccVore")
    If (slider.Name != "")
        slider.Stage1 = MCM.GetModSettingFloat("FalloutVore", "fSlider11Stage1:ThiccVore")
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider11Stage2:ThiccVore")) > Math.abs(slider.Stage1))
            slider.Stage2 = MCM.GetModSettingFloat("FalloutVore", "fSlider11Stage2:ThiccVore")
        Else
            slider.Stage2 = slider.Stage1
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider11Stage3:ThiccVore")) > Math.abs(slider.Stage2))
            slider.Stage3 = MCM.GetModSettingFloat("FalloutVore", "fSlider11Stage3:ThiccVore")
        Else
            slider.Stage3 = slider.Stage2
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider11Stage4:ThiccVore")) > Math.abs(slider.Stage3))
            slider.Stage4 = MCM.GetModSettingFloat("FalloutVore", "fSlider11Stage4:ThiccVore")
        Else
            slider.Stage4 = slider.Stage3
        EndIf
        ThiccPresets.Add(slider)
    EndIf
    
    slider = new PresetSlider
    slider.Name = MCM.GetModSettingString("FalloutVore", "sSlider12Name:ThiccVore")
    If (slider.Name != "")
        slider.Stage1 = MCM.GetModSettingFloat("FalloutVore", "fSlider12Stage1:ThiccVore")
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider12Stage2:ThiccVore")) > Math.abs(slider.Stage1))
            slider.Stage2 = MCM.GetModSettingFloat("FalloutVore", "fSlider12Stage2:ThiccVore")
        Else
            slider.Stage2 = slider.Stage1
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider12Stage3:ThiccVore")) > Math.abs(slider.Stage2))
            slider.Stage3 = MCM.GetModSettingFloat("FalloutVore", "fSlider12Stage3:ThiccVore")
        Else
            slider.Stage3 = slider.Stage2
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider12Stage4:ThiccVore")) > Math.abs(slider.Stage3))
            slider.Stage4 = MCM.GetModSettingFloat("FalloutVore", "fSlider12Stage4:ThiccVore")
        Else
            slider.Stage4 = slider.Stage3
        EndIf
        ThiccPresets.Add(slider)
    EndIf
    
    slider = new PresetSlider
    slider.Name = MCM.GetModSettingString("FalloutVore", "sSlider13Name:ThiccVore")
    If (slider.Name != "")
        slider.Stage1 = MCM.GetModSettingFloat("FalloutVore", "fSlider13Stage1:ThiccVore")
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider13Stage2:ThiccVore")) > Math.abs(slider.Stage1))
            slider.Stage2 = MCM.GetModSettingFloat("FalloutVore", "fSlider13Stage2:ThiccVore")
        Else
            slider.Stage2 = slider.Stage1
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider13Stage3:ThiccVore")) > Math.abs(slider.Stage2))
            slider.Stage3 = MCM.GetModSettingFloat("FalloutVore", "fSlider13Stage3:ThiccVore")
        Else
            slider.Stage3 = slider.Stage2
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider13Stage4:ThiccVore")) > Math.abs(slider.Stage3))
            slider.Stage4 = MCM.GetModSettingFloat("FalloutVore", "fSlider13Stage4:ThiccVore")
        Else
            slider.Stage4 = slider.Stage3
        EndIf
        ThiccPresets.Add(slider)
    EndIf
    
    slider = new PresetSlider
    slider.Name = MCM.GetModSettingString("FalloutVore", "sSlider14Name:ThiccVore")
    If (slider.Name != "")
        slider.Stage1 = MCM.GetModSettingFloat("FalloutVore", "fSlider14Stage1:ThiccVore")
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider14Stage2:ThiccVore")) > Math.abs(slider.Stage1))
            slider.Stage2 = MCM.GetModSettingFloat("FalloutVore", "fSlider14Stage2:ThiccVore")
        Else
            slider.Stage2 = slider.Stage1
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider14Stage3:ThiccVore")) > Math.abs(slider.Stage2))
            slider.Stage3 = MCM.GetModSettingFloat("FalloutVore", "fSlider14Stage3:ThiccVore")
        Else
            slider.Stage3 = slider.Stage2
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider14Stage4:ThiccVore")) > Math.abs(slider.Stage3))
            slider.Stage4 = MCM.GetModSettingFloat("FalloutVore", "fSlider14Stage4:ThiccVore")
        Else
            slider.Stage4 = slider.Stage3
        EndIf
        ThiccPresets.Add(slider)
    EndIf
    
    slider = new PresetSlider
    slider.Name = MCM.GetModSettingString("FalloutVore", "sSlider15Name:ThiccVore")
    If (slider.Name != "")
        slider.Stage1 = MCM.GetModSettingFloat("FalloutVore", "fSlider15Stage1:ThiccVore")
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider15Stage2:ThiccVore")) > Math.abs(slider.Stage1))
            slider.Stage2 = MCM.GetModSettingFloat("FalloutVore", "fSlider15Stage2:ThiccVore")
        Else
            slider.Stage2 = slider.Stage1
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider15Stage3:ThiccVore")) > Math.abs(slider.Stage2))
            slider.Stage3 = MCM.GetModSettingFloat("FalloutVore", "fSlider15Stage3:ThiccVore")
        Else
            slider.Stage3 = slider.Stage2
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider15Stage4:ThiccVore")) > Math.abs(slider.Stage3))
            slider.Stage4 = MCM.GetModSettingFloat("FalloutVore", "fSlider15Stage4:ThiccVore")
        Else
            slider.Stage4 = slider.Stage3
        EndIf
        ThiccPresets.Add(slider)
    EndIf
    
    slider = new PresetSlider
    slider.Name = MCM.GetModSettingString("FalloutVore", "sSlider16Name:ThiccVore")
    If (slider.Name != "")
        slider.Stage1 = MCM.GetModSettingFloat("FalloutVore", "fSlider16Stage1:ThiccVore")
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider16Stage2:ThiccVore")) > Math.abs(slider.Stage1))
            slider.Stage2 = MCM.GetModSettingFloat("FalloutVore", "fSlider16Stage2:ThiccVore")
        Else
            slider.Stage2 = slider.Stage1
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider16Stage3:ThiccVore")) > Math.abs(slider.Stage2))
            slider.Stage3 = MCM.GetModSettingFloat("FalloutVore", "fSlider16Stage3:ThiccVore")
        Else
            slider.Stage3 = slider.Stage2
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider16Stage4:ThiccVore")) > Math.abs(slider.Stage3))
            slider.Stage4 = MCM.GetModSettingFloat("FalloutVore", "fSlider16Stage4:ThiccVore")
        Else
            slider.Stage4 = slider.Stage3
        EndIf
        ThiccPresets.Add(slider)
    EndIf
    
    slider = new PresetSlider
    slider.Name = MCM.GetModSettingString("FalloutVore", "sSlider17Name:ThiccVore")
    If (slider.Name != "")
        slider.Stage1 = MCM.GetModSettingFloat("FalloutVore", "fSlider17Stage1:ThiccVore")
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider17Stage2:ThiccVore")) > Math.abs(slider.Stage1))
            slider.Stage2 = MCM.GetModSettingFloat("FalloutVore", "fSlider17Stage2:ThiccVore")
        Else
            slider.Stage2 = slider.Stage1
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider17Stage3:ThiccVore")) > Math.abs(slider.Stage2))
            slider.Stage3 = MCM.GetModSettingFloat("FalloutVore", "fSlider17Stage3:ThiccVore")
        Else
            slider.Stage3 = slider.Stage2
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider17Stage4:ThiccVore")) > Math.abs(slider.Stage3))
            slider.Stage4 = MCM.GetModSettingFloat("FalloutVore", "fSlider17Stage4:ThiccVore")
        Else
            slider.Stage4 = slider.Stage3
        EndIf
        ThiccPresets.Add(slider)
    EndIf
    
    slider = new PresetSlider
    slider.Name = MCM.GetModSettingString("FalloutVore", "sSlider18Name:ThiccVore")
    If (slider.Name != "")
        slider.Stage1 = MCM.GetModSettingFloat("FalloutVore", "fSlider18Stage1:ThiccVore")
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider18Stage2:ThiccVore")) > Math.abs(slider.Stage1))
            slider.Stage2 = MCM.GetModSettingFloat("FalloutVore", "fSlider18Stage2:ThiccVore")
        Else
            slider.Stage2 = slider.Stage1
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider18Stage3:ThiccVore")) > Math.abs(slider.Stage2))
            slider.Stage3 = MCM.GetModSettingFloat("FalloutVore", "fSlider18Stage3:ThiccVore")
        Else
            slider.Stage3 = slider.Stage2
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider18Stage4:ThiccVore")) > Math.abs(slider.Stage3))
            slider.Stage4 = MCM.GetModSettingFloat("FalloutVore", "fSlider18Stage4:ThiccVore")
        Else
            slider.Stage4 = slider.Stage3
        EndIf
        ThiccPresets.Add(slider)
    EndIf
    
    slider = new PresetSlider
    slider.Name = MCM.GetModSettingString("FalloutVore", "sSlider19Name:ThiccVore")
    If (slider.Name != "")
        slider.Stage1 = MCM.GetModSettingFloat("FalloutVore", "fSlider19Stage1:ThiccVore")
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider19Stage2:ThiccVore")) > Math.abs(slider.Stage1))
            slider.Stage2 = MCM.GetModSettingFloat("FalloutVore", "fSlider19Stage2:ThiccVore")
        Else
            slider.Stage2 = slider.Stage1
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider19Stage3:ThiccVore")) > Math.abs(slider.Stage2))
            slider.Stage3 = MCM.GetModSettingFloat("FalloutVore", "fSlider19Stage3:ThiccVore")
        Else
            slider.Stage3 = slider.Stage2
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider19Stage4:ThiccVore")) > Math.abs(slider.Stage3))
            slider.Stage4 = MCM.GetModSettingFloat("FalloutVore", "fSlider19Stage4:ThiccVore")
        Else
            slider.Stage4 = slider.Stage3
        EndIf
        ThiccPresets.Add(slider)
    EndIf
    
    slider = new PresetSlider
    slider.Name = MCM.GetModSettingString("FalloutVore", "sSlider20Name:ThiccVore")
    If (slider.Name != "")
        slider.Stage1 = MCM.GetModSettingFloat("FalloutVore", "fSlider20Stage1:ThiccVore")
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider20Stage2:ThiccVore")) > Math.abs(slider.Stage1))
            slider.Stage2 = MCM.GetModSettingFloat("FalloutVore", "fSlider20Stage2:ThiccVore")
        Else
            slider.Stage2 = slider.Stage1
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider20Stage3:ThiccVore")) > Math.abs(slider.Stage2))
            slider.Stage3 = MCM.GetModSettingFloat("FalloutVore", "fSlider20Stage3:ThiccVore")
        Else
            slider.Stage3 = slider.Stage2
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider20Stage4:ThiccVore")) > Math.abs(slider.Stage3))
            slider.Stage4 = MCM.GetModSettingFloat("FalloutVore", "fSlider20Stage4:ThiccVore")
        Else
            slider.Stage4 = slider.Stage3
        EndIf
        ThiccPresets.Add(slider)
    EndIf
    
    slider = new PresetSlider
    slider.Name = MCM.GetModSettingString("FalloutVore", "sSlider21Name:ThiccVore")
    If (slider.Name != "")
        slider.Stage1 = MCM.GetModSettingFloat("FalloutVore", "fSlider21Stage1:ThiccVore")
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider21Stage2:ThiccVore")) > Math.abs(slider.Stage1))
            slider.Stage2 = MCM.GetModSettingFloat("FalloutVore", "fSlider21Stage2:ThiccVore")
        Else
            slider.Stage2 = slider.Stage1
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider21Stage3:ThiccVore")) > Math.abs(slider.Stage2))
            slider.Stage3 = MCM.GetModSettingFloat("FalloutVore", "fSlider21Stage3:ThiccVore")
        Else
            slider.Stage3 = slider.Stage2
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider21Stage4:ThiccVore")) > Math.abs(slider.Stage3))
            slider.Stage4 = MCM.GetModSettingFloat("FalloutVore", "fSlider21Stage4:ThiccVore")
        Else
            slider.Stage4 = slider.Stage3
        EndIf
        ThiccPresets.Add(slider)
    EndIf
    
    slider = new PresetSlider
    slider.Name = MCM.GetModSettingString("FalloutVore", "sSlider22Name:ThiccVore")
    If (slider.Name != "")
        slider.Stage1 = MCM.GetModSettingFloat("FalloutVore", "fSlider22Stage1:ThiccVore")
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider22Stage2:ThiccVore")) > Math.abs(slider.Stage1))
            slider.Stage2 = MCM.GetModSettingFloat("FalloutVore", "fSlider22Stage2:ThiccVore")
        Else
            slider.Stage2 = slider.Stage1
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider22Stage3:ThiccVore")) > Math.abs(slider.Stage2))
            slider.Stage3 = MCM.GetModSettingFloat("FalloutVore", "fSlider22Stage3:ThiccVore")
        Else
            slider.Stage3 = slider.Stage2
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider22Stage4:ThiccVore")) > Math.abs(slider.Stage3))
            slider.Stage4 = MCM.GetModSettingFloat("FalloutVore", "fSlider22Stage4:ThiccVore")
        Else
            slider.Stage4 = slider.Stage3
        EndIf
        ThiccPresets.Add(slider)
    EndIf
    
    slider = new PresetSlider
    slider.Name = MCM.GetModSettingString("FalloutVore", "sSlider23Name:ThiccVore")
    If (slider.Name != "")
        slider.Stage1 = MCM.GetModSettingFloat("FalloutVore", "fSlider23Stage1:ThiccVore")
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider23Stage2:ThiccVore")) > Math.abs(slider.Stage1))
            slider.Stage2 = MCM.GetModSettingFloat("FalloutVore", "fSlider23Stage2:ThiccVore")
        Else
            slider.Stage2 = slider.Stage1
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider23Stage3:ThiccVore")) > Math.abs(slider.Stage2))
            slider.Stage3 = MCM.GetModSettingFloat("FalloutVore", "fSlider23Stage3:ThiccVore")
        Else
            slider.Stage3 = slider.Stage2
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider23Stage4:ThiccVore")) > Math.abs(slider.Stage3))
            slider.Stage4 = MCM.GetModSettingFloat("FalloutVore", "fSlider23Stage4:ThiccVore")
        Else
            slider.Stage4 = slider.Stage3
        EndIf
        ThiccPresets.Add(slider)
    EndIf
    
    slider = new PresetSlider
    slider.Name = MCM.GetModSettingString("FalloutVore", "sSlider24Name:ThiccVore")
    If (slider.Name != "")
        slider.Stage1 = MCM.GetModSettingFloat("FalloutVore", "fSlider24Stage1:ThiccVore")
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider24Stage2:ThiccVore")) > Math.abs(slider.Stage1))
            slider.Stage2 = MCM.GetModSettingFloat("FalloutVore", "fSlider24Stage2:ThiccVore")
        Else
            slider.Stage2 = slider.Stage1
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider24Stage3:ThiccVore")) > Math.abs(slider.Stage2))
            slider.Stage3 = MCM.GetModSettingFloat("FalloutVore", "fSlider24Stage3:ThiccVore")
        Else
            slider.Stage3 = slider.Stage2
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider24Stage4:ThiccVore")) > Math.abs(slider.Stage3))
            slider.Stage4 = MCM.GetModSettingFloat("FalloutVore", "fSlider24Stage4:ThiccVore")
        Else
            slider.Stage4 = slider.Stage3
        EndIf
        ThiccPresets.Add(slider)
    EndIf
    
    slider = new PresetSlider
    slider.Name = MCM.GetModSettingString("FalloutVore", "sSlider25Name:ThiccVore")
    If (slider.Name != "")
        slider.Stage1 = MCM.GetModSettingFloat("FalloutVore", "fSlider25Stage1:ThiccVore")
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider25Stage2:ThiccVore")) > Math.abs(slider.Stage1))
            slider.Stage2 = MCM.GetModSettingFloat("FalloutVore", "fSlider25Stage2:ThiccVore")
        Else
            slider.Stage2 = slider.Stage1
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider25Stage3:ThiccVore")) > Math.abs(slider.Stage2))
            slider.Stage3 = MCM.GetModSettingFloat("FalloutVore", "fSlider25Stage3:ThiccVore")
        Else
            slider.Stage3 = slider.Stage2
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider25Stage4:ThiccVore")) > Math.abs(slider.Stage3))
            slider.Stage4 = MCM.GetModSettingFloat("FalloutVore", "fSlider25Stage4:ThiccVore")
        Else
            slider.Stage4 = slider.Stage3
        EndIf
        ThiccPresets.Add(slider)
    EndIf
    
    slider = new PresetSlider
    slider.Name = MCM.GetModSettingString("FalloutVore", "sSlider26Name:ThiccVore")
    If (slider.Name != "")
        slider.Stage1 = MCM.GetModSettingFloat("FalloutVore", "fSlider26Stage1:ThiccVore")
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider26Stage2:ThiccVore")) > Math.abs(slider.Stage1))
            slider.Stage2 = MCM.GetModSettingFloat("FalloutVore", "fSlider26Stage2:ThiccVore")
        Else
            slider.Stage2 = slider.Stage1
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider26Stage3:ThiccVore")) > Math.abs(slider.Stage2))
            slider.Stage3 = MCM.GetModSettingFloat("FalloutVore", "fSlider26Stage3:ThiccVore")
        Else
            slider.Stage3 = slider.Stage2
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider26Stage4:ThiccVore")) > Math.abs(slider.Stage3))
            slider.Stage4 = MCM.GetModSettingFloat("FalloutVore", "fSlider26Stage4:ThiccVore")
        Else
            slider.Stage4 = slider.Stage3
        EndIf
        ThiccPresets.Add(slider)
    EndIf
    
    slider = new PresetSlider
    slider.Name = MCM.GetModSettingString("FalloutVore", "sSlider27Name:ThiccVore")
    If (slider.Name != "")
        slider.Stage1 = MCM.GetModSettingFloat("FalloutVore", "fSlider27Stage1:ThiccVore")
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider27Stage2:ThiccVore")) > Math.abs(slider.Stage1))
            slider.Stage2 = MCM.GetModSettingFloat("FalloutVore", "fSlider27Stage2:ThiccVore")
        Else
            slider.Stage2 = slider.Stage1
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider27Stage3:ThiccVore")) > Math.abs(slider.Stage2))
            slider.Stage3 = MCM.GetModSettingFloat("FalloutVore", "fSlider27Stage3:ThiccVore")
        Else
            slider.Stage3 = slider.Stage2
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider27Stage4:ThiccVore")) > Math.abs(slider.Stage3))
            slider.Stage4 = MCM.GetModSettingFloat("FalloutVore", "fSlider27Stage4:ThiccVore")
        Else
            slider.Stage4 = slider.Stage3
        EndIf
        ThiccPresets.Add(slider)
    EndIf
    
    slider = new PresetSlider
    slider.Name = MCM.GetModSettingString("FalloutVore", "sSlider28Name:ThiccVore")
    If (slider.Name != "")
        slider.Stage1 = MCM.GetModSettingFloat("FalloutVore", "fSlider28Stage1:ThiccVore")
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider28Stage2:ThiccVore")) > Math.abs(slider.Stage1))
            slider.Stage2 = MCM.GetModSettingFloat("FalloutVore", "fSlider28Stage2:ThiccVore")
        Else
            slider.Stage2 = slider.Stage1
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider28Stage3:ThiccVore")) > Math.abs(slider.Stage2))
            slider.Stage3 = MCM.GetModSettingFloat("FalloutVore", "fSlider28Stage3:ThiccVore")
        Else
            slider.Stage3 = slider.Stage2
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider28Stage4:ThiccVore")) > Math.abs(slider.Stage3))
            slider.Stage4 = MCM.GetModSettingFloat("FalloutVore", "fSlider28Stage4:ThiccVore")
        Else
            slider.Stage4 = slider.Stage3
        EndIf
        ThiccPresets.Add(slider)
    EndIf
    
    slider = new PresetSlider
    slider.Name = MCM.GetModSettingString("FalloutVore", "sSlider29Name:ThiccVore")
    If (slider.Name != "")
        slider.Stage1 = MCM.GetModSettingFloat("FalloutVore", "fSlider29Stage1:ThiccVore")
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider29Stage2:ThiccVore")) > Math.abs(slider.Stage1))
            slider.Stage2 = MCM.GetModSettingFloat("FalloutVore", "fSlider29Stage2:ThiccVore")
        Else
            slider.Stage2 = slider.Stage1
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider29Stage3:ThiccVore")) > Math.abs(slider.Stage2))
            slider.Stage3 = MCM.GetModSettingFloat("FalloutVore", "fSlider29Stage3:ThiccVore")
        Else
            slider.Stage3 = slider.Stage2
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider29Stage4:ThiccVore")) > Math.abs(slider.Stage3))
            slider.Stage4 = MCM.GetModSettingFloat("FalloutVore", "fSlider29Stage4:ThiccVore")
        Else
            slider.Stage4 = slider.Stage3
        EndIf
        ThiccPresets.Add(slider)
    EndIf
    
    slider = new PresetSlider
    slider.Name = MCM.GetModSettingString("FalloutVore", "sSlider30Name:ThiccVore")
    If (slider.Name != "")
        slider.Stage1 = MCM.GetModSettingFloat("FalloutVore", "fSlider30Stage1:ThiccVore")
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider30Stage2:ThiccVore")) > Math.abs(slider.Stage1))
            slider.Stage2 = MCM.GetModSettingFloat("FalloutVore", "fSlider30Stage2:ThiccVore")
        Else
            slider.Stage2 = slider.Stage1
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider30Stage3:ThiccVore")) > Math.abs(slider.Stage2))
            slider.Stage3 = MCM.GetModSettingFloat("FalloutVore", "fSlider30Stage3:ThiccVore")
        Else
            slider.Stage3 = slider.Stage2
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider30Stage4:ThiccVore")) > Math.abs(slider.Stage3))
            slider.Stage4 = MCM.GetModSettingFloat("FalloutVore", "fSlider30Stage4:ThiccVore")
        Else
            slider.Stage4 = slider.Stage3
        EndIf
        ThiccPresets.Add(slider)
    EndIf
    
    slider = new PresetSlider
    slider.Name = MCM.GetModSettingString("FalloutVore", "sSlider31Name:ThiccVore")
    If (slider.Name != "")
        slider.Stage1 = MCM.GetModSettingFloat("FalloutVore", "fSlider31Stage1:ThiccVore")
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider31Stage2:ThiccVore")) > Math.abs(slider.Stage1))
            slider.Stage2 = MCM.GetModSettingFloat("FalloutVore", "fSlider31Stage2:ThiccVore")
        Else
            slider.Stage2 = slider.Stage1
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider31Stage3:ThiccVore")) > Math.abs(slider.Stage2))
            slider.Stage3 = MCM.GetModSettingFloat("FalloutVore", "fSlider31Stage3:ThiccVore")
        Else
            slider.Stage3 = slider.Stage2
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider31Stage4:ThiccVore")) > Math.abs(slider.Stage3))
            slider.Stage4 = MCM.GetModSettingFloat("FalloutVore", "fSlider31Stage4:ThiccVore")
        Else
            slider.Stage4 = slider.Stage3
        EndIf
        ThiccPresets.Add(slider)
    EndIf
    
    slider = new PresetSlider
    slider.Name = MCM.GetModSettingString("FalloutVore", "sSlider32Name:ThiccVore")
    If (slider.Name != "")
        slider.Stage1 = MCM.GetModSettingFloat("FalloutVore", "fSlider32Stage1:ThiccVore")
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider32Stage2:ThiccVore")) > Math.abs(slider.Stage1))
            slider.Stage2 = MCM.GetModSettingFloat("FalloutVore", "fSlider32Stage2:ThiccVore")
        Else
            slider.Stage2 = slider.Stage1
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider32Stage3:ThiccVore")) > Math.abs(slider.Stage2))
            slider.Stage3 = MCM.GetModSettingFloat("FalloutVore", "fSlider32Stage3:ThiccVore")
        Else
            slider.Stage3 = slider.Stage2
        EndIf
        If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider32Stage4:ThiccVore")) > Math.abs(slider.Stage3))
            slider.Stage4 = MCM.GetModSettingFloat("FalloutVore", "fSlider32Stage4:ThiccVore")
        Else
            slider.Stage4 = slider.Stage3
        EndIf
        ThiccPresets.Add(slider)
    EndIf

    ; Trace("CompileThiccSliders", ThiccPresets)
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
    int index = 0
    ; Trace("UpdateMorphs", "Thicc Presets: " + ThiccPresets + " thiccStage: " + thiccStage)
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