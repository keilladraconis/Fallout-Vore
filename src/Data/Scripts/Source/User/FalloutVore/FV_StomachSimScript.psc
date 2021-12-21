Scriptname FalloutVore:FV_StomachSimScript extends Quest
{
    Simulates stomach processes and tracks values related to the stomach and digestion.
    
    API:
    Float GetBellyVolume(Actor)
    Bool AddDigestible(Actor, Float) 
    Bool AddIndigestible(Actor, Float)
    Bool AddDigestiblePrey(Actor, Float, ActorTypeKeyword)
    Bool PurgeIndigestible(Actor, Float, Bool)
    Bool ShiftIndigestibleToDigestiblePrey(Actor, Float, ActorTypeKeyword)

    Tracks a map of Actors to structs.
    - DigestibleVolume
    - IndigestibleVolume
    - DigestiblePreyVolume
    - ActorTypeKeyword

    OnTimerGameTime:
    Iterates the list of actors, applies digestion strength proportionally to their digestibles.
    When all digestibles are zeroed out, drop the Actor from the map.
    Fire digestion events for SAV, AudioVisual
}

Function Trace(string asFunction, string asMessage = "") Global debugOnly
	string logName = "FalloutVore"
	Debug.OpenUserLog(logName)
    Debug.TraceUser(logName, "[FalloutVore:FV_StomachSimScript] " + asFunction + " - " + asMessage)	
EndFunction

; Public

; Gets the belly volume for the actor 
float Function GetBellyVolume(Actor akActor)
    Stomach currentStomach = GetStomachFor(akActor)
    return currentStomach.DigestibleVolume + currentStomach.IndigestibleVolume + currentStomach.DigestiblePreyVolume
EndFunction

; Adds digestible volume
Function AddDigestible(Actor akPred, Float afVolume)
    Stomach currentStomach = GetStomachFor(akPred, true)
    currentStomach.DigestibleVolume += afVolume
    akPred.DamageValue(FV_BellyCapacity, afVolume)
    SendStomachChange(akPred)
EndFunction

Function AddIndigestible(Actor akPred, Float afVolume)
    Trace("AddIndigestible()")
    Stomach currentStomach = GetStomachFor(akPred, true)
    currentStomach.IndigestibleVolume += afVolume
    akPred.DamageValue(FV_BellyCapacity, afVolume)
    SendStomachChange(akPred)
EndFunction

; Adds digestible prey. Any existing digestible prey is pushed to DigestibleVolume
Function AddDigestiblePrey(Actor akPred, Float afVolume, Actor akPrey)
    Stomach currentStomach = GetStomachFor(akPred, true)
    currentStomach.DigestibleVolume += currentStomach.DigestiblePreyVolume
    currentStomach.DigestiblePreyVolume = afVolume
    currentStomach.Prey = akPrey
    akPred.DamageValue(FV_BellyCapacity, afVolume)
    SendStomachChange(akPred)
EndFunction

; Removes Indigestible volume. The abAll parameter enables clearing all indigestibles.
Function PurgeIndigestible(Actor akPred, Float afVolume, Bool abAll = false)
    Stomach currentStomach = GetStomachFor(akPred)
    If (abAll)
        currentStomach.IndigestibleVolume = 0.0
    Else
        currentStomach.IndigestibleVolume -= afVolume
    EndIf
    akPred.RestoreValue(FV_BellyCapacity, afVolume)
    SendStomachChange(akPred)
EndFunction

; Deducts Indigestible and adds it to Digestible, such as when a prey dies.
Function ShiftIndigestibleToDigestiblePrey(Actor akPred, Float afVolume, Actor akPrey)
    PurgeIndigestible(akPred, afVolume)
    AddDigestiblePrey(akPred, afVolume, akPrey)
    SendStomachChange(akPred)
EndFunction

; Private

Group Scripts
    FalloutVore:FV_FalloutVoreScript Property FV_FalloutVore Auto Const Mandatory
EndGroup

Group ActorValues
    ActorValue Property FV_BellyCapacity Auto Const Mandatory
    ActorValue Property FV_DigestionSpeed Auto Const Mandatory
EndGroup

Struct Stomach
    Actor Pred
    float DigestibleVolume
    float IndigestibleVolume
    float DigestiblePreyVolume
    Actor Prey ; Most recently added prey actor
EndStruct

Stomach[] StomachMap

; These two events fire on each pred's digestion step
; args[0] = stomach.Pred
; args[1] = stomach.Prey
; args[2] = digestionAmount
CustomEvent OnDigestProgress
CustomEvent OnDigestFinish
; Fires when the stomach volume changes
; args[0] = akActor
CustomEvent OnStomachChange

Event OnInit()
    StomachMap = new Stomach[0]
    RegisterForCustomEvent(FV_FalloutVore, "VoreGameTick")
EndEvent

Event FalloutVore:FV_FalloutVoreScript.VoreGameTick(FalloutVore:FV_FalloutVoreScript akSender, Var[] akArgs)
    Trace("VoreGameTick()")
    float timeElapsed = akArgs[0] as float
    RunEachDigestion(timeElapsed)
EndEvent

; Ensures the StomachMap and gets/sets a stomach for the actor.
Stomach Function GetStomachFor(Actor akActor, Bool abAdd = false)
    int index = StomachMap.FindStruct("Pred", akActor)
    If (index >= 0)
        return StomachMap[index]
    EndIf

    Stomach newStomach = new Stomach
    newStomach.Pred = akActor

    If (abAdd && StomachMap.Length < 128)
        StomachMap.Add(newStomach)
    EndIf

    return newStomach
EndFunction

Function RemoveStomachFor(Actor akActor)
    int index = StomachMap.FindStruct("Pred", akActor)
    If (index >= 0)
        StomachMap.Remove(index)
    EndIf
EndFunction

Function RunEachDigestion(float afTimeElapsed)
    int index = 0
    While (index < StomachMap.Length && index <= 128)
        Stomach item = StomachMap[index]
        If (item.DigestiblePreyVolume + item.DigestibleVolume > 0)
            RunDigestion(afTimeElapsed, item)
        EndIf
        index += 1
    EndWhile
    
    While (index < StomachMap.Length && index <= 128)
        Stomach item = StomachMap[index]
        If (item.DigestiblePreyVolume + item.DigestibleVolume <= 0)
            ; Because we remove the indexed item while looping, removal functions as advancing the index.
            StomachMap.Remove(index)
        Else
            index += 1
        EndIf
    EndWhile
EndFunction

Function RunDigestion(float afTimeElapsed, Stomach stomach)
    Trace("RunDigestion()", stomach)
    float digestionSpeed = stomach.Pred.GetValue(FV_DigestionSpeed)
    If (digestionSpeed == 0.0)
        digestionSpeed = 1.0 ; Some actors have no digestion speed. Default to 1 unit per hour.
    EndIf
    float digestionAmount = afTimeElapsed * (digestionSpeed / 3600.0) ; Digestionspeed computed into units-per-hour.
    float digestProportion = digestionAmount / (stomach.DigestibleVolume + stomach.DigestiblePreyVolume)
    float digestibleVolume = stomach.DigestibleVolume
    float digestiblePreyVolume = stomach.DigestiblePreyVolume
    Trace("RunDigestion()", digestionAmount)
    digestibleVolume -= digestProportion * digestibleVolume
    digestiblePreyVolume -= digestProportion * digestiblePreyVolume

    If (digestibleVolume <= 0)
        digestionAmount += digestibleVolume ; On overdigestion, subtract it from digestAmount
        digestibleVolume = 0
    EndIf

    If (digestiblePreyVolume <= 0)
        digestionAmount += digestiblePreyVolume ; On overdigestion, subtract it from digestAmount
        digestiblePreyVolume = 0
    EndIf

    stomach.Pred.RestoreValue(FV_BellyCapacity, digestionAmount)
    Trace("RunDigestion()", "FV_BellyCapacity[" + stomach.Pred + "] += " + digestionAmount)
    stomach.DigestibleVolume = digestibleVolume
    stomach.DigestiblePreyVolume = digestiblePreyVolume
    SendStomachChange(stomach.Pred)
    If (digestibleVolume + digestiblePreyVolume + stomach.IndigestibleVolume <= 0)
        Var[] args = new Var[3]
        args[0] = stomach.Pred
        args[1] = stomach.Prey
        args[2] = digestionAmount
        SendCustomEvent("OnDigestFinish", args)
    Else
        Var[] args = new Var[3]
        args[0] = stomach.Pred
        args[1] = stomach.Prey
        args[2] = digestionAmount
        SendCustomEvent("OnDigestProgress", args)
    EndIf
EndFunction

Function SendStomachChange(Actor akActor)
    Trace("SendStomachChange()", akActor)
    Var[] args = new Var[1]
    args[0] = akActor
    SendCustomEvent("OnStomachChange", args)
EndFunction