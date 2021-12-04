Scriptname FalloutVore:FV_LeveledListContainerInjectionScript Extends Quest

Group List1
	LeveledInjection[] Property InjectionArray Auto
EndGroup

Struct LeveledInjection
	Container Container_List
	LeveledItem Leveled_List
EndStruct

Event OnInit()

EndEvent

Function Injection()
	int i = 0
	While(i<InjectionArray.Length)
		
		i += 1
	EndWhile
EndFunction