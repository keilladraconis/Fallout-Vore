Scriptname FV_ContextVoreQuestScript extends Quest Conditional

Group ActorInfo
	ActorBase Property FV_ScatLootCorpse Auto
	ActorValue Property FV_ContextPreyAnnoyed Auto
	ActorValue Property FV_RegurgitateBool Auto
	Faction Property HasBeenCompanionFaction Auto
	Faction Property DisallowedCompanionFaction Auto
	GlobalVariable Property FV_ContextPredAnnoyed Auto
	Keyword Property ActorTypeHuman Auto
	ReferenceAlias Property BellyNPC Auto
	ReferenceAlias Property ContextNPC Auto
	ReferenceAlias Property PlayersPredAlias Auto
	ReferenceAlias Property FV_Prey Auto
EndGroup

Group Scenes
	GlobalVariable Property TimeScale Auto
	Float Property PerkDisplayReset = 0.0833 Auto
	Scene Property CompanionContextVoreDialogue Auto
	Scene Property HumanContextVoreDialogueN Auto
	Scene Property PlayerEscapedRevenge Auto
	Scene Property HumanContextBellyDialogue Auto
	Scene Property PlayerCompanionPredDialogue Auto
	Scene Property PlayerFriendlyPredDialogueN Auto
	Scene Property PlayerHostilePredDialogue Auto
	Scene Property PlayerTalksToPrey Auto
	GlobalVariable Property FV_ContextTimer Auto
	Keyword Property FV_AnnoyedNPCPredDialogue Auto
	Keyword Property FV_ContextAnnoyedDenial_Topic Auto
	Keyword Property FV_RevengeDialogue_Topic Auto
EndGroup

Group RandomContextChance
	GlobalVariable Property FV_ContextChance Auto
	Perk Property Intimidation01 Auto
	Perk Property Intimidation02 Auto
	Perk Property Intimidation03 Auto
	Perk Property BlackWidow01 Auto
	Perk Property BlackWidow02 Auto
	Perk Property BlackWidow03 Auto
	Perk Property LadyKiller01 Auto
	Perk Property LadyKiller02 Auto
	Perk Property LadyKiller03 Auto
EndGroup

Group Scripts
	FV_ConsumptionRegistryScript Property FV_ConsumptionRegistry Auto
EndGroup

bool sceneplaying = false conditional
float ContextTimer = 0.5
float RestartTime = 0.5
int currentArrayIndex = 0

Bool DisplayPerk = true conditional
Float ContextVoreSwallowedPlayerType = 0.0 conditional
;used for when the player is gulped.  0-swallow 1-anal 2-unbirth/cock

struct AliasInfo
	Actor Prey
	Actor Pred
	Int Index
	Bool isRevenge = false
EndStruct

AliasInfo[] ContextPreyArray

Event OnInit()
	RegisterForCustomEvent(FV_ConsumptionRegistry, "OnVomit")
	RegisterForCustomEvent(FV_ConsumptionRegistry, "OnDigest")	
EndEvent

Function StartDialogue(Actor akNPC)
	debug.trace("  ContextVoreScript StartDialogue() akNPC: " + akNPC)
	ContextNPC.ForceRefTo(akNPC)
	debug.trace("  ContextVoreScript StartDialogue() ContextNPC: " + ContextNPC)
	;since GetActorRef() never seems to want to work in a conditional
	;make sure player and alias aren't already in scene
	debug.trace("  ContextVoreScript StartDialogue() akNPC.IsInScene(): " + akNPC.IsInScene() + " Game.GetPlayer().IsInScene(): " + Game.GetPlayer().IsInScene() + " akNPC.HasKeyword(ActorTypeHuman): " +akNPC.HasKeyword(ActorTypeHuman) + " akNPC.IsInFaction(HasBeenCompanionFaction): " + akNPC.IsInFaction(HasBeenCompanionFaction))
	If akNPC != NONE && akNPC.GetValue(FV_ContextPreyAnnoyed) == 5
		akNPC.SayCustom(FV_ContextAnnoyedDenial_Topic)
	ElseIf akNPC != None && !akNPC.IsInScene() && akNPC.HasKeyword(ActorTypeHuman) && !akNPC.IsInFaction(HasBeenCompanionFaction)
		debug.trace(" ContextVoreScript StartDialogue() Begin Scene Human NPC")
		;block the ability for a new scene to start and start the dialogue
		DisplayPerk = false
		StartTimerGameTime(PerkDisplayReset/TimeScale.GetValue(), 1001)
		HumanContextVoreDialogueN.Start()
	ElseIf akNPC != None && !akNPC.IsInScene() && akNPC.IsInFaction(HasBeenCompanionFaction) && !akNPC.IsInFaction(DisallowedCompanionFaction)
		debug.trace(" ContextVoreScript StartDialogue() Begin Scene Companion")
		;block the ability for a new scene to start and start the dialogue
		DisplayPerk = false
		StartTimerGameTime(PerkDisplayReset/TimeScale.GetValue(), 1001)
		CompanionContextVoreDialogue.Start()
	Else
		debug.trace(" ContextVoreScript StartDialogue() Scene Bail")
		;clear these JIC
		;sceneplaying = false
		;ContextNPC.Clear()
	EndIf
EndFunction

Function PokeHostilePred(Actor akNPC)
	debug.trace("  ContextVoreScript PokeHostilePred() akNPC: " + akNPC + " DisplayPerk: " + DisplayPerk + " IsInScene(): " + akNPC.IsInScene() + " IsInCombat(): " + akNPC.IsInCombat())
	contextNPC.ForceRefTo(akNPC)
	if akNPC != NONE && !akNPC.IsInScene() && !akNPC.IsInCombat()
		Game.GetPlayer().TranslateToRef(akNPC, 25000)
		SuspendLethal(Game.GetPlayer())
		DisplayPerk = false
		StartTimerGameTime(PerkDisplayReset/TimeScale.GetValue(), 1001)
		PlayerHostilePredDialogue.Start()
	EndIf
EndFunction

Function PokeFriendlyPred(Actor akNPC)

	Actor PlayersPred = PlayersPredAlias.GetActorReference()
	debug.trace("  ContextVoreScript PokeFriendlyPred() akNPC: " + akNPC + " PlayersPred: " + PlayersPred)
	contextNPC.ForceRefTo(akNPC)
	
	If akNPC != NONE && !akNPC.IsInScene() && akNPC == PlayersPred && akNPC.GetValue(FV_ContextPreyAnnoyed) >= 4
		akNPC.SayCustom(FV_AnnoyedNPCPredDialogue)
	ElseIf akNPC != NONE && !akNPC.IsInScene() && akNPC == PlayersPred && !akNPC.IsInFaction(HasBeenCompanionFaction)
		Game.GetPlayer().TranslateToRef(akNPC, 25000)
		;sceneplaying = true
		DisplayPerk = false
		StartTimerGameTime(PerkDisplayReset/TimeScale.GetValue(), 1001)
		PlayerFriendlyPredDialogueN.Start()
	ElseIf akNPC != None && !akNPC.IsInScene() && akNPC == PlayersPred && akNPC.IsInFaction(HasBeenCompanionFaction) && !akNPC.IsInFaction(DisallowedCompanionFaction)
		Game.GetPlayer().TranslateToRef(akNPC, 25000)
		DisplayPerk = false
		StartTimerGameTime(PerkDisplayReset/TimeScale.GetValue(), 1001)
		PlayerCompanionPredDialogue.Start()
	EndIf
EndFunction

Function PokeFriendlyPrey()
	If ContextPreyArray.length > 0
		int i = Utility.RandomInt(0, ContextPreyArray.Length - 1)
		If i >=0 && !ContextPreyArray[i].Prey.IsInFaction(HasBeenCompanionFaction)
			CancelTimerGameTime(ContextPreyArray[i].Index)
			FV_Prey.ForceRefTo(ContextPreyArray[i].Prey)
			; Actor InvisibleNPC = Game.GetPlayer().PlaceActorAtMe(FV_ScatLootCorpse)
			; float fAngle
			; float fSin
			; float fCos
			; float fHeight
			; fAngle = Game.GetPlayer().GetAngleZ()
			; fSin = Math.sin(fAngle)
			; fCos = Math.cos(fAngle)
			; fHeight = Game.GetPlayer().GetPositionZ()
			; InvisibleNPC.moveto(Game.GetPlayer(), 60.0 * fSin, 60.0 * fCos, 0.0, False)
		
			; BellyNPC.ForceRefTo(InvisibleNPC)
			SetBellyNPCAlias(ContextPreyArray[i].Prey)
			PlayerTalksToPrey.Start()
		Else
			debug.trace("  ContextVoreScript: PokeFriendlyPrey() BUG ContextPreyArray returned negative index")
		EndIf
	Endif
EndFunction

Function SetBellyNPCAlias(Actor akPrey)
	FV_Prey.ForceRefTo(akPrey)
	Actor InvisibleNPC = Game.GetPlayer().PlaceActorAtMe(FV_ScatLootCorpse)
	float fAngle
	float fSin
	float fCos
	float fHeight
	fAngle = Game.GetPlayer().GetAngleZ()
	fSin = Math.sin(fAngle)
	fCos = Math.cos(fAngle)
	fHeight = Game.GetPlayer().GetPositionZ()
	InvisibleNPC.moveto(Game.GetPlayer(), 60.0 * fSin, 60.0 * fCos, 0.0, False)
		
	BellyNPC.ForceRefTo(InvisibleNPC)
EndFunction

Function RandomConvinceChance(bool Intimidate = false)
	int RandomChance = Utility.RandomInt()
	RandomChance += Game.GetPlayer().GetValue(Game.GetCharismaAV()) as int
	If Intimidate && Game.getPlayer().HasPerk(Intimidation03)
		RandomChance += 20
	ElseIf Intimidate && Game.getPlayer().HasPerk(Intimidation02)
		RandomChance += 15
	ElseIf Intimidate && Game.getPlayer().HasPerk(Intimidation01)
		RandomChance += 10
	EndIf
	Actor NPCTalk = ContextNPC.GetActorRef()
	If Game.GetPlayer().HasPerk(BlackWidow03) && NPCTalk.GetActorBase().GetSex() == 0
		RandomChance += 9
	ElseIf Game.GetPlayer().HasPerk(BlackWidow02) && NPCTalk.GetActorBase().GetSex() == 0
		RandomChance += 6
	ElseIf Game.GetPlayer().HasPerk(BlackWidow01) && NPCTalk.GetActorBase().GetSex() == 0
		RandomChance += 3
	ElseIf Game.GetPlayer().HasPerk(LadyKiller03) && NPCTalk.GetActorBase().GetSex() == 1
		RandomChance += 9
	ElseIf Game.GetPlayer().HasPerk(LadyKiller02) && NPCTalk.GetActorBase().GetSex() == 1
		RandomChance += 6
	ElseIf Game.GetPlayer().HasPerk(LadyKiller01) && NPCTalk.GetActorBase().GetSex() == 1
		RandomChance += 3
	EndIf
	debug.trace("ContextVoreScript RandomConvinceChance() RandomChance: " + RandomChance)
	FV_ContextChance.SetValue(RandomChance)
EndFunction

Function SetTypeOfVore(Float Type = 0.0)
	ContextVoreSwallowedPlayerType = Type
EndFunction

Function EndDialogue(bool storeNPC = false, bool EnablePerk = true)
	debug.trace(" ContextVoreScript EndDialogue() End Scene")
	;This is called at the end of a dialogue scene
	Actor ActorNPC = ContextNPC.GetActorReference()
	If storeNPC
		If ContextPreyArray == None
			ContextPreyArray = new AliasInfo[0]
			ContextPreyArray.clear()
		EndIf
		AliasInfo TempActor = new AliasInfo
		TempActor.Prey = ActorNPC
		TempActor.Index = GetNextIndex()
		ContextPreyArray.Add(TempActor)
		StartTimerGameTime(FV_ContextTimer.GetValue(), TempActor.Index)
	EndIf
	DisplayPerk = EnablePerk
	If !DisplayPerk
		;StartTimerGameTime(PerkDisplayReset, 1001)
	EndIf
	;sceneplaying = false
	
	ContextNPC.Clear()
EndFunction

Function FinishedContext(Actor akPrey, bool removePrey = false, bool TurnLethal = false, bool RestartTimer = false)
	If akPrey != None
		int i = ContextPreyArray.findstruct("prey", akPrey)
		debug.trace("ContextVoreScript FinishedContext() akPrey: " + akPrey + ", removePrey: " + removePrey + ", TurnLethal: " + TurnLethal + ", RestartTimer: " + RestartTimer + ", i: " + i)
		If i >= 0 && removePrey
			ContextPreyArray.Remove(i)
		EndIf
		if (akPrey == FV_Prey.GetActorReference() || akPrey == Game.GetPlayer())&& TurnLethal
			GoneLethal(akPrey)
		EndIf
		If akPrey == FV_Prey.GetActorReference() && removePrey
			FV_Prey.clear()
		EndIf
		If akPrey == FV_Prey.GetActorReference() && RestartTimer
			StartTimerGameTime(FV_ContextTimer.GetValue(), ContextPreyArray[i].Index)
		EndIf
		Actor ActorToDelete = BellyNPC.GetActorReference()
		BellyNPC.clear()
		If ActorToDelete != NONE
			ActorToDelete.Delete()
		EndIf
		FV_Prey.Clear()
	EndIf
EndFunction

Function RevengeTimer()
	If ContextPreyArray == None
		ContextPreyArray = new AliasInfo[0]
		ContextPreyArray.clear()
	EndIf
	AliasInfo TempActor = new AliasInfo
	TempActor.Prey = Game.GetPlayer()
	TempActor.Pred = ContextNPC.GetActorReference()
	TempActor.Index = GetNextIndex()
	TempActor.isRevenge = true
	ContextPreyArray.Add(TempActor)
	StartTimerGameTime(0.25, TempActor.Index)		;15 minute game timer before pred pulls revenge
EndFunction

Function NPCDeclines(Actor akPrey)
	If ContextPreyArray == None
		ContextPreyArray = new AliasInfo[0]
		ContextPreyArray.clear()
	EndIf
	AliasInfo TempActor = new AliasInfo
	TempActor.Prey = akPrey
	TempActor.Index = GetNextIndex()
	ContextPreyArray.Add(TempActor)
	StartTimerGameTime(24.0, TempActor.Index)
EndFunction

Function GoneLethal(Actor akPrey)
	If akPrey != Game.GetPlayer()		;don't add player to array and start timer.  Meant for NPC only
		int i = ContextPreyArray.findstruct("prey", akPrey)
		int tempIndex = -1
		if i >= 0
			tempIndex = ContextPreyArray[i].Index
		Else
			AliasInfo TempActor = new AliasInfo
			TempActor.Prey = akPrey
			TempActor.Index = GetNextIndex()
			tempIndex = TempActor.Index
			If ContextPreyArray == NONE
				ContextPreyArray = new AliasInfo[0]
				ContextPreyArray.clear()
			EndIf
			ContextPreyArray.Add(TempActor)
		Endif
		akPrey.SetValue(FV_ContextPreyAnnoyed, 4)
		StartTimerGameTime(48.0, tempIndex)
	EndIf
	FV_ConsumptionRegistry.MakeLethal(akPrey)
EndFunction

Function ReleasePlayer(Actor akPred)
	akPred.SetValue(FV_RegurgitateBool, 1)
EndFunction

Function DigestPlayer()
	;Set player health to 1 so the next damage tick will certainly "kill" them
	Float HealthRemaining = Game.GetPlayer().GetValue(Game.GetHealthAV())
	Game.GetPlayer().DamageValue(Game.GetHealthAV(), HealthRemaining-1)
	GoneLethal(Game.GetPlayer())
EndFunction

Function SuspendLethal(Actor akPrey)
	FV_ConsumptionRegistry.MakeNonLethal(akPrey)
EndFunction

int Function GetNextIndex()
	currentArrayIndex += 1
	If currentArrayIndex > 999
		currentArrayIndex = 0
	EndIf
	return currentArrayIndex
EndFunction

Event FV_ConsumptionRegistryScript.OnDigest(FV_ConsumptionRegistryScript akSend, Var[] akArgs)
	If akArgs[1] as int == 0
		CheckAndDelete(akArgs[2] as actor)
	EndIf
EndEvent

Event FV_ConsumptionRegistryScript.OnVomit(FV_ConsumptionRegistryScript akSend, Var[] akArgs)
	Actor akPred = akArgs[0] as Actor
	Actor akPrey = akArgs[1] as Actor
	If akPrey != NONE
		If akPrey == Game.Getplayer() && akPred.GetValue(FV_ContextPreyAnnoyed) == 5 || FV_ContextPredAnnoyed.GetValue() >= 2
			ContextNPC.ForceRefTo(akPred)
			PlayerEscapedRevenge.Start()
		ElseIf akPrey.GetValue(FV_ContextPreyAnnoyed) == 4
			;Do nothing
		ElseIf akPrey.Getvalue(FV_ContextPreyAnnoyed) < 3 && akPrey.GetValue(FV_ContextPreyAnnoyed) > 0
			akPrey.SetValue(FV_ContextPreyAnnoyed, 0)
			CheckAndDelete(akPrey)
		ElseIf akPrey == Game.GetPlayer()
			DisplayPerk = true
			EndDialogue()
		Else
			CheckAndDelete(akPrey)
		EndIf
		If akPrey == Game.GetPlayer() && FV_ContextPredAnnoyed.GetValue() >= 2
			FV_ContextPredAnnoyed.SetValue(0)
		EndIf
		PlayersPredAlias.Clear()
	Endif
EndEvent

Function CheckAndDelete(actor akPrey)
	If(akPrey != None)
		int i = ContextPreyArray.findstruct("prey", akPrey)
		If i >= 0
			;debug.notification("Stopped prey timer for context vore")
			CancelTimerGameTime(ContextPreyArray[i].index)
			ContextPreyArray.Remove(i)
		EndIf
	EndIf
EndFunction

Event OnTimerGameTime(int aiTimerID)
	
	int i = ContextPreyArray.FindStruct("Index", aiTimerID) ;conditionalize trace to prevent errors in log if index not found
	If(i > -1)
		debug.trace("ContextVore OnTimerGameTime() ContextPreyArray[i].Index: " + ContextPreyArray[i].Index + " aiTimerID: " + aiTimerID + " ContextPreyArray[i].Prey: " + ContextPreyArray[i].Prey)
	Else
		debug.trace("ContextVore OnTimerGameTime() aiTimerID: " + aiTimerID)
	Endif
	If aiTimerID == 1001
		DisplayPerk = true
	ElseIf i >=0 && ContextPreyArray[i].Prey.IsDead()
		debug.trace("Context Vore - prey has died before timer expired.  Removing from data storage.")
		ContextPreyArray.Remove(i)
	ElseIf i >= 0 && ContextPreyArray[i].isRevenge && ContextPreyArray[i].Prey == Game.GetPlayer()
		debug.trace("Context Vore - a pred NEVER forgets.  The player will burn! pred: " + ContextPreyArray[i].Pred)
		ContextPreyArray[i].Pred.SayCustom(FV_RevengeDialogue_Topic)
		ContextPreyArray[i].Pred.SetValue(FV_ContextPreyAnnoyed, 5)
		Utility.Wait(5.0)
		FV_ConsumptionRegistry.MakeLethal(Game.GetPlayer())
		ContextPreyArray.Remove(i)
	ElseIf i >= 0 && ContextPreyArray[i].Prey.GetValue(FV_ContextPreyAnnoyed) >= 4
		debug.trace("Context Vore - Downgrade Prey Annoyed actor: " + ContextPreyArray[i].Prey + " from " + ContextPreyArray[i].Prey.GetValue(FV_ContextPreyAnnoyed) + " to 3")
		ContextPreyArray[i].Prey.SetValue(FV_ContextPreyAnnoyed, 3)
		StartTimerGameTime(24.0, aiTimerID)
	ElseIf i >= 0 && ContextPreyArray[i].Prey.GetValue(FV_ContextPreyAnnoyed) == 3
		debug.trace("Context Vore - Reset Prey Annoyed actor: " + ContextPreyArray[i].Prey + " Prey.GetValue(FV_ContextPreyAnnoyed): " + ContextPreyArray[i].Prey.GetValue(FV_ContextPreyAnnoyed))
		ContextPreyArray[i].Prey.SetValue(FV_ContextPreyAnnoyed, 0)
		CheckAndDelete(ContextPreyArray[i].Prey)
	Elseif i >= 0 && !Game.GetPlayer().IsInScene()
		;Actor TempPrey = ContextPreyArray[i].Prey
		FV_Prey.ForceRefTo(ContextPreyArray[i].Prey)
		; Actor InvisibleNPC = Game.GetPlayer().PlaceActorAtMe(FV_ScatLootCorpse)
		; float fAngle
		; float fSin
		; float fCos
		; float fHeight
		; fAngle = Game.GetPlayer().GetAngleZ()
		; fSin = Math.sin(fAngle)
		; fCos = Math.cos(fAngle)
		; fHeight = Game.GetPlayer().GetPositionZ()
		; InvisibleNPC.moveto(Game.GetPlayer(), 60.0 * fSin, 60.0 * fCos, 0.0, False)
		
		; BellyNPC.ForceRefTo(InvisibleNPC)
		SetBellyNPCAlias(ContextPreyArray[i].Prey)
		HumanContextBellyDialogue.Start()
	ElseIf i >= 0 && Game.GetPlayer().IsInScene()
		debug.trace("Context Vore - Player in scene.  Restarting time for " + aiTimerID + " for an additional " + FV_ContextTimer.GetValue()/2 + " in game hours")
		starttimergametime(FV_ContextTimer.GetValue()/2, aiTimerID)
	Else
		debug.trace("Context Vore BUG - i: " + i + " aiTimerID: " + aiTimerID)
	EndIf
	
EndEvent

Function PlaySpeechAnim()
	UI.Invoke("DialogueMenu", "root1.Menu_mc.PlaySpeechChallengeAnim")
EndFunction

Function DebugReset()
	DisplayPerk = true
	ContextNPC.clear()
	BellyNPC.clear()
	FV_Prey.clear()
	CancelTimerGameTime(1001)
	CancelTimerGameTime(1000)
	FV_ContextPredAnnoyed.SetValue(0)
	int i = ContextPreyArray.Length
	while i > -1
		CancelTimerGameTime(ContextPreyArray[i].Index)
		If ContextPreyArray[i].Prey != NONE
			ContextPreyArray[i].Pred.SetValue(FV_ContextPreyAnnoyed, 0)
		EndIf
		ContextPreyArray.Remove(i)
		i -= 1
	EndWhile
	debug.trace("Context Vore DebugReset() CompleteAllObjectives")
		
EndFunction