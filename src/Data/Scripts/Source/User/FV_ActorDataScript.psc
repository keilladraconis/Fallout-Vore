Scriptname FV_ActorDataScript extends Quest
;; Bound to FV_ActorData Quest. Referenced by many other scripts

ActorValue Property Rads Auto Const Mandatory
SlotData[] Property BaseActorData Auto ; A list of SlotData structs provided by ESP. Customized in the Creation Kit.
Faction Property HasBeenCompanionFaction Auto Const Mandatory
Keyword Property ActorTypeBug Auto Const Mandatory
Keyword Property ActorTypeRobot Auto Const Mandatory
GlobalVariable Property FV_SwallowPerksRequired Auto
Race Property BloatFlyRace Auto Const Mandatory
Race Property ProtectronRace Auto Const Mandatory

Struct SlotData
	Keyword ActorType
	Race ActorRace
	Int Slots = 2
	Bool IsHuman = false
	Int IndigestionChanceIncrease = 0
	Perk IndigestionIncreaseCancelPerk = NONE
	
	Perk SwallowPerkRequired
	Message SwallowMessageToPlay
	Bool CanAlwaysSwallow = false		;Any actortypes or races that can always be swallowed need to be placed at the top of the array to save clock cycles
	
	ActorValue PreyCount
	Int RadDamageMin = 0
	Int RadDamageMax = 0
	Perk RadResist = None
EndStruct

; Finds the index of the entry in BaseActorData which matches the player's race, or otherwise their bug/robot keyword.
Int Function GetIndex(Actor akActorToCheck)
	Race RaceToCheck = akActorToCheck.GetRace()
	int i = BaseActorData.FindStruct("ActorRace", RaceToCheck)
	If(i < 0)
		;Special handlers for bug defaults and robot defaults
		If(akActorToCheck.HasKeyword(ActorTypeBug))
			i = BaseActorData.FindStruct("ActorRace", BloatFlyRace)
		ElseIf(akActorToCheck.HasKeyword(ActorTypeRobot))
			i = BaseActorData.FindStruct("ActorRace", ProtectronRace)
		EndIf
	EndIf
	return i
EndFunction

; Returns how many belly slots the prey occupies.
Int Function EvaluateSlots(Actor akPrey, Bool checkHuman = false)
	Int SlotsRequired = 0
	Int index = GetIndex(akPrey)
	if(index > -1)
		If(checkHuman && BaseActorData[index].IsHuman)
			SlotsRequired = BaseActorData[index].Slots
		ElseIf(!checkHuman)
			SlotsRequired = BaseActorData[index].Slots
		EndIf
	Endif
	
	If SlotsRequired == 0 && !checkHuman
		Return 2
	Else
		Return SlotsRequired
	EndIf
EndFunction

; Returns the IndigestionChance when consuming the actor. 
int Function EvaluateIndigestionChance(Actor akActor)
	int result = 0
	Int index = GetIndex(akActor)
	If(index > -1)
		If BaseActorData[index].IndigestionIncreaseCancelPerk != None
			If(!akActor.HasPerk(BaseActorData[index].IndigestionIncreaseCancelPerk))
				result = BaseActorData[index].IndigestionChanceIncrease
			Endif
		Else
			result = BaseActorData[index].IndigestionChanceIncrease
		EndIf
	Endif
	
	return result
EndFunction

; Determines whether a given prey can always be swallowed. For example; Humans, Bloatflies, Dogs
Bool Function GetCanSwallow(Actor akPred, Actor akPrey)
	Race RaceToCheck = akPrey.GetRace()
	Int index = GetIndex(akPrey)
	if(index > -1)
		If(!BaseActorData[index].CanAlwaysSwallow && !akPred.HasPerk(BaseActorData[index].SwallowPerkRequired) && FV_SwallowPerksRequired.GetValue() as Int == 1)
			If(akPred == Game.GetPlayer())
				BaseActorData[index].SwallowMessageToPlay.Show()
			EndIf
			Return false
		EndIf
	EndIf
	return true
EndFunction

; Seems like this tracks some stats relating to how many times pred has eaten a prey. Also inexplicably applies radiation damage.
; Used Once by FV_ConsumptionRegistry
Function UpdateDigestCount(Actor akPred, Actor akPrey)
	Int index = GetIndex(akPrey)
	If(index > -1)
		akPred.ModValue(BaseActorData[index].PreyCount, 1)
		If(akPred != Game.GetPlayer() && akPred.IsInFaction(HasBeenCompanionFaction))
			;update the player tracker if the pred is a companion
			Game.GetPlayer().ModValue(BaseActorData[index].PreyCount, 1)
		EndIf
		; TODO Why is radiation damage applied here?
		If(BaseActorData[index].RadDamageMax > 0)
			If(BaseActorData[index].RadResist != NONE)
				If(!akPred.HasPerk(BaseActorData[index].RadResist))
					akPred.DamageValue(Rads, Utility.RandomInt(BaseActorData[index].RadDamageMin, BaseActorData[index].RadDamageMax))
				EndIf
			Else
				akPred.DamageValue(Rads, Utility.RandomInt(BaseActorData[index].RadDamageMin, BaseActorData[index].RadDamageMax))
			EndIf
		EndIf
	EndIf
EndFunction

; Simple getter. Used once by ConsumptionRegistry to set IsHumanoid VoreData.
Bool Function GetIsHumanoid(Actor akPrey)
	Int index = GetIndex(akPrey)
	if(index > -1)
		return BaseActorData[index].IsHuman
	Endif
	return false
EndFunction

;GAZ: Used to patch DLCs and maybe in the future mods. DLC is detected and patched by FV_ConsumptionRegistryScript RunDLCPatches().
Function InjectAddedInfo(SlotData DataToInject)
	BaseActorData.add(DataToInject)
EndFunction