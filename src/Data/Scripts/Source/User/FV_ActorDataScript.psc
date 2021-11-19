Scriptname FV_ActorDataScript extends Quest

ActorValue Property Rads Auto
SlotData[] Property BaseActorData Auto
Faction Property HasBeenCompanionFaction Auto
Keyword Property ActorTypeBug Auto
Keyword Property ActorTypeRobot Auto
Race Property BloatFlyRace Auto
Race Property ProtectronRace Auto

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



Event OnInit()
	
EndEvent

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

int Function EvaluateIndigestionChance(Actor akPred)
	int result = 0
	Int index = GetIndex(akPred)
	If(index > -1)
		If BaseActorData[index].IndigestionIncreaseCancelPerk != None
			If(!akPred.HasPerk(BaseActorData[index].IndigestionIncreaseCancelPerk))
				result = BaseActorData[index].IndigestionChanceIncrease
			Endif
		Else
			result = BaseActorData[index].IndigestionChanceIncrease
		EndIf
	Endif
	
	return result
EndFunction

Bool Function GetCanSwallow(Actor akPred, Actor akPrey)
	Race RaceToCheck = akPrey.GetRace()
	Int index = GetIndex(akPrey)
	if(index > -1)
		If(!BaseActorData[index].CanAlwaysSwallow && !akPred.HasPerk(BaseActorData[index].SwallowPerkRequired))
			If(akPred == Game.GetPlayer())
				BaseActorData[index].SwallowMessageToPlay.Show()
			EndIf
			Return false
		EndIf
	EndIf
	return true
EndFunction

Function UpdateDigestCount(Actor akPred, Actor akPrey)
	Int index = GetIndex(akPrey)
	If(index > -1)
		akPred.ModValue(BaseActorData[index].PreyCount, 1)
		If(akPred != Game.GetPlayer() && akPred.IsInFaction(HasBeenCompanionFaction))
			;update the player tracker if the pred is a companion
			Game.GetPlayer().ModValue(BaseActorData[index].PreyCount, 1)
		EndIf
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

Bool Function GetIsHumanoid(Actor akPrey)
	Int index = GetIndex(akPrey)
	if(index > -1)
		return BaseActorData[index].IsHuman
	Endif
	return false
EndFunction

Function InjectAddedInfo(SlotData DataToInject)
	BaseActorData.add(DataToInject)
EndFunction