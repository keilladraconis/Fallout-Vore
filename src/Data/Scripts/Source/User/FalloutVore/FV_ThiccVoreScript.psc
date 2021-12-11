Scriptname FalloutVore:FV_ThiccVoreScript extends Quest
{
	Handles actor weight change and morphs. Usually triggered by events.
}


Function Trace(string asFunction, string asMessage = "") Global debugOnly
	string logName = "FalloutVore"
	Debug.OpenUserLog(logName)
    Debug.TraceUser(logName, "[FalloutVore:FV_ThiccVoreScript] " + asFunction + " - " + asMessage)	
EndFunction

; Public

CustomEvent OnThiccnessChange

; Private

Group ActorValues
	ActorValue Property FV_FullnessMeter Auto Const Mandatory
	ActorValue Property FV_Thiccness Auto Const Mandatory
EndGroup

Group Keywords
	Keyword Property ActorTypeRobot Auto Const Mandatory
	Keyword Property ActorTypeSynth Auto Const Mandatory
	Keyword Property ActorTypeYaoGuai Auto Const Mandatory
	Keyword Property FV_VoreMorphKeyword Auto Const Mandatory
EndGroup

Group Messages
	Message Property FV_ThiccNoNutritonMessage Auto Const Mandatory
EndGroup

Group Scripts
 	FalloutVore:FV_VoreHudScript Property FV_VoreHud Auto Const Mandatory
	FalloutVore:FV_StomachSimScript Property FV_StomachSim Auto Const Mandatory
EndGroup

; Quest Script Setup Boilerplate
int Version = 0
Function Setup(int aiVersion = 1) ; Increment version as needed.
	Trace("Setup()", Version)
    if Version < aiVersion
        Actor player = Game.GetPlayer()
		RegisterForRemoteEvent(Game.GetPlayer(), "OnPlayerLoadGame")
		RegisterForCustomEvent(FV_StomachSim, "OnDigestProgress")
        Version = aiVersion
    EndIf
EndFunction

Event OnInit()
    Setup()
EndEvent

Event Actor.OnPlayerLoadGame(Actor akSender)
    Setup()
EndEvent

Event FalloutVore:FV_StomachSimScript.OnDigestProgress(FalloutVore:FV_StomachSimScript akSender, Var[] akArgs)
	HandleDigestedAmount(akArgs[0] as Actor, akArgs[2] as float)
EndEvent

Event FalloutVore:FV_StomachSimScript.OnDigestFinish(FalloutVore:FV_StomachSimScript akSender, Var[] akArgs)
	HandleDigestedAmount(akArgs[0] as Actor, akArgs[2] as float)
EndEvent

Function HandleDigestedAmount(Actor akActor, float afAmount)
	Trace("HandleDigestedAmount()", afAmount)
	; This only works for female actors.
	If (akActor.GetLeveledActorBase().GetSex() == 0)
		Return
	EndIf

	; Per the amount, update the thiccness on the actor, up to 1.0
	; Then update the morphs.
	float thiccness = akActor.GetValue(FV_Thiccness)
	thiccness += afAmount
	If thiccness > 1.0
		thiccness = 1.0
	EndIf

	akActor.SetValue(FV_Thiccness, thiccness)
	Var[] args = new Var[1]
	args[0] = akActor
	SendCustomEvent("OnThiccnessChange", args)
EndFunction
