Scriptname HUDFramework extends Quest Native Hidden

;**************************************************************************************************
;**************************************   HUDFramework   ******************************************
;**************************************************************************************************
;**********   HUDFramework is a UI framework that makes it possible for mods to          **********
;**********   add new UI elements to the HUD in a conflict-free way.                     **********
;**************************************************************************************************
;****        Note: This file contains method signatures only and must not be compiled.       ****** 
;****  Take care to ensure that it is not inadvertently distributed with your mod's scripts. ******
;**************************************************************************************************

; Retrieves a reference to the HUDFramework instance.
; Returns None if HUDFramework is not installed.
HUDFramework Function GetInstance() global
    Debug.MessageBox("Warning: HUDFramework implementation not present. You may have compiled HUDFramework.psc without an implementation.")
    return None
EndFunction

; Returns the installed HUDFramework build number.
int Function GetVersion() native global

;**************************************************************************************************
;*********************************   WIDGET REGISTRATION   ****************************************
;**************************************************************************************************

; Registers a HUD widget with HUDFramework.
; HUD widgets must be registered before they can be loaded.
; akOwner    : The ScriptObject (usually Self) that owns this HUD widget.
;              Must implement the function HUD_WidgetLoaded(string asWidget).
; asSWF      : The path to your widget's SWF file. The root directory is Data\Interface.
;              This is the widget identifier. Use this value in future LoadWidget and SendMessage calls.
; afX, afY   : Coordinates to position the HUD widget.
; abLoadNow  : Load the widget immediately after registration. (default: false)
; abAutoLoad : Automatically load the widget whenever the game starts. (default: false)

Function RegisterWidget(ScriptObject akOwner, string asSWF, float afX = 0.0, float afY = 0.0, bool abLoadNow = False, bool abAutoLoad = False) native

; Unregisters a HUD widget. Will unload the widget if it is currently loaded.
Function UnregisterWidget(string asWidgetID) native

; Checks if the specified widget is registered with HUDFramework.
bool Function IsWidgetRegistered(string asWidgetID) native

; Sets whether the specified widget is automatically loaded when the game starts.
Function SetWidgetAutoload(string asWidgetID, bool abAutoLoad) native

;**************************************************************************************************
;*********************************   WIDGET LOAD / UNLOAD   ***************************************
;**************************************************************************************************

; Load a HUD widget.
Function LoadWidget(string asWidgetID) native

; Unload a HUD widget.
Function UnloadWidget(string asWidgetID) native

; Checks if the specified widget is currently loaded.
bool Function IsWidgetLoaded(string asWidgetID) native

; Note:
; You must implement the function HUD_WidgetLoaded(string asWidgetID) to be notified when your
; widget is loaded and ready to receive messages. You should not attempt to communicate with
; your widget before it is loaded.

; Example:
;/
    Function HUD_WidgetLoaded(string asWidgetID)
     If (asWidgetID == "MyWidget.swf")
         ; Initialize the widget.
     EndIf
    EndFunction
/;

;**************************************************************************************************
;**********************************   WIDGET PROPERTIES   *****************************************
;**************************************************************************************************

; Position a HUD widget.
; afX, afY      : Coordinates to position the HUD widget.
; abTemporary   : If true, the new position is not saved and will persist
;                 for the current game session only.

Function SetWidgetPosition(string asWidgetID, float afX = 0.0, float afY = 0.0, bool abTemporary = False) native
Function ModWidgetPosition(string asWidgetID, float afDeltaX = 0.0, float afDeltaY = 0.0, bool abTemporary = False) native
float[] Function GetWidgetPosition(string asWidgetID) native

; Scale a HUD widget.
; afScaleX, afScaleY : The new scale of the HUD widget.
;                      If only afScaleX is provided, afScaleY is set equal to afScaleX.
; abTemporary        : If true, the new scale is not saved and will persist
;                      for the current game session only.

Function SetWidgetScale(string asWidgetID, float afScaleX = 0.0, float afScaleY = 0.0, bool abTemporary = False) native
Function ModWidgetScale(string asWidgetID, float afScaleX = 0.0, float afScaleY = 0.0, bool abTemporary = False) native
float[] Function GetWidgetScale(string asWidgetID) native

; Set the opacity of a HUD widget.
; afOpacity     : The new opacity of the HUD widget. Ranges from 0 to 1.
; abTemporary   : If true, the new opacity is not saved and will persist
;                 for the current game session only.

Function SetWidgetOpacity(string asWidgetID, float afOpacity = 1.0, bool abTemporary = False) native
float Function GetWidgetOpacity(string asWidgetID) native

;**************************************************************************************************
;*********************************   WIDGET COMMUNICATION   ***************************************
;**************************************************************************************************

; Sends a message to the specified HUD widget. The message is dispatched immediately.
Function SendMessage(string asWidgetID, int aiCommand, float arg1 = 0.0, float arg2 = 0.0, \
    float arg3 = 0.0, float arg4 = 0.0, float arg5 = 0.0, float arg6 = 0.0) native

; Sends a custom message to the specified HUD widget. The message is dispatched immediately.
; Note that the custom Message form must be correctly formatted.
Function SendCustomMessage(Message akMessageToSend, float arg1 = 0.0, float arg2 = 0.0, \
    float arg3 = 0.0, float arg4 = 0.0, float arg5 = 0.0, float arg6 = 0.0, float arg7 = 0.0, \
    float arg8 = 0.0, float arg9 = 0.0) native

; Sends a string message to the specified HUD widget.
; The message is queued for dispatch and may not be sent immediately. Maximum delay: 1 second.
; If the user has F4SE installed, the message is sent immediately.
; Can accept any primitive or reference type representable as a string, including forms,
; ObjectReferences and arrays.
; abReplaceExisting : Replace any existing message sent with the same command if it is still in
;                     the queue and has yet to be dispatched.
; abDeferSend       : Do not schedule a message dispatch for this function call. Note that other
;                     mods sending messages may trigger dispatch.

Function SendMessageString(string asWidgetID, string asCommand, string asBody, \
    bool abReplaceExisting = True, bool abDeferSend = False) native

; Evaluates an AS3 expression on the document class of HUDMenu.
; Powerful and potentially dangerous - use with care.
; Evaluation is queued and may not happen immediately. Maximum delay: 1 second.
; If the user has F4SE installed, evaluation happens immediately.
Function Eval(string asExpression) native

;**************************************************************************************************
;****************************************   UTILITIES   *******************************************
;**************************************************************************************************

; Looks for and unregisters any widget registrations that have been orphaned, i.e. widgets with
; no owners. Widgets are orphaned when the mod providing the widget is uninstalled without having
; first unregistered their widgets.
; It is good practice to provide an uninstall method that unregisters all widgets you have
; registered for.

Function ClearOrphanedRegistrations() native