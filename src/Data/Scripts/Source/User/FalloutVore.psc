Scriptname FalloutVore Native Hidden
;; Native stubs for some special functions. Used by FV_PlayerBellyContainerScript

bool Function OpenVoreLevelMenu() global native
;This function will force the Fallout Vore level up menu to open

bool Function CloseVoreLevelMenu() global native
;This function will force the Fallout Vore level up menu to close

Function AddPerkList(FormList PerkList) global native
;This function will register all perks on it with the vore level up menu

Function LoadBellyContainer(int aCurrWeight, int aMaxWeight) global native

Function BellyItemChanged(int aCurrWeight, int aMaxWeight) global native