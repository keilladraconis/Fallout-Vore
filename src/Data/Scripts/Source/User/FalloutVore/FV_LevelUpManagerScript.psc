Scriptname FalloutVore:FV_LevelUpManagerScript extends Quest

; TODO: Delete this 
import FalloutVore:FV_VoreUtilityScript

Group Actor_Values
	ActorValue Property FV_HasHadNukaAcid Auto
	ActorValue Property FV_PredLevel Auto
	ActorValue Property FV_PreyLevel Auto
	ActorValue Property FV_VoreXP Auto
	ActorValue Property FV_VoreExpBonus Auto
EndGroup

Group RefAlias
	Faction Property HasBeenCompanionFaction Auto
	RefCollectionAlias Property ActiveCompanions const auto
EndGroup

Group Globals
	GlobalVariable Property FV_PerkPoints Auto
	GlobalVariable Property FV_VoreLevelPoints Auto
	GlobalVariable Property FV_CompanionPredLevel Auto
	GlobalVariable Property FV_CompanionPreyLevel Auto
	GlobalVariable Property FV_CompanionVoreXP Auto
EndGroup

Group Messages
	Message Property FV_GainedAPerkMessage Auto
EndGroup

Group StatTraits
	Perk Property FV_PerkPredatorBasic Auto
	int Property BasicLevel = 1 Auto
	Perk Property FV_PerkPredatorMedium Auto
	int Property MediumLevel = 10 Auto
	Perk Property FV_PerkPredatorTough Auto
	int Property ToughLevel = 20 Auto
	Perk Property FV_PerkPredatorAdvanced Auto
	int Property AdvancedLevel = 35 Auto
	Perk Property FV_PerkPredatorEpic Auto
	int Property EpicLevel = 50 Auto
EndGroup

Group Potions
	Spell Property FV_spNPC_PerkCheck Auto
EndGroup

Group Quests
	FalloutVore:FV_ConsumptionRegistryScript Property FV_ConsumptionRegistry Auto
	FalloutVore:FV_VoreHudScript Property FV_VoreHud Auto
	FollowersScript Property Followers Auto
EndGroup

string MenuName = "LevelUpVore"
string MenuPath = "LevelUpVore"
string rootPath = "root1"

Actor PlayerRef
bool EditLock = false

Event OnInit()
	PlayerRef = Game.GetPlayer()
	RegisterLevelUpVoreMenu()
	RegisterEvents()
EndEvent

Event Actor.OnPlayerLoadGame(Actor akSender)
	RegisterLevelUpVoreMenu()
	PlayerRef = Game.GetPlayer()								;REMOVE THIS BEFORE RELEASE
	; RegisterForCustomEvent(FV_ConsumptionRegistry, "OnDigest")	;REMOVE THIS BEFORE RELEASE
EndEvent

; Event FalloutVore:FV_ConsumptionRegistryScript.OnDigest(FalloutVore:FV_ConsumptionRegistryScript akSender, Var[] akArgs)
; 	int eventType = akArgs[1] as int
; 	if(eventType == 0)
; 		GetEditLock()
; 		Actor Pred = akArgs[0] as Actor
; 		Actor Prey = akArgs[2] as Actor
; 		CalculateVoreXP(Pred, Prey)
; 		EditLock = false
; 	EndIf
; EndEvent

Event FollowersScript.CompanionChange(FollowersScript akSend, Var[] akArgs)			;akArgs[0] => actor companion, akArgs[1] => bool iscompanion
	LevelActor(akArgs[0] as Actor)
EndEvent

Function OnPlayerChooseLevel()
	debug.trace("received OnPlayerChooseLevel event")
	CheckTraits(PlayerRef)
	CheckGlobal(PlayerRef)
	LevelActor(PlayerRef)
EndFunction

;Event FalloutVore:FV_ConsumptionRegistryScript.VoreLevelUp(FalloutVore:FV_ConsumptionRegistryScript akSender, Var[] akArgs)			;akArgs[0] = CurrentPred
;	Actor ActorToLevel = akArgs[0] as actor
;	FV_ConsumptionRegistry.trace(self, "Received level up event for " + ActorToLevel)
;	CheckTraits(ActorToLevel)
;	CheckGlobal(ActorToLevel)
;	LevelActor(ActorToLevel)
;EndEvent

Function RegisterEvents()
	RegisterForRemoteEvent(PlayerRef, "OnPlayerLoadGame")
	RegisterForCustomEvent(Followers, "CompanionChange")
	;RegisterForCustomEvent(FV_ConsumptionRegistry, "VoreLevelUp")
	; RegisterForCustomEvent(FV_ConsumptionRegistry, "OnDigest")
	RegisterForExternalEvent("onPlayerLevelChoice", "OnPlayerChooseLevel")
EndFunction

Function RegisterLevelUpVoreMenu()
	if(!UI.IsMenuRegistered(MenuName))
		UI:MenuData data = new UI:MenuData
		data.MenuFlags = 0x4006DD	;this is a bitwise calculation of 0x01 | 0x04 | 0x08 | 0x10 | 0x40 | 0x80 | 0x200 | 0x400 | 0x400000 = 0x4006DD
		;data.ExtendedFlags = FlagNone
		data.Depth = 0x09
		UI.RegisterCustomMenu(MenuName, MenuPath, rootPath, data)
	EndIf
EndFunction

Function CalculateVoreXP(Actor akPred, Actor akPrey)
	Trace(self, "CalculateVoreXP() akPred: " + akPred + " akPrey: " + akPrey)
	Actor PredToLevel = akPred
	float VoreLevel = akPred.GetValue(FV_PredLevel) + akPred.GetValue(FV_PreyLevel) + 13.0	;modify by 13 to bring base preyelevel to old 14 base
	If(akPred == PlayerRef || akPred.IsInFaction(HasBeenCompanionFaction))
		VoreLevel = PlayerRef.GetValue(FV_PredLevel) + PlayerRef.GetValue(FV_PreyLevel) + 13.0 + FV_VoreLevelPoints.GetValue()
	EndIf
	Float XPGain = Math.Ceiling(VoreLevel/3.0)*(1.0-2.0*((akPred.GetLevel() as float)-(akPrey.GetLevel() as float))/100)
	
	;set the minimum XP a pred can earn to be 1/4 of their level
	If(XPGain < Math.Ceiling(VoreLevel/4.0))
		XPGain = Math.Ceiling(VoreLevel/4.0)
	EndIf
	
	XPGain = Math.Ceiling(XPGain*(akPred.GetValue(FV_VoreExpBonus)))
	
	;Help all NPCs.  They level so slow ;_;
	If((akPred.IsInFaction(HasBeenCompanionFaction) && PlayerRef.GetValue(FV_HasHadNukaAcid) == 0) || (!akPred.IsInFaction(HasBeenCompanionFaction) && akPred != PlayerRef))
		XPGain = Math.Ceiling(XPGain*1.1)
	EndIf
	CheckLevelUp(XPGain, akPred, VoreLevel)
EndFunction

Function CheckLevelUp(Float afXPGain, Actor akActorToLevel, float akVoreLevel)
	Actor ActorToLevel = akActorToLevel
	Float OldLevel
	Float OldXP
	Float OldLevelReq
	Float newXPGain = afXPGain
	
	If(akActorToLevel.IsInFaction(HasBeenCompanionFaction)) ;&& PlayerRef.GetValue(FV_HasHadNukaAcid) == 1)
		;We want to add some XP to the player instead of the companion.  Companion will level up with player once playerlevels
		newXPGain = Math.Ceiling(afXPGain * 0.25)
		ActorToLevel = PlayerRef		
	EndIf
	
	OldLevel = akVoreLevel
	OldXP = ActorToLevel.GetValue(FV_VoreXP)
	ActorToLevel.ModValue(FV_VoreXP, newXPGain)
	;If(akActorToLevel == PlayerRef)
		;FV_VoreLevelPoints.SetValue(FV_VoreLevelPoints + 1)
	float LevelReq = Math.Ceiling(Math.Pow(akVoreLevel/2, 1.7))
	OldLevelReq = LevelReq
	
	int levelUp = 0
	While(ActorToLevel.GetValue(FV_VoreXP) >= LevelReq) ;old comparison was >= ActorToLevel.GetValue(FV_VoreLevel)*6
		ActorToLevel.ModValue(FV_VoreXP, -1*LevelReq)
		
		;increase the player's level point global IF they're a pred.  Else if the NPC is a pred, increase their pred level.  Finally, if the player or NPC isn't a pred, increae their prey level
		If(ActorToLevel == PlayerRef && ActorToLevel.GetValue(FV_PredLevel) > 0)
			FV_VoreLevelPoints.SetValue(FV_VoreLevelPoints.GetValue() + 1.0)
		ElseIf(ActorToLevel != PlayerRef && ActorToLevel.GetValue(FV_PredLevel) > 0)
			ActorToLevel.ModValue(FV_PredLevel, 1)
		Else
			ActorToLevel.ModValue(FV_PreyLevel, 1)
		EndIf
		akVoreLevel = akVoreLevel + 1.0										;Increment by one so we can recalculate exp required for the next level
		levelUp = 1
		LevelReq = Math.Ceiling(Math.Pow(akVoreLevel/2, 1.7))
		If(ActorToLevel == PlayerRef)

			FV_GainedAPerkMessage.Show()
			FV_PerkPoints.Mod(1)

			Var[] kArgs = new Var[1]
			kArgs[0] = PlayerRef
			;SendCustomEvent("VoreLevelUp", kArgs)		;Send event to level up all recruited companions DISABLING FOR NOW AS THE PLAYER WILL BE MANUALLY SELECTING LEVELS AND LEVEL UP SHOULD BE HANDLED THEN
		ElseIf(!ActorToLevel.IsInfaction(HasBeenCompanionFaction) || PlayerRef.GetValue(FV_HasHadNukaAcid) == 0)
			LevelUpNPC(ActorToLevel)
		EndIf
	EndWhile
	If(ActorToLevel == PlayerRef)
		FV_VoreHud.UpdatePlayerXP((OldXP/OldLevelReq * 100) as int, (ActorToLevel.GetValue(FV_VoreXP)/LevelReq * 100) as int, newXPGain as int, levelUp as int)
	Endif
	Trace(self, "Actor " + ActorToLevel + "Previous XP: " + OldXP + " newXPGain: " + newXPGain + " New XP: " + ActorToLevel.GetValue(FV_VoreXP) + " Old Level: " + OldLevel + " NewLevel: " + akVoreLevel)
	
EndFunction

Function LevelUpNPC(Actor akPred, Int levelUp = -1)
	Var[] kArgs = new Var[1]
	kArgs[0] = akPred
	If(levelUp > -1)
		If(akPred.GetValue(Fv_PredLevel) > 0)
			akPred.ModValue(FV_PredLevel, levelUp)
		Else
			akPred.ModValue(FV_PreyLevel, levelUp)
		EndIf
	EndIf
	Trace(self, "Received level up for " + akPred)
	CheckTraits(akPred)
	CheckGlobal(akPred)
	LevelActor(akPred)
	
EndFunction

Function LevelUpPlayer_int(Int levelup = 1, Bool SuppressLevelMessage = false, Bool SuppressPerkMessage = false)
	If(levelup > 0)
		int OldLevel = (PlayerRef.GetValue(FV_PredLevel) + PlayerRef.GetValue(FV_PreyLevel) + FV_VoreLevelPoints.GetValue()) as int
		If(PlayerRef.GetValue(FV_PredLevel) > 0)
			FV_VoreLevelPoints.SetValue(FV_VoreLevelPoints.GetValue() + levelup)
		Else
			PlayerRef.ModValue(FV_PreyLevel, levelup as float)
		EndIf
		int NewLevel = (PlayerRef.GetValue(FV_PredLevel) + PlayerRef.GetValue(FV_PreyLevel) + FV_VoreLevelPoints.GetValue()) as int
		int i = 0
		While(NewLevel > OldLevel)
			;If((NewLevel% 3) == 0)
				FV_PerkPoints.Mod(1)
				i += 1
			;EndIf
			NewLevel -= 1
		EndWhile
		If(!SuppressLevelMessage)
			debug.notification("You have added " + levelup + " levels(s).")
		EndIf
		If(i > 0 && !SuppressPerkMessage)
			debug.notification("You have gained " + i + " perk point(s).")
		EndIf
	Endif
EndFunction

Function CheckTraits(Actor akActorToLevel)
	If(akActorToLevel.GetValue(FV_PredLevel) >= EpicLevel && !akActorToLevel.HasPerk(FV_PerkPredatorAdvanced))
		akActorToLevel.AddPerk(FV_PerkPredatorEpic)
	ElseIf(akActorToLevel.GetValue(FV_PredLevel) >= AdvancedLevel && akActorToLevel.GetValue(FV_PredLevel) < EpicLevel && !akActorToLevel.HasPerk(FV_PerkPredatorTough))
		akActorToLevel.AddPerk(FV_PerkPredatorAdvanced)
	ElseIf(akActorToLevel.GetValue(FV_PredLevel) >= ToughLevel && akActorToLevel.GetValue(FV_PredLevel) < AdvancedLevel && !akActorToLevel.HasPerk(FV_PerkPredatorMedium))
		akActorToLevel.AddPerk(FV_PerkPredatorTough)
	ElseIf(akActorToLevel.GetValue(FV_PredLevel) >= MediumLevel && akActorToLevel.GetValue(FV_PredLevel) < ToughLevel && !akActorToLevel.HasPerk(FV_PerkPredatorBasic))
		akActorToLevel.AddPerk(FV_PerkPredatorMedium)
	ElseIf(akActorToLevel.GetValue(FV_PredLevel) >= BasicLevel && akActorToLevel.GetValue(FV_PredLevel) < MediumLevel && !akActorToLevel.HasPerk(FV_PerkPredatorBasic))
		akActorToLevel.AddPerk(FV_PerkPredatorBasic)
	EndIf
EndFunction

Function CheckGlobal(Actor ActorToLevel)
	If(ActorToLevel == PlayerRef && PlayerRef.GetValue(FV_HasHadNukaAcid) == 1)
		float PlayerPredLevel = PlayerRef.GetValue(FV_PredLevel)
		float PlayerPreyLevel = PlayerRef.GetValue(FV_PreyLevel)
		FV_CompanionVoreXP.SetValue(PlayerRef.GetValue(FV_VoreXP))
		If(PlayerPredLevel > FV_CompanionPredLevel.GetValue())
			FV_CompanionPredLevel.SetValue(PlayerPredLevel)
		EndIf
		If(PlayerPreyLevel > FV_CompanionPreyLevel.GetValue())
			FV_CompanionPreyLevel.SetValue(PlayerPreyLevel)
		EndIf
	ElseIf(ActiveCompanions.Find(ActorToLevel) >= 0 && PlayerRef.GetValue(FV_HasHadNukaAcid) == 0)
		Int i = 0
		FV_CompanionVoreXP.SetValue(ActorToLevel.GetValue(FV_VoreXP))
		While(i < ActiveCompanions.GetCount())
			If((ActiveCompanions.GetAt(i) as Actor).GetValue(FV_PredLevel) > FV_CompanionPredLevel.GetValue())
				FV_CompanionPredLevel.SetValue((ActiveCompanions.GetAt(i) as Actor).GetValue(FV_PredLevel))
			EndIf
			If((ActiveCompanions.GetAt(i) as Actor).GetValue(FV_PreyLevel) > FV_CompanionPreyLevel.GetValue())
				FV_CompanionPreyLevel.SetValue((ActiveCompanions.GetAt(i) as Actor).GetValue(FV_PreyLevel))
			EndIf
			i += 1
		EndWhile
	EndIf
EndFunction

Function LevelActor(Actor ActorToLevel)
	
	If(ActorToLevel == PlayerRef || ActiveCompanions.Find(ActorToLevel) >= 0)
		Int i = 0
		Actor Companion
		While(i < ActiveCompanions.GetCount())
			Companion = ActiveCompanions.GetAt(i) as Actor
			If(Companion.Is3DLoaded() && Companion.IsInFaction(HasBeenCompanionFaction))
				If(Companion.GetValue(FV_PredLevel) > 0 && FV_CompanionPredLevel.GetValue() > Companion.GetValue(FV_PredLevel))
					Companion.ModValue(FV_PredLevel, FV_CompanionPredLevel.GetValue() - Companion.GetValue(FV_PredLevel))
					Companion.ModValue(FV_VoreXP, FV_CompanionVoreXP.GetValue() - Companion.GetValue(FV_VoreXP))
					FV_spNPC_PerkCheck.Cast(PlayerRef, Companion)
					CheckTraits(Companion)
				ElseIf(FV_CompanionPreyLevel.GetValue() > Companion.GetValue(FV_PreyLevel))
					Companion.ModValue(FV_PreyLevel, FV_CompanionPreyLevel.GetValue() - Companion.GetValue(FV_PreyLevel))
					Companion.ModValue(FV_VoreXP, FV_CompanionVoreXP.GetValue() - Companion.GetValue(FV_VoreXP))
					FV_spNPC_PerkCheck.Cast(PlayerRef, Companion)
				EndIf
			EndIf
			i += 1
		EndWhile		
	ElseIf(ActiveCompanions.Find(ActorToLevel) < 0)
		FV_spNPC_PerkCheck.Cast(ActorToLevel, ActorToLevel)
		CheckTraits(ActorToLevel)
	EndIf
	Trace(self, "Finished level up for " + ActorToLevel)
EndFunction

int iEditLockCount = 1
Function GetEditLock()
	iEditLockCount += 1
	While (EditLock)
		Utility.Wait(0.1 * iEditLockCount)
	EndWhile
	EditLock = true
	iEditLockCount -= 1
EndFunction