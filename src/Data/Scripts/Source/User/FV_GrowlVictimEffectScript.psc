Scriptname FV_GrowlVictimEffectScript Extends ActiveMagicEffect

Perk Property FV_FrighteningGrowl01 Auto
Perk Property FV_FrighteningGrowl02 Auto
Perk Property FV_FrighteningGrowl03 Auto
actorValue property Assistance auto mandatory
ActorValue Property FV_GrowlTypeAV Auto
ActorValue Property FV_BellyCapacity Auto
ActorValue Property FV_CurrentPrey Auto
RefCollectionAlias property GrowlVictimAliasCollection auto mandatory
Keyword Property ActorTypeHuman Auto
FV_ConsumptionRegistryScript Property FV_ConsumptionRegistry Auto

actor victimActor
int startingAssistance
int startingAggression
int startingConfidence
float FleePercent = -1.0
float CowerPercent = -1.0
float DesirePercent = -1.0

RefCollectionAlias GrowlTypeAliasCollection
Bool GrowlSuccessful = false

Event OnEffectStart(Actor akTarget, Actor akCaster)
	RegisterForCustomEvent(FV_ConsumptionRegistry, "OnSwallow")
	float GrowlChance = Utility.RandomFloat(0.0, 100.0)
	debug.trace("Growl Effect start GrowlChance: " + GrowlChance + " akTarget: " + akTarget)
	SetPercents()
	If(GrowlChance <= DesirePercent && akTarget.HasKeyword(ActorTypeHuman) && Game.GetPlayer().GetValue(FV_CurrentPrey) < Game.GetPlayer().GetValue(FV_BellyCapacity))
		akTarget.SetValue(FV_GrowlTypeAV, 3)
		BeginGrowl(akCaster, akTarget)
	ElseIf(GrowlChance <= DesirePercent && akTarget.HasKeyword(ActorTypeHuman) && Game.GetPlayer().GetValue(FV_CurrentPrey) >= Game.GetPlayer().GetValue(FV_BellyCapacity))
		akTarget.SetValue(FV_GrowlTypeAV, 1)
		BeginGrowl(akCaster, akTarget)
	ElseIf(GrowlChance <= DesirePercent && !akTarget.HasKeyword(ActorTypeHuman))
		;We don't want to make non-humans approach the player
		akTarget.SetValue(FV_GrowlTypeAV, 1)
		BeginGrowl(akCaster, akTarget)
	ElseIf(GrowlChance > DesirePercent && GrowlChance <= CowerPercent)
		akTarget.SetValue(FV_GrowlTypeAV, 2)
		BeginGrowl(akCaster, akTarget)
	ElseIf(GrowlChance > CowerPercent && GrowlChance <= FleePercent)
		akTarget.SetValue(FV_GrowlTypeAV, 1)
		BeginGrowl(akCaster, akTarget)
	Else
		Self.Dispel()
	EndIf
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	UnregisterForCustomEvent(FV_ConsumptionRegistry, "OnSwallow")
	If(GrowlSuccessful)
		EndOfEffect(akCaster, akTarget)
	EndIf
EndEvent

Function SetPercents()
	If(Game.GetPlayer().HasPerk(FV_FrighteningGrowl03))
		FleePercent = 100.0
		CowerPercent = 70.0
		DesirePercent = 100.0	;15.0
	ElseIf(Game.GetPlayer().HasPerk(FV_FrighteningGrowl02))
		FleePercent = 60.0
		CowerPercent = 30.0
	ElseIf(Game.GetPlayer().HasPerk(FV_FrighteningGrowl01))
		FleePercent = 50.0
	EndIf
EndFunction

Function BeginGrowl(Actor akPred, Actor akPrey)
	debug.trace("Begin growl akPrey: " + akPrey)
	GrowlSuccessful = true
	victimActor = akPrey
	GrowlVictimAliasCollection.addRef(akPrey)
	;***Store actor variables that this effect will change
	startingAssistance = akPrey.GetValue(Assistance) as int
	startingConfidence = akPrey.GetValue(Game.GetConfidenceAV()) as int
	startingAggression = akPrey.GetValue(Game.GetAggressionAV()) as int
	
	;***Make victim unaggressive and make them not care about crime***
	akPrey.SetValue(Game.GetAggressionAV(), -1)
	akPrey.SetValue(Assistance, 0)
	
	;***Send an assault alarm and detection event so nearby actors can react. Then stop combat on victim actor.***
	akPrey.enableAI(False)
	akPrey.createDetectionEvent(game.getplayer(), 66)
	akPrey.sendAssaultAlarm()
	akPrey.stopCombat()
	akPrey.enableAI()
	akPrey.EvaluatePackage()
	
	;***Registering for all events that can break the holdup state
	RegisterForPlayerTeleport()
	RegisterForHitEvent(akPrey, game.getPlayer(), abMatch = true)
EndFunction

Event FV_ConsumptionRegistryScript.OnSwallow(FV_ConsumptionRegistryScript akSender, Var[] akArgs)
	If(victimActor != NONE)
		If(Game.GetPlayer().GetValue(FV_CurrentPrey) >= Game.GetPlayer().GetValue(FV_BellyCapacity) && victimActor.GetValue(FV_GrowlTypeAV) == 3)
			;Player just filled up.  Send this desire victim running for the hills
			victimActor.SetValue(FV_GrowlTypeAV, 1)
			victimActor.EvaluatePackage()
		Endif
	EndIf
EndEvent

Function EndOfEffect(Actor akPred, Actor akPrey)
	;remove all effects and reset actor values upon dispel
	debug.trace("Frightening Growl block ran")
	akPrey.SetValue(Game.GetAggressionAV(), startingAggression)
	akPrey.SetValue(Game.GetConfidenceAV(), startingConfidence)
	akPrey.SetValue(Assistance, startingAssistance)
	akPrey.SetValue(FV_GrowlTypeAV, 0)
	GrowlVictimAliasCollection.RemoveRef(akPrey)
	akPrey.EvaluatePackage()
	game.getPlayer().createDetectionEvent(game.getplayer(), 66)
	akPrey.sendAssaultAlarm()
EndFunction

Event onPlayerTeleport()
	;If the player goes through a load door, fast travels, or is moved; dispel the effect.
	self.dispel()
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	;Dispel if the player hits the target actor, unless they are frenzied
	if akAggressor == game.getPlayer()
		debug.trace("dispelling due to player hit")
		self.dispel()
	endif
EndEvent

Event onPickpocketFailed()
	;If the player gets caught pickpocketing the victim actor, dispel the effect.
	self.dispel()
EndEvent