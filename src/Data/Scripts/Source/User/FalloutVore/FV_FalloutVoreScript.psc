Scriptname FalloutVore:FV_FalloutVoreScript extends Quest
{
    Core script governing the setup of the mod, initialization of things like plugins, and the main game-time timer
}

Function Trace(string asFunction, string asMessage = "") Global debugOnly
	string logName = "FalloutVore"
	Debug.OpenUserLog(logName)
    Debug.TraceUser(logName, "[FalloutVore:FV_FalloutVoreScript] " + asFunction + " - " + asMessage)	
EndFunction

; Public
; Private
float TickRate
float GameTimeElapsed
int TIMER_MAIN = 1 const

CustomEvent VoreGameTick

; Quest Script Setup Boilerplate
int Version = 0
Function Setup(int aiVersion = 1) ; Increment version as needed.
    if Version < aiVersion
        Actor player = Game.GetPlayer()
        RegisterForRemoteEvent(player, "OnPlayerLoadGame")
        TickRate = 1.0 / 6.0 ; Tick every 10 game-time minutes.
        GameTimeElapsed = Utility.GetCurrentGameTime()
        StartTimerGameTime(TickRate, TIMER_MAIN)
        Version = aiVersion
    EndIf
EndFunction

Event OnInit()
    Setup()
EndEvent

Event Actor.OnPlayerLoadGame(Actor akSender)
    Setup()
EndEvent

Event OnTimerGameTime(int timer)
    if timer == TIMER_MAIN
        ; Time is reported as a floating point number where 1 is a whole day. 1 hour is 1/24 expressed as a decimal. (1.0 / 24.0) * 60 * 60 = 150
        float timeDelta = (Utility.GetCurrentGameTime() - GameTimeElapsed) / (1.0 / 24.0) * 60 * 60
        Trace("OnTimerGameTime()", timeDelta)
        GameTimeElapsed = Utility.GetCurrentGameTime()
        Var[] args = new Var[1]
        args[0] = timeDelta
        SendCustomEvent("VoreGameTick", args)
        StartTimerGameTime(TickRate, TIMER_MAIN)
    endif
endevent