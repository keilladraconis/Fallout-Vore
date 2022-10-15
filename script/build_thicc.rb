require 'json'
require 'pathname'

MCM_CONFIG_PATH = Pathname.new("src/Data/MCM/Config/FalloutVore/config.json")
UPDATE_SLIDERS = {
    id: "UpdateSliders",
    text: "Update Sliders",
    type: "button",
    action: {
        type: "CallFunction",
        form: "FalloutVore.esm|D36D",
        function: "CompileThiccSliders"
    }
}

class ThiccControl
    def initialize(index)
        @index = index
    end

    def to_ini
        <<~INI
        sSlider#{@index}Name=
        fSlider#{@index}Stage1=0.0
        fSlider#{@index}Stage2=0.0
        fSlider#{@index}Stage3=0.0
        fSlider#{@index}Stage4=0.0
        INI
    end

    def to_mcm
        [{
            id: "sSlider#{@index}Name:ThiccVore",
            text: "Slider #{@index} Name",
            type: "textinput",
            valueOptions: { sourceType: "ModSettingString" }
        },{
            id: "fSlider#{@index}Stage1:ThiccVore",
            text: "Slider #{@index} Stage 1 Value",
            type: "textinputFloat",
            valueOptions: { sourceType: "ModSettingFloat" }
        },{
            id: "fSlider#{@index}Stage2:ThiccVore",
            text: "Slider #{@index} Stage 2 Value",
            type: "textinputFloat",
            valueOptions: { sourceType: "ModSettingFloat" }
        },{
            id: "fSlider#{@index}Stage3:ThiccVore",
            text: "Slider #{@index} Stage 3 Value",
            type: "textinputFloat",
            valueOptions: { sourceType: "ModSettingFloat" }
        },{
            id: "fSlider#{@index}Stage4:ThiccVore",
            text: "Slider #{@index} Stage 4 Value",
            type: "textinputFloat",
            valueOptions: { sourceType: "ModSettingFloat" }
        }]
    end

    def to_papyrus
        <<~PAPYRUS
        slider = new PresetSlider
        slider.Name = MCM.GetModSettingString("FalloutVore", "sSlider#{@index}Name:ThiccVore")
        If (slider.Name != "")
            slider.Stage1 = MCM.GetModSettingFloat("FalloutVore", "fSlider#{@index}Stage1:ThiccVore")
            If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider#{@index}Stage2:ThiccVore")) > Math.abs(slider.Stage1))
                slider.Stage2 = MCM.GetModSettingFloat("FalloutVore", "fSlider#{@index}Stage2:ThiccVore")
            Else    
                slider.Stage2 = slider.Stage1
            EndIf
            If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider#{@index}Stage3:ThiccVore")) > Math.abs(slider.Stage2))
                slider.Stage3 = MCM.GetModSettingFloat("FalloutVore", "fSlider#{@index}Stage3:ThiccVore")
            Else    
                slider.Stage3 = slider.Stage2
            EndIf
            If (Math.abs(MCM.GetModSettingFloat("FalloutVore", "fSlider#{@index}Stage4:ThiccVore")) > Math.abs(slider.Stage3))
                slider.Stage4 = MCM.GetModSettingFloat("FalloutVore", "fSlider#{@index}Stage4:ThiccVore")
            Else    
                slider.Stage4 = slider.Stage3
            EndIf
            ThiccPresets.Add(slider)
        EndIf
        PAPYRUS
    end
end

thiccSettings = Array.new(32) {|i| ThiccControl.new(i+1)}

case ARGV[0]
when "papyrus"
    print thiccSettings.map(&:to_papyrus).join("\n")
when "mcm"
    config = JSON.load_file(MCM_CONFIG_PATH)
    vore = config["pages"].find {|p| p["pageDisplayName"] == "THICC Vore" }
    p vore
    vore["content"] = [UPDATE_SLIDERS]
    vore["content"] += thiccSettings.map(&:to_mcm).flatten
    File.open(MCM_CONFIG_PATH, 'w') do |f|
        f.write(JSON.pretty_generate(config))
    end
when "ini"
    print thiccSettings.map(&:to_ini).join("\n")
end
