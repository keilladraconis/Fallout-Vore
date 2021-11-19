Scriptname FV_PlacePreyAtVomitLocationScript extends ObjectReference
{Places the prey, when vomited, where the vomit projectile lands.}


FV_ConsumptionRegistryScript Property Manager Auto 

Event OnLoad()
	Actor victim = Manager.Prey

	Debug.Notification("Running activator script")
	
	victim.disable()
	victim.moveTo(Self)
	victim.setPosition(Self.GetPositionX(),Self.getPositionY(),Self.getPositionZ()+42)
	victim.enable(0)
	victim.setScale(1)
	victim.setAlpha(100)
	victim.setGhost(false)
	
	
	
	victim.playIdle(resetIdle)
	ObjectReference boom = placeAtMe(theExplosion)

	Disable()
	Delete()
	
endEvent

Idle Property ResetIdle Auto
Explosion Property theExplosion Auto  



