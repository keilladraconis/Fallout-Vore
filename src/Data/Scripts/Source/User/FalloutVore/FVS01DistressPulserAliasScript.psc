Scriptname FalloutVore:FVS01DistressPulserAliasScript extends ReferenceAlias
{Script on the FVS01 Distress Pulser Aliases. Keeps them synced with their associated Transmitters, moving the Transmitters along with them.}
;
;In general, this script runs a timer that periodically moves the transmitter to the pulser misc object. It stops the timer
;when the pulser unloads or is picked up, and restarts it when it loads or is dropped.

ReferenceAlias property myTransmitter Auto Mandatory
{The transmitter object associated with this pulser.}

int property myTransmitterRadius Auto Mandatory
{The initial max radius of this transmitter.}

float property myTransmitterFrequency Auto Mandatory
{The radio frequency associated with this transmitter.}

Objectreference property myReplacementTransmitter Auto Const Mandatory
{Transmitter to swap in after the player picks up the pulser.}

int property myReplacementTransmitterRadius = 10000 Auto Const
{Default=10000. The max radius of the replacement transmitter.}

Message property FVS01PulserSignalStrengthMessage Auto Const
{Default=False. Signal strength message to display.}

bool property tracesOn Auto
{Default=False. Should we show debug traces?}

ObjectReference mySelf			 	;Local refs.
ObjectReference myTransmitterRef
Actor player


Event OnAliasInit()
	if (tracesOn)
		Debug.Trace("PULSER: Initializing " + Self)
	EndIf
	mySelf = Self.GetReference()
	myTransmitterRef = myTransmitter.GetReference()
	player = Game.GetPlayer()
	OnLoad()
EndEvent

Event OnLoad()
	if (tracesOn)
		Debug.Trace("PULSER: OnLoad for " + Self)
	EndIf
	StartTimer(0, 0)
	StartTimer(0, 1)
EndEvent

Event OnUnload()
	if (tracesOn)
		Debug.Trace("PULSER: OnUnload for " + Self + ", " + mySelf.IsInInterior())
	EndIf
	if (mySelf.IsInInterior())
		CancelTimer(0)
	Else
		CancelTimer(0)
		CancelTimer(1)
		UnregisterForDistanceEvents(mySelf, player)
	EndIf
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance)
	if (tracesOn)
		Debug.Trace("PULSER: OnDistanceLessThan for " + Self)
	EndIf
	StartTimer(0, 1)
EndEvent

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if (akNewContainer == None)
		;Pulser was dropped. Move the transmitter and start the timer.
		if (tracesOn)
			Debug.Trace("PULSER: " + Self + " dropped")
		EndIf
		StartTimer(0, 0)
		StartTimer(0, 1)
		myTransmitter.TryToEnable()
	ElseIf (akOldContainer == None)
		;Pulser was picked up.
		if (tracesOn)
			Debug.Trace("PULSER: " + Self + " picked Up")
		EndIf
		;Stop the timer.
		CancelTimer(0)
		CancelTimer(1)
		;Turn off the radio if the player was listening to the distress signal, to avoid static when the transmitter is disabled.
		if (Game.GetPlayerRadioFrequency() == myTransmitterFrequency)
     		Game.TurnPlayerRadioOn(False)
		EndIf
		;Turn off the transmitter.
		myTransmitter.TryToDisable()
		;Swap the initial transmitter for the replacement, which has a consistent range.
		myTransmitter.ForceRefTo(myReplacementTransmitter)
		myTransmitterRef = myReplacementTransmitter
		myTransmitterRadius = myReplacementTransmitterRadius
	EndIf
EndEvent

Event OnTimer(int timerID)
	if (timerID == 0)
		if (tracesOn)
			Debug.Trace("PULSER: " + Self + " timer 0 tick.")
		EndIf
		if ((mySelf != None) && mySelf.Is3DLoaded())
			myTransmitter.GetReference().MoveTo(mySelf)
			StartTimer(3, 0)
		EndIf
	ElseIf (timerID == 1)
		float playerDistance = myTransmitterRef.GetTransmitterDistance()
		;Display the signal strength message, if appropriate.
		if (tracesOn)
			Debug.Trace("Pulser " + Self + " timer 1 tick. " + Game.IsPlayerRadioOn() +", "+Game.GetPlayerRadioFrequency()+", "+ playerDistance +", " +myTransmitterFrequency+", "+(Game.GetPlayerRadioFrequency() == myTransmitterFrequency)+", "+(playerDistance <= myTransmitterRadius))
		EndIf
		if ((Game.IsPlayerRadioOn()) && (Game.GetPlayerRadioFrequency() == myTransmitterFrequency) && (playerDistance <= myTransmitterRadius))
			float strength = ((myTransmitterRadius-playerDistance)/myTransmitterRadius)*100
			FVS01PulserSignalStrengthMessage.Show(strength)
		EndIf
		;Now, do we need to start the timer again?
		; - If in an interior, irrespective of distance, yes.
		; - If in an exterior and player is in range, yes.
		; - If in an exterior and player is not in range, don't repeat until the player gets within range.
		if (mySelf.IsInInterior())
			if (tracesOn)
				Debug.Trace("Pulser " + Self + " restart 1.")
			EndIf
			StartTimer(11, 1)
		ElseIf (playerDistance <= myTransmitterRadius)
			if (tracesOn)
				Debug.Trace("Pulser " + Self + " restart 2.")
			EndIf
			StartTimer(11, 1)
		Else
			if (tracesOn)
				Debug.Trace("Pulser " + Self + " restart 3.")
			EndIf
			Self.RegisterForDistanceLessThanEvent(mySelf, player, myTransmitterRadius)
		EndIf
	EndIf
EndEvent