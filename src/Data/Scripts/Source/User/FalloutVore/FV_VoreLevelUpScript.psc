Scriptname FalloutVore:FV_VoreLevelUpScript extends activemagiceffect

Int Property VoreSpawnLevel=0 Auto

GlobalVariable Property FV_VoreLevelPoints Auto
FalloutVore:FV_ConsumptionRegistryScript Property FV_ConsumptionRegistry Auto
FalloutVore:FV_LevelUpManagerScript Property FV_LevelUpManager Auto
ActorValue Property FV_PredLevel Auto
ActorValue Property FV_PreyLevel Auto
ActorValue Property FV_HasHadNukaAcid Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Int NewLevel = 0
	If (VoreSpawnLevel == 0)
		Int LevelModifier = utility.RandomInt(-10, 0)
		NewLevel = (Game.GetPlayer().GetValue(FV_PredLevel) + Game.GetPlayer().GetValue(FV_PreyLevel) + 13 + FV_VoreLevelPoints.GetValue()) as int + LevelModifier
	Else	
		NewLevel = VoreSpawnLevel
	EndIf
	If(NewLevel > 14)
		Utility.wait(0.1)	;give any perks applying FV_HasHadNukaAcid to the newly spawned NPC
		if((akCaster).GetValue(FV_HasHadNukaAcid) > 0)
			(akCaster).ModValue(FV_PredLevel, NewLevel - (akCaster).GetValue(FV_PredLevel))
		Else
			(akCaster).ModValue(FV_PreyLevel, NewLevel - (akCaster).GetValue(FV_PreyLevel))
		EndIf
		FV_LevelUpManager.LevelUpNPC(akCaster)
	EndIf
EndEvent