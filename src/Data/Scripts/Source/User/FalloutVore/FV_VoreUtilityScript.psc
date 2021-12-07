Scriptname FalloutVore:FV_VoreUtilityScript extends Quest

import Debug

Function Trace(ScriptObject CallingObject, string asMessage = "") Global debugOnly
	string logName = "FalloutVore"
	OpenUserLog(logName)
    TraceUser(logName, "[" + CallingObject + "] - " + asMessage)	
EndFunction