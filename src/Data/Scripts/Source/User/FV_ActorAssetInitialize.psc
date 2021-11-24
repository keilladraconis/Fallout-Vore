Scriptname FV_ActorAssetInitialize extends Actor
;; Used by FV_Louise and FV_GunnerBoss_Jill. Apparently gives them the Azar ponytail hair.

String Property ModName = "AzarPonytailHairstyles.esp" Auto

int Property HairFormID = 0x00000FBD Auto

bool initialized = false

Event OnLoad()
	RegisterForRemoteEvent(Game.GetPlayer(), "OnPlayerLoadGame")
	CheckAndReplace()
EndEvent

Event Actor.OnPlayerLoadGame(Actor akSender)
	CheckAndReplace()
EndEvent

Function CheckAndReplace()
	HeadPart hairToEquip = Game.GetFormFromFile(HairFormID, ModName) as HeadPart
	If(hairToEquip != NONE)
		HeadPart[] headparts =  GetActorBase().GetHeadParts()
		If headparts.Find(hairToEquip) <0
			debug.trace("Hair found.  Calling ChangeHeadPart")
			ChangeHeadPart(hairToEquip)
		EndIf
	Else
		debug.trace("hair not found: " + hairToEquip)
	EndIf
EndFunction