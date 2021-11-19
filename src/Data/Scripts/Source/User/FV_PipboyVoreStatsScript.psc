ScriptName FV_PipboyVoreStatsScript extends Quest

FormList Property FV_GeneralStats Auto Const 
FormList Property FV_PlayerGlobals Auto Const
FormList Property FV_PipboyTabsFilter Auto
ActorValue Property FV_HasHadNukaAcid Auto

Event OnInit()
    RegisterForRemoteEvent(Game.GetPlayer(), "OnPlayerLoadGame")
    RegisterCustomEvents()
	Debug.Trace("Pipboy Vore Stats Initialized")
EndEvent

Function RegisterCustomEvents()
	RegisterForMenuOpenCloseEvent("PipboyMenu")
EndFunction

Event OnMenuOpenCloseEvent(string asMenuName, bool abOpening)
    If(asMenuName== "PipboyMenu")
        If(abOpening)
			UpdatePlayerStats()
        EndIf
    EndIf
EndEvent

Event Actor.OnPlayerLoadGame(Actor akSender)
	UpdatePlayerStats()
EndEvent

Function CheckPlayerPred()
	
		Int i = 0
		While(i<FV_PipboyTabsFilter.GetSize()-1)
			If(Game.GetPlayer().GetValue(FV_HasHadNukaAcid) == 1 && (FV_PipboyTabsFilter.GetAt(i) as GlobalVariable).GetValue() as int == 0)
				(FV_PipboyTabsFilter.GetAt(i) as GlobalVariable).SetValue(1)
			ElseIf(Game.GetPlayer().GetValue(FV_HasHadNukaAcid) == 0 && (FV_PipboyTabsFilter.GetAt(i) as GlobalVariable).GetValue() as int == 1)
				(FV_PipboyTabsFilter.GetAt(i) as GlobalVariable).SetValue(0)
			EndIf
			i += 1
		EndWhile
		If(Game.GetPlayer().GetValue(FV_HasHadNukaAcid) == 1 && (FV_PipboyTabsFilter.GetAt(i) as GlobalVariable).GetValue() as int == 1)
			(FV_PipboyTabsFilter.GetAt(i) as GlobalVariable).SetValue(0)
		ElseIf(Game.GetPlayer().GetValue(FV_HasHadNukaAcid) == 0 && (FV_PipboyTabsFilter.GetAt(i) as GlobalVariable).GetValue() as int == 0)
			(FV_PipboyTabsFilter.GetAt(i) as GlobalVariable).SetValue(1)
		EndIf
EndFunction

Function UpdatePlayerStats()
	CheckPlayerPred()
	Int i = 0
	While(i < FV_GeneralStats.GetSize())
		If(Game.GetPlayer().GetValue(FV_GeneralStats.GetAt(i) as ActorValue) as int != (FV_PlayerGlobals.GetAt(i) as GlobalVariable).GetValueInt())
			(FV_PlayerGlobals.GetAt(i) as GlobalVariable).SetValue((Game.GetPlayer().GetValue(FV_GeneralStats.GetAt(i) as ActorValue)) as int)
		EndIf
		i += 1
	EndWhile
EndFunction