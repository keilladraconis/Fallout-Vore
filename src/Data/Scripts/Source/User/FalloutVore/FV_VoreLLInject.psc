Scriptname FalloutVore:FV_VoreLLInject Extends Quest

InjectedActor[] Property ActorsToInject1 Auto
LeveledActor Property LeveledListForInjection1 Auto

ActorBase[] Property WorkshopLCharToInject2 Auto
LeveledActor Property WorkshopLCharInjected2 Auto

Struct InjectedActor
	ActorBase lvlActor
	Int level
EndStruct

Event OnInit()
	InjectList1()
	InjectList2()
EndEvent

Function InjectList1()
	int i = 0
	While(i < ActorsToInject1.length)
		LeveledListForInjection1.AddForm(ActorsToInject1[i].lvlActor as form, ActorsToInject1[i].level)
		i += 1
	EndWhile
EndFunction

Function InjectList2()
	int i = 0
	While(i<WorkshopLCharToInject2.length)
		WorkshopLCharInjected2.AddForm(WorkshopLCharToInject2[i], 1)
		i += 1
	EndWhile
EndFunction