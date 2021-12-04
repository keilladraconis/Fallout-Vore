Scriptname FalloutVore:FV_VoreshopNPCScript	Extends Actor

GlobalVariable Property FV_ColdSteelEnabled Auto
GlobalVariable Property FV_MaleColdSteelToggle Auto
FV_ColdSteelBellyScript Property FV_ColdSteelBelly Auto
FormList Property FV_DigestionArmorList Auto

bool HasBeenChecked = false

Event OnLoad()
	If(!HasBeenChecked)
		CheckColdSteel()
		HasBeenChecked = true
	EndIf
EndEvent

Function CheckColdSteel()
	Actor thisActor = self as Actor
	int randomBellySize = Utility.RandomInt(3, 12)
	If(FV_ColdSteelEnabled.GetValue() == 1 && thisActor.GetLeveledActorBase().GetSex() == 1)
		SetColdSteelBelly(thisActor, randomBellySize)
	ElseIf(FV_ColdSteelEnabled.GetValue() == 1 && FV_MaleColdSteelToggle.GetValue() == 1 && thisActor.GetLeveledActorBase().GetSex() == 0)
		SetColdSteelBelly(thisActor, randomBellySize)
	Else
		thisActor.EquipItem(FV_DigestionArmorList.GetAt(randomBellySize-1) as Armor, abSilent = true)
	EndIf
EndFunction

Function SetColdSteelBelly(Actor akActor, int ikSize)
	Utility.wait(0.5)	;wait a moment to let the actor spawn in and BodyGen to randomize their sliders
	FV_ColdSteelBelly.ChangeColdSteelDigestFullness(akActor, ikSize as float)
	FV_ColdSteelBelly.SaveBelly(akActor)
EndFunction