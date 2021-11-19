Scriptname Overlays Native Hidden

struct Entry
	int uid ; Will be filled by Add
	int priority
	string template ; Must be defined by a json file first
	float red
	float green
	float blue
	float alpha
	float offset_u
	float offset_v
	float scale_u
	float scale_v
EndStruct

Function AddEntry(Actor akActor, bool isFemale, int priority, string template) global
	Entry overlay = new Entry
	overlay.priority = priority
	overlay.template = template
	overlay.red = 0
	overlay.green = 0
	overlay.blue = 0
	overlay.alpha = 0
	overlay.offset_u = 0
	overlay.offset_v = 0
	overlay.scale_u = 1
	overlay.scale_v = 1
	Add(akActor, isFemale, overlay)
EndFunction

; Adds an overlay and returns the UID, also sets the Entry UID to the new UID
int Function Add(Actor akActor, bool isFemale, Entry overlay) global native

; Removes an Actors overlay by UID
bool Function Remove(Actor akActor, bool isFemale, int uid) global native

; Alters all properties to the overlay except for the UID
bool Function Set(Actor akActor, bool isFemale, int uid, Entry newData) global native
Entry Function Get(Actor akActor, bool isFemale, int uid) global native

; Removes all overlays on the actor
bool Function RemoveAll(Actor akActor, bool isFemale) global native

; Returns all the overlays on the actor
Entry[] Function GetAll(Actor akActor, bool isFemale) global native

Function Update(Actor akActor) global native

; Removes all overlays from all actors (does not perform update)
Function ClearAll() global native