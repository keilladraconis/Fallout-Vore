Scriptname FV_AddColdSteelScript Extends Quest

FormList[] Property ListToAdd Auto
FormList Property FV_ColdSteelArmorMaster Auto

Event OnInit()
	AddLists()
EndEvent

Function AddLists()
	Int i = 0
	If(ListToAdd != NONE)
		While(i < ListToAdd.Length)
			If !FV_ColdSteelArmorMaster.HasForm(ListToAdd[i])
				FV_ColdSteelArmorMaster.AddForm(ListToAdd[i])
			EndIf
			i += 1
		EndWhile
	EndIf
EndFunction