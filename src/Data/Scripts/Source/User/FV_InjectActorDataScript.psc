Scriptname FV_InjectActorDataScript extends Quest

InjectData[] Property ActorDataInject Auto
FV_ActorDataScript Property FV_ActorData Auto
Race[] Property BlockedRaces Auto
FormList Property FV_RaceSwallowBlock Auto

Struct InjectData
	Keyword ActorType = NONE
	Race ActorRace = NONE
	Int Slots = 2
	Bool IsHuman = false
	Int IndigestionChanceIncrease = 0
	Perk IndigestionIncreaseCancelPerk = NONE
	
	Perk SwallowPerkRequired = NONE
	Message SwallowMessageToPlay = NONE
	Bool CanAlwaysSwallow = false		;Any actortypes or races that can always be swallowed need to be placed at the top of the array to save clock cycles
EndStruct

Event OnInit()
	InjectStruct()
	InjectSwallowBlock()
EndEvent

Function InjectStruct()
	FV_ActorDataScript:SlotData DataInjection = new FV_ActorDataScript:SlotData
	int i = 0
	While(i<ActorDataInject.length)
		DataInjection.ActorType = ActorDataInject[i].ActorType
		DataInjection.ActorRace = ActorDataInject[i].ActorRace
		DataInjection.Slots = ActorDataInject[i].Slots
		DataInjection.IsHuman = ActorDataInject[i].IsHuman
		DataInjection.IndigestionChanceIncrease = ActorDataInject[i].IndigestionChanceIncrease
		DataInjection.IndigestionIncreaseCancelPerk = ActorDataInject[i].IndigestionIncreaseCancelPerk
		DataInjection.SwallowPerkRequired = ActorDataInject[i].SwallowPerkRequired
		DataInjection.SwallowMessageToPlay = ActorDataInject[i].SwallowMessageToPlay
		DataInjection.CanAlwaysSwallow = ActorDataInject[i].CanAlwaysSwallow
		FV_ActorData.InjectAddedInfo(DataInjection)
		i += 1
	EndWhile
	debug.trace("FV_InjectActorDataScript InjectStruct() finished")
EndFunction

Function InjectSwallowBlock()
	int i = 0
	While(i<BlockedRaces.length)
		FV_RaceSwallowBlock.AddForm(BlockedRaces[i])
		i += 1
	EndWhile
EndFunction