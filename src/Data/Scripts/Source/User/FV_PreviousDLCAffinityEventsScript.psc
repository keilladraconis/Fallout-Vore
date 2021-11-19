Scriptname FV_PreviousDLCAffinityEventsScript extends Quest

Group DLCCompanionActors
	CompanionActorScript Property BriaRef const auto Mandatory
EndGroup

Group DLCCompanionAffinityKeywords
	keyword Property CA_CustomEvent_BriaLoves auto const mandatory
	keyword Property CA_CustomEvent_BriaLikes auto const mandatory
	keyword Property CA_CustomEvent_BriaDislikes auto const mandatory
	keyword Property CA_CustomEvent_BriaHates auto const mandatory
	keyword Property CA_CustomEvent_Bria__UNSET auto const mandatory
EndGroup

Group FOCompanionAffinityEventQuest
	CompanionAffinityEventQuestScript Property CompanionAffinity const auto mandatory
EndGroup


;PREVIOUS DLC QUESTS
String sDLC01 = "DLCRobot.esm" const

Quest DLC01MQ01 
Quest DLC01MQ02 
Quest DLC01MQ04 
Quest DLC01MQ05 
Quest DLC01DialogueQuest 
Quest DLC01MQPostQuestRadiantAssault01 
Quest DLC01MQPostQuestRadiantAssault02 
Quest DLC01MQPostQuestRadiantAssault03_Min
Quest DLC01MQPostQuestRadiantAssault04_Inst
Quest DLC01MQPostQuestRadiantAssault05_BOS

int iDLC01MQ01 = 0x01000806 const
int iDLC01MQ02 = 0x01000801 const
int iDLC01MQ04 = 0x01002833 const
int iDLC01MQ05 = 0x010010F5 const
int iDLC01DialogueQuest = 0x0100AEDD const
int iDLC01MQPostQuestRadiantAssault01 = 0x01003E8A const
int iDLC01MQPostQuestRadiantAssault02 = 0x0100AF4D const
int iDLC01MQPostQuestRadiantAssault03_Min = 0x0100AF50 const
int iDLC01MQPostQuestRadiantAssault04_Inst = 0x0100AF4C const
int iDLC01MQPostQuestRadiantAssault05_BOS = 0x0100AF51 const

bool bDLC01EventsReady


String sDLC03 = "DLCCoast.esm" const
Quest DLC03MQ01
Quest DLC03MQ02
Quest DLC03MQ03
Quest DLC03MQ05
Quest DLC03MQ06
Quest DLC03MQ06a
Quest DLC03MQPostQuest
Quest DLC03AcadiaM01
Quest DLC03AtomM01
Quest DLC03CoA_DialogueNucleusEntrance
Quest DLC03AtomM02
Quest DLC03FarHarborFF01
Quest DLC03FarHarborFF02
Quest DLC03FarHarborFF03a
Quest DLC03FarHarborFF03b
Quest DLC03FarHarborFF03c
Quest DLC03FarHarborM01
Quest DLC03FarHarborM03
Quest DLC03FarHarborS01
Quest DLC03FarHarborS02
Quest DLC03FarHarborS03
Quest DLC03CoA_FFNucleus01
Quest DLC03CoA_FFNucleus02
Quest DLC03CoA_FFNucleus03
Quest DLC03AcadiaM02
Quest DLC03AcadiaM03
Quest DLC03AcadiaDialogue
Quest DLC03AcadiaM04
Quest DLC03Acadia_BoS
Quest DLC03Acadia_Institute
Quest DLC03DialogueNakanoResidence
Quest DLC03DialogueKasumiAcadia
Quest DLC03DialogueDiMA
Quest DLC03DialogueNick
Quest DLC03CoA_DialogueNucleus
Quest DLC03_V118_PearlHiring
Quest DLC03_V118_Intro
Quest DLC03_V118_Quest
Quest DLC03_V118_ClueTracker
Quest DLC03DialogueV118
Quest DLC03_ADV017
Quest DLC03DialogueFarHarbor
Quest DLC03DialogueFarHarborPostMQ05Avery
Quest DLC03DialogueFarHarborPostQuest

int iDLC03MQ01 = 0x00000000 const
int iDLC03MQ02 = 0x00000000 const
int iDLC03MQ03 = 0x00000000 const
int iDLC03MQ05 = 0x00000000 const
int iDLC03MQ06 = 0x00000000 const
int iDLC03MQ06a = 0x00000000 const
int iDLC03MQPostQuest = 0x00000000 const
int iDLC03AcadiaM01 = 0x00000000 const
int iDLC03AtomM01 = 0x00000000 const
int iDLC03CoA_DialogueNucleusEntrance = 0x00000000 const
int iDLC03AtomM02 = 0x00000000 const
int iDLC03FarHarborFF01 = 0x00000000 const
int iDLC03FarHarborFF02 = 0x00000000 const
int iDLC03FarHarborFF03a = 0x00000000 const
int iDLC03FarHarborFF03b = 0x00000000 const
int iDLC03FarHarborFF03c = 0x00000000 const
int iDLC03FarHarborM01 = 0x00000000 const
int iDLC03FarHarborM03 = 0x00000000 const
int iDLC03FarHarborS01 = 0x00000000 const
int iDLC03FarHarborS02 = 0x00000000 const
int iDLC03FarHarborS03 = 0x00000000 const
int iDLC03CoA_FFNucleus01 = 0x00000000 const
int iDLC03CoA_FFNucleus02 = 0x00000000 const
int iDLC03CoA_FFNucleus03 = 0x00000000 const
int iDLC03AcadiaM02 = 0x00000000 const
int iDLC03AcadiaM03 = 0x00000000 const
int iDLC03AcadiaDialogue = 0x00000000 const
int iDLC03AcadiaM04 = 0x00000000 const
int iDLC03Acadia_BoS = 0x00000000 const
int iDLC03Acadia_Institute = 0x00000000 const
int iDLC03DialogueNakanoResidence = 0x00000000 const
int iDLC03DialogueKasumiAcadia = 0x00000000 const
int iDLC03DialogueDiMA = 0x00000000 const
int iDLC03DialogueNick = 0x00000000 const
int iDLC03CoA_DialogueNucleus = 0x00000000 const
int iDLC03_V118_PearlHiring = 0x00000000 const
int iDLC03_V118_Intro = 0x00000000 const
int iDLC03_V118_Quest = 0x00000000 const
int iDLC03_V118_ClueTracker = 0x00000000 const
int iDLC03DialogueV118 = 0x00000000 const
int iDLC03_ADV017 = 0x00000000 const
int iDLC03DialogueFarHarbor = 0x00000000 const
int iDLC03DialogueFarHarborPostMQ05Avery = 0x00000000 const
int iDLC03DialogueFarHarborPostQuest = 0x00000000 const

bool bDLC03EventsReady

String sDLC06 = "DLCWorkshop03.esm" const

Quest DLC06MQ03
Quest DLC06E01
Quest DLC06E02
Quest DLC06E03
Quest DLC06E04
Quest DLC06DialogueVault88

int iDLC06MQ03 = 0x00000000 const
int iDLC06E01 = 0x00000000 const
int iDLC06E02 = 0x00000000 const
int iDLC06E03 = 0x00000000 const
int iDLC06E04 = 0x00000000 const
int iDLC06DialogueVault88 = 0x00000000 const

bool bDLC06EventsReady

Event OnQuestInit()
   RegisterForRemoteEvent(Game.GetPlayer(), "OnPlayerLoadGame")
   bDLC01EventsReady = bDLC01EventsReady || CheckForDLC01AndProcessVariablesAndRegisterForEvent()
   bDLC03EventsReady = bDLC03EventsReady || CheckForDLC03AndProcessVariablesAndRegisterForEvent()
   bDLC06EventsReady = bDLC06EventsReady || CheckForDLC06AndProcessVariablesAndRegisterForEvent()
EndEvent

;need this event, in case the player installs the other DLC AFTER installing this one
Event Actor.OnPlayerLoadGame(actor akSource)
   bDLC01EventsReady = bDLC01EventsReady || CheckForDLC01AndProcessVariablesAndRegisterForEvent()
   bDLC03EventsReady = bDLC03EventsReady || CheckForDLC03AndProcessVariablesAndRegisterForEvent()
   bDLC06EventsReady = bDLC06EventsReady || CheckForDLC06AndProcessVariablesAndRegisterForEvent()
EndEvent

bool Function CheckForDLC01AndProcessVariablesAndRegisterForEvent()
	if Game.IsPluginInstalled(sDLC01)

		DLC01MQ01 = Game.GetFormFromFile(iDLC01MQ01, sDLC01) as Quest
		DLC01MQ02 = Game.GetFormFromFile(iDLC01MQ02, sDLC01) as Quest
		DLC01MQ04 = Game.GetFormFromFile(iDLC01MQ04, sDLC01) as Quest
		DLC01MQ05 = Game.GetFormFromFile(iDLC01MQ05, sDLC01) as Quest
		DLC01DialogueQuest = Game.GetFormFromFile(iDLC01DialogueQuest, sDLC01) as Quest
		DLC01MQPostQuestRadiantAssault01 = Game.GetFormFromFile(iDLC01MQPostQuestRadiantAssault01, sDLC01) as Quest
		DLC01MQPostQuestRadiantAssault02 = Game.GetFormFromFile(iDLC01MQPostQuestRadiantAssault02, sDLC01) as Quest
		DLC01MQPostQuestRadiantAssault03_Min = Game.GetFormFromFile(iDLC01MQPostQuestRadiantAssault03_Min, sDLC01) as Quest
		DLC01MQPostQuestRadiantAssault04_Inst = Game.GetFormFromFile(iDLC01MQPostQuestRadiantAssault04_Inst, sDLC01) as Quest
		DLC01MQPostQuestRadiantAssault05_BOS = Game.GetFormFromFile(iDLC01MQPostQuestRadiantAssault05_BOS, sDLC01) as Quest

		;register for companion events (no reason to do this if the plugin isn't installed, since other scripts are handling base game and this DLC's events)
		RegisterForCustomEvent(CompanionAffinity, "CompanionAffinityEvent")

		return true
	endif
EndFunction


bool Function CheckForDLC03AndProcessVariablesAndRegisterForEvent()
	if Game.IsPluginInstalled(sDLC03)

		DLC03_ADV017 = Game.GetFormFromFile(iDLC03_ADV017, sDLC03) as Quest
		DLC03_V118_ClueTracker = Game.GetFormFromFile(iDLC03_V118_ClueTracker, sDLC03) as Quest
		DLC03_V118_Intro = Game.GetFormFromFile(iDLC03_V118_Intro, sDLC03) as Quest
		DLC03_V118_PearlHiring = Game.GetFormFromFile(iDLC03_V118_PearlHiring, sDLC03) as Quest
		DLC03_V118_Quest = Game.GetFormFromFile(iDLC03_V118_Quest, sDLC03) as Quest
		DLC03Acadia_BoS = Game.GetFormFromFile(iDLC03Acadia_BoS, sDLC03) as Quest
		DLC03Acadia_Institute = Game.GetFormFromFile(iDLC03Acadia_Institute, sDLC03) as Quest
		DLC03AcadiaDialogue = Game.GetFormFromFile(iDLC03AcadiaDialogue, sDLC03) as Quest
		DLC03AcadiaM01 = Game.GetFormFromFile(iDLC03AcadiaM01, sDLC03) as Quest
		DLC03AcadiaM02 = Game.GetFormFromFile(iDLC03AcadiaM02, sDLC03) as Quest
		DLC03AcadiaM03 = Game.GetFormFromFile(iDLC03AcadiaM03, sDLC03) as Quest
		DLC03AcadiaM04 = Game.GetFormFromFile(iDLC03AcadiaM04, sDLC03) as Quest
		DLC03AtomM01 = Game.GetFormFromFile(iDLC03AtomM01, sDLC03) as Quest
		DLC03AtomM02 = Game.GetFormFromFile(iDLC03AtomM02, sDLC03) as Quest
		DLC03CoA_DialogueNucleus = Game.GetFormFromFile(iDLC03CoA_DialogueNucleus, sDLC03) as Quest
		DLC03CoA_DialogueNucleusEntrance = Game.GetFormFromFile(iDLC03CoA_DialogueNucleusEntrance, sDLC03) as Quest
		DLC03CoA_FFNucleus01 = Game.GetFormFromFile(iDLC03CoA_FFNucleus01, sDLC03) as Quest
		DLC03CoA_FFNucleus02 = Game.GetFormFromFile(iDLC03CoA_FFNucleus02, sDLC03) as Quest
		DLC03CoA_FFNucleus03 = Game.GetFormFromFile(iDLC03CoA_FFNucleus03, sDLC03) as Quest
		DLC03DialogueDiMA = Game.GetFormFromFile(iDLC03DialogueDiMA, sDLC03) as Quest
		DLC03DialogueFarHarbor = Game.GetFormFromFile(iDLC03DialogueFarHarbor, sDLC03) as Quest
		DLC03DialogueFarHarborPostMQ05Avery = Game.GetFormFromFile(iDLC03DialogueFarHarborPostMQ05Avery, sDLC03) as Quest
		DLC03DialogueFarHarborPostQuest = Game.GetFormFromFile(iDLC03DialogueFarHarborPostQuest, sDLC03) as Quest
		DLC03DialogueKasumiAcadia = Game.GetFormFromFile(iDLC03DialogueKasumiAcadia, sDLC03) as Quest
		DLC03DialogueNakanoResidence = Game.GetFormFromFile(iDLC03DialogueNakanoResidence, sDLC03) as Quest
		DLC03DialogueNick = Game.GetFormFromFile(iDLC03DialogueNick, sDLC03) as Quest
		DLC03DialogueV118 = Game.GetFormFromFile(iDLC03DialogueV118, sDLC03) as Quest
		DLC03FarHarborFF01 = Game.GetFormFromFile(iDLC03FarHarborFF01, sDLC03) as Quest
		DLC03FarHarborFF02 = Game.GetFormFromFile(iDLC03FarHarborFF02, sDLC03) as Quest
		DLC03FarHarborFF03a = Game.GetFormFromFile(iDLC03FarHarborFF03a, sDLC03) as Quest
		DLC03FarHarborFF03b = Game.GetFormFromFile(iDLC03FarHarborFF03b, sDLC03) as Quest
		DLC03FarHarborFF03c = Game.GetFormFromFile(iDLC03FarHarborFF03c, sDLC03) as Quest
		DLC03FarHarborM01 = Game.GetFormFromFile(iDLC03FarHarborM01, sDLC03) as Quest
		DLC03FarHarborM03 = Game.GetFormFromFile(iDLC03FarHarborM03, sDLC03) as Quest
		DLC03FarHarborS01 = Game.GetFormFromFile(iDLC03FarHarborS01, sDLC03) as Quest
		DLC03FarHarborS02 = Game.GetFormFromFile(iDLC03FarHarborS02, sDLC03) as Quest
		DLC03FarHarborS03 = Game.GetFormFromFile(iDLC03FarHarborS03, sDLC03) as Quest
		DLC03MQ01 = Game.GetFormFromFile(iDLC03MQ01, sDLC03) as Quest
		DLC03MQ02 = Game.GetFormFromFile(iDLC03MQ02, sDLC03) as Quest
		DLC03MQ03 = Game.GetFormFromFile(iDLC03MQ03, sDLC03) as Quest
		DLC03MQ05 = Game.GetFormFromFile(iDLC03MQ05, sDLC03) as Quest
		DLC03MQ06 = Game.GetFormFromFile(iDLC03MQ06, sDLC03) as Quest
		DLC03MQ06a = Game.GetFormFromFile(iDLC03MQ06a, sDLC03) as Quest
		DLC03MQPostQuest = Game.GetFormFromFile(iDLC03MQPostQuest, sDLC03) as Quest

		;register for companion events (no reason to do this if the plugin isn't installed, since other scripts are handling base game and this DLC's events)
		RegisterForCustomEvent(CompanionAffinity, "CompanionAffinityEvent")

		return true
	endif
EndFunction


bool Function CheckForDLC06AndProcessVariablesAndRegisterForEvent()
	if Game.IsPluginInstalled(sDLC06)

		DLC06DialogueVault88 = Game.GetFormFromFile(iDLC06DialogueVault88, sDLC06) as Quest
		DLC06E01 = Game.GetFormFromFile(iDLC06E01, sDLC06) as Quest
		DLC06E02 = Game.GetFormFromFile(iDLC06E02, sDLC06) as Quest
		DLC06E03 = Game.GetFormFromFile(iDLC06E03, sDLC06) as Quest
		DLC06E04 = Game.GetFormFromFile(iDLC06E04, sDLC06) as Quest
		DLC06MQ03 = Game.GetFormFromFile(iDLC06MQ03, sDLC06) as Quest

		;register for companion events (no reason to do this if the plugin isn't installed, since other scripts are handling base game and this DLC's events)
		RegisterForCustomEvent(CompanionAffinity, "CompanionAffinityEvent")

		return true
	endif
EndFunction



;DLC COMPANIONS
function Bria__UNSET()

endFunction

function Bria_Neutral(bool CheckCompanionProximity = true)
endFunction

function Bria_Dislikes(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_BriaDislikes, CheckCompanionProximity)
endFunction

function Bria_Hates(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_BriaHates, CheckCompanionProximity)
endFunction

function Bria_Likes(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_BriaLikes, CheckCompanionProximity)
endFunction

function Bria_Loves(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_BriaLoves, CheckCompanionProximity)
endFunction


function SendAffinityEvent(keyword affinityKeyword, bool CheckCompanionProximity = true)
	debug.trace(self + " SendAffinityEvent " + affinityKeyword)
	FollowersScript.SendAffinityEvent(self, affinityKeyword, ShouldSuppressComment = false, IsDialogueBump = true, CheckCompanionProximity = CheckCompanionProximity)
endFunction


Event CompanionAffinityEventQuestScript.CompanionAffinityEvent(CompanionAffinityEventQuestScript akSender, Var[] akArgs)
	; cast akSender to figure out the eventID
	; akArgs:
	; 0: Quest
	; 1: Sender (TopicInfo or Quest)
	; 2: eventID
	Quest eventQuest = akArgs[0] as Quest
	ScriptObject sender = akArgs[1] as ScriptObject
	int eventID = akArgs[2] as int

	debug.trace(self + " CompanionAffinityEvent received: " + eventQuest + ", " + sender + ", " + eventID)

	if eventID == -1
		debug.trace(self + " WARNING - uninitialized eventID from " + sender)
		return
	endif

	; send to correct quest function
	if sender is TopicInfo
		;...

	elseif sender is Quest

		if eventQuest == DLC01MQ01
			HandleQuestStageBump_DLC01MQ01(eventQuest, eventID)
		elseif eventQuest == DLC01MQ02
			HandleQuestStageBump_DLC01MQ02(eventQuest, eventID)
		elseif eventQuest == DLC01MQ04
			HandleQuestStageBump_DLC01MQ04(eventQuest, eventID)
		elseif eventQuest == DLC01MQ05
			HandleQuestStageBump_DLC01MQ05(eventQuest, eventID)
		elseif eventQuest == DLC01DialogueQuest
			HandleQuestStageBump_DLC01DialogueQuest(eventQuest, eventID)
		elseif eventQuest == DLC01MQPostQuestRadiantAssault01
			HandleQuestStageBump_DLC01MQPostQuestRadiantAssault01(eventQuest, eventID)
		elseif eventQuest == DLC01MQPostQuestRadiantAssault02
			HandleQuestStageBump_DLC01MQPostQuestRadiantAssault02(eventQuest, eventID)
		elseif eventQuest == DLC01MQPostQuestRadiantAssault03_Min
			HandleQuestStageBump_DLC01MQPostQuestRadiantAssault03_Min(eventQuest, eventID)
		elseif eventQuest == DLC01MQPostQuestRadiantAssault04_Inst
			HandleQuestStageBump_DLC01MQPostQuestRadiantAssault04_Inst(eventQuest, eventID)
		elseif eventQuest == DLC01MQPostQuestRadiantAssault05_BOS
			HandleQuestStageBump_DLC01MQPostQuestRadiantAssault05_BOS(eventQuest, eventID)
		elseif eventQuest == DLC03MQ01
			HandleQuestStageBump_DLC03MQ01(eventQuest, eventID)
		elseif eventQuest == DLC03MQ02
			HandleQuestStageBump_DLC03MQ02(eventQuest, eventID)
		elseif eventQuest == DLC03MQ03
			HandleQuestStageBump_DLC03MQ03(eventQuest, eventID)
		elseif eventQuest == DLC03MQ05
			HandleQuestStageBump_DLC03MQ05(eventQuest, eventID)
		elseif eventQuest == DLC03MQ06
			HandleQuestStageBump_DLC03MQ06(eventQuest, eventID)
		elseif eventQuest == DLC03MQ06a
			HandleQuestStageBump_DLC03MQ06a(eventQuest, eventID)
		elseif eventQuest == DLC03MQPostQuest
			HandleQuestStageBump_DLC03MQPostQuest(eventQuest, eventID)
		elseif eventQuest == DLC03AcadiaM01
			HandleQuestStageBump_DLC03AcadiaM01(eventQuest, eventID)
		elseif eventQuest == DLC03AtomM01
			HandleQuestStageBump_DLC03AtomM01(eventQuest, eventID)
		elseif eventQuest == DLC03CoA_DialogueNucleusEntrance
			HandleQuestStageBump_DLC03CoA_DialogueNucleusEntrance(eventQuest, eventID)
		elseif eventQuest == DLC03AtomM02
			HandleQuestStageBump_DLC03AtomM02(eventQuest, eventID)
		elseif eventQuest == DLC03FarHarborFF01
			HandleQuestStageBump_DLC03FarHarborFF01(eventQuest, eventID)
		elseif eventQuest == DLC03FarHarborFF02
			HandleQuestStageBump_DLC03FarHarborFF02(eventQuest, eventID)
		elseif eventQuest == DLC03FarHarborFF03a
			HandleQuestStageBump_DLC03FarHarborFF03a(eventQuest, eventID)
		elseif eventQuest == DLC03FarHarborFF03b
			HandleQuestStageBump_DLC03FarHarborFF03b(eventQuest, eventID)
		elseif eventQuest == DLC03FarHarborFF03c
			HandleQuestStageBump_DLC03FarHarborFF03c(eventQuest, eventID)
		elseif eventQuest == DLC03FarHarborM01
			HandleQuestStageBump_DLC03FarHarborM01(eventQuest, eventID)
		elseif eventQuest == DLC03FarHarborM03
			HandleQuestStageBump_DLC03FarHarborM03(eventQuest, eventID)
		elseif eventQuest == DLC03FarHarborS01
			HandleQuestStageBump_DLC03FarHarborS01(eventQuest, eventID)
		elseif eventQuest == DLC03FarHarborS02
			HandleQuestStageBump_DLC03FarHarborS02(eventQuest, eventID)
		elseif eventQuest == DLC03FarHarborS03
			HandleQuestStageBump_DLC03FarHarborS03(eventQuest, eventID)
		elseif eventQuest == DLC03CoA_FFNucleus01
			HandleQuestStageBump_DLC03CoA_FFNucleus01(eventQuest, eventID)
		elseif eventQuest == DLC03CoA_FFNucleus02
			HandleQuestStageBump_DLC03CoA_FFNucleus02(eventQuest, eventID)
		elseif eventQuest == DLC03CoA_FFNucleus03
			HandleQuestStageBump_DLC03CoA_FFNucleus03(eventQuest, eventID)
		elseif eventQuest == DLC03AcadiaM02
			HandleQuestStageBump_DLC03AcadiaM02(eventQuest, eventID)
		elseif eventQuest == DLC03AcadiaM03
			HandleQuestStageBump_DLC03AcadiaM03(eventQuest, eventID)
		elseif eventQuest == DLC03AcadiaDialogue
			HandleQuestStageBump_DLC03AcadiaDialogue(eventQuest, eventID)
		elseif eventQuest == DLC03AcadiaM04
			HandleQuestStageBump_DLC03AcadiaM04(eventQuest, eventID)
		elseif eventQuest == DLC03Acadia_BoS
			HandleQuestStageBump_DLC03Acadia_BoS(eventQuest, eventID)
		elseif eventQuest == DLC03Acadia_Institute
			HandleQuestStageBump_DLC03Acadia_Institute(eventQuest, eventID)
		elseif eventQuest == DLC03DialogueNakanoResidence
			HandleQuestStageBump_DLC03DialogueNakanoResidence(eventQuest, eventID)
		elseif eventQuest == DLC03DialogueKasumiAcadia
			HandleQuestStageBump_DLC03DialogueKasumiAcadia(eventQuest, eventID)
		elseif eventQuest == DLC03DialogueDiMA
			HandleQuestStageBump_DLC03DialogueDiMA(eventQuest, eventID)
		elseif eventQuest == DLC03DialogueNick
			HandleQuestStageBump_DLC03DialogueNick(eventQuest, eventID)
		elseif eventQuest == DLC03CoA_DialogueNucleus
			HandleQuestStageBump_DLC03CoA_DialogueNucleus(eventQuest, eventID)
		elseif eventQuest == DLC03_V118_PearlHiring
			HandleQuestStageBump_DLC03_V118_PearlHiring(eventQuest, eventID)
		elseif eventQuest == DLC03_V118_Intro
			HandleQuestStageBump_DLC03_V118_Intro(eventQuest, eventID)
		elseif eventQuest == DLC03_V118_Quest
			HandleQuestStageBump_DLC03_V118_Quest(eventQuest, eventID)
		elseif eventQuest == DLC03_V118_ClueTracker
			HandleQuestStageBump_DLC03_V118_ClueTracker(eventQuest, eventID)
		elseif eventQuest == DLC03DialogueV118
			HandleQuestStageBump_DLC03DialogueV118(eventQuest, eventID)
		elseif eventQuest == DLC03_ADV017
			HandleQuestStageBump_DLC03_ADV017(eventQuest, eventID)
		elseif eventQuest == DLC03DialogueFarHarbor
			HandleQuestStageBump_DLC03DialogueFarHarbor(eventQuest, eventID)
		elseif eventQuest == DLC03DialogueFarHarborPostMQ05Avery
			HandleQuestStageBump_DLC03DialogueFarHarborPostMQ05Avery(eventQuest, eventID)
		elseif eventQuest == DLC03DialogueFarHarborPostQuest
			HandleQuestStageBump_DLC03DialogueFarHarborPostQuest(eventQuest, eventID)
		elseif eventQuest == DLC06MQ03
			HandleQuestStageBump_DLC06MQ03(eventQuest, eventID)
		elseif eventQuest == DLC06E01
			HandleQuestStageBump_DLC06E01(eventQuest, eventID)
		elseif eventQuest == DLC06E02
			HandleQuestStageBump_DLC06E02(eventQuest, eventID)
		elseif eventQuest == DLC06E03
			HandleQuestStageBump_DLC06E03(eventQuest, eventID)
		elseif eventQuest == DLC06E04
			HandleQuestStageBump_DLC06E04(eventQuest, eventID)
		elseif eventQuest == DLC06DialogueVault88
			HandleQuestStageBump_DLC06DialogueVault88(eventQuest, eventID)
		else
			; unhandled quest - but not an error once DLC exists
			debug.trace(self + " CompanionAffinityEvent: WARNING - unhandled quest stage bump " + eventQuest)
		endif
	endif
endEvent

function HandleQuestStageBump_DLC01MQ01(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC01MQ01
		if eventID == 1
			; INFO/STAGE 100 on DLC01MQ01
			; DESCRIPTION: Player was sympathetic to learn Ada lost her whole caravan, saying "Sorry for your loss."

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 110 on DLC01MQ01
			; DESCRIPTION: Player saying Ada "paid the price" when she and her caravan decided to stay in the Commonwealth a little bit longer and everyone but Ada ended up dead.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 120 on DLC01MQ01
			; DESCRIPTION: Player agrees to help Ada on her mission against the Mechanist.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 4
			; INFO/STAGE 130 on DLC01MQ01
			; DESCRIPTION: Player says this isn't their fight when Ada asks them for help against the Mechanist.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - DLC01MQ01 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC01MQ02(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC01MQ02
		if eventID == 1
			; INFO/STAGE 100 on DLC01MQ02
			; DESCRIPTION: Player is positive about the information Ada has deduced from installing the Mechanist radar beacon on herself.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 110 on DLC01MQ02
			; DESCRIPTION: Player is negative about Ada not being able to find enough information from installing the Mechanist radar beacon on her, calling it "useless".

			;DLC04 COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - DLC01MQ02 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC01MQ04(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC01MQ04
		if eventID == 1
			; INFO/STAGE 102 on DLC01MQ04
			; DESCRIPTION: Player cracked a joke that "a little lemon juice and steel wool" could fix the Rust Devils (poking fun at a Raider group name)

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 141 on DLC01MQ04
			; DESCRIPTION: Player is speaking to Jezebel's head on the machine in the Rust Devil base. After Jez greets asking what player is doing there, Player responds with "Getting ready to crack open your dome to get the Radar Beacon"

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 142 on DLC01MQ04
			; DESCRIPTION: Jezebel offers to help Player if Player agrees to reciprocate. Player is eager for the help, and heartily agrees.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 4
			; INFO/STAGE 143 on DLC01MQ04
			; DESCRIPTION: Jezebel offers to help Player if Player agrees to reciprocate. Instead, Player threatens to take what he needs.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 5
			; INFO/STAGE 182 on DLC01MQ04
			; DESCRIPTION: Player returned Radar Beacon to Ada. Ada is down on herself for allowing her caravan to get killed, and for making mistakes (making the Player's quest harder). Player says not to worry and is very supportive.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 6
			; INFO/STAGE 184 on DLC01MQ04
			; DESCRIPTION: Player returned Radar Beacon to Ada. Ada is down on herself for allowing her caravan to get killed, and for making mistakes (making the Player's quest harder). Player scolds her and basically says "yeah, quit making mistakes"

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 7
			; INFO/STAGE 186 on DLC01MQ04
			; DESCRIPTION: Ada still down in the dumps from the above and wishes she could turn off her personality mode in order to forget she cares about all the past mistakes, Player uses Speech Challenge to convince her that her personailty defines for as an individual and not to let it go.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 8
			; INFO/STAGE 188 on DLC01MQ04
			; DESCRIPTION: Ada still down in the dumps from the above and wishes she could turn off her personality mode in order to forget she cares about all the past mistakes, Player uses Speech Challenge to convince her that her personailty helps her think more creatively, so she should keep it.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 9
			; INFO/STAGE 202 on DLC01MQ04
			; DESCRIPTION: Jezebel has just explained that she's been doing the Mechanist's bidding - helping the people of the Commonwealth (the logic mistake has not be revealed yet). Player says "I knew there was some good left inside that brain." in a supportive fashion.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 10
			; INFO/STAGE 204 on DLC01MQ04
			; DESCRIPTION: Jezebel has just explained that she's been doing the Mechanist's bidding - helping the people of the Commonwealth (the logic mistake has not be revealed yet). Player accused Jezebel of lying saying he doesn't believe she'd even help a human.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 11
			; INFO/STAGE 206 on DLC01MQ04
			; DESCRIPTION: Player threatens to turn Jezebel into "brain pate" if she doesn't cooperate. This is after a long discussion about gaining access to Mechanist's Lair.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - DLC01MQ04 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC01MQ05(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC01MQ05
		if eventID == 1
			; INFO/STAGE 100 on DLC01MQ05
			; DESCRIPTION: Player lowered their weapon on the Mechanist's request so they can talk. Once the Mechanist comes out and entered dialogue, the very first choice the player makes is "You shouldn't have trusted me" and starts combat. All the player knows about the Mechanist is that her robots are destructive and killing people, but in all of their eyebot interactions, the Mechanist always speaks as if she is the hero and the player is the villain.

			;DLC04 COMPANIONS: 
			Bria_Loves()

		elseif eventID == 2
			; INFO/STAGE 110 on DLC01MQ05
			; DESCRIPTION: Player has opted to continue to speak nicely with the Mechanist after she's left the safety of her room.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 3
			; INFO/STAGE 130 on DLC01MQ05
			; DESCRIPTION: Player lets the Mechanist live. Mechanist is a good person, who genuinely wanted to help, but due to her reclusive nature, she wasn't aware that her robots were acting out on their own.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 4
			; INFO/STAGE 140 on DLC01MQ05
			; DESCRIPTION: Player has opted to kill the Mechanist. Player may or may not have known at this point that the Mechanist was really a good person. They will be able to find this out if they search the area for terminals.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 5
			; INFO/STAGE 120 on DLC01MQ05
			; DESCRIPTION: Player has chosen to be rude to the Mechanist two times in a row.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - DLC01MQ05 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC01DialogueQuest(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC01DialogueQuest
		if eventID == 1
			; INFO/STAGE 11 on DLC01DialogueQuest
			; DESCRIPTION: Player is saying thank you for the Mechanist suit Isabel just gave them.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 12 on DLC01DialogueQuest
			; DESCRIPTION: Player is being mean, telling Isabel to "get lost" when she wants to talk to them once they've gotten her to stand down and taken control of her lair.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 60 on DLC01DialogueQuest
			; DESCRIPTION: Player is being nice to isabel, trying to get her to say more about herself post quest. "You never know until you tell me."

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 4
			; INFO/STAGE 70 on DLC01DialogueQuest
			; DESCRIPTION: Player is being uncaring… Isabel is reflecting on how she could have made a difference for the better and the player is saying they don’t have time for this.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 5
			; INFO/STAGE 80 on DLC01DialogueQuest
			; DESCRIPTION: Player is being nice to Isabel post quest, telling her, at least she tried to do some good, even if it backfired.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 6
			; INFO/STAGE 90 on DLC01DialogueQuest
			; DESCRIPTION: Player is being mean to Isabel, saying she's only created a symbol of terror and sarcastically telling her "way to go."

			;DLC04 COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - DLC01DialogueQuest got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC01MQPostQuestRadiantAssault01(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC01MQPostQuestRadiantAssault01
		if eventID == 1
			; INFO/STAGE  on DLC01MQPostQuestRadiantAssault01
			; DESCRIPTION: Player asked Isabel/Ada to locate rogue robots to stop them from attacking more people.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - DLC01MQPostQuestRadiantAssault01 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC01MQPostQuestRadiantAssault02(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC01MQPostQuestRadiantAssault02
		if eventID == 1
			; INFO/STAGE  on DLC01MQPostQuestRadiantAssault02
			; DESCRIPTION: Player asked Isabel/Ada to locate rogue robots to stop them from attacking more people.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - DLC01MQPostQuestRadiantAssault02 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC01MQPostQuestRadiantAssault03_Min(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC01MQPostQuestRadiantAssault03_Min
		if eventID == 1
			; INFO/STAGE  on DLC01MQPostQuestRadiantAssault03_Min
			; DESCRIPTION: Player asked Isabel/Ada to locate rogue robots to stop them from attacking more people.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - DLC01MQPostQuestRadiantAssault03_Min got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC01MQPostQuestRadiantAssault04_Inst(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC01MQPostQuestRadiantAssault04_Inst
		if eventID == 1
			; INFO/STAGE  on DLC01MQPostQuestRadiantAssault04_Inst
			; DESCRIPTION: Player asked Isabel/Ada to locate rogue robots to stop them from attacking more people.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - DLC01MQPostQuestRadiantAssault04_Inst got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC01MQPostQuestRadiantAssault05_BOS(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC01MQPostQuestRadiantAssault05_BOS
		if eventID == 1
			; INFO/STAGE  on DLC01MQPostQuestRadiantAssault05_BOS
			; DESCRIPTION: Player asked Isabel/Ada to locate rogue robots to stop them from attacking more people.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - DLC01MQPostQuestRadiantAssault05_BOS got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03MQ01(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03MQ01
		if eventID == 1
			; INFO/STAGE 6 on DLC03MQ01
			; DESCRIPTION: Player jokes around with Ellie about the case. "The only thing I'm ready for is danger and awesome."

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 7 on DLC03MQ01
			; DESCRIPTION: Player jokes around with Ellie again. "So is the fedora and trench-coat mandatory when solving these cases? 'Cause I'm thinking smoking pipe and British accent..."

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 3
			; INFO/STAGE 123 on DLC03MQ01
			; DESCRIPTION: Player hits up Kenji Nakano for money before he'll look for the missing daughter.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 4
			; INFO/STAGE 312 on DLC03MQ01
			; DESCRIPTION: Player tells the Nakano's that synths are Institute Property

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 5
			; INFO/STAGE 313 on DLC03MQ01
			; DESCRIPTION: Player tell the Nakano's that synths are people too

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 6
			; INFO/STAGE 314 on DLC03MQ01
			; DESCRIPTION: Player tell the Nakano's that synths are abominations

			;DLC04 COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - DLC03MQ01 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03MQ02(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03MQ02
		if eventID == 1
			; INFO/STAGE 21 on DLC03MQ02
			; DESCRIPTION: Agree that the Children of Atom should be killed. Extremely aggressive stand against an arguably insane cult.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 22 on DLC03MQ02
			; DESCRIPTION: Just met Old Longfellow who started bossing the player around. The player chooses to say back, "Don't order me around, old man." Rude, but provoked.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 23 on DLC03MQ02
			; DESCRIPTION: Just met a confrontational Children of Atom preacher. The first thing the player says to them is they're crazy.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 4
			; INFO/STAGE 24 on DLC03MQ02
			; DESCRIPTION: Just met a confrontational Children of Atom preacher with Old Longfellow. The player tells Longfellow to just shoot her.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 5
			; INFO/STAGE 25 on DLC03MQ02
			; DESCRIPTION: Just met a confrontational Children of Atom preacher with Old Longfellow. The player tells Longfellow to calm down and tries to defuse the situation.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 6
			; INFO/STAGE 26 on DLC03MQ02
			; DESCRIPTION: Player tells the Children of Atom zealot that he'd like to sign up and join the Children of Atom.

			;DLC04 COMPANIONS: 
			Bria_Hates()

		elseif eventID == 7
			; INFO/STAGE 565 on DLC03MQ02
			; DESCRIPTION: After meeting a Children of Atom zealot, the player kills her in cold blood. She was spouting off dangerous rhetoric, but she did nothing directly threatening.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - DLC03MQ02 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03MQ03(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03MQ03
		if eventID == 1
			; INFO/STAGE 121 on DLC03MQ03
			; DESCRIPTION: Player is kind to Kasumi and treats her with compassion

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 122 on DLC03MQ03
			; DESCRIPTION: Player tries to convince Kasumi that she's not a synth and that Kenji and Rei are her parents

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 3
			; INFO/STAGE 123 on DLC03MQ03
			; DESCRIPTION: Player tries to convince Kasumi that she's not a synth by explaining that she's just confused/having an identity crisis

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 4
			; INFO/STAGE 126 on DLC03MQ03
			; DESCRIPTION: Player offers to help Kasumi investigate DiMA

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 5
			; INFO/STAGE 127 on DLC03MQ03
			; DESCRIPTION: Player tells Kasumi that investigating DiMA isn't his problem

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 6
			; INFO/STAGE 128 on DLC03MQ03
			; DESCRIPTION: Player jokes around and tells Kasumi that mass-murder is very soothing

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 7
			; INFO/STAGE 131 on DLC03MQ03
			; DESCRIPTION: Player persuades DiMA into telling him the truth by offering to help him

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 8
			; INFO/STAGE 132 on DLC03MQ03
			; DESCRIPTION: Player strong-arms DiMA into telling him the truth by demanding answers

			;DLC04 COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - DLC03MQ03 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03MQ05(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03MQ05
		if eventID == 1
			; INFO/STAGE 21 on DLC03MQ05
			; DESCRIPTION: DiMA murdered and replace a leader of Far Harbor in order to ensure there is a peace on the island. The player says that DiMA did the right thing.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 22 on DLC03MQ05
			; DESCRIPTION: DiMA murdered and replace a leader of Far Harbor in order to ensure there is a peace on the island. The player says that DiMA is a fraud (because he poses as a holy man type).

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 23 on DLC03MQ05
			; DESCRIPTION: The player tries to convince DiMA to turn himself in for murdering the Far Harbor leader.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 4
			; INFO/STAGE 24 on DLC03MQ05
			; DESCRIPTION: Captain Avery breaks down after discovering she is a synth. The player offers his sympathies.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 5
			; INFO/STAGE 25 on DLC03MQ05
			; DESCRIPTION: The player has proof that DiMA has replaced Captain Avery with a synth. When asked by the local doctor what the player will do with this info, he chooses to "Minimize the damage".

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 6
			; INFO/STAGE 26 on DLC03MQ05
			; DESCRIPTION: The player has proof that DiMA has replaced Captain Avery with a synth. When asked by the local doctor what the player will do with this info, he chooses to "Make DiMA pay".

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 7
			; INFO/STAGE 27 on DLC03MQ05
			; DESCRIPTION: Captain Avery is exposed a synth by an angry mob. The player defends her saying she shouldn't be killed.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 8
			; INFO/STAGE 28 on DLC03MQ05
			; DESCRIPTION: Captain Avery is exposed a synth by an angry mob. The player says that she should be exectuted.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 9
			; INFO/STAGE 29 on DLC03MQ05
			; DESCRIPTION: DiMA turns himself in for justice for his murder. An angry firebrand says that not only should DiMA be executed, but his settlement Acadia should be destroyed, as well. The player says, "Acadia should burn!"

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 10
			; INFO/STAGE 30 on DLC03MQ05
			; DESCRIPTION: There is a mob outisde of Acadia ready to attack for their replacing the Far Harbor leader with a synth. The residents of Acadia are innocent of any wrong doing, though. The player is eager to attack Acadia with the mob and says so.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 11
			; INFO/STAGE 31 on DLC03MQ05
			; DESCRIPTION: DiMA shares a plan to murder and replace Tektus (a militant cultist) with a synth to achieve a lasting peace on the island. An ends to a means (and as ends go, it's killing someone that's a big problem). The player agrees to go along with this plan.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 12
			; INFO/STAGE 110 on DLC03MQ05
			; DESCRIPTION: DiMA shares a plan to murder and replace Tektus (a militant cultist) with a synth to achieve a lasting peace on the island. An ends to a means (and as ends go, it's killing someone that's a big problem). The player refuses to do DiMA's dirty work.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 13
			; INFO/STAGE 100 on DLC03MQ05
			; DESCRIPTION: The player confronts DiMA about his murder and replacement of Captain Avery. Then he tells DiMA he's going to tell Far Harbor (which could result in a lynch mob - although it's by many people's standards a morale act).

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 14
			; INFO/STAGE 775 on DLC03MQ05
			; DESCRIPTION: DiMA turns himself in for justice for his murder. An angry firebrand says that not only should DiMA be executed, but his settlement Acadia should be destroyed, as well. The player tries to talk down the firebrand and save the people of Acadia.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 15
			; INFO/STAGE 820 on DLC03MQ05
			; DESCRIPTION: There is a mob outisde of Acadia ready to attack for their replacing the Far Harbor leader with a synth. The residents of Acadia are innocent of any wrong doing, though. The player tries to stop the attack, but at this point there's no hope of stopping it.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 16
			; INFO/STAGE 36 on DLC03MQ05
			; DESCRIPTION: Avery just asked for the player to keep a secret that ensures the town won't attack Acadia (and execute DiMA). The player agrees to keep DiMA's murder secret.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 17
			; INFO/STAGE 37 on DLC03MQ05
			; DESCRIPTION: Avery just asked for the player to keep a secret that ensures the town won't attack Acadia (and execute DiMA). The player tries to extort bribe money out of Avery for his silence.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - DLC03MQ05 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03MQ06(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03MQ06
		if eventID == 1
			; INFO/STAGE 190 on DLC03MQ06
			; DESCRIPTION: Player gave Tektus the key to the nukes (he has no intention of using it to blow up the Children. The player has effectively closed out the "Nuke the Children" path)

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 200 on DLC03MQ06
			; DESCRIPTION: Player convinced the High Confessor its time for Division - death through a Nucleus explosion - but hasn't turned the key yet. This will kill everyone in the Nucleus (though it is part of their religious precepts) 

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 1
			; INFO/STAGE 103 on DLC03MQ06
			; DESCRIPTION: Player launched the nuke to destroy the Children of Atom, but did not convince them it was time for Division first (effectively murdering all of them against their will)

			;DLC04 COMPANIONS: 
			Bria_Loves()

		elseif eventID == 1
			; INFO/STAGE 23 on DLC03MQ06
			; DESCRIPTION: Player told Captain Avery, leader of Far Harbor, about the wind farm kill switch code which could be used to destroy their town and informed her they won't use the it, keeping Far Harbor safe.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 24 on DLC03MQ06
			; DESCRIPTION: Player told Avery about the wind farm kill switch code, but said they haven't yet decided what they're planning to do with them.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 3
			; INFO/STAGE 25 on DLC03MQ06
			; DESCRIPTION: Player told Avery about the wind farm kill switch code and then extorted her for money (the player still hasn't agreed to not use it)

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 4
			; INFO/STAGE 50 on DLC03MQ06
			; DESCRIPTION: The player has brought down Far Harbor's wind turbine, killing the town.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - DLC03MQ06 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03MQ06a(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03MQ06a
		if eventID == 1
			; INFO/STAGE 97 on DLC03MQ06a
			; DESCRIPTION: While meeting with the High Confessor with the intention of replacing him with a synth, the player attempted to convince the High Confessor to leave the island instead of the player killing him. Tektus had been threatening player before the player made this offer.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 98 on DLC03MQ06a
			; DESCRIPTION: While meeting with the High Confessor with the intention of replacing him with a synth, the player attacked Tektus without attempting to convince the High Confessor to leave the island. Tektus had been threatening the player.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 99 on DLC03MQ06a
			; DESCRIPTION: While meeting with the High Confessor with the intention of replacing him with a synth, the player attempted to convince the High Confessor to leave the island instead of the player killing him. Tektus trusted the player in this case, coming without guards and respectfully asking for the player's help.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 4
			; INFO/STAGE 94 on DLC03MQ06a
			; DESCRIPTION: While meeting with the High Confessor with the intention of replacing him with a synth, the player attacked Tektus without attempting to convince the High Confessor to leave the island. Tektus trusted the player in this case, coming without guards and respectfully asking for the player's help.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - DLC03MQ06a got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03MQPostQuest(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03MQPostQuest
		if eventID == 1
			; INFO/STAGE 140 on DLC03MQPostQuest
			; DESCRIPTION: The player is reporting back to Kasumi after seeing DiMA's memories. Here, he expresses the believe that Acadia is worth protecting (from the threat posed by the conflict between Far Harbor and the Children of Atom)

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 145 on DLC03MQPostQuest
			; DESCRIPTION: Same sitution as above, but this time, the player goes the opposite direction and says "Acadia will burn. This can't continue." It's an implied threat that the player might personally wipe out all the synths, possibly because the idea of a synth refuge should nto be tolerated.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 146 on DLC03MQPostQuest
			; DESCRIPTION: This is a very dark moment in which Kasumi questions the player's involvement in the destruction of both the Children of Atom and Far Harbor. The player can be sarcastic and say how much he enjoyed murdering all of those people. Yes, it's pretty messed up.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 4
			; INFO/STAGE 191 on DLC03MQPostQuest
			; DESCRIPTION: Just after Kasumi has been happily reunited with her parents, the player decides to out her as a synth, which shocks and devastates Kenji and Rei Nakano. Afterward, the player can explain why he made this choice. In this specific case, the player said it was because Kenji and Rei deserved to know the truth.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 5
			; INFO/STAGE 192 on DLC03MQPostQuest
			; DESCRIPTION: Same situation as above but this time the player says he outed Kasumi as a synth because he wants Kasumi's parents to accept her for who she really is. The vibe here is more about acceptance, reconciliation, and healing because the real (human) Kasumi is obviously dead.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		else
			debug.trace(self + " WARNING - DLC03MQPostQuest got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03AcadiaM01(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03AcadiaM01
		if eventID == 1
			; INFO/STAGE 405 on DLC03AcadiaM01
			; DESCRIPTION: The player either failed a speech challenge to avoid violence against some Trappers, or chose to attack the Trapers and initiate violence. Characters who like violence should like this outcome.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 440 on DLC03AcadiaM01
			; DESCRIPTION: The player succeeded at a speech challenge to avoid combat with some Trappers and thus resolve the situation peacefully

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 3
			; INFO/STAGE 550 on DLC03AcadiaM01
			; DESCRIPTION: When offered caps as a reward, the player asked for more caps.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - DLC03AcadiaM01 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03AtomM01(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03AtomM01
		if eventID == 1
			; INFO/STAGE 146 on DLC03AtomM01
			; DESCRIPTION: After having their vision quest, when asked about it by the Grand Zealot of the Children of Atom, the player chose to make a joke about seeing a beautiful Lurk-taur ("You know, half woman, half Mirelurk") instead of answering the question

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 147 on DLC03AtomM01
			; DESCRIPTION: After being told the player was led by a messenger from Atom and that they were meant to join the family, the player opted to join the Children of Atom, but without fervor. Stated "Sure. I'm willing to learn."

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 3
			; INFO/STAGE 148 on DLC03AtomM01
			; DESCRIPTION: After being told the player was led by a messenger from Atom and that they were meant to join the family, the player chose to join the Children of Atom, but with more fervor. Stated "I am ready to follow His (Atom's) path."

			;DLC04 COMPANIONS: 
			Bria_Hates()

		elseif eventID == 4
			; INFO/STAGE 149 on DLC03AtomM01
			; DESCRIPTION: After being told the player was led by a messenger from Atom and that they were meant to join the family, the player declined joining the Children of Atom.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - DLC03AtomM01 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03CoA_DialogueNucleusEntrance(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03CoA_DialogueNucleusEntrance
		if eventID == 1
			; INFO/STAGE 62 on DLC03CoA_DialogueNucleusEntrance
			; DESCRIPTION: When asked if the player if from Far Harbor, player replied "Far Harbor can go rot."

			;DLC04 COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - DLC03CoA_DialogueNucleusEntrance got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03AtomM02(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03AtomM02
		if eventID == 1
			; INFO/STAGE 520 on DLC03AtomM02
			; DESCRIPTION: The player has been sent to locate Sister Gwyneth, a heretic who fled from the Nucleus. Upon finding her, and with a cry of "Die, heretic!" the player attacks Sister Gwyneth, who never threatened violence. This is a bloodthuirsty choice but it was the player's mission to kill her.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 525 on DLC03AtomM02
			; DESCRIPTION: The player tries to persuade Sister Gwyneth to return to the Nucleus to atone for her sins against Atom. This is a peaceful alternative to killing her and shows that the player seems to truly believe in Atom

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 3
			; INFO/STAGE 535 on DLC03AtomM02
			; DESCRIPTION: The player tries to persuade Sister Gwyneth to leave the island for good. Like the above line, this is another peaceful alternative to killing Sister Gwyneth, but in this case it's a less pro-Atom choice (because the player is not telling Gwyneth that she's wrong), suggesting the player does not care as much about the Cult of Atom as he might in the above choice.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 4
			; INFO/STAGE 610 on DLC03AtomM02
			; DESCRIPTION: The player says "Glory to Atom!" after being congratulated on the success of his mission to deal with Sister Gwyneth. This shows a righteous zeal, and the player here is clearly choosing to roleplay a devout follower of Atom.

			;DLC04 COMPANIONS: 
			Bria_Hates()

		elseif eventID == 5
			; INFO/STAGE 620 on DLC03AtomM02
			; DESCRIPTION: In contrast to the above, the player is sarcastic and mocks the faith of Atom after being congratulated on the successful completion of his mission. This earns an angry rebuke from Grand Zealot Richter and shows the player is not taking the Children of Atom very seriously.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - DLC03AtomM02 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03FarHarborFF01(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03FarHarborFF01
		if eventID == 1
			; INFO/STAGE 155 on DLC03FarHarborFF01
			; DESCRIPTION: When offered caps as a reward, the player asked for more caps.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 255 on DLC03FarHarborFF01
			; DESCRIPTION: When offered caps as a reward, the player asked for more caps.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 355 on DLC03FarHarborFF01
			; DESCRIPTION: The player said he didn't care about a woman's family history and her desire to avenge the deaths of those she lost - he just wants to get paid.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - DLC03FarHarborFF01 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03FarHarborFF02(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03FarHarborFF02
		if eventID == 1
			; INFO/STAGE 310 on DLC03FarHarborFF02
			; DESCRIPTION: The player found the corpse of Howard Dunbar, a citizen of Far Harbor who was out trying to repair some Fog Condensers when he was killed by Mirelurks. The player calls him a hero.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 320 on DLC03FarHarborFF02
			; DESCRIPTION: Same as above, but this time the plaeyr is insensitive and says that Howard is "Mirelurk food"

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 330 on DLC03FarHarborFF02
			; DESCRIPTION: When offered caps as a reward, the player asked for more caps.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - DLC03FarHarborFF02 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03FarHarborFF03a(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03FarHarborFF03a
		if eventID == 1
			; INFO/STAGE 250 on DLC03FarHarborFF03a
			; DESCRIPTION: The player was contracted to get power tools for the Mariner (who needs it to help defend the town). Instead, he agrees to sell the tools to someone else for a TON more money.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 22 on DLC03FarHarborFF03a
			; DESCRIPTION: The player was contracted to get power tools for the Mariner (who needs it to help defend the town). He's offered a ton of money to sell it to someone else and refuses.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 3
			; INFO/STAGE 290 on DLC03FarHarborFF03a
			; DESCRIPTION: An innocent trader offered the player a bunch of money to sell something to him and renege on a contract. The player killed the trader.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - DLC03FarHarborFF03a got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03FarHarborFF03b(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03FarHarborFF03b
		if eventID == 1
			; INFO/STAGE 21 on DLC03FarHarborFF03b
			; DESCRIPTION: The player learns the Mariner has terminal cancer. He offers his sympathy and support.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 22 on DLC03FarHarborFF03b
			; DESCRIPTION: A distraught Mariner is wondering to do with her last remaining weeks of life. The player says you should, "Stay with friends".

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 3
			; INFO/STAGE 23 on DLC03FarHarborFF03b
			; DESCRIPTION: A distraught Mariner is wondering to do with her last remaining weeks of life. The player says you should, "End life on your terms."

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 4
			; INFO/STAGE 24 on DLC03FarHarborFF03b
			; DESCRIPTION: A distraught Mariner is wondering to do with her last remaining weeks of life. The player says you should, "Leave town with dignity." This is what she was leaning towards.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - DLC03FarHarborFF03b got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03FarHarborFF03c(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03FarHarborFF03c
		if eventID == 1
			; INFO/STAGE 21 on DLC03FarHarborFF03c
			; DESCRIPTION: After helping the Mariner for the 3rd time in helping reinforce the town's wall, the players says he's sick of working on the wall (which isn’t completely unreasonably, if rude to say).

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 22 on DLC03FarHarborFF03c
			; DESCRIPTION: The terminally dying Mariner is depressed that her fellow citizens squabble instead of helping save each other's lives. The player says the community "should come together".

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 3
			; INFO/STAGE 23 on DLC03FarHarborFF03c
			; DESCRIPTION: The terminally dying Mariner is depressed that her fellow citizens squabble instead of helping save each other's lives. The player says it's OK to "Protect your interests".

			;DLC04 COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - DLC03FarHarborFF03c got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03FarHarborM01(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03FarHarborM01
		if eventID == 1
			; INFO/STAGE 21 on DLC03FarHarborM01
			; DESCRIPTION: The player is asked why he's been helping the people of Far Harbor. He says, "You're good people."

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 22 on DLC03FarHarborM01
			; DESCRIPTION: The player is asked why he's been helping the people of Far Harbor. He says he is "Planning to stop" helping.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 23 on DLC03FarHarborM01
			; DESCRIPTION: The player is asked why he's been helping the people of Far Harbor. He says, "For the caps."

			;DLC04 COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - DLC03FarHarborM01 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03FarHarborM03(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03FarHarborM03
		if eventID == 1
			; INFO/STAGE 21 on DLC03FarHarborM03
			; DESCRIPTION: Avery thanks the player profusely for saving the town. The player says he did it to help his friends.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 22 on DLC03FarHarborM03
			; DESCRIPTION: Avery thanks the player profusely for saving the town. The player says he did it for the money.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - DLC03FarHarborM03 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03FarHarborS01(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03FarHarborS01
		if eventID == 1
			; INFO/STAGE 21 on DLC03FarHarborS01
			; DESCRIPTION: Mitch is hesitating big time in asking the player for help for his Uncle Ken. The players says he'd do anything for family if he was in Mitch's shoes.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 22 on DLC03FarHarborS01
			; DESCRIPTION: Mitch is hesitating big time in asking the player for help for his Uncle Ken. The players says pride is going to get Mitch killed one day.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 23 on DLC03FarHarborS01
			; DESCRIPTION: The player is confronted by a slightly unhinged Uncle Ken who threatens and tries to intimidate the player. The player calls the old geezer crazy.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 4
			; INFO/STAGE 24 on DLC03FarHarborS01
			; DESCRIPTION: Uncle Ken and the player fight off raiders together. And still Uncle Ken refuses to leave his farm. The player angrily says "You're going to die".

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 5
			; INFO/STAGE 25 on DLC03FarHarborS01
			; DESCRIPTION: Uncle Ken and the player fight off raiders together. And still Uncle Ken refuses to leave his farm. The player tries to use Charisma to convince him to leave for the safety of town.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 6
			; INFO/STAGE 26 on DLC03FarHarborS01
			; DESCRIPTION: When trying to convince Uncle Ken to go back to town, the player threatens to take Uncle Ken by force.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - DLC03FarHarborS01 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03FarHarborS02(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03FarHarborS02
		if eventID == 1
			; INFO/STAGE 21 on DLC03FarHarborS02
			; DESCRIPTION: A young girl offers 14 1/2 caps to help her. She sounds very earnest. The player says he'll help for free.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 22 on DLC03FarHarborS02
			; DESCRIPTION: A young girl offers 14 1/2 caps to help her. She sounds very earnest. The player blows her off.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 23 on DLC03FarHarborS02
			; DESCRIPTION: A young girl offers a pretty sophisticated plan to help her town survive. The players says she's a remarkable girl.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 4
			; INFO/STAGE 24 on DLC03FarHarborS02
			; DESCRIPTION: A cannibalistic raider offers a Faustian bargain to the player. Take these caps and lure your friends here so I can eat them. The player takes the caps.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 5
			; INFO/STAGE 25 on DLC03FarHarborS02
			; DESCRIPTION: A cannibalistic raider offers a Faustian bargain to the player. Take these caps and lure your friends here so I can eat them. The player leaves in peace and allows him to keep his land.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 6
			; INFO/STAGE 26 on DLC03FarHarborS02
			; DESCRIPTION: The player warns Far Harbor that there's a dangerous cannibal on the land they want to settle. The player urges them to chase the cannibal off.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 7
			; INFO/STAGE 27 on DLC03FarHarborS02
			; DESCRIPTION: The player warns Far Harbor that there's a dangerous cannibal on the land they want to settle. The player urges them to kill the raider.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 8
			; INFO/STAGE 325 on DLC03FarHarborS02
			; DESCRIPTION: The player warns Far Harbor that there's a dangerous cannibal on the land they want to settle. He then says they should let the raider keep his land.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - DLC03FarHarborS02 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03FarHarborS03(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03FarHarborS03
		if eventID == 1
			; INFO/STAGE 21 on DLC03FarHarborS03
			; DESCRIPTION: The Mariner says she's planning something she knows is crazy. She if the player ever does insane things. Player chooses "I like to play it safe"

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 22 on DLC03FarHarborS03
			; DESCRIPTION: The Mariner says she's planning something she knows is crazy. She if the player ever does insane things. Player chooses "The crazier the better"

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 23 on DLC03FarHarborS03
			; DESCRIPTION: The Mariner says she's planning something she knows is crazy. She if the player ever does insane things. Player chooses "I rely on logic"

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 4
			; INFO/STAGE 24 on DLC03FarHarborS03
			; DESCRIPTION: The Mariner and the player come across a mythical boogeyman that proves to be a hoax. If they reveal what they found, the Mariner will be a laughingstock. The player recommends they don't lie.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 5
			; INFO/STAGE 25 on DLC03FarHarborS03
			; DESCRIPTION: The Mariner and the player come across a mythical boogeyman that proves to be a hoax. If they reveal what they found, the Mariner will be a laughingstock. The player recommends they make up a suitably tall tale about their accomplishments. Total lies.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 6
			; INFO/STAGE 26 on DLC03FarHarborS03
			; DESCRIPTION: The Mariner and the player come across a mythical boogeyman that proves to be a hoax. If they reveal what they found, the Mariner will be a laughingstock. The player recommends telling a little white lie - they didn't find the mythic beast.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 7
			; INFO/STAGE 27 on DLC03FarHarborS03
			; DESCRIPTION: The Mariner is considering how to spend her few remaining weeks/days on earth. The player says she should help others.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 8
			; INFO/STAGE 28 on DLC03FarHarborS03
			; DESCRIPTION: The Mariner is considering how to spend her few remaining weeks/days on earth. The player says she should be selfish - and do what's right for her alone (and she deserves this for all her good deeds).

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 9
			; INFO/STAGE 29 on DLC03FarHarborS03
			; DESCRIPTION: The Mariner is considering how to spend her few remaining weeks/days on earth. The player recommends leaving a legacy behind.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - DLC03FarHarborS03 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03CoA_FFNucleus01(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03CoA_FFNucleus01
		if eventID == 1
			; INFO/STAGE 26 on DLC03CoA_FFNucleus01
			; DESCRIPTION: Zealot Ware, a friend of Brother Devin, a fasting Child of Atom, has suggested to the player that they dress up as a messenger from Atom in order to trick Devin into giving up his fast. The player has stated they think that sounds like blasphemy.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		else
			debug.trace(self + " WARNING - DLC03CoA_FFNucleus01 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03CoA_FFNucleus02(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03CoA_FFNucleus02
		if eventID == 1
			; INFO/STAGE 220 on DLC03CoA_FFNucleus02
			; DESCRIPTION: The player has been tasked by the High Confessor to investigate the loyalty of one of the Children of Atom. The player has found a note where the woman in question, Sister Aubert, questions the High Confessor's right to rule and vaguely threatens him, as she suspects him of having her lover killed. The player has found this note and handed it over to her to destroy.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 230 on DLC03CoA_FFNucleus02
			; DESCRIPTION: The player has been tasked by the High Confessor to investigate the loyalty of one of the Children of Atom. The player has found a note where the woman in question, Sister Aubert, questions the High Confessor's right to rule and vaguely threatens him, as she suspects him of having her lover killed. The player has found this note and demands caps for her (but has not yet agreed to give her the note or otherwise).

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 240 on DLC03CoA_FFNucleus02
			; DESCRIPTION: The player has been tasked by the High Confessor to investigate the loyalty of one of the Children of Atom. The player has found a note where the woman in question, Sister Aubert, questions the High Confessor's right to rule and vaguely threatens him, as she suspects him of having her lover killed. The player has found this note but informed Aubert she should flee.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 4
			; INFO/STAGE 300 on DLC03CoA_FFNucleus02
			; DESCRIPTION: The player has been tasked by the High Confessor to investigate the loyalty of one of the Children of Atom. The player has found a note where the woman in question, Sister Aubert, questions the High Confessor's right to rule and vaguely threatens him, as she suspects him of having her lover killed. The player has found this note but convinced the High Confessor that Aubert is not a threat.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 5
			; INFO/STAGE 310 on DLC03CoA_FFNucleus02
			; DESCRIPTION: The player has been tasked by the High Confessor to investigate the loyalty of one of the Children of Atom. The player has found a note where the woman in question, Sister Aubert, questions the High Confessor's right to rule and vaguely threatens him, as she suspects him of having her lover killed. The player has found this note and turned it over to the High Confessor, effectively signing Aubert's death warrant (although the player could've already told her to flee).

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 6
			; INFO/STAGE 320 on DLC03CoA_FFNucleus02
			; DESCRIPTION: The player has been tasked by the High Confessor to investigate the loyalty of one of the Children of Atom. The player has found a note where the woman in question, Sister Aubert, questions the High Confessor's right to rule and vaguely threatens him, as she suspects him of having her lover killed. The player informed the High Confessor that there is not evidence against Aubert, but did not pass the speech challenge convincing him she's not a threat.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - DLC03CoA_FFNucleus02 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03CoA_FFNucleus03(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03CoA_FFNucleus03
		if eventID == 1
			; INFO/STAGE 40 on DLC03CoA_FFNucleus03
			; DESCRIPTION: The player succesfully repaired the Nucleus' radiation decontamination arches.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 51 on DLC03CoA_FFNucleus03
			; DESCRIPTION: The player activated the decontamination arches for the first time, but was sprayed with a dangerous amount of irradiated water

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 3
			; INFO/STAGE 52 on DLC03CoA_FFNucleus03
			; DESCRIPTION: The player activated the decontamination arches for the first time, but fixed them so they remove radiation damage instead of inflicting it, against the wishes of the Children of Atom

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - DLC03CoA_FFNucleus03 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03AcadiaM02(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03AcadiaM02
		if eventID == 1
			; INFO/STAGE 100 on DLC03AcadiaM02
			; DESCRIPTION: Player has agreed to kill a Courser for the citizens of Acadia

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 20 on DLC03AcadiaM02
			; DESCRIPTION: Player tells Dejen he's killed Coursers before

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 220 on DLC03AcadiaM02
			; DESCRIPTION: Player jokes with Dejen, saying that the Courser killed him and now he's  a ghost, rather than just telling Dejen the job is done and Acadia is safe.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - DLC03AcadiaM02 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03AcadiaM03(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03AcadiaM03
		if eventID == 1
			; INFO/STAGE 30 on DLC03AcadiaM03
			; DESCRIPTION: Player repeatedly insists Faraday pay him extra for retrieving the storage drives

			;DLC04 COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - DLC03AcadiaM03 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03AcadiaDialogue(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03AcadiaDialogue
		if eventID == 1
			; INFO/STAGE 61 on DLC03AcadiaDialogue
			; DESCRIPTION: Player confronts Faraday about the mind wipe performed on Jule without her consent (it was done to save her life), but agrees it was the right thing to do

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 62 on DLC03AcadiaDialogue
			; DESCRIPTION: Player confronts Faraday about the mind wipe performed on Jule without her knowledge, and says there's no excuse for leaving her in that state

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - DLC03AcadiaDialogue got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03AcadiaM04(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03AcadiaM04
		if eventID == 3
			; INFO/STAGE 400 on DLC03AcadiaM04
			; DESCRIPTION: Player agrees to hand over evidence of the mind wipe to Cog, and keep it a secret from Jule

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 4
			; INFO/STAGE 410 on DLC03AcadiaM04
			; DESCRIPTION: Player tells Jule that she was mind-wiped without her permission

			;DLC04 COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - DLC03AcadiaM04 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03Acadia_BoS(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03Acadia_BoS
		if eventID == 1
			; INFO/STAGE 40 on DLC03Acadia_BoS
			; DESCRIPTION: Player tells Captain Kells about the existence of Acadia

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 500 on DLC03Acadia_BoS
			; DESCRIPTION: Player has helped the BoS destroy all the synths in Acadia

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 3
			; INFO/STAGE 180 on DLC03Acadia_BoS
			; DESCRIPTION: Player asks at the last minute whether there's some other way to deal with the situation, rather than wiping out the synths. The attack will still proceed after the player asks.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		else
			debug.trace(self + " WARNING - DLC03Acadia_BoS got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03Acadia_Institute(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03Acadia_Institute
		if eventID == 1
			; INFO/STAGE 40 on DLC03Acadia_Institute
			; DESCRIPTION: Player tells the Institute about the existence of Acadia

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 200 on DLC03Acadia_Institute
			; DESCRIPTION: Player has agreed to help the Institute reclaim all of the synths of Acadia

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 3
			; INFO/STAGE 180 on DLC03Acadia_Institute
			; DESCRIPTION: Player asks at the last minute whether there's another option for handling the situation, rather than forcibly reclaiming all the synths. The attack will still proceed after the player asks.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		else
			debug.trace(self + " WARNING - DLC03Acadia_Institute got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03DialogueNakanoResidence(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03DialogueNakanoResidence
		if eventID == 1
			; INFO/STAGE 100 on DLC03DialogueNakanoResidence
			; DESCRIPTION: Player goes to the trouble of returning to the Nakano's and telling them Kasumi is safe, but they're still working on convincing her to come home

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		else
			debug.trace(self + " WARNING - DLC03DialogueNakanoResidence got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03DialogueKasumiAcadia(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03DialogueKasumiAcadia
		if eventID == 1
			; INFO/STAGE 6 on DLC03DialogueKasumiAcadia
			; DESCRIPTION: Player reports back to Kasumi. Tell her not to worry. He'll get to the bottom of DiMA's secrets

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 7 on DLC03DialogueKasumiAcadia
			; DESCRIPTION: Player reports back to Kasumi. Tells her that he's going to keep anything he finds about DiMA for himself.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 8 on DLC03DialogueKasumiAcadia
			; DESCRIPTION: Player reports back to Kasumi. He jokes around about hoping that DiMA's memories aren't just going to be him starting at a wall or something.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - DLC03DialogueKasumiAcadia got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03DialogueDiMA(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03DialogueDiMA
		if eventID == 1
			; INFO/STAGE 106 on DLC03DialogueDiMA
			; DESCRIPTION: After DiMA introduces himself, Player calls DiMA out as a kidnapper and says he brainwashed Kasumi

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 107 on DLC03DialogueDiMA
			; DESCRIPTION: After DiMA introduces himself, Player jokes around, says he wants Kasumi returned home and also a pony

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 131 on DLC03DialogueDiMA
			; DESCRIPTION: DiMa asks if the player is a synth. Player admits that he suspects that he/she is.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 4
			; INFO/STAGE 132 on DLC03DialogueDiMA
			; DESCRIPTION: DiMa asks if the player is a synth. Player says he's a human. End of story.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 5
			; INFO/STAGE 133 on DLC03DialogueDiMA
			; DESCRIPTION: DiMa asks if the player is a synth. Player jokes around and says he looks like a different person if he squints hard in the mirror.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 6
			; INFO/STAGE 136 on DLC03DialogueDiMA
			; DESCRIPTION: DiMA asks the player what he thinks of synths. Player says they're impressive

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 7
			; INFO/STAGE 137 on DLC03DialogueDiMA
			; DESCRIPTION: DiMA asks the player what he thinks of synths. Player says he has no opinion

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 8
			; INFO/STAGE 138 on DLC03DialogueDiMA
			; DESCRIPTION: DiMA asks the player what he thinks of synths. Player says he thinks they're just machines.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 9
			; INFO/STAGE 71 on DLC03DialogueDiMA
			; DESCRIPTION: Player tells DiMA he's in the Railroad, DiMA objects because the Railroad changes synth identity - Player then says he never thought about it like that and apologizes

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 10
			; INFO/STAGE 72 on DLC03DialogueDiMA
			; DESCRIPTION: Player tells DiMA he's in the Railroad, DiMA objects because the Railroad changes synth identity - Player then says we protect them and we do what we have to

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 11
			; INFO/STAGE 73 on DLC03DialogueDiMA
			; DESCRIPTION: Player tells DiMA he's in the Railroad, DiMA objects because the Railroad changes synth identity - Player then says he's not here to debate, just to help

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 12
			; INFO/STAGE 76 on DLC03DialogueDiMA
			; DESCRIPTION: Player tells DiMA he's in the Institute, DiMA asks the player to give Acadia a chance. Player agrees to keep Acadia a secret from the Institute.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 13
			; INFO/STAGE 77 on DLC03DialogueDiMA
			; DESCRIPTION: Player tells DiMA he's in the Institute, DiMA asks the player to give Acadia a chance. Player says he won't agree to staying silent.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 14
			; INFO/STAGE 78 on DLC03DialogueDiMA
			; DESCRIPTION: Player tells DiMA he's in the Institute, DiMA asks the player to give Acadia a chance. Player says he'll think about it.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 15
			; INFO/STAGE 81 on DLC03DialogueDiMA
			; DESCRIPTION: Player tells DiMA he's in the Brotherhood of Steel, DiMA asks the player to give Acadia a chance. Player agrees to reserve judgment.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 16
			; INFO/STAGE 82 on DLC03DialogueDiMA
			; DESCRIPTION: Player tells DiMA he's in the Brotherhood of Steel, DiMA asks the player to give Acadia a chance. Player says synths are a threat to all humanity.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 17
			; INFO/STAGE 83 on DLC03DialogueDiMA
			; DESCRIPTION: Player tells DiMA he's in the Brotherhood of Steel, DiMA asks the player to give Acadia a chance. Player says he'll think about it.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 18
			; INFO/STAGE 123 on DLC03DialogueDiMA
			; DESCRIPTION: Player tells DiMA that the Institute has been destroyed.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 19
			; INFO/STAGE 51 on DLC03DialogueDiMA
			; DESCRIPTION: Player has the nuclear launch key, confronts DiMA, but tells DiMA that he'll ensure the Nucleus isn't destroyed

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 20
			; INFO/STAGE 52 on DLC03DialogueDiMA
			; DESCRIPTION: Player has the nuclear launch key, confronts DiMA, and tells DiMA that they should destroy the Children of Atom

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 21
			; INFO/STAGE 53 on DLC03DialogueDiMA
			; DESCRIPTION: Player has the nuclear launch key, confronts DiMA, and tells DiMA that they should destroy BOTH the Children of Atom and Far Harbor

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 22
			; INFO/STAGE 56 on DLC03DialogueDiMA
			; DESCRIPTION: Player has the Far Harbor Kill Code, confronts DiMA, but tells DiMA he'll protect Far Harbor and make sure it isn't used.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 23
			; INFO/STAGE 57 on DLC03DialogueDiMA
			; DESCRIPTION: Player has the Far Harbor Kill Code, confronts DiMA, and tells DiMA that they should destroy Far Harbor

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 24
			; INFO/STAGE 58 on DLC03DialogueDiMA
			; DESCRIPTION: Player has the Far Harbor Kill Code, confronts DiMA, and tells DiMA that they should destroy BOTH Far Harbor and the Children of Atom

			;DLC04 COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - DLC03DialogueDiMA got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03DialogueNick(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03DialogueNick
		if eventID == 1
			; INFO/STAGE 200 on DLC03DialogueNick
			; DESCRIPTION: Player gives Nick a holotape proving that he and DiMA are brothers

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - DLC03DialogueNick got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03CoA_DialogueNucleus(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03CoA_DialogueNucleus
		if eventID == 1
			; INFO/STAGE 41 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: When the player speaks to the High Confessor for the first time and he asks "How does it feel to take your place among Atom's chosen," the player replies "It's an honor."

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 42 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: When the player speaks to the High Confessor for the first time and he asks "How does it feel to take your place among Atom's chosen," the player replies "Like I'm surrounded by fanatics."

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 43 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: When the player speaks to the High Confessor for the first time and he asks "How does it feel to take your place among Atom's chosen," the player replies "A lot more rads than I usually like."

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 4
			; INFO/STAGE 44 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: When the player speaks to the High Confessor for the first time and the Confessor asks "What would you do with Far Harbor?" the player replies "Try to make peace."

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 5
			; INFO/STAGE 45 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: When the player speaks to the High Confessor for the first time and the Confessor asks "What would you do with Far Harbor?" the player replies "Destroy them."

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 6
			; INFO/STAGE 46 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: When the player speaks to the High Confessor for the first time and the Confessor asks "What would you do with Far Harbor?" the player replies "I don't know."

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 7
			; INFO/STAGE 47 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: The player has attempted to rat on a Child of Atom who the confessor suspects of disloyalty, possibly putting her life in danger. All woman said was say that she didn't like the confessor.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 8
			; INFO/STAGE 75 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: Player has agreed to investigate a Child of Atom who the High Confessor suspects of disloyalty. At this point, the player doesn't know who the Child in question is.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 9
			; INFO/STAGE 48 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: The High Confessor has asked the player to investigate a Child of Atom they suspect of disloyalty. The player has declined. The player does not know at this point who the Child is.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 10
			; INFO/STAGE 20 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: The player has informed the High Confessor they have the means to bring down the Wind Farm powering Far Harbor's condensors and destroy the town. When asked what they plan to do with the information, the player has said they plan to destroy Far Harbor.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 11
			; INFO/STAGE 21 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: The player has informed the High Confessor they have the means to bring down the Wind Farm powering Far Harbor's condensors and destroy the town. When asked what they plan to do with the information, the player has said they are still deciding.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 12
			; INFO/STAGE 22 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: The player has informed the High Confessor they have the means to bring down the Wind Farm powering Far Harbor's condensors and destroy the town. When asked what they plan to do with the information, the player has said they plan to destroy Far Harbor, but only if they get paid.

			;DLC04 COMPANIONS: 
			Bria_Loves()

		elseif eventID == 13
			; INFO/STAGE 23 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: Player has agreed to help Sister Mai repair the decontamination arches in the bay by collecting an object from a dangerous dungeon filled with Super Mutants (the player may or may not know that Mai plans to use them to spray irradiated water. If you think your Comp would have a different opinion either way, let me know and I can add additional handling).

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 14
			; INFO/STAGE 24 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: Player has declined to help Sister Mai repair the decontamination arches in the bay by collecting an object from a dangerous dungeon (the player may or may not know that Mai plans to use them to spray irradiated water. If you think you Comp would have an opinion either way, let me know and I can add additional handling).

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 15
			; INFO/STAGE 25 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: Player has demanded caps from Mai in addition to the reward she's already offered to provide.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 16
			; INFO/STAGE 26 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: Player has agreed to hunt down and kill a Child of Atom heretic - Sister Gwyneth. Gwyneth's only apparent crime was vandalizing some Children of Atom shrines and claiming Atom isn't real.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 17
			; INFO/STAGE 27 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: Player objected to hunting down and killing a Child of Atom heretic - Sister Gwyneth. Gwyneth's only apparent crime was vandalizing some Children of Atom shrines and claiming Atom isn't real.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 18
			; INFO/STAGE 28 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: When asked to hunt down and kill a Child of Atom heretic (whose only apparent crime was vandalizing some Children of Atom holy sites and not believing in Atom), the player suggested they might try talking to her isn't of killing her.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 19
			; INFO/STAGE 2 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: When asked what they think about a Child of Atom who's been on a dangerously long fast, the player replied that it's very admirable.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 20
			; INFO/STAGE 3 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: When asked what they think about a Child of Atom who's been on a dangerously long fast, the player replied that it's nuts.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 21
			; INFO/STAGE 4 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: When asked what they think about a Child of Atom who's been on a dangerously long fast, the player replied that it's that Child's choice.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 22
			; INFO/STAGE 5 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: When asked to attempt to talk this Child of Atom out of their dangerously long fast, the player agreed to speak to the fasting Child.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 23
			; INFO/STAGE 6 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: When asked to attempt to talk this Child of Atom out of their dangerously long fast, the player said it's not their problem.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 24
			; INFO/STAGE 7 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: When asked to attempt to talk this Child of Atom out of their dangerously long fast, the player Chastized the person asking, stating that they should try and be as pious as the fasting child.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 25
			; INFO/STAGE 8 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: When asking the fasting Child of Atom about the message he claims to have received from Atom, the player replied "Atom's not real."

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 26
			; INFO/STAGE 125 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: The player pretended to be a messenger from Atom, successfully convincing the fasting Child of Atom that they can go back to their normal life.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 27
			; INFO/STAGE 127 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: While dressed as a messenger from Atom in an attempt to convince a fasting Child of Atom to end their dangerous fast, the player demanded caps from the Child.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - DLC03CoA_DialogueNucleus got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03_V118_PearlHiring(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03_V118_PearlHiring
		if eventID == 1
			; INFO/STAGE 10 on DLC03_V118_PearlHiring
			; DESCRIPTION: When approached by a robot to help solve a murder in Vault 118, the player asked for money.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 13 on DLC03_V118_PearlHiring
			; DESCRIPTION: When approached by a robot to help solve a murder in Vault 118, the player asked for money.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 200 on DLC03_V118_PearlHiring
			; DESCRIPTION: When approached by a robot to help solve a murder in Vault 118, the player agreed to help.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - DLC03_V118_PearlHiring got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03_V118_Intro(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03_V118_Intro
		if eventID == 1
			; INFO/STAGE 21 on DLC03_V118_Intro
			; DESCRIPTION: Upon entering Vault 118, the player asked the receptionist for money to help with the investigation

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 22 on DLC03_V118_Intro
			; DESCRIPTION: Upon entering Vault 118, the player asked the receptionist for money to help with the investigation

			;DLC04 COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - DLC03_V118_Intro got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03_V118_Quest(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03_V118_Quest
		if eventID == 1
			; INFO/STAGE 200 on DLC03_V118_Quest
			; DESCRIPTION: The player agreed to help the robobrains in Vault 118 investigate the murder.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 910 on DLC03_V118_Quest
			; DESCRIPTION: The player found and defeated the killer (not the actual killer, but the player doesn't know that yet)

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 833 on DLC03_V118_Quest
			; DESCRIPTION: The player, through difficult speech challenges, got information from one of the robobrains that implicates the real murderer.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 4
			; INFO/STAGE 544 on DLC03_V118_Quest
			; DESCRIPTION: The player flirted with one of the robobrains

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 5
			; INFO/STAGE 545 on DLC03_V118_Quest
			; DESCRIPTION: The player flirted with one of the robobrains

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 6
			; INFO/STAGE 546 on DLC03_V118_Quest
			; DESCRIPTION: The player flirted with one of the robobrains

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 7
			; INFO/STAGE 548 on DLC03_V118_Quest
			; DESCRIPTION: The player 'went on a date' with one of the robobrains

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		else
			debug.trace(self + " WARNING - DLC03_V118_Quest got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03_V118_ClueTracker(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03_V118_ClueTracker
		if eventID == 1
			; INFO/STAGE 40 on DLC03_V118_ClueTracker
			; DESCRIPTION: The player found a hidden clue at the crime scene

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 80 on DLC03_V118_ClueTracker
			; DESCRIPTION: The player found hidden proof that victim had been embezzling from the residents.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 3
			; INFO/STAGE 501 on DLC03_V118_ClueTracker
			; DESCRIPTION: The player found out that one of the robobrains was in love with the victim, ruling that person out as a suspect.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - DLC03_V118_ClueTracker got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03DialogueV118(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03DialogueV118
		if eventID == 1
			; INFO/STAGE 500 on DLC03DialogueV118
			; DESCRIPTION: The player revealed real killer

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 1350 on DLC03DialogueV118
			; DESCRIPTION: The receptionist told the player that they got the wrong person with their first conviction. This means the player killed someone who was innocent.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 510 on DLC03DialogueV118
			; DESCRIPTION: After revealing the true identity of the killer, the player asked for money in exchange for letting the killer go. This was successful

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 4
			; INFO/STAGE 511 on DLC03DialogueV118
			; DESCRIPTION: After revealing the true identity of the killer, the player asked for money in exchange for letting the killer go. This failed.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 5
			; INFO/STAGE 600 on DLC03DialogueV118
			; DESCRIPTION: The player said they would let the killer go. They still have a chance to go tell the receptionist the killers true identity if they can do so before the killer leaves the vault.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 6
			; INFO/STAGE 950 on DLC03DialogueV118
			; DESCRIPTION: The player told the receptionist that the killer is actually alive, allowing the robotic staff to help kill the killer.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 7
			; INFO/STAGE 920 on DLC03DialogueV118
			; DESCRIPTION: Player told the receptionist that they had defeated the killer (truth)

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 8
			; INFO/STAGE 930 on DLC03DialogueV118
			; DESCRIPTION: Player told the receptionist that they had defeated the killer or that the killer had escaped (lie)

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 9
			; INFO/STAGE 1500 on DLC03DialogueV118
			; DESCRIPTION: The actual killer was killed.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 10
			; INFO/STAGE 810 on DLC03DialogueV118
			; DESCRIPTION: The player is now enemies of Vault 118 for killing one of the residents in cold blood (not having accused them of murder)

			;DLC04 COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - DLC03DialogueV118 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03_ADV017(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03_ADV017
		if eventID == 1
			; INFO/STAGE 8 on DLC03_ADV017
			; DESCRIPTION: The player found Erikson, the super mutant who is friendly, and decided (through speech option) to start combat.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 1 on DLC03_ADV017
			; DESCRIPTION: The player killed Erikson.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 2 on DLC03_ADV017
			; DESCRIPTION: Player killed one of Erikson's dogs

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 4
			; INFO/STAGE 3 on DLC03_ADV017
			; DESCRIPTION: Player killed one of Erikson's dogs

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 5
			; INFO/STAGE 4 on DLC03_ADV017
			; DESCRIPTION: Player killed one of Erikson's dogs

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 6
			; INFO/STAGE 7 on DLC03_ADV017
			; DESCRIPTION: The player didn't kill Erikson on sight, but let him go up to his camp.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 7
			; INFO/STAGE 40 on DLC03_ADV017
			; DESCRIPTION: The player bought a dog from Erikson (this only happens the first time you buy one)

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 8
			; INFO/STAGE 50 on DLC03_ADV017
			; DESCRIPTION: The player bought a wolf from Erikson (this only happens the first time you buy one)

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 9
			; INFO/STAGE 60 on DLC03_ADV017
			; DESCRIPTION: The player bought a FEV Hound from Erikson (this only happens the first time you buy one)

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - DLC03_ADV017 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03DialogueFarHarbor(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03DialogueFarHarbor
		if eventID == 1
			; INFO/STAGE 21 on DLC03DialogueFarHarbor
			; DESCRIPTION: Allen Lee is dismissive of the player's help defending the town's wall. The player calls Allen an ungrateful jerk. Rude but accurate.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 22 on DLC03DialogueFarHarbor
			; DESCRIPTION: Andre's was near death and the player used his medical knowledge to save him. When Andre asks why the player did it, the player says he was just being a good samaritan.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 3
			; INFO/STAGE 23 on DLC03DialogueFarHarbor
			; DESCRIPTION: Andre's was near death and the player used his medical knowledge to save him. When Andre asks why the player did it, the player says he was hoping for a reward.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 4
			; INFO/STAGE 24 on DLC03DialogueFarHarbor
			; DESCRIPTION: Andre is consumed with revenge for the death of his husband. He wants to go on a suicide run murdering things. The player tries to convince him to stop by finding a good reason to live.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 5
			; INFO/STAGE 25 on DLC03DialogueFarHarbor
			; DESCRIPTION: Brooks (who the player correctly thinks may be a synth) asks what the player's view of synths is. The player says he's a friend of the synths.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 6
			; INFO/STAGE 26 on DLC03DialogueFarHarbor
			; DESCRIPTION: Brooks (who the player correctly thinks may be a synth) asks what the player's view of synths is. The player says synths are abominations.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 7
			; INFO/STAGE 27 on DLC03DialogueFarHarbor
			; DESCRIPTION: Brooks (who the player correctly thinks may be a synth) asks what the player's view of synths is. The player says synths belong in the Institute.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 8
			; INFO/STAGE 110 on DLC03DialogueFarHarbor
			; DESCRIPTION: The player has healed a dying person in Far Harbor. This displays some medical skill and no reward has been offered.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		else
			debug.trace(self + " WARNING - DLC03DialogueFarHarbor got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03DialogueFarHarborPostMQ05Avery(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03DialogueFarHarborPostMQ05Avery
		if eventID == 1
			; INFO/STAGE 21 on DLC03DialogueFarHarborPostMQ05Avery
			; DESCRIPTION: Captain Avery is shocked her people stood up to the firebrand Allen Lee and didn't storm Acadia in large part because of the player. The player says Harbormen are good.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 22 on DLC03DialogueFarHarborPostMQ05Avery
			; DESCRIPTION: Captain Avery is shocked her people stood up to the firebrand Allen Lee and didn't storm Acadia in large part because of the player. The player says Avery owes him (which is absolutely accurate if mercenary).

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 23 on DLC03DialogueFarHarborPostMQ05Avery
			; DESCRIPTION: Captain Avery is depressed that Harbormen slaughtered an innocent settlement. The player says it's a tragedy.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 4
			; INFO/STAGE 24 on DLC03DialogueFarHarborPostMQ05Avery
			; DESCRIPTION: Captain Avery is depressed that Harbormen slaughtered an innocent settlement. The player says that Acadia wasn't so innocent, it was a threat.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 5
			; INFO/STAGE 25 on DLC03DialogueFarHarborPostMQ05Avery
			; DESCRIPTION: Captain Avery is depressed that Harbormen slaughtered an innocent settlement. The player says that it was Far Harbor's fault (which it is, but is very harsh).

			;DLC04 COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - DLC03DialogueFarHarborPostMQ05Avery got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03DialogueFarHarborPostQuest(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03DialogueFarHarborPostQuest
		if eventID == 1
			; INFO/STAGE 21 on DLC03DialogueFarHarborPostQuest
			; DESCRIPTION: The Children of Atom were nuked, the player is responsible. When asked why he did it, he says the Children of Atom were a disease.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 22 on DLC03DialogueFarHarborPostQuest
			; DESCRIPTION: The Children of Atom were nuked, the player is responsible. When asked why he did it, he says he killed the cultists to safeguard Far Harbor's future.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - DLC03DialogueFarHarborPostQuest got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC06MQ03(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC06MQ03
		if eventID == 1
			; INFO/STAGE 11 on DLC06MQ03
			; DESCRIPTION: The player is talking with a ghoul Overseer. At his first chance he calls Vault-Tec bastards for the terrible things they've done to people (like the player)

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 12 on DLC06MQ03
			; DESCRIPTION: The ghoul Overseer wants to run experiments on people to make devices that'll help the Vault. The player says he will assist only if no one gets hurt in the experiments. At this point there's a real chance these devices are on the up-and-up.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 3
			; INFO/STAGE 13 on DLC06MQ03
			; DESCRIPTION: A nervous and apparently all-too-eager perspective settler arrives to Vault 118 named Clem. After Clem delivers several stumbling nervous as hell lines, the player calls Clem an idiot to his face.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 4
			; INFO/STAGE 14 on DLC06MQ03
			; DESCRIPTION: After Clem delivers a lot of nervous, eager, and gung-ho lines the player says he likes Clem.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		else
			debug.trace(self + " WARNING - DLC06MQ03 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC06E01(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC06E01
		if eventID == 1
			; INFO/STAGE 510 on DLC06E01
			; DESCRIPTION: The player is experimenting on an exercycle. The player chooses to make it so that if the rider pedals too slow they receive an electric shock to keep them pedaling fast.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 520 on DLC06E01
			; DESCRIPTION: The player is experimenting on an exercycle. The player chooses to have the cycle inject the cyclist with a narcotic to make the rider addicted to using the exercycle. There is a chance it'll kill some cyclists, too.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 530 on DLC06E01
			; DESCRIPTION: The player is experimenting on an exercycle. The player chooses aromatherapy and gentle mood music to encourage people to exercise. Totally benign stuff.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		else
			debug.trace(self + " WARNING - DLC06E01 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC06E02(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC06E02
		if eventID == 1
			; INFO/STAGE 510 on DLC06E02
			; DESCRIPTION: The player is experimenting with a Soda Fountain and choosing which chemicals to add to it. The player chooses an appetite suppresant which makes all the citizens weaker but consume far less food.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 520 on DLC06E02
			; DESCRIPTION: Now the player chooses an Ecstasy-like narcotic that makes the citizens happy and pliant. No real adverse effects besides being manipulative.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 3
			; INFO/STAGE 530 on DLC06E02
			; DESCRIPTION: Now the player chooses instead a really delicious alternative to Nuka-Cola. Benign.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - DLC06E02 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC06E03(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC06E03
		if eventID == 1
			; INFO/STAGE 11 on DLC06E03
			; DESCRIPTION: The Overseer is saying the Hippocratic Oath is bullshit. The player sticks up for the doctor's oath saying it's the right thing.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 12 on DLC06E03
			; DESCRIPTION: The player is confronted by an angry settler who correctly knows the player has been experimenting on the Vault (and at least some of those experiments are "evil"). The player says he's done this for the "greater good". Machievellian, but potentially true.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 3
			; INFO/STAGE 13 on DLC06E03
			; DESCRIPTION: Same scene as above. Except the player lies and denies everything.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 4
			; INFO/STAGE 14 on DLC06E03
			; DESCRIPTION: A happy settler wonders why the player is working on all these helpful devices that are making people's lives better (this scene only plays if all the "good" options are chosen). The player says he's doing this to benefit society.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 5
			; INFO/STAGE 15 on DLC06E03
			; DESCRIPTION: Same scene as above. Except the player says he's doing it to maximize productivity.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 6
			; INFO/STAGE 310 on DLC06E03
			; DESCRIPTION: The experiment now is on a piece of optometrist equipment. The player chooses to use a dangerous amount of radiation and subliminal messaging to make the settlers more obedient to the Overseer.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 7
			; INFO/STAGE 320 on DLC06E03
			; DESCRIPTION: Same experiment. Except the player chooses to conduct MRIs to try and read the settler's minds. Think 1984 police state - sinister government surveilling its citizens.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 8
			; INFO/STAGE 330 on DLC06E03
			; DESCRIPTION: Same experiment. Except the player chooses to make a much improved piece of equipment that can help people's eyesight.

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - DLC06E03 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC06E04(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC06E04
		if eventID == 1
			; INFO/STAGE 11 on DLC06E04
			; DESCRIPTION: The Overseer is ticked off that the player keeps helping the citizens instead of helping the Vault by choosing more "evil" experiments. The player replies that the Overseer is a psychopath.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 12 on DLC06E04
			; DESCRIPTION: The Overseer is pleased at the number of "evil" options the player has chosen. When the Overseer says now she's leaving the Vault, the player tries to persuade her to stay (despite her by now obviously being a sinister dangerous person).

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 3
			; INFO/STAGE 13 on DLC06E04
			; DESCRIPTION: The Overseer is furious because the player has chosen all the "good" experiments. The player responds that he's happy he's "made a better Vault".

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 4
			; INFO/STAGE 14 on DLC06E04
			; DESCRIPTION: The Overseer is still furious with the player for choosing only good experiments and is leaving in disgust. The player says "good riddance" as she's leaving. 

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 5
			; INFO/STAGE 310 on DLC06E04
			; DESCRIPTION: The experiment is now a specially designed very addictive slot machine. The player chooses the option that tries to drain the settler dry. The option is called "Indentured Servitude".

			;DLC04 COMPANIONS: 
			Bria_Likes()

		elseif eventID == 6
			; INFO/STAGE 320 on DLC06E04
			; DESCRIPTION: The player instead chooses a surveillance device installed in the slot machine that keeps track of "degenerates".

			;DLC04 COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 7
			; INFO/STAGE 330 on DLC06E04
			; DESCRIPTION: The player instead chooses to lose money and make it so the slot machine pays out more than 50% of the time. This makes people happy, but will cost the player caps.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		else
			debug.trace(self + " WARNING - DLC06E04 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC06DialogueVault88(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC06DialogueVault88
		if eventID == 1
			; INFO/STAGE 11 on DLC06DialogueVault88
			; DESCRIPTION: Clem says a friendly farewell after having been a champ and gone through all the experiments. The player chooses to "Thank" him for all his help.

			;DLC04 COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 12 on DLC06DialogueVault88
			; DESCRIPTION: Same scene, but the player tells him to "Wise up" and stop being such a stupid chump. It's probably good advice - if delivered rudely.

			;DLC04 COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - DLC06DialogueVault88 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction