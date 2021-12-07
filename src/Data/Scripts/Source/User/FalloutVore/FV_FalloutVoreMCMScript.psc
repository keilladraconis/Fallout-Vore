Scriptname FalloutVore:FV_FalloutVoreMCMScript extends Quest

import FalloutVore:FV_VoreUtilityScript

ReferenceAlias Property CurrentCompanion Auto Const

Group ActorValues
	;ActorValue Property FV_BellyCapacity Auto
	ActorValue Property FV_VoreLevel Auto
	ActorValue Property Strength Auto
	ActorValue Property Perception Auto
	ActorValue Property Endurance Auto
	ActorValue Property Charisma Auto
	ActorValue Property Intelligence Auto
	ActorValue Property Agility Auto
	ActorValue Property Luck Auto
	ActorValue Property FV_HasHadNukaAcid Auto
	ActorValue Property FV_PredLevel Auto
	ActorValue Property FV_SwallowStrength Auto
EndGroup

Group Globals
	GlobalVariable Property FV_PlayerNeedsNuka Auto
	GlobalVariable Property FV_ClothesripChance Auto
	GlobalVariable Property FV_ColdSteelEnabled Auto
	GlobalVariable Property FV_HudDebugEnabled Auto
	GlobalVariable Property FV_ManualDigestBool Auto
	GlobalVariable Property FV_ManualPreyContext Auto
	GlobalVariable Property FV_MaxCapacity Auto
	GlobalVariable Property FV_PerkPoints Auto
	GlobalVariable Property FV_ScatBool Auto
	GlobalVariable Property FV_GrowlBool Auto
	GlobalVariable Property FV_ScatEnabled Auto
	GlobalVariable Property FV_StruggleControlType Auto
	;GlobalVariable Property FV_StatBool Auto
	GlobalVariable Property FV_TwoPreyEnabled Auto
	GlobalVariable Property FV_VomitBool Auto
	GlobalVariable Property FV_VoreCoreToggle Auto
	GlobalVariable Property FV_FemaleVoreEnabled Auto
	GlobalVariable Property FV_MaleVoreEnabled Auto
	GlobalVariable Property FV_VoreRaiderEnabled Auto
	GlobalVariable Property FV_VoreRoyaltyEnabled Auto
EndGroup

Group Perks
	Perk Property FV_ContextVorePerk Auto
EndGroup

Group Potions
	;Potion Property CompanionScatPotion Auto
	Potion Property FV_DigestPotion Auto
	Potion Property FV_RegurgitatePotion Auto
	Potion Property FV_ScatPotion Auto
	;Potion Property FV_VoreStatPotion Auto
	Potion Property FV_ContextPreyPotion Auto
	Potion Property FV_EvoPredatorBasicInjector Auto
	Potion Property FV_PrimeGrowl Auto
EndGroup

Group Scripts
	FalloutVore:FV_ConsumptionRegistryScript Property FV_ConsumptionRegistry Auto
	FalloutVore:FV_LevelUpManagerScript Property FV_LevelUpManager Auto
	FalloutVore:FV_VoreHudScript Property FV_VoreHud Auto
EndGroup

Float fCameraVomitMin = 100.0
Float fCameraSwallowMin = 10.0

String sModName = "FalloutVore"

Bool Property bClothesripChance Auto Hidden
Bool Property bFOVoreEnabled Auto Hidden
Bool Property bContextVore Auto Hidden
;Bool Property bControlGroup5 Auto Hidden
Bool Property bControlGroup6 Auto Hidden
Bool Property bCrouchToShit Auto Hidden

Int Property iScatType = 0 Auto Hidden

Actor PlayerRef
Bool Update301 = false

Event OnInit()
	PlayerRef = Game.GetPlayer()
	RegisterForRemoteEvent(Game.GetPlayer(), "OnPlayerLoadGame")
	EventRegistration()
	SyncProperties()
	EnableOnStart()
	RestoreCameraProperties()
	Update301 = true
EndEvent

Event Actor.OnPlayerLoadGame(Actor akSender)
	EventRegistration()
	SyncProperties()
	If(!Update301)
		If(FV_LevelUpManager == NONE)
			FV_LevelUpManager = Game.GetFormFromFile(0x0001101A, "FalloutVore.esp") as FalloutVore:FV_LevelUpManagerScript
		EndIf
		Update301 = true
	EndIf
	;RestoreCameraProperties()
EndEvent

Function EnableOnStart()
	bClothesripChance = MCM.GetModSettingBool(sModName, "bClothesRipEnabledOnStart:FalloutVoreMain")
	If(bClothesripChance)
		FV_ClothesripChance.SetValue(50)
		Trace(self, "Clothes ripping turned on")
	Else
		FV_ClothesripChance.SetValue(0)
		Trace(self, "Clothes ripping turned off")
	EndIf
	FV_ScatEnabled.SetValue(MCM.GetModSettingBool(sModName, "bScatEnabledOnStart:FalloutVoreMain") as float)
	FV_FemaleVoreEnabled.SetValue(MCM.GetModSettingBool(sModName, "bFemaleVoreEnabledOnStart:FalloutVoreMain") as float)
	FV_MaleVoreEnabled.SetValue(MCM.GetModSettingBool(sModName, "bMaleVoreEnabledOnStart:FalloutVoreMain") as float)
	FV_ColdSteelEnabled.SetValue(MCM.GetModSettingBool(sModName, "bColdsteelEnabledOnStart:FalloutVoreMain") as float)
	FV_VoreRaiderEnabled.SetValue(MCM.GetModSettingBool(sModName, "bVoreRaiderEnabledOnStart:FalloutVoreMain") as float)
	FV_VoreRoyaltyEnabled.SetValue(MCM.GetModSettingBool(sModName, "bVoreRoyaltyEnabledOnStart:FalloutVoreMain") as float)
EndFunction

Function ResetCamera()
	RestoreCameraProperties()
	MCM.RefreshMenu()
EndFunction

Function RestoreCameraProperties()
	Float CameraDistanceSwallow = MCM.GetModSettingFloat(sModName, "fCameraDistanceSwallow:FalloutVoreMain")
	Float CameraDistanceVomit = MCM.GetModSettingFloat(sModName, "fCameraDistanceVomit:FalloutVoreMain")
	
	; FV_ConsumptionRegistry.UpdateCameraSwallowDistance(CameraDistanceSwallow) ; KEILLA TODO: Who is responsible for doign camera crap?
	; FV_ConsumptionRegistry.UpdateCameraVomitDistance(CameraDistanceVomit)
EndFunction

Function EventRegistration()
	RegisterForExternalEvent("OnMCMSettingChange|FalloutVore", "OnMCMSettingChange")
	RegisterForExternalEvent("OnMCMOpen", "OnMCMOpen")
	debug.trace("MCM for FOVore settings registered")
EndFunction

Function LevelUpPlayer()
	FV_LevelUpManager.LevelUpPlayer_int()
	debug.messagebox("One level has been added to your vore level.")
EndFunction

Function LevelUpCompanion()
	If(currentCompanion != NONE && Game.GetPlayer().GetValue(FV_HasHadNukaAcid) == 0)
		FV_LevelUpManager.LevelUpNPC(currentCompanion.GetActorRef(), 1)
		debug.messagebox("One level has been added to your companion's vore level.")
	ElseIf(Game.GetPlayer().GetValue(FV_HasHadNukaAcid) == 1)
		debug.messagebox("You are a pred.  Level up yourself to level up your companions.")
	ElseIf(currentCompanion == NONE)
		debug.messagebox("You do not have an active companion.")
	EndIf
EndFunction

Event Actor.OnEnterSneaking(Actor akSender)
	If(bCrouchToShit)
		PlayerRef.EquipItem(FV_ScatPotion, true, true)
	EndIf
EndEvent

Function SyncProperties()
	
	If(FV_ClothesripChance.GetValue() == 50)
		bClothesripChance = true
	EndIf
	If(FV_PlayerNeedsNuka.GetValue()==0)
		bFOVoreEnabled = true
	Else
		bFOVoreEnabled = false
	EndIf
	
EndFunction

Function OnMCMOpen()
 	SyncProperties()
    MCM.RefreshMenu()
EndFunction

Function CallScat()
	FV_ScatBool.SetValue(1)
	PlayerRef.EquipItem(FV_ScatPotion, true, true)
EndFunction

Function Regurgitate()
	FV_VomitBool.SetValue(1)
	PlayerRef.EquipItem(FV_RegurgitatePotion, true, true)
EndFunction

Function CallDigest()
	FV_ManualDigestBool.SetValue(1)
	PlayerRef.EquipItem(FV_DigestPotion, true, true)
EndFunction

Function CallContext()
	FV_ManualPreyContext.SetValue(1)
	PlayerRef.EquipItem(FV_ContextPreyPotion, true, true)
EndFunction

Function CallGrowl()
	FV_GrowlBool.SetValue(1)
	PlayerRef.EquipItem(FV_PrimeGrowl, true, true)
EndFunction

Function OnMCMSettingChange(string modName, string id)
	If(modName == sModName)
		Trace(self, "FOVore MCM received update setting")
		;If(id == "FOVoreEnable" && FV_PlayerNeedsNuka.GetValue() == 1)
		;	debug.messagebox("Experiment Activated")
		;	FV_PlayerNeedsNuka.SetValue(0)
		;	StartModSpell.Cast(Game.GetPlayer())
			;bControlGroup5 = false
			;bControlGroup6 = true
		;	MCM.RefreshMenu()
		;EndIf
		If(id == "ClothingToggle")
			If(bClothesripChance)
				FV_ClothesripChance.SetValue(50)
				Trace(self, "Clothes ripping turned on")
			Else
				FV_ClothesripChance.SetValue(0)
				Trace(self, "Clothes ripping turned off")
			EndIf
		ElseIf(id == "ContextVore")
			;If(bContextVore)
				If(!Game.GetPlayer().HasPerk(FV_ContextVorePerk))
					Game.GetPlayer().Addperk(FV_ContextVorePerk)
				EndIf
		ElseIf(id == "ActivatePlayerPred")
			;GAZ: I found this line like this. I wonder if at some point someone tried to make Context ran through MCM Hotkey. Investigate.
		ElseIf(id=="CrouchScatToggle")
			If(bCrouchToShit)
				RegisterForRemoteEvent(PlayerRef, "OnEnterSneaking")
			ElseIf(!bCrouchToShit)
				UnregisterForRemoteEvent(PlayerRef, "OnEnterSneaking")
			EndIf
		ElseIf(id == "CameraSettingChange")
			If FV_ConsumptionRegistry.fCameraDistanceSwallow < fCameraSwallowMin
				; FV_ConsumptionRegistry.UpdateCameraSwallowDistance(fCameraSwallowMin) KEILLA TODO: Who is responsible for camera shit?
				MCM.RefreshMenu()
			EndIf
			If FV_ConsumptionRegistry.fCameraDistanceVomit < fCameraVomitMin
				; FV_ConsumptionRegistry.UpdateCameraVomitDistance(fCameraVomitMin) KEILLA TODO: Who is responsible for camera shit?
				MCM.RefreshMenu()
			EndIf
		ElseIf(id == "HudDebugToggle")
			FV_VoreHud.HudDebugToggle(FV_HudDebugEnabled.GetValue() as int)
		ElseIf(id == "UpdateStruggleType")
			FV_VoreHud.UpdateStruggleControlType(FV_StruggleControlType.GetValue() as int)
		EndIf
	EndIf
EndFunction

Function MakePlayerPred()
	If(PlayerRef.GetValue(FV_HasHadNukaAcid) == 0)
		PlayerRef.SetValue(FV_HasHadNukaAcid, 1)
		PlayerRef.SetValue(FV_SwallowStrength, 25)
		PlayerRef.ModValue(FV_PredLevel, 1)
		PlayerRef.EquipItem(FV_EvoPredatorBasicInjector, abSilent = true)
		FV_PlayerNeedsNuka.SetValue(0)
		MCM.RefreshMenu()
		FV_ConsumptionRegistry.MakePlayerPred()
	EndIf
EndFunction