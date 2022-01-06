Scriptname FalloutVore:FV_FalloutVoreScript extends Quest
{
    Core script governing the setup of the mod, initialization of things like plugins, and the main game-time timer
}

FalloutVore:FV_ActorDataScript Property FV_ActorData Auto Const Mandatory

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
; VoreGameTick: args[0] = Float timeDelta

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
    RunDLCPatches() ; Run every time b/c player could buy DLC at any time.
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

Bool DLC03Patched = False	;Far Harbor
Bool DLC06Patched = False	;Nuka-World

Function RunDLCPatches()
    ;GAZ: Function to detect DLC and add DLC Races to ActorData if present. Should check each time incase user buys DLC and continues save.
    ;This way is slightly uglier and more script-intensive on first run, but prevents us from needing to make patch-plugins that confuse and clutter load orders.
    ;I handle this patching here because there's no benefit to patch things before the Registry is fully ready to go.

    If Game.IsPluginInstalled("DLCCoast.esm") && !DLC03Patched
        Perk pApexPredator = Game.GetFormFromFile(0x0000F8EC, "FalloutVore.esm") as Perk Const	;GAZ: Used ofte, so cache here!

        FalloutVore:FV_ActorDataScript:SlotData DLC03Payload = new FalloutVore:FV_ActorDataScript:SlotData
        DLC03Payload.ActorRace = Game.GetFormFromFile(0x000247C1, "DLCCoast.esm") as Race	;GAZ: Gulpers!
        DLC03Payload.IndigestionChanceIncrease = 20
        DLC03Payload.Slots = 12
        DLC03Payload.SwallowMessageToPlay = Game.GetFormFromFile(0x0000C384, "FalloutVore.esm") as Message
        DLC03Payload.SwallowPerkRequired = pApexPredator
        FV_ActorData.InjectAddedInfo(DLC03Payload)

        DLC03Payload = new FalloutVore:FV_ActorDataScript:SlotData
        DLC03Payload.ActorRace = Game.GetFormFromFile(0x000180A8, "DLCCoast.esm") as Race	;GAZ: Hermit Crabs!
        DLC03Payload.IndigestionChanceIncrease = 20
        DLC03Payload.Slots = 12
        DLC03Payload.SwallowMessageToPlay = Game.GetFormFromFile(0x0000C385, "FalloutVore.esm") as Message
        DLC03Payload.SwallowPerkRequired = pApexPredator
        FV_ActorData.InjectAddedInfo(DLC03Payload)

        DLC03Payload = new FalloutVore:FV_ActorDataScript:SlotData
        DLC03Payload.ActorRace = Game.GetFormFromFile(0x0004E28E, "DLCCoast.esm") as Race	;GAZ: Small Gulpers!
        DLC03Payload.CanAlwaysSwallow = True
        DLC03Payload.IndigestionChanceIncrease = 5
        DLC03Payload.Slots = 3
        FV_ActorData.InjectAddedInfo(DLC03Payload)

        DLC03Payload = new FalloutVore:FV_ActorDataScript:SlotData
        DLC03Payload.ActorRace = Game.GetFormFromFile(0x0000FEEA, "DLCCoast.esm") as Race	;GAZ: Anglers!
        DLC03Payload.CanAlwaysSwallow = True
        DLC03Payload.IndigestionChanceIncrease = 5
        DLC03Payload.Slots = 4
        FV_ActorData.InjectAddedInfo(DLC03Payload)

        DLC03Payload = new FalloutVore:FV_ActorDataScript:SlotData
        DLC03Payload.ActorRace = Game.GetFormFromFile(0x00014174, "DLCCoast.esm") as Race	;GAZ: Fog Crawlers!
        DLC03Payload.IndigestionChanceIncrease = 20
        DLC03Payload.Slots = 12
        DLC03Payload.SwallowMessageToPlay = Game.GetFormFromFile(0x0000C386, "FalloutVore.esm") as Message
        DLC03Payload.SwallowPerkRequired = pApexPredator
        FV_ActorData.InjectAddedInfo(DLC03Payload)

        DLC03Payload = new FalloutVore:FV_ActorDataScript:SlotData
        DLC03Payload.ActorRace = Game.GetFormFromFile(0x0003FD66, "DLCCoast.esm") as Race	;GAZ: Rad Chickens!
        DLC03Payload.CanAlwaysSwallow = True
        DLC03Payload.Slots = 1
        FV_ActorData.InjectAddedInfo(DLC03Payload)

        DLC03Payload = new FalloutVore:FV_ActorDataScript:SlotData
        DLC03Payload.ActorRace = Game.GetFormFromFile(0x0003DDDE, "DLCCoast.esm") as Race	;GAZ: Rad Rabbits!
        DLC03Payload.CanAlwaysSwallow = True
        DLC03Payload.Slots = 1
        FV_ActorData.InjectAddedInfo(DLC03Payload)

        Debug.Notification("FalloutVore detected Far Harbor DLC and patched it.")	;GAZ: Feedback is important so the player knows it's working.
        DLC03Patched = True
    EndIf

    IF Game.IsPluginInstalled("DLCNukaWorld.esm") && !DLC06Patched
        
        Perk pApexPredator = Game.GetFormFromFile(0x0000F8EC, "FalloutVore.esm") as Perk Const	;GAZ: Used ofte, so cache here!

        FalloutVore:FV_ActorDataScript:SlotData DLC06Payload = new FalloutVore:FV_ActorDataScript:SlotData
        DLC06Payload.ActorRace = Game.GetFormFromFile(0x0003637A, "DLCNukaWorld.esm") as Race	;GAZ: Gatorclaws!
        DLC06Payload.IndigestionChanceIncrease = 20
        DLC06Payload.Slots = 12
        DLC06Payload.SwallowMessageToPlay = Game.GetFormFromFile(0x0000C383, "FalloutVore.esm") as Message
        DLC06Payload.SwallowPerkRequired = pApexPredator
        FV_ActorData.InjectAddedInfo(DLC06Payload)

        DLC06Payload = new FalloutVore:FV_ActorDataScript:SlotData
        DLC06Payload.ActorRace = Game.GetFormFromFile(0x0000AAFE, "DLCNukaWorld.esm") as Race	;GAZ: Cave Crickets!
        DLC06Payload.CanAlwaysSwallow = True
        DLC06Payload.IndigestionChanceIncrease = 5
        DLC06Payload.Slots = 2
        FV_ActorData.InjectAddedInfo(DLC06Payload)

        DLC06Payload = new FalloutVore:FV_ActorDataScript:SlotData
        DLC06Payload.ActorRace = Game.GetFormFromFile(0x0004CBCE, "DLCNukaWorld.esm") as Race	;GAZ: Ghoulrillas!
        DLC06Payload.IndigestionChanceIncrease = 20
        DLC06Payload.Slots = 9
        DLC06Payload.SwallowMessageToPlay = Game.GetFormFromFile(0x0000C383, "FalloutVore.esm") as Message
        DLC06Payload.SwallowPerkRequired = pApexPredator
        FV_ActorData.InjectAddedInfo(DLC06Payload)

        FormList BlockedList = Game.GetFormFromFile(0x0000E1A8, "FalloutVore.esm") as FormList
        BlockedList.AddForm(Game.GetFormFromFile(0x0000B028, "DLCNukaWorld.esm") as Race)	;GAZ: Add Ant-Swarms to the Block-List. They cause crashes when swallowed.

        Debug.Notification("FalloutVore detected Nuka-World DLC and patched it.")	;GAZ: Feedback is important so the player knows it's working.
        DLC06Patched = True
    EndIf
EndFunction