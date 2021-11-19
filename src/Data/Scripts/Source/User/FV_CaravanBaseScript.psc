Scriptname FV_CaravanBaseScript extends Quest Conditional

; Trader int passed to CaravanWaits function
int nLouise 		= 0		; Vore

Function CaravanWaits(int nCaravan)
	Debug.Trace("Caravan " + nCaravan + "'s waiting timer has started.")
	StartTimerGameTime(8, nCaravan) 		; 8 hour waiting at the caravan destination
EndFunction

Event OnTimerGameTime(int aiTimerID)		
	Debug.Trace("Caravan " + aiTimerID + "'s waiting timer has ended.")
	
  	If aiTimerID == nLouise 				; Louise's timer expires
		Debug.Trace(self + ": Louise is done waiting at settlement.")
		pCaravanLouiseCurrentStatus.SetValue(0)
  	EndIf

EndEvent

GlobalVariable Property pCaravanLouiseCurrentStatus Auto Const
