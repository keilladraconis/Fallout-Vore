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
	FalloutVore:FV_FalloutVoreScript Property FV_FalloutVore Auto Const Mandatory
EndGroup

; Quest Script Setup Boilerplate
int Version = 0
Function Setup(int aiVersion = 2) ; Increment version as needed.
	Trace("Setup()", Version)
    if Version < aiVersion
		RegisterForRemoteEvent(Game.GetPlayer(), "OnPlayerLoadGame")
		RegisterForCustomEvent(FV_StomachSim, "OnDigestProgress")
		RegisterForCustomEvent(FV_FalloutVore, "VoreGameTick")
		If (ThiccActors == NONE)
			ThiccActors = new Actor[0]
		EndIf
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

Event FalloutVore:FV_FalloutVoreScript.VoreGameTick(FalloutVore:FV_FalloutVoreScript akSender, Var[] akArgs)
	LoseWeightAll(akArgs[0] as float)
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
	If thiccness > 4.0
		thiccness = 4.0
	EndIf
	akActor.SetValue(FV_Thiccness, thiccness)

	If (ThiccActors.Find(akActor) < 0)
		ThiccActors.Add(akActor)
	EndIf

	Var[] args = new Var[1]
	args[0] = akActor
	SendCustomEvent("OnThiccnessChange", args)
EndFunction

Actor[] ThiccActors

; Call LoseWeight for all actors in the ThiccActors array.
; If LoseWeight is false, actor is done losing weight and should be dropped from tracking.
Function LoseWeightAll(float afTimeDelta)
	int index = 0
	While (index < ThiccActors.Length)
		Actor item = ThiccActors[index]
		If (LoseWeight(item, afTimeDelta))
			index += 1
		Else
			ThiccActors.Remove(index)
		EndIf
	EndWhile	
EndFunction

; Invokes weight loss for an actor. If the actor's thiccness is <= 0, return false.
bool Function LoseWeight(Actor akActor, float afTimeDelta)
	bool still_thicc = true
	If (akActor.IsDead())
		return false ; Do nothing, and signal to stop tracking dead actors.
	EndIf

	float thiccness = akActor.GetValue(FV_Thiccness)
	thiccness -= afTimeDelta / (3600.0 * 8.0) ; TODO: Refine the weight loss rate, this is 1.0 per 8-hour period.
	If thiccness <= 0.0
		thiccness = 0.0
		still_thicc = false
	EndIf

	akActor.SetValue(FV_Thiccness, thiccness)
	Var[] args = new Var[1]
	args[0] = akActor
	SendCustomEvent("OnThiccnessChange", args)
	return still_thicc
EndFunction