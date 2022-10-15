require 'json'

config = JSON.load_file('script/src/Data/MCM/Config/FalloutVore/config.json')
vore = config["pages"][2]

def voreControl(idx, stage)
    [
        { 
            "id": "fSlider${idx}Stage${stage}Name"
            "text": "Slider ${idx} Stage ${stage} Name",
            "type": "textinputFloat",
            "valueOptions": {
                "sourceType": "ModSettingString",
            }
        }
    ]
end