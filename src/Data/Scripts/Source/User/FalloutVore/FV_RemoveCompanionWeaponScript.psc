Scriptname FalloutVore:FV_RemoveCompanionWeaponScript extends ActiveMagicEffect

FormList Property FV_CompanionWeapons Auto

Event OnEffectStart(actor akTarget, actor akCaster)
	ParseInventory(akTarget)
EndEvent

Function ParseInventory(Actor akCompanion)
	Form[] CompanionInventory = akCompanion.GetInventoryItems()
	
	int i = 0
	
	While(i<FV_CompanionWeapons.GetSize())
		int j = CompanionInventory.Find(FV_CompanionWeapons.GetAt(i))
		debug.trace("j: " + j + " FV_CompanionWeapons:i : " + FV_CompanionWeapons.GetAt(i))
		If(j > -1)
			debug.trace("CompanionInventory[j]: " + CompanionInventory[j])
			akCompanion.RemoveItem(CompanionInventory[j])
		EndIf
		i += 1
	EndWhile
EndFunction