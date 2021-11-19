ScriptName FV_ScatManagerScript Extends Quest

Activator Property FV_ScatPile Auto
Activator[] Property FV_HumanBones Auto
Activator[] Property FV_Deadclaw Auto
Activator[] Property FV_BrahminBones Auto
Activator[] Property FV_HumanBonesClean Auto
Activator[] Property FV_DeadclawClean Auto
Activator[] Property FV_BrahminBonesClean Auto
ActorBase Property FV_ScatLootCorpse Auto
ActorValue Property FV_CurrentPrey Auto
ActorValue Property FV_ScatReady Auto
FV_ConsumptionRegistryScript Property FV_ConsumptionRegistry Auto
Faction Property CurrentCompanionFaction Auto
GlobalVariable Property FV_ScatEnabled Auto
GlobalVariable Property FV_CompanionScat Auto
GlobalVariable Property FV_NPCScatEnabled Auto
GlobalVariable Property FV_ScatType Auto
Keyword Property ActorTypeDeathclaw Auto
Keyword Property ActorTypeGhoul Auto
Keyword Property ActorTypeHuman Auto
Keyword Property ActorTypeSuperMutant Auto
ObjectReference Property FV_BellyContainer Auto
;ObjectReference Property VM_CompanionBellyContainer Auto
Potion Property FV_ScatPotion Auto
Race Property BrahminRace Auto
Sound Property FV_Scatsound Auto
ReferenceAlias Property DogmeatCompanion Auto
RefCollectionAlias Property ActiveCompanions Auto
MiscObject Property FV_JunkWeapon Auto
MiscObject Property FV_JunkLeatherArmor Auto
MiscObject Property FV_JunkMetalArmor Auto
Perk Property FV_SelectiveAcids01 Auto
Perk Property FV_SelectiveAcids02 Auto
Keyword Property ObjectTypeChem Auto
Keyword Property ObjectTypeStimpak Auto
Formlist Property lootItemsUnique Auto
Message Property FV_PlayerObjectScatReady Auto
MiscObject Property Caps001 Auto

Struct ScatData
	Actor Pred
	Int BrahminPrey
	Int DeathclawPrey
	Int HumanoidPrey
	Int TotalPrey
	ObjectReference InstancedBellyContainer
EndStruct

ScatData[] ScatArray

Event OnInit()
	EventRegister()
EndEvent

Function EventRegister()
	RegisterForCustomEvent(FV_ConsumptionRegistry, "OnVomit")
	RegisterForCustomEvent(FV_ConsumptionRegistry, "OnDigest")
EndFunction

;Event functions
Event FV_ConsumptionRegistryScript.OnDigest(FV_ConsumptionRegistryScript akSender, Var[] akArgs)
	If(FV_ScatEnabled.GetValue()==1)
		Actor akPred = akArgs[0] as Actor
		Int DigestionEvent = akArgs[1] as Int			;event 0 is when a prey dies.  event 1 is end of digestion
		Actor akPrey = akArgs[2] as Actor
		ObjectReference akContainer = akArgs[3] as ObjectReference
		ProcessPred(akPred, akPrey, akContainer, DigestionEvent)
	EndIf
EndEvent

Event FV_ConsumptionRegistryScript.OnVomit(FV_ConsumptionRegistryScript akSender, Var[] akArgs)
	;Remove pred from array if no prey are present
	Actor akPred = akArgs[0] as Actor
	If(akPred.GetValue(FV_CurrentPrey) <= 0 && akPred.GetValue(FV_ScatReady) == 0)
		RemovePred(akPred)
	EndIf
EndEvent

Event ObjectReference.OnItemRemoved(ObjectReference akSender, Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	Actor PlayerRef = Game.GetPlayer()
	debug.trace("FV_Scatmanager OnItemRemoved() akItemReference: " + akItemReference + " akBaseItem: " + akBaseItem)
	If(itemForm == NONE)
		itemForm = new ObjectReference[0]
		itemForm.clear()
	EndIf
	akItemReference.disable()
	itemForm.add(akItemReference)
	CallFunctionNoWait("PlayerSwallowItem_int", new var[0])
EndEvent

;Array Functions
ScatData Function RetrieveFromArray(Actor akPred)
	Int i = 0
	While(i < ScatArray.Length)
		If(ScatArray[i].Pred == akPred)
			return ScatArray[i]
		EndIf
		i += 1
	EndWhile
	
	return NONE
EndFunction

Scatdata Function AddPred(Actor akPred, ObjectReference akContainer = NONE)
	If(ScatArray==NONE)
		ScatArray = new ScatData[0]
		ScatArray.clear()
	EndIf
	If(RetrieveFromArray(akPred) == NONE)
		ScatData data = new ScatData
		data.Pred = akPred
		data.HumanoidPrey = 0
		data.DeathclawPrey = 0
		data.BrahminPrey = 0
		data.TotalPrey = 0
		data.InstancedBellyContainer = akContainer
		
		ScatArray.add(data)
		
		return data
	EndIf
EndFunction

Function RemovePred(Actor akPred)
	Int i = 0
	While(i < ScatArray.Length)
		If(ScatArray[i].Pred == akPred)
			ScatArray.Remove(i)
		EndIf
		i += 1
	EndWhile
EndFunction

;Public Functions
Function PlayerScat(Actor akPred)
	If(FV_ScatEnabled.GetValue() == 1 && akPred == Game.GetPlayer())
		If(akPred.GetValue(FV_CurrentPrey) > 0)
			Debug.Notification("Your prey is still digesting")
		Else
			PerformScat(akPred)
			akPred.SetValue(FV_ScatReady, 0)
			RemovePred(akPred)
			If FV_CompanionScat.GetValue() == 1 && ActiveCompanions.GetCount() > 0
				int i = 0
				Actor CompanionToScat
				while i < ActiveCompanions.GetCount()
					CompanionToScat = (ActiveCompanions.GetAt(i) as Actor)
					If CompanionToScat.IsInFaction(CurrentCompanionFaction)
						CompanionScat(CompanionToScat)
					EndIf
					i += 1
				EndWhile
			EndIf
			Actor Dogmeat = DogmeatCompanion.GetActorRef()
			If FV_CompanionScat.GetValue() == 1 && Dogmeat != NONE && Dogmeat.IsInFaction(CurrentCompanionFaction)
				CompanionScat(Dogmeat)
			EndIf
		EndIf
	EndIf
	;If(!akPred.GetItemCount(FV_ScatPotion))
	;	akPred.AddItem(FV_ScatPotion, 1, true) 
	;EndIf
EndFunction

Function NPCScat(Actor akPred)
	If(FV_ScatEnabled.GetValue() == 1)
		PerformScat(akPred)
		RemovePred(akPred)
	EndIf
EndFunction

Function CompanionScat(Actor akPred)
	If(FV_ScatEnabled.GetValue() == 1 && akPred.GetValue(FV_ScatReady) > 0)
		PerformScat(akPred)
		akPred.SetValue(FV_ScatReady, 0)
		RemovePred(akPred)
	EndIf
EndFunction

Function ProcessPreyItems(Actor akPrey, Actor akPred)
	ProcessPreyItems_int(akPrey, akPred)
EndFunction

;Private functions
Function ProcessPred(Actor akPred, Actor akPrey, ObjectReference akContainer, Int aiDigestionEvent)
	ScatData data = RetrieveFromArray(akPred)
	
		If(akPred == Game.GetPlayer() || (akPred.IsInFaction(CurrentCompanionFaction) && FV_CompanionScat.GetValue() == 1) || (!akPred.IsInFaction(CurrentCompanionFaction) && FV_NPCScatEnabled.GetValue() == 1))
			If(aiDigestionEvent == 0)
				If(data == None)
					data = AddPred(akPred, akContainer)
				EndIf
				data.TotalPrey += 1
				If(akPrey != NONE)
					If(akPrey.HasKeyword(ActorTypeHuman) || akPrey.hasKeyword(ActorTypeGhoul) || akPrey.HasKeyword(ActorTypeSuperMutant))
						data.HumanoidPrey += 1
					ElseIf(akPrey.HasKeyword(ActorTypeDeathclaw))
						data.DeathclawPrey += 1
					ElseIf(akPrey.GetRace() == BrahminRace)
						data.BrahminPrey += 1
					EndIf
				EndIf
			EndIf
		EndIf
	
EndFunction

Function PerformScat(Actor akPred)
	ScatData data = RetrieveFromArray(akPred)

	actor victim = data.Pred.placeactoratme(FV_ScatLootCorpse)
	float fAngle
	float fSin
	float fCos
	float fHeight
	fAngle = data.Pred.GetAngleZ() + 180.0
	fSin = Math.sin(fAngle)
	fCos = Math.cos(fAngle)
	fHeight = data.Pred.GetPositionZ()
		
	data.InstancedBellyContainer.removeallitems(victim)
	victim.moveto(data.Pred, 60.0 * fSin, 60.0 * fCos, 0.0, False)
	FV_Scatsound.Play(data.Pred)
	
	;If(FV_ScatType.GetValue() == 0)
	bool placeHuman = data.HumanoidPrey > 0
	bool placeBrahmin = data.BrahminPrey > 0
	bool placeDeathclaw = data.DeathclawPrey > 0
	Int RandomBones
	
	If(FV_ScatType.GetValue() == 0 || FV_ScatType.GetValue() == 1)
		victim.AttachAshPile(FV_ScatPile)
	EndIf
	If(FV_ScatType.GetValue() == 1)
		If(placeDeathclaw)
			RandomBones = Utility.RandomInt(0, FV_Deadclaw.Length-1)
			victim.AttachAshPile(FV_Deadclaw[RandomBones])
		ElseIf(placeBrahmin && FV_BrahminBones.Length > 0)
			RandomBones = Utility.RandomInt(0, FV_BrahminBones.Length-1)
			victim.AttachAshPile(FV_BrahminBones[RandomBones])
		ElseIf(placeHuman && FV_HumanBones.Length > 0)
			RandomBones = Utility.RandomInt(0, FV_HumanBones.Length-1)
			victim.AttachAshPile(FV_HumanBones[RandomBones])
		EndIf
	EndIf
	If(FV_ScatType.GetValue() == 2)
		If(placeDeathclaw)
			RandomBones = Utility.RandomInt(0, FV_DeadclawClean.Length-1)
			victim.AttachAshPile(FV_DeadclawClean[RandomBones])
		ElseIf(placeBrahmin && FV_BrahminBonesClean.Length > 0)
			RandomBones = Utility.RandomInt(0, FV_BrahminBonesClean.Length-1)
			victim.AttachAshPile(FV_BrahminBonesClean[RandomBones])
		ElseIf(placeHuman && FV_HumanBones.Length > 0)
			RandomBones = Utility.RandomInt(0, FV_HumanBonesClean.Length-1)
			victim.AttachAshPile(FV_HumanBonesClean[RandomBones])
		Else
			victim.AttachAshPile(FV_ScatPile)
		EndIf
	EndIf
	;ElseIf(FV_ScatType.GetValue() == 2)
	;	Int randomScat = Utility.RandomInt(1, 2)
	;	If(randomScat == 1)
	;		victim.AttachAshPile(FV_ScatPile)
	;	ElseIf(randomScat == 2)
	;		victim.AttachAshPile(VM_ScatBones)
	;	EndIf
	victim.killsilent()
	;victim.setAlpha(0, false)
EndFunction

struct ItemParse
	Form object = NONE
	int count = 0
endstruct

ObjectReference[] itemForm

bool bProcessingFood = false

Function PlayerSwallowItem(int aiFormID)
	debug.trace("Received PlayerSwallowItem " + aiFormID)
	Form itemFilter = Game.GetForm(aiFormID)
	RegisterForRemoteEvent(Game.GetPlayer(), "OnItemRemoved")
	AddInventoryEventFilter(itemFilter)
EndFunction

Function PlayerSwallowItem_int()
	ItemParse[] finalItem = new ItemParse[0]
	finalItem.clear()
	Actor PlayerRef = Game.GetPlayer()
	If bProcessingFood
		return
	EndIf
	bProcessingFood = true
	
	while itemForm.length > 0
	
		if(itemForm[0])
			finalItem = ProcessSingleItem(PlayerRef, PlayerRef, itemForm[0], 1)
			int i = 0
			PlayerRef.removeItem(itemForm[0], abSilent = true)
			While(i<finalItem.length)
		
				FV_BellyContainer.additem(finalItem[i].object, finalItem[i].count, true)
				i += 1
			EndWhile
			If(FV_ScatEnabled.GetValue() > 0)
				If(PlayerRef.GetValue(FV_ScatReady) == 0)
					FV_PlayerObjectScatReady.Show()
					PlayerRef.SetValue(FV_ScatReady, 1)
				EndIf
				ProcessPred(PlayerRef, NONE, FV_BellyContainer, 0)
			EndIf
		Else
			debug.trace("PlayerSwallowItem_int received invalid formID: " + itemForm[0])
		EndIf
		itemForm.remove(0)
	EndWhile
	bProcessingFood = false
	RemoveAllInventoryEventFilters()
	UnregisterForRemoteEvent(Game.GetPlayer(), "OnItemRemoved")
EndFunction

Function ProcessPreyItems_int(Actor akPrey, Actor akPred)
	;Form[] inventoryList = akPrey.GetInventoryItems()
	ItemParse[] finalInventory = new ItemParse[0]
	finalInventory.clear()
	int i = 0
	ObjectReference droppedRef = NONE
	If(akPrey.GetItemCount(NONE) > 0)
		droppedRef = akPrey.DropFirstObject()
	EndIf
	;While(i<inventoryList.length)
	While(droppedRef)
		ItemParse[] itemToAdd = new ItemParse[0]
		itemToAdd.clear()
		itemToAdd = ProcessSingleItem(akPrey, akPred, droppedRef, 1)
		;itemToAdd = ProcessSingleItem(akPrey, akPred, inventoryList[i], akPrey.GetItemCount(inventoryList[i]))
		If(itemToAdd.length > 0)
			int j = 0
			While(j < itemToAdd.length)
				finalInventory.add(itemToAdd[j])
				j += 1
			EndWhile
		EndIf
		If(akPrey.GetItemCount(NONE) > 0)
			droppedRef = akPrey.DropFirstObject()
		Else
			droppedRef = NONE
		EndIf
		;i += 1
	EndWhile
	i = 0
	akPrey.removeallitems()
	While(i<finalInventory.length)
		akPrey.additem(finalInventory[i].object, finalInventory[i].count, true)
		i += 1
	EndWhile
EndFunction

ItemParse[] Function ProcessSingleItem(Actor akPrey, Actor akPred, Form afItem, int aiCount)
	ItemParse[] processedItem = new ItemParse[0]
	processedItem.clear()
	bool checkItem = true
	Form checkForm = afItem
	
	If(afItem is ObjectReference)
		checkForm = (afItem as ObjectReference).GetBaseObject()
	EndIf
	debug.trace("FV_ScatManagerScript ProcessSingleItem afItem: " + afItem + " checkForm: " + checkForm)
	If(lootItemsUnique.HasForm(checkForm))
		ItemParse questParse = new ItemParse
		questParse.object = afItem
		questParse.count = aiCount
		processedItem.add(questParse)
		checkItem = false
	EndIf
	If(checkItem && checkForm is Ammo && akPred.HasPerk(FV_SelectiveAcids01))
		ItemParse ammoParse = new ItemParse
		ammoParse.object = afItem
		ammoParse.count = aiCount
		processedItem.add(ammoParse)
		checkItem = false
	EndIf
	If(checkItem && checkForm is Potion && (checkForm.HasKeyword(ObjectTypeChem) || checkForm.HasKeyword(ObjectTypeStimpak))  && akPred.HasPerk(FV_SelectiveAcids01))
		ItemParse potionParse = new ItemParse
		potionParse.object = afItem
		potionParse.count = aiCount
		processedItem.add(potionParse)
		checkItem = false
	EndIf
	If(checkItem && checkForm is Weapon)
		ItemParse weaponParse = new ItemParse
		If(afItem is ObjectReference && akPred.HasPerk(FV_SelectiveAcids02))
			weaponParse.object = afItem
		ElseIf(akPred.HasPerk(FV_SelectiveAcids02))
			ObjectReference droppedWeapon = akPrey.DropObject(afItem)
			weaponParse.object = droppedWeapon
		Else
			weaponParse.object = FV_JunkWeapon
			(afItem as ObjectReference).delete()
		EndIf
		weaponParse.count = aiCount
		processedItem.add(weaponParse)
		checkItem = false
	EndIf
	If(checkItem && checkForm is Armor)
		ItemParse armorParse = new ItemParse
		If(afItem is ObjectReference && akPred.HasPerk(FV_SelectiveAcids02))
			armorParse.object = afItem
		ElseIf(akPred.HasPerk(FV_SelectiveAcids02))
			ObjectReference droppedArmor = akPrey.DropObject(afItem)
			armorParse.object = droppedArmor
		Else
			armorParse.object = FV_JunkLeatherArmor
			(afItem as ObjectReference).delete()
		EndIf
		armorParse.count = aiCount
		processedItem.add(armorParse)
		checkItem = false
	EndIf
	If(checkItem && (checkForm is Key || checkForm is Book || checkForm is Holotape || checkForm == Caps001))
		ItemParse saveItem = new ItemParse
		saveItem.object = afItem
		saveItem.count = aiCount
		processedItem.add(saveItem)
	EndIf
	If(checkItem && checkForm is MiscObject)
		MiscObject:MiscComponent[] comps = (checkForm as MiscObject).GetMiscComponents()
		Int j=0
		While(j < comps.length)
			ItemParse scrapItem = new ItemParse
			MiscObject:MiscComponent breakdownItem = comps[j]
			scrapItem.object = breakdownItem.Object.GetScrapItem()
			scrapItem.count = breakdownItem.Count * aiCount
			processedItem.add(scrapItem)
			j += 1
		EndWhile
		checkItem = false
	EndIf
	return processedItem
EndFunction
;Private Functions