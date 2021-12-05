Scriptname FalloutVore:FV_RoyaltyAssetInitialize extends Actor

String Property ModName = "AzarPonytailHairstyles.esp" Auto

int[] Property HairFormID Auto

bool initialized = false
int HairType = -1

Event OnLoad()
	RegisterForRemoteEvent(Game.GetPlayer(), "OnPlayerLoadGame")
	CheckAndReplace()
EndEvent

Event Actor.OnPlayerLoadGame(Actor akSender)
	CheckAndReplace()
EndEvent

Function CheckAndReplace()
	If(HairType == -1)
		HairType = Utility.RandomInt(0, HairFormID.length)
	EndIf
	HeadPart hairToEquip = Game.GetFormFromFile(HairFormID[HairType], ModName) as HeadPart
	If(hairToEquip != NONE)
		HeadPart[] headparts =  GetActorBase().GetHeadParts()
		If headparts.Find(hairToEquip) <0
			debug.trace("Hair found.  Calling ChangeHeadPart HairType: " + HairType + " HairFormID: " + hairToEquip)
			ChangeHeadPart(hairToEquip)
		EndIf
	Else
		debug.trace("hair not found: " + hairToEquip)
	EndIf
EndFunction