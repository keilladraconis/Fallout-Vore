Scriptname FalloutVore:FVS01_QuestScript extends Quest

Actor Property BriaRef Auto
GlobalVariable Property CaravanLouiseCurrentStatus Auto
Faction Property HasBeenCompanionFaction Auto
Faction Property PlayerEnemyFaction Auto
Quest Property FV_COMBria Auto
Int Property StageToSet Auto Mandatory

int nLouise 		= 0
Int Stage10TimerID = 1

Event OnInit()
	
EndEvent

Function Stage10TimerStart()
	StartTimerGameTime(48, Stage10TimerID)
	
EndFunction

Function Stage20StopTimer()
	CancelTimerGameTime(Stage10TimerID)
EndFunction

Event OnTimerGameTime(int aiTimerID)
	If aiTimerID == Stage10TimerID
		self.SetStage(StageToSet)			;placeholder stage until actual stage confirmed
	ElseIf aiTimerID == nLouise
		Debug.Trace(self + ": Louise is done waiting at settlement.")
		CaravanLouiseCurrentStatus.SetValue(0)
	EndIf
EndEvent

Function BriaLeavesOnTimer()
	; Adjust Bria's Affinity and flip her to Protected (Hatred + Shutdown)
	if BriaRef.IsInFaction(HasBeenCompanionFaction) == 1
		FV_COMBria.SetStage(91)
		(BriaRef as CompanionActorScript).SetAffinity(-5000)
	endIf
	BriaRef.AddToFaction(PlayerEnemyFaction)
	BriaRef.GetActorBase().SetEssential(false)
EndFunction

Function CaravanWaits(int nTime)
	Debug.Trace(self + "Caravan " + nLouise + "'s waiting timer has started.")
	StartTimerGameTime(nTime, nLouise) 		; Variable wait time
EndFunction

Function AdvanceCaravan()
	CancelTimerGameTime(nLouise)
	CaravanLouiseCurrentStatus.SetValue(0)
EndFunction