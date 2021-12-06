Scriptname FalloutVore:FV_PlayerCapacitySystemScript extends Quest

ActorValue Property FV_BellyCapacity Auto
ActorValue Property FV_CurrentPrey Auto
ActorValue Property FV_PredLevel Auto
GlobalVariable Property FV_PlayerCapacityPoints Auto
GlobalVariable Property FV_CompanionCapacityPoints Auto
GlobalVariable Property FV_PlayerMinimumCapacityTraining Auto
FalloutVore:FV_ActorDataScript Property FV_ActorData Auto
FalloutVore:FV_ConsumptionRegistryScript Property FV_ConsumptionRegistry Auto
Message Property FV_PlayerGainedCapacityMessage Auto

RefCollectionAlias Property ActiveCompanions Auto

Perk Property FV_WhaleBelly01 Auto
Perk Property FV_WhaleBelly02 Auto
Perk Property FV_WhaleBelly03 Auto

Actor PlayerRef
Bool bProcessingTraining = false
Int iWhaleRank = 0
TrainingArray[] ProcessPrey

Struct TrainingArray
	Float fPreySlots
	Float fPlayerTotalPreyCount
	Actor aPred = NONE
EndStruct

Event OnInit()
	PlayerRef = Game.GetPlayer()
	ProcessPrey = new TrainingArray[0]
	ProcessPrey.clear()
	RegisterForCustomEvent(FV_ConsumptionRegistry, "OnDigest")
EndEvent

Event FalloutVore:FV_ConsumptionRegistryScript.OnDigest(FalloutVore:FV_ConsumptionRegistryScript akSender, Var[] akArgs)
	;debug.trace("FalloutVore:FV_PlayerCapacitySystemScript Received OnDigest Event")
	Actor Sentpred = akArgs[0] as Actor
	Int DigestType = akArgs[1] as Int
	If(SentPred == PlayerRef && DigestType == 0)
		TrainingArray temp = new TrainingArray
		temp.fPreySlots = (FV_ActorData.EvaluateSlots(akArgs[2] as Actor)) as float
		temp.fPlayerTotalPreyCount = PlayerRef.GetValue(FV_CurrentPrey)
		ProcessPrey.add(temp)
		
		CallFunctionNoWait("ProcessCapacityTraining", new var[0])
	ElseIf(ActiveCompanions.Find(SentPred) > 0 && PlayerRef.GetValue(FV_PredLevel) == 0)
		TrainingArray tempCompanion = new TrainingArray
		tempCompanion.fPreySlots = (FV_ActorData.EvaluateSlots(akArgs[2] as Actor)) as float
		tempCompanion.fPlayerTotalPreyCount = Sentpred.GetValue(FV_CurrentPrey)
		tempCompanion.aPred = SentPred
		ProcessPrey.add(tempCompanion)
		
		CallFunctionNoWait("ProcessCompanionCapacityTraining", new var[0])
	EndIf
EndEvent

Function ProcessCapacityTraining()
	;debug.trace("FalloutVore:FV_PlayerCapacitySystemScript ProcessCapacityTraining() Processing " + ProcessPrey.length + " PreyCount Items...")
	If(bProcessingTraining)
		return
	EndIf
	
	bProcessingTraining = true
	while ProcessPrey.length > 0
		ProcessSinglePrey(ProcessPrey[0].fPreySlots, ProcessPrey[0].fPlayerTotalPreyCount)
		ProcessPrey.remove(0)
		;debug.trace("FalloutVore:FV_PlayerCapacitySystemScript ProcessCapacityTraining() " + ProcessPrey.length + " remaining...")
		utility.WaitMenuMode(0.1)
	endwhile
	
	; We out. Peace.
	bProcessingTraining = false
EndFunction

Function ProcessCompanionCapacityTraining()
	;debug.trace("FalloutVore:FV_PlayerCapacitySystemScript ProcessCompanionCapacityTraining() Processing " + ProcessPrey.length + " PreyCount Items...")
	If(bProcessingTraining)
		return
	EndIf
	
	bProcessingTraining = true
	while ProcessPrey.length > 0
		ProcessCompanionSinglePrey(ProcessPrey[0].fPreySlots, ProcessPrey[0].fPlayerTotalPreyCount, ProcessPrey[0].aPred)
		ProcessPrey.remove(0)
		;debug.trace("FalloutVore:FV_PlayerCapacitySystemScript ProcessCompanionCapacityTraining() " + ProcessPrey.length + " remaining...")
		utility.WaitMenuMode(0.1)
	endwhile
	
	; We out. Peace.
	bProcessingTraining = false
EndFunction

Function ProcessSinglePrey(Float afSlots, Float afTotalPreyCount)
	;debug.trace("FalloutVore:FV_PlayerCapacitySystemScript ProcessSinglePrey() afSlots: " + afSlots + " afTotalPreyCount: " + afTotalPreyCount + " FV_PlayerMinimumCapacityTraining: " + FV_PlayerMinimumCapacityTraining.GetValue())
	If(afTotalPreyCount <= FV_PlayerMinimumCapacityTraining.GetValue())
		;bail out.  The player needs to eat more
		return
	ElseIf(afTotalPreyCount-afSlots < FV_PlayerMinimumCapacityTraining.GetValue())
		;If the difference of the alive prey count and the current prey slots is less than the minimum for training, reduce the slots evaluated
		afSlots = afTotalPreyCount-FV_PlayerMinimumCapacityTraining.GetValue()
	EndIf
	If(afSlots <= 0)
		;bail out  training can't be accomplished
		return
	EndIf
	;Now we can start the points checking
	Float NewCapacityPoints = FV_PlayerCapacityPoints.GetValue() + afSlots
	;Bonus points if the prey gets the player close to max capacity once it starts taking a lot of points to mature capacity.  6^2.25 would require 56 points
	If(PlayerRef.GetValue(FV_BellyCapacity) >= 6.0)
		If(afTotalPreyCount/PlayerRef.GetValue(FV_BellyCapacity) >= 1.0)
			NewCapacityPoints += 3
		ElseIf(afTotalPreyCount/PlayerRef.GetValue(FV_BellyCapacity) >= 0.9)
			NewCapacityPoints += 2
		ElseIf(afTotalPreyCount/PlayerRef.GetValue(FV_BellyCapacity) >= 0.75)
			NewCapacityPoints += 1
		EndIf
	EndIf
	If(NewCapacityPoints >= Math.Ceiling(Math.Pow(PlayerRef.GetBaseValue(FV_BellyCapacity)-iWhaleRank, 2.25)))
		;levelup!
		NewCapacityPoints = RankUp(NewCapacityPoints)
		FV_PlayerCapacityPoints.SetValue(NewCapacityPoints)
		;Let the player know.  %0.1f is the format replacer, so divide by 2 to give the player an idea of how many humans they can stuff in their guts
		
		debug.trace("FalloutVore:FV_PlayerCapacitySystemScript ProcessSinglePrey() Rank Up - FV_PlayerCapacityPoints: " + FV_PlayerCapacityPoints.GetValue() + " FV_BellyCapacity: " + PlayerRef.GetValue(FV_BellyCapacity))
	Else
		FV_PlayerCapacityPoints.SetValue(NewCapacityPoints)
		debug.trace("FalloutVore:FV_PlayerCapacitySystemScript ProcessSinglePrey() No Rank Up - FV_PlayerCapacityPoints: " + FV_PlayerCapacityPoints.GetValue())
	EndIf
	
EndFunction

Float Function RankUp(Float afCapacityPoints)
	While(afCapacityPoints >= Math.Ceiling(Math.Pow(PlayerRef.GetBaseValue(FV_BellyCapacity)-iWhaleRank, 2.25)))
		
		afCapacityPoints -= Math.Ceiling(Math.Pow(PlayerRef.GetBaseValue(FV_BellyCapacity)-iWhaleRank, 2.25))
		PlayerRef.SetValue(FV_BellyCapacity, PlayerRef.GetBaseValue(FV_BellyCapacity) + 1)
		RankUpCompanions()
		If((PlayerRef.GetBaseValue(FV_BellyCapacity) as int)%5 == 0)
			FV_PlayerMinimumCapacityTraining.SetValue(FV_PlayerMinimumCapacityTraining.GetValue() + 1)
		EndIf
		
	EndWhile
	;Let the player know.  %0.1f is the format replacer, so divide by 2 to give the player an idea of how many humans they can stuff in their guts
	FV_PlayerGainedCapacityMessage.show(PlayerRef.GetValue(FV_BellyCapacity)/2)
	return afCapacityPoints
EndFunction

Function ProcessCompanionSinglePrey(Float afSlots, Float afTotalPreyCount, Actor akPred)
	If(afSlots <= 0)
		;bail out  training can't be accomplished
		return
	EndIf
	Float NewCapacityPoints = FV_PlayerCapacityPoints.GetValue() + afSlots
	If(akPred.GetValue(FV_BellyCapacity) >= 6.0)
		If(afTotalPreyCount/akPred.GetValue(FV_BellyCapacity) >= 1.0)
			NewCapacityPoints += 3
		ElseIf(afTotalPreyCount/akPred.GetValue(FV_BellyCapacity) >= 0.9)
			NewCapacityPoints += 2
		ElseIf(afTotalPreyCount/akPred.GetValue(FV_BellyCapacity) >= 0.75)
			NewCapacityPoints += 1
		EndIf
	EndIf
	If(NewCapacityPoints >= Math.Ceiling(Math.Pow(akPred.GetBaseValue(FV_BellyCapacity), 2.25)))
		While(NewCapacityPoints >= Math.Ceiling(Math.Pow(akPred.GetBaseValue(FV_BellyCapacity), 2.25)))
			NewCapacityPoints -= Math.Ceiling(Math.Pow(akPred.GetBaseValue(FV_BellyCapacity), 2.25))
			RankUpCompanions()
		EndWhile
		FV_CompanionCapacityPoints.SetValue(NewCapacityPoints)
	EndIf
EndFunction

Function RankUpCompanions()
	int i = 0
	While(i < ActiveCompanions.GetCount())
		Actor Companion = ActiveCompanions.GetAt(i) as Actor
		If(PlayerRef.GetBaseValue(FV_BellyCapacity) > Companion.GetBaseValue(FV_BellyCapacity))
			Companion.SetValue(FV_BellyCapacity, PlayerRef.GetBaseValue(FV_BellyCapacity))
		ElseIf(PlayerRef.GetValue(FV_PredLevel) == 0)
			Companion.SetValue(FV_BellyCapacity, Companion.GetBaseValue(FV_BellyCapacity)+1)
		EndIf
		debug.trace("FalloutVore:FV_PlayerCapacitySystemScript RankUpCompanions() Actor: " + Companion + " FV_BellyCapacity: " + Companion.GetBaseValue(FV_BellyCapacity))
		i += 1
	EndWhile
EndFunction

Function UpdateWhaleRank()
	Float OldCapacityPoints = Math.Ceiling(Math.Pow(PlayerRef.GetBaseValue(FV_BellyCapacity)-iWhaleRank, 2.25))
	If(PlayerRef.HasPerk(FV_WhaleBelly03))
		iWhaleRank = 3
	ElseIf(PlayerRef.HasPerk(FV_WhaleBelly02))
		iWhaleRank = 2
	ElseIf(PlayerRef.HasPerk(FV_WhaleBelly01))
		iWhaleRank = 1
	EndIf
	Float CapacityPoints = FV_PlayerCapacityPoints.GetValue()
	
	If(CapacityPoints >= Math.Ceiling(Math.Pow(PlayerRef.GetBaseValue(FV_BellyCapacity)-iWhaleRank, 2.25)))
		;levelup!
		CapacityPoints = RankUp(CapacityPoints)
		FV_PlayerCapacityPoints.SetValue(CapacityPoints)		
	EndIf
EndFunction