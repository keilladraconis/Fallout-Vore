Scriptname FalloutVore:FV_ColdSteelBellyScript Extends Quest

Armor Property FV_ColdSteelBellySound Auto
ActorValue Property FV_HasBloating Auto
ActorValue Property FV_DigestionStarted Auto
ActorValue Property FV_GiantBelly Auto
ActorValue Property FV_HumanPreyCount Auto
ActorValue Property FV_CurrentPrey Auto
FormList Property FV_ColdSteelArmorMaster Auto
GlobalVariable Property FV_MaxBellySize Auto
FalloutVore:FV_ConsumptionRegistryScript Property FV_ConsumptionRegistry Auto

string sCBBEGiantbelly = "Giant belly (coldsteelj)"
string sCBBEVorePreyBelly = "Vore prey belly"
float fGiantBellyMultiplier = 0.18
float fPreyBellyMultiplier = 0.25

Function SaveBelly(Actor akPred)
	;If(akPred.HasKeyword(ColdSteelBody) && akPred.GetValue(FV_CurrentPrey) as int == 0)
		Float BellySave = BodyGen.GetMorph(akPred, true, sCBBEGiantbelly, NONE)
		akPred.SetValue(FV_GiantBelly, BellySave)
		FV_ConsumptionRegistry.trace(self, "setting giant belly to " + akPred.GetValue(FV_GiantBelly))
	;EndIf
EndFunction

Bool Function ChangeColdSteelFullness(Actor akPred, Int newValue)
	Bool removeColdSteelBellySound = akPred.GetItemCount(FV_ColdSteelBellySound) > 0
	Bool predGender = GenderCheck(akPred)
	If (newValue > FV_MaxBellySize.GetValue())
		newValue = FV_MaxBellySize.GetValue() as int
	EndIf
	Int newValueTimerState = (((newValue as float)/2-1)*3+6) as int
	If(newValue == 0)
		bodygen.SetMorph(akPred, predGender, sCBBEGiantbelly, NONE, akPred.GetValue(FV_GiantBelly))
		bodygen.SetMorph(akPred, predGender, sCBBEVorePreyBelly, NONE, 0)
		bodygen.UpdateMorphs(akPred)
		If(removeColdSteelBellySound)
			akPred.UnequipItem(FV_ColdSteelBellySound, true, true)
			akPred.RemoveItem(FV_ColdSteelBellySound, 1, true, NONE)
		EndIf
	ElseIf(newValue == 1)
		If (akPred.GetValue(FV_GiantBelly) < 0.72)
			bodygen.SetMorph(akPred, predGender, sCBBEVorePreyBelly, NONE, 0)
			bodygen.SetMorph(akPred, predGender, sCBBEGiantbelly, NONE, 0.72)		
		EndIf
		akPred.SetValue(FV_DigestionStarted, 0)
		bodygen.UpdateMorphs(akPred)
		Else
		Float bellySize
		
		If(akPred.GetValue(FV_HumanPreyCount) >= akPred.GetValue(FV_CurrentPrey)/2)
			bodygen.SetMorph(akPred, predGender, sCBBEGiantbelly, NONE, 0)
			bellySize = 0.5 + ((newValue as float) - 2.0)/2.0*fPreyBellyMultiplier
			bodygen.SetMorph(akPred, predGender, sCBBEVorePreyBelly, NONE, bellySize)
		Else
			bodygen.SetMorph(akPred, predGender, sCBBEVorePreyBelly, NONE, 0)
			bellySize = (newValueTimerState as float) * fGiantBellyMultiplier
			If(akPred.GetValue(FV_GiantBelly) < bellySize)
				bodygen.SetMorph(akPred, predGender, sCBBEGiantbelly, NONE, bellySize)			
			EndIf
		EndIf
		akPred.SetValue(FV_DigestionStarted, 0)
		bodygen.UpdateMorphs(akPred)
	
	EndIf
	If(!removeColdSteelBellySound)
		akPred.EquipItem(FV_ColdSteelBellySound, true, true)
	EndIf
	
	Return true
EndFunction

Bool Function ChangeColdSteelDigestFullness(Actor akPred, Float TimerState)
	Bool bUpdateGiantBelly = false
	Bool predGender = GenderCheck(akPred)
	Float ChangePerCount = 0.01
	Float MaxTimerState = ((FV_MaxBellySize.GetValue()/2.0-1.0)*3.0+6.0)
	If(akPred.GetItemCount(FV_ColdSteelBellySound) == 0)
		akPred.EquipItem(FV_ColdSteelBellySound, true, true)
	EndIf
	If(akPred.GetValue(FV_HasBloating) as int == 1)
		ChangePerCount = -0.01						;When bloating occurs, belly will increase in size until next tick
	EndIf
	Float fUpdateGiantBelly = BodyGen.GetMorph(akPred, predGender, sCBBEGiantbelly, NONE)
	If(TimerState >= MaxTimerState && fUpdateGiantBelly < MaxTimerState * fGiantBellyMultiplier)	
		BodyGen.SetMorph(akPred, predGender, sCBBEVorePreyBelly, NONE, 0)
		BodyGen.SetMorph(akPred, predGender, sCBBEGiantBelly, NONE, MaxTimerState * fGiantBellyMultiplier)
		bUpdateGiantBelly = true
	ElseIf(TimerState < MaxTimerState && TimerState > 0)
		FV_ConsumptionRegistry.trace(self, "ChangeColdSteelDigestFullness() FV_GiantBelly: " + akPred.GetValue(FV_GiantBelly) + " TimerStateAndMult: " +TimerState*fGiantBellyMultiplier + " fUpdateGiantBelly: " + fUpdateGiantBelly + " MaxTimerState: " + MaxTimerState)
		If(akPred.GetValue(FV_DigestionStarted) as int == 0)
			;Float tempTimerState = data.TimerState as float	
			If(akPred.GetValue(FV_GiantBelly) as float < TimerState*fGiantBellyMultiplier)
				BodyGen.SetMorph(akPred, predGender, sCBBEGiantBelly, NONE, TimerState*fGiantBellyMultiplier)
			Else
				BodyGen.SetMorph(akPred, predGender, sCBBEGiantBelly, NONE, akPred.GetValue(FV_GiantBelly) as float)
			EndIf
			BodyGen.SetMorph(akPred, predGender, sCBBEVorePreyBelly, NONE, 0)
			akPred.SetValue(FV_DigestionStarted, 1)
			bUpdateGiantBelly = true
		Else
			If(fUpdateGiantBelly > akPred.GetValue(FV_GiantBelly) as float)
				fUpdateGiantBelly -= ChangePerCount
				BodyGen.SetMorph(akPred, predGender, sCBBEGiantBelly, NONE, fUpdateGiantBelly)
				bUpdateGiantBelly = true
			EndIf
		EndIf
	ElseIf(TimerState == 0)
		akPred.SetValue(FV_DigestionStarted, 0)
		BodyGen.SetMorph(akPred, predGender, sCBBEVorePreyBelly, NONE, 0)
		BodyGen.SetMorph(akPred, predGender, sCBBEGiantBelly, NONE, akPred.GetValue(FV_GiantBelly) as float)
		bUpdateGiantBelly = true
		If(akPred.GetItemCount(FV_ColdSteelBellySound) > 0)
			akPred.UnequipItem(FV_ColdSteelBellySound, true, true)
			akPred.RemoveItem(FV_ColdSteelBellySound, 1, true, NONE)
		EndIf
	EndIf
	If(bUpdateGiantBelly)
		BodyGen.UpdateMorphs(akPred)
	EndIf
	return true
EndFunction

Bool Function CheckItemForKeyword(Actor akPred)
	Actor:WornItem wornItem = akPred.GetWornItem(3)
	Int i = 0
	FormList ListSearch
	bool ItemSearch = false
	While(i < FV_ColdSteelArmorMaster.GetSize() && !ItemSearch)
		ListSearch = FV_ColdSteelArmorMaster.GetAt(i) as FormList
		ItemSearch = ListSearch.HasForm(wornItem.item)
		i += 1
	EndWhile
	FV_ConsumptionRegistry.trace(self, "akPred: " + akPred + " wornItem.item: " + wornItem.item + " ItemSearch: " + ItemSearch)
	return ItemSearch
EndFunction

Bool Function GenderCheck(Actor akPred)
	If(akPred.GetLeveledActorBase().GetSex() == 0)
		return false
	Else
		return true
	EndIf
EndFunction

Function ResetMorphs(Actor a)
	Bool predGender = GenderCheck(a)
	BodyGen.SetMorph(a, predGender, sCBBEGiantBelly, NONE, a.GetValue(FV_GiantBelly) as float)
	BodyGen.SetMorph(a, predGender, sCBBEVorePreyBelly, NONE, 0)
	BodyGen.UpdateMorphs(a)
EndFunction