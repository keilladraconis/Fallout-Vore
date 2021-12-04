Scriptname FalloutVore:FV_BriaInitializeScript extends Actor

Armor Property FV_BriaClothes Auto

String sAzarMod = "AzarPonytailHairstyles.esp"
String sWasterMod = "wasterArmor.esp"
int iAzarHairShort06 = 0x00000FBD
int iWasterArmor = 0x00000F9E
bool initialized = false

Event OnLoad()
	RegisterForRemoteEvent(Game.GetPlayer(), "OnPlayerLoadGame")
	If(!initialized)
		CheckAndReplaceClothes()
		initialized = true
	EndIf
	CheckAndReplaceHair()
EndEvent

Event Actor.OnPlayerLoadGame(Actor akSender)
	If(!initialized)
		CheckAndReplaceClothes()
		initialized = true
	EndIf
	CheckAndReplaceHair()
EndEvent

Function CheckAndReplaceHair()
	HeadPart azarHairShort = Game.GetFormFromFile(iAzarHairShort06, sAzarMod) as HeadPart
	If(azarHairShort != NONE)
		HeadPart[] headparts =  GetActorBase().GetHeadParts()
		If(headparts.Find(azarHairShort) < 0)
			debug.trace("Hair found.  Calling ChangeHeadPart")
			ChangeHeadPart(azarHairShort)
		EndIf
	Else
		debug.trace("azar hair not found: " + azarHairShort)
	EndIf
EndFunction

Function CheckAndReplaceClothes()
	Armor wasterArmor =  Game.GetFormFromFile(iWasterArmor, sWasterMod) as Armor
	If(wasterArmor)
		debug.trace("Waster armor found")
		EquipItem(wasterArmor, abSilent = true)
		RemoveItem(FV_BriaClothes, abSilent = true)
	Else
		debug.trace("Waster armor not found: " + wasterArmor)
	EndIf
EndFunction