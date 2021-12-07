Scriptname FalloutVore:FV_VoreHudScript extends Quest

HUDFramework hud
import FalloutVore:FV_VoreUtilityScript

String Property VoreHud = "FalloutVore_hud.swf" AutoReadOnly Hidden

Group ThiccVoreProperties
	FalloutVore:FV_WeightChangeScript Property ThiccVore Auto Const
EndGroup

Group TrackerProperties
	ActorValue Property FV_CurrentPrey Auto
	ActorValue Property FV_BellyCapacity Auto
EndGroup

Group ExpProperties
	Sound Property UIExperienceUpVore_FV_ Auto
	Sound Property UILevelUpTextVore_FV_ Auto
EndGroup

Group Actors
	Actor Property PlayerRef Auto Const Mandatory
EndGroup

Group Scripts
	FalloutVore:FV_ConsumptionRegistryScript Property FV_ConsumptionRegistry Auto Const Mandatory
EndGroup

Int Property Command_ThiccUpdateStats	 			= 100 AutoReadOnly Hidden
Int Property Command_ThiccUpdateName 				= 110 AutoReadOnly Hidden
Int Property Command_ThiccHideActor					= 120 AutoReadOnly Hidden

Int Property Command_UpdatePlayerXP 				= 200 AutoReadOnly Hidden
Int Property Command_TrackerUpdateProperties		= 210 AutoReadOnly Hidden

Int Property Command_StruggleInitialize				= 300 AutoReadOnly Hidden
Int Property Command_StruggleKeyPress				= 310 AutoReadOnly Hidden
Int Property Command_StrugglePushMessage			= 320 AutoReadOnly Hidden
Int Property Command_StruggleResult					= 330 AutoReadOnly Hidden
Int Property Command_StruggleChangeStage			= 340 AutoReadOnly Hidden
Int Property Command_UpdateControlType				= 350 AutoReadOnly Hidden

Int Property Command_UpdateHealthBar				= 400 AutoReadOnly Hidden
Int Property Command_RemoveHealthBar				= 410 AutoReadOnly Hidden
Int Property Command_ClearHealthBars				= 420 AutoReadOnly Hidden

Int Property Command_DebugToggle					= 1000 AutoReadOnly Hidden

bool EditLock = false

Event OnInit()
	RegisterForRemoteEvent(Game.GetPlayer(), "OnPlayerLoadGame")
	InitializeHUD()
	RegisterForCustomEvent(FV_ConsumptionRegistry, "OnAdd")
	RegisterForCustomEvent(FV_ConsumptionRegistry, "OnRemove")
EndEvent

Event Actor.OnPlayerLoadGame(Actor akSender)
	if (!hud)
		InitializeHUD()
	endif
	RegisterForCustomEvent(FV_ConsumptionRegistry, "OnAdd")
	RegisterForCustomEvent(FV_ConsumptionRegistry, "OnRemove")
EndEvent

Event FalloutVore:FV_ConsumptionRegistryScript.OnAdd(FalloutVore:FV_ConsumptionRegistryScript akSource, Var[] akArgs)
	Actor pred = akArgs[0] as Actor
	if pred == PlayerRef
		SendTrackerUpdate()	
	endif
EndEvent

Event FalloutVore:FV_ConsumptionRegistryScript.OnRemove(FalloutVore:FV_ConsumptionRegistryScript akSource, Var[] akArgs)
	Actor pred = akArgs[0] as Actor
	if pred == PlayerRef
		SendTrackerUpdate()	
	endif
EndEvent

Function InitializeHUD()
	hud = HUDFramework.GetInstance()
	HudStart()
EndFunction

Function HUDStart()
	If (hud)
		utility.wait(0.5)
		if(!hud.IsWidgetRegistered(VoreHud))
			Trace(self, "Registering Fallout Vore HUD")
			hud.RegisterWidget(Self, VoreHud, 0, 0, abLoadNow = True, abAutoLoad = True)
		else
			Trace(self, "Fallout Vore HUD Registered")
		EndIf
		
    Else
        Trace(self, "HUDFramework is not installed!")
    EndIf
EndFunction

Function HUD_WidgetLoaded(string asWidget)
	If(Game.getPlayer().getvalue(FV_CurrentPrey) > 0)
		SendTrackerUpdate()
	EndIf
	If(ThiccVore.WeightModEnabled)
		ThiccVore.HUDLoaded()
	EndIf
EndFunction

Function SendTrackerUpdate()
	if(hud)
		float playerprey = PlayerRef.GetValue(FV_CurrentPrey)
		float PlayerCapacity = PlayerRef.GetValue(FV_BellyCapacity)
		float playerSex = PlayerRef.GetLeveledActorBase().GetSex() as float
		GetEditLock()
		hud.sendmessage(VoreHud, Command_TrackerUpdateProperties, playerprey, PlayerCapacity, playerSex)
		EditLock = False
	EndIf
EndFunction

Function UpdatePlayerXP(int oldPercent, int newPercent, int AddedXP, int levelUp = 0)
	If(hud)
		float startPercent = (oldPercent as float)/100.0
		float endPercent = (newPercent as float)/100.0
		GetEditLock()
		hud.SendMessage(VoreHud, Command_UpdatePlayerXP, startPercent, endPercent, AddedXP as float, levelUp as float)
		If(newPercent >= oldPercent)
			UIExperienceUpVore_FV_.Play(Game.GetPlayer())
		Else
			UILevelUpTextVore_FV_.Play(Game.GetPlayer())
		EndIf
		EditLock = False
	EndIf
EndFunction

Function HideThiccActor(int Index)
	GetEditLock()
	hud.SendMessage(VoreHud, Command_ThiccHideActor, Index)
	EditLock = False
EndFunction

Function UpdateThiccStats(int Index, float thiccPercent, float satedPercent, int hunger, Bool isPlayer = false)
	ThiccVore.trace(self, "FV_ThiccHudScript UpdateStats() thiccPercent: " + thiccPercent + " index: " + Index + " satedPercent: " + satedPercent + " isPlayer: " + isPlayer)
	GetEditLock()
	hunger = hunger * -1
	hud.SendMessage(VoreHud, Command_ThiccUpdateStats, Index, satedPercent, thiccPercent, hunger, isPlayer as float)
	EditLock = False
EndFunction

Function UpdateName(String akPredName, int index)
	ThiccVore.trace(self, "FV_ThiccHudScript UpdateName() akPredName: " + akPredName + " index: " + Index)
	GetEditLock()
	String SendMessage = index + "?" + akPredName
	hud.SendMessageString(VoreHud, Command_ThiccUpdateName as string, SendMessage)
	
	EditLock = False
EndFunction

Function StruggleInitialize(Float afDifficulty, String[] asKeySequence)
	String SendMessage = afDifficulty
	int i = 0
	While(i < asKeySequence.length)
		SendMessage = SendMessage + "?" + asKeySequence[i]
		i += 1
		;Trace(self, "FV_VoreHud StruggleInitialize() i: " + i)
	EndWhile
	GetEditLock()
	
	hud.SendMessageString(VoreHud, Command_StruggleInitialize as string, SendMessage)
	
	EditLock = False
EndFunction

Function StruggleBegin()

	GetEditLock()
	
	EditLock = False
EndFunction

Function StruggleKeyPress(Int aiKeyCode, Int aiSequenceNumber)
	GetEditLock()
	hud.SendMessage(VoreHud, Command_StruggleKeyPress, aiKeyCode, aiSequenceNumber)
	EditLock = False
EndFunction

Function StruggleResult(Int aiStageID, Float afLevelPercent)

	GetEditLock()
	hud.SendMessage(VoreHud, Command_StruggleResult, aiStageID, afLevelPercent)
	EditLock = False
EndFunction

Function StruggleStageChange(Int aiStageID)
	GetEditLock()
	Trace(self, "FalloutVore:FV_VoreHudScript StruggleStageChange aiStageID: " + aiStageID)
	hud.SendMessage(VoreHud, Command_StruggleChangeStage, aiStageID)
	EditLock = False
EndFunction

Function StrugglePushMessage(String asMessage, int FastFadeOut = 0)
	GetEditLock()
	String SendMessage = FastFadeOut + "/" + asMessage
	hud.SendMessageString(VoreHud, Command_StrugglePushMessage as string, SendMessage)
	EditLock = False
EndFunction

Function UpdateStruggleControlType(Int aiUseAlternate = 0)
	GetEditLock()
	hud.SendMessage(VoreHud, Command_UpdateControlType, aiUseAlternate)
	EditLock = False
EndFunction

Function UpdateHealthBar(Int aiIndex, Actor akPrey)
	
	GetEditLock()
	String PreyName = akPrey.GetLeveledActorBase().GetName()
	Float healthPercentage = akPrey.GetValue(Game.GetHealthAV())/akPrey.GetBaseValue(Game.GetHealthAV())
	String SendMessage = aiIndex + "?" + PreyName + "?" + healthPercentage
	Trace(self, "FalloutVore:FV_VoreHudScript UpdateHealthBar() SendMessage: " + SendMessage)
	hud.SendMessageString(VoreHud, Command_UpdateHealthBar as string, SendMessage)
	
	EditLock = False
EndFunction

; TODO: This is going to be broken until this script can keep its own mapping of prey to indices.
Function RemoveHealthBar(Int aiIndex)
	GetEditLock()
	
	hud.SendMessage(VoreHud, Command_RemoveHealthBar, aiIndex)
	EditLock = false
EndFunction

Function ClearHealthBars()
	GetEditLock()
	
	hud.SendMessage(VoreHud, Command_ClearHealthBars)
	EditLock = false
EndFunction

Function HudDebugToggle(Int aiEnabled)
	GetEditLock()
	hud.SendMessage(VoreHud, Command_DebugToggle, aiEnabled)
	EditLock = false
EndFunction

Bool Function GetHudActive()
	If(hud)
		return true
	Else
		return false
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