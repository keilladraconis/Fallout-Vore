Scriptname FalloutVore:FV_FalloutVoreMCMScript extends Quest

Function Trace(string asFunction, string asMessage = "") Global debugOnly
	string logName = "FalloutVore"
	Debug.OpenUserLog(logName)
    Debug.TraceUser(logName, "[FalloutVore:FV_FalloutVoreMCMScript] " + asFunction + " - " + asMessage)	
EndFunction

ReferenceAlias Property CurrentCompanion Auto Const

Group Globals
	GlobalVariable Property FV_PlayerNeedsNuka Auto
	GlobalVariable Property FV_ClothesripChance Auto
	GlobalVariable Property FV_ManualDigestBool Auto
	GlobalVariable Property FV_ManualPreyContext Auto
	GlobalVariable Property FV_MaxCapacity Auto
	GlobalVariable Property FV_PerkPoints Auto
	GlobalVariable Property FV_GrowlBool Auto
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
	Potion Property FV_DigestPotion Auto
	Potion Property FV_RegurgitatePotion Auto
	Potion Property FV_ContextPreyPotion Auto
	Potion Property FV_PrimeGrowl Auto
EndGroup

String sModName = "FalloutVore"

Bool Property bClothesripChance Auto Hidden
Bool Property bFOVoreEnabled Auto Hidden
Bool Property bContextVore Auto Hidden

Actor PlayerRef

Event OnInit()
	PlayerRef = Game.GetPlayer()
	RegisterForRemoteEvent(Game.GetPlayer(), "OnPlayerLoadGame")
	EventRegistration()
	SyncProperties()
	EnableOnStart()
EndEvent

Event Actor.OnPlayerLoadGame(Actor akSender)
	EventRegistration()
	SyncProperties()
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
	FV_FemaleVoreEnabled.SetValue(MCM.GetModSettingBool(sModName, "bFemaleVoreEnabledOnStart:FalloutVoreMain") as float)
	FV_MaleVoreEnabled.SetValue(MCM.GetModSettingBool(sModName, "bMaleVoreEnabledOnStart:FalloutVoreMain") as float)
	FV_VoreRaiderEnabled.SetValue(MCM.GetModSettingBool(sModName, "bVoreRaiderEnabledOnStart:FalloutVoreMain") as float)
	FV_VoreRoyaltyEnabled.SetValue(MCM.GetModSettingBool(sModName, "bVoreRoyaltyEnabledOnStart:FalloutVoreMain") as float)
EndFunction

Function EventRegistration()
	RegisterForExternalEvent("OnMCMSettingChange|FalloutVore", "OnMCMSettingChange")
	RegisterForExternalEvent("OnMCMOpen", "OnMCMOpen")
	debug.trace("MCM for FOVore settings registered")
EndFunction

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
		Trace("OnMCMSettingChange()")
		If(id == "ClothingToggle")
			If(bClothesripChance)
				FV_ClothesripChance.SetValue(50)
				Trace("OnMCMSettingChange()", "Clothes ripping turned on")
			Else
				FV_ClothesripChance.SetValue(0)
				Trace("OnMCMSettingChange()", "Clothes ripping turned off")
			EndIf
		ElseIf(id == "ContextVore")
			If(!Game.GetPlayer().HasPerk(FV_ContextVorePerk))
				Game.GetPlayer().Addperk(FV_ContextVorePerk)
			EndIf
		EndIf
	EndIf
EndFunction