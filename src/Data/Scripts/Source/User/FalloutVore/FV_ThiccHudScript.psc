Scriptname FalloutVore:FV_ThiccHudScript extends Quest

HUDFramework hud
FalloutVore:FV_WeightChangeScript Property FV_ThiccVore Auto

Faction Property CurrentCompanionFaction Auto
Faction Property HasBeenCompanionFaction Auto
;GlobalVariable Property WeightModEnabled Auto
string sHUDPositionDropdown = "HUDPositionDropdown"

Int Property iHUDPosition = 0 Auto Hidden

Int Property Command_ShowActor = 110 AutoReadOnly Hidden
Int Property Command_HideActor = 120 AutoReadOnly Hidden
Int Property Command_UpdateStats = 130 AutoReadOnly Hidden
String Property Command_UpdateName = "UpdateName" AutoReadOnly Hidden

bool HeaderLoaded
String Property ThiccHud_Widget = "thicc_hud.swf" AutoReadOnly Hidden
bool EditLock

Event OnInit()
	RegisterForRemoteEvent(Game.GetPlayer(), "OnPlayerLoadGame")
	iHUDPosition = MCM.GetModSettingInt("FalloutVore", "iHUDPosition:ThiccVoreMain")
	hud = HUDFramework.GetInstance()
	HudStart()
EndEvent

Event Actor.OnPlayerLoadGame(Actor akSender)
	If(!hud)
		hud = HUDFramework.GetInstance()
	EndIf
	If(hud)
		If(!hud.IsWidgetRegistered(ThiccHud_Widget))
			HudStart()
		EndIf
	EndIf
EndEvent

Function HUDStart()
	If (hud)
		;hud.ClearOrphanedRegistrations()
		utility.wait(0.5)
        hud.RegisterWidget(Self, ThiccHud_Widget, 1050, 200, abLoadNow = True, abAutoLoad = True)
		
		;If(iHUDPosition != 0)
		;	HUDPosition()
		;EndIf
		debug.trace("Registering Thicc Vore HUD")
		;ToggleHud(NONE, false)
    Else
        debug.trace("HUDFramework is not installed!")
    EndIf
EndFunction

Function HUDPosition()
	If(hud)
		float[] HudPos = hud.GetWidgetPosition(ThiccHud_Widget)
		float tempX = 0
		float tempY = 0
		;HUDFramework:WidgetInfo widget = hud.GetWidgetByID(ThiccHud_Widget)
		debug.trace("Updating HUD Position with ID of " + iHUDPosition + " and original pos of " + HudPos[0] + " and " + HudPos[1])
		If(iHUDPosition == 0)
			debug.trace("Updating HUD Position with ID of " + iHUDPosition)
			tempX = 1050 - HudPos[0]
			tempY = 200 - HudPos[1]
			hud.SetWidgetPosition(ThiccHud_Widget, afX = 1050, afY = 200, abTemporary = false)						;default position middle right
		ElseIf(iHUDPosition == 1)
			tempX = 25 - HudPos[0]
			tempY = 200 - HudPos[1]
			hud.SetWidgetPosition(ThiccHud_Widget, afX = 25, afY = 200, abTemporary = false)						;middle left
			hud.SetWidgetOpacity(ThiccHud_Widget, 0.5, false)
		ElseIf(iHUDPosition == 2)
			tempX = 1050 - HudPos[0]
			tempY = 400 - HudPos[1]
			hud.SetWidgetPosition(ThiccHud_Widget, afX = 1050, afY = 400, abTemporary = false)						;bottom right
			hud.SetWidgetOpacity(ThiccHud_Widget, 1, false)
		ElseIf(iHUDPosition == 3)
			tempX = 25 - HudPos[0]
			tempY = 400 - HudPos[1]
			hud.SetWidgetPosition(ThiccHud_Widget, afx = 25, afY = 400, abTemporary = false)						;bottom left
		EndIf
		debug.trace("Moving hud to position " + tempX + ", " + tempY)
		;hud.ModWidgetPosition(ThiccHud_Widget, tempX, tempY)
	EndIf
EndFunction

Function HUD_WidgetLoaded(string asWidget)
    If(asWidget == ThiccHud_Widget)
		If(hud)
			If(!FV_ThiccVore.WeightModEnabled)
				debug.trace("Thicc Vore not enabled.  Thicc HUD Disabled and hidden.")
			Else
				FV_ThiccVore.HUDLoaded()
			EndIf
			debug.trace("Thicc HUD loaded")
		EndIf
    EndIf
EndFunction

Function UpdateName(String akPredName, int index)
	if(hud)
		GetEditLock()
		String SendMessage = index + "?" + akPredName
		hud.SendMessageString(ThiccHud_Widget, Command_UpdateName, SendMessage)
		EditLock = False
	EndIf
EndFunction

Function ShowActor(int Index, Bool isPlayer = false)
	If(hud)
		GetEditLock()
		hud.SendMessage(ThiccHud_Widget, Command_ShowActor, Index, isPlayer as float)
		EditLock = False
	EndIf
EndFunction

Function HideActor(int Index)
	If(hud)
		GetEditLock()
		hud.SendMessage(ThiccHud_Widget, Command_HideActor, Index)
		EditLock = False
	EndIf
EndFunction

Function UpdateStats(int Index, float thiccPercent, float satedPercent, int hunger)
	If(hud)
		GetEditLock()
		hunger = hunger * -1
		hud.SendMessage(ThiccHud_Widget, Command_UpdateStats, Index, satedPercent, thiccPercent, hunger)
		EditLock = False
	EndIf
EndFunction


Function ToggleHud(Actor akPred, String sPredName, Int iFullnessMeter, bool bEnable, Int iMeterDownCounter)

EndFunction

Function UpdateHUD(Actor akPred, Int iFullnessMeter)
	
EndFunction

Function UpdateHUDHunger(Actor akPred, Int iMeterDownCounter)
	
EndFunction

Function UnregisterThiccHUD()
	If(hud)
		ToggleHud(NONE, " ", 0, false, 0)
		Hud.UnloadWidget(ThiccHud_Widget)
		hud.UnregisterWidget(ThiccHud_Widget)
		hud = NONE
		debug.messagebox("Thicc HUD has been unregistered.  You can safely uninstall Fallout Vore now.")
	EndIf
EndFunction

int iEditLockCount = 1
Function GetEditLock()
	iEditLockCount += 1
	While (EditLock)
		Utility.Wait(0.1 * iEditLockCount)
	EndWhile
	EditLock = true
	iEditLockCount -= 1
EndFunction