Scriptname FalloutVore:FV_VoreRaiderAliasNameScript extends ReferenceAlias

ActorValue Property FV_HasHadNukaAcid Auto
ReferenceAlias Property NamedAlias Auto
ReferenceAlias Property ThisAlias Auto

Event OnAliasInit()
	;wait a seocnd to let the base alias finish filling so has had nuka acid can bet set before firing this event
	utility.wait(1.0)
	
	Actor ActorToCheck = ThisAlias.GetActorReference()
	If ActorToCheck.GetValue(FV_HasHadNukaAcid) == 1
		NamedAlias.ForceRefTo(ActorToCheck)
	EndIf
EndEvent