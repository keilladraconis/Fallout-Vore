Scriptname FV_BaseGameAffinityEventsScript extends Quest const
{Base game events that companions in this DLC will respond to. Attached to FV_CompanionAffinity Quest}
; This is responsible for how Bria reacts to various events in the MSQ.

group quests
	Quest property BoS100 auto const mandatory
	Quest property BoS101 auto const mandatory
	Quest property BoS201 auto const mandatory
	Quest property BoS202 auto const mandatory
	Quest property BoS203 auto const mandatory
	Quest property BoS301 auto const mandatory
	Quest property BoS302 auto const mandatory
	Quest property BoS303 auto const mandatory
	Quest property BoSM01 auto const mandatory
	Quest property BoSM02 auto const mandatory
	Quest property BoSR05 auto const mandatory
	Quest property DialogueAbernathyFarm auto const mandatory
	Quest property DialogueBunkerHill auto const mandatory
	Quest property DialogueConcordArea auto const mandatory
	Quest property DialogueDiamondCity auto const mandatory
	Quest property DialogueDiamondCityEntrance auto const mandatory
	Quest property DialogueDiamondCitySchoolhouse auto const mandatory
	Quest property DialogueDrumlinDiner auto const mandatory
	Quest property DialogueGoodneighbor auto const mandatory
	Quest property DialogueGoodneighborEntrance auto const mandatory
	Quest property DialogueGraygarden auto const mandatory
	Quest property DialogueRailroad auto const mandatory
	Quest property DialogueTheSlog auto const mandatory
	Quest property DialogueVault81 auto const mandatory
	Quest property DialogueWarwickHomestead auto const mandatory
	Quest property DiamondCitySuperMutantIntro auto const mandatory
	Quest property DN019JoinCult auto const mandatory
	Quest property DN053 auto const mandatory
	Quest property DN102 auto const mandatory
	Quest property FFDiamondCity01 auto const mandatory
	Quest property FFDiamondCity07 auto const mandatory
	Quest property FFDiamondCity08 auto const mandatory
	Quest property FFDiamondCity10 auto const mandatory
	Quest property FFGoodneighbor07 auto const mandatory
	Quest property Inst301 auto const mandatory
	Quest property Inst302 auto const mandatory
	Quest property Inst306 auto const mandatory
	Quest property InstM01 auto const mandatory
	Quest property InstM02 auto const mandatory
	Quest property InstM03 auto const mandatory
	Quest property Min01 auto const mandatory
	Quest property Min03 auto const mandatory
	Quest property MinRecruit03 auto const mandatory
	Quest property MinRecruit09 auto const mandatory
	Quest property MinVsInst auto const mandatory
	Quest property MQ00MamaMurphy auto const mandatory
	Quest property MQ104 auto const mandatory
	Quest property MQ105 auto const mandatory
	Quest property MQ201 auto const mandatory
	Quest property MQ206 auto const mandatory
	Quest property MQ206RR auto const mandatory
	Quest property MQ302BoS auto const mandatory
	Quest property MQ302Min auto const mandatory
	Quest property MQ302RR auto const mandatory
	Quest property MS01 auto const mandatory
	Quest property MS04 auto const mandatory
	Quest property MS05B auto const mandatory
	Quest property MS07a auto const mandatory
	Quest property MS09 auto const mandatory
	Quest property MS11 auto const mandatory
	Quest property MS13 auto const mandatory
	Quest property MS13CookeDies auto const mandatory
	Quest property MS13FindPhoto auto const mandatory
	Quest property MS13NelsonDies auto const mandatory
	Quest property MS13PaulDies auto const mandatory
	Quest property MS14 auto const mandatory
	Quest property MS16 auto const mandatory
	Quest property MS17 auto const mandatory
	Quest property MS19 auto const mandatory
	Quest property REAssaultSC01_DN123SkylanesAssault auto const mandatory
	Quest property RECampLC01 auto const mandatory
	Quest property RESceneLC01 auto const mandatory
	Quest property RETravelKMK_BoSM02 auto const mandatory
	Quest property RETravelSC01_DN123SkylanesPointer auto const mandatory
	Quest property RR101 auto const mandatory
	Quest property RR102 auto const mandatory
	Quest property RR201 auto const mandatory	
	Quest property RR302 auto const mandatory
	Quest property RR303 auto const mandatory
	Quest property RRM01 auto const mandatory
	Quest property RRM02 auto const mandatory
	Quest property RRR02aQuest auto const mandatory
	Quest property RRR05 auto const mandatory
	Quest property RRR08 auto const mandatory
	Quest property V81_00_Intro auto const mandatory
	Quest property V81_01 auto const mandatory
	Quest property V81_03 auto const mandatory

	;NEW QUESTS ADDED WHEN ADDING QUEST STAGE BUMPS
	Quest Property BoS200 const auto mandatory
	Quest Property BoS204 const auto mandatory
	Quest Property DialogueDrinkingBuddy const auto mandatory
	Quest Property DialogueGoodneighborRufus const auto mandatory
	Quest Property DN015 const auto mandatory
	Quest Property DN036 const auto mandatory
	Quest Property DN036_Post const auto mandatory
	Quest Property DN079 const auto mandatory
	Quest Property DN083_Barney const auto mandatory
	Quest Property DN101 const auto mandatory
	Quest Property DN109 const auto mandatory
	Quest Property DN119Fight const auto mandatory
	Quest Property DN121 const auto mandatory
	Quest Property FFBunkerHill03 const auto mandatory
	Quest Property Inst307 const auto mandatory
	Quest Property InstR03NEW const auto mandatory
	Quest Property InstR04 const auto mandatory
	Quest Property InstR05 const auto mandatory
	Quest Property Min02 const auto mandatory
	Quest Property Min207 const auto mandatory
	Quest Property Min301 const auto mandatory
	Quest Property MinDefendCastle const auto mandatory
	Quest Property MinDestBOS const auto mandatory
	Quest Property MQ203 const auto mandatory
	Quest Property MQ302 const auto mandatory
	Quest Property MS05BPostQuest const auto mandatory
	Quest Property MS07b const auto mandatory
	Quest Property MS07c const auto mandatory
	Quest Property RRAct3PickUp const auto mandatory
	Quest Property RRR04 const auto mandatory
endGroup

GlobalVariable Property MinCastleAttacker Auto Const

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

;REGISTER FOR BASE GAME SCRIPT'S EVENT
event OnInit()
	RegisterForCustomEvent(CompanionAffinity, "CompanionAffinityEvent")
endEvent

;BRIA COMPANIONS
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

		if eventQuest == BoS100
			HandleDialogueBump_BoS100(eventQuest, eventID)
		elseif eventQuest == BoS101
			HandleDialogueBump_BoS101(eventQuest, eventID)
		elseif eventQuest == BoS201
			HandleDialogueBump_BoS201(eventQuest, eventID)
		elseif eventQuest == BoS202
			HandleDialogueBump_BoS202(eventQuest, eventID)
		elseif eventQuest == BoS203
			HandleDialogueBump_BoS203(eventQuest, eventID)
		elseif eventQuest == BoS301
			HandleDialogueBump_BoS301(eventQuest, eventID)
		elseif eventQuest == BoS302
			HandleDialogueBump_BoS302(eventQuest, eventID)
		elseif eventQuest == BoS303
			HandleDialogueBump_BoS303(eventQuest, eventID)
		elseif eventQuest == BoSM01
			HandleDialogueBump_BoSM01(eventQuest, eventID)
		elseif eventQuest == BoSM02
			HandleDialogueBump_BoSM02(eventQuest, eventID)
		elseif eventQuest == BoSR05
			HandleDialogueBump_BoSR05(eventQuest, eventID)
		elseif eventQuest == DialogueAbernathyFarm
			HandleDialogueBump_DialogueAbernathyFarm(eventQuest, eventID)
		elseif eventQuest == DialogueBunkerHill
			HandleDialogueBump_DialogueBunkerHill(eventQuest, eventID)
		elseif eventQuest == DialogueConcordArea
			HandleDialogueBump_DialogueConcordArea(eventQuest, eventID)
		elseif eventQuest == DialogueDiamondCity
			HandleDialogueBump_DialogueDiamondCity(eventQuest, eventID)
		elseif eventQuest == DialogueDiamondCityEntrance
			HandleDialogueBump_DialogueDiamondCityEntrance(eventQuest, eventID)
		elseif eventQuest == DialogueDiamondCitySchoolhouse
			HandleDialogueBump_DialogueDiamondCitySchoolhouse(eventQuest, eventID)
		elseif eventQuest == DialogueDrumlinDiner
			HandleDialogueBump_DialogueDrumlinDiner(eventQuest, eventID)
		elseif eventQuest == DialogueGoodneighbor
			HandleDialogueBump_DialogueGoodneighbor(eventQuest, eventID)
		elseif eventQuest == DialogueGoodneighborEntrance
			HandleDialogueBump_DialogueGoodneighborEntrance(eventQuest, eventID)
		elseif eventQuest == DialogueGraygarden
			HandleDialogueBump_DialogueGraygarden(eventQuest, eventID)
		elseif eventQuest == DialogueRailroad
			HandleDialogueBump_DialogueRailroad(eventQuest, eventID)
		elseif eventQuest == DialogueTheSlog
			HandleDialogueBump_DialogueTheSlog(eventQuest, eventID)
		elseif eventQuest == DialogueVault81
			HandleDialogueBump_DialogueVault81(eventQuest, eventID)
		elseif eventQuest == DialogueWarwickHomestead
			HandleDialogueBump_DialogueWarwickHomestead(eventQuest, eventID)
		elseif eventQuest == DiamondCitySuperMutantIntro
			HandleDialogueBump_DiamondCitySuperMutantIntro(eventQuest, eventID)
		elseif eventQuest == DN019JoinCult
			HandleDialogueBump_DN019JoinCult(eventQuest, eventID)
		elseif eventQuest == DN053
			HandleDialogueBump_DN053(eventQuest, eventID)
		elseif eventQuest == DN102
			HandleDialogueBump_DN102(eventQuest, eventID)
		elseif eventQuest == FFDiamondCity01
			HandleDialogueBump_FFDiamondCity01(eventQuest, eventID)
		elseif eventQuest == FFDiamondCity07
			HandleDialogueBump_FFDiamondCity07(eventQuest, eventID)
		elseif eventQuest == FFDiamondCity08
			HandleDialogueBump_FFDiamondCity08(eventQuest, eventID)
		elseif eventQuest == FFDiamondCity10
			HandleDialogueBump_FFDiamondCity10(eventQuest, eventID)
		elseif eventQuest == FFGoodneighbor07
			HandleDialogueBump_FFGoodneighbor07(eventQuest, eventID)
		elseif eventQuest == Inst301
			HandleDialogueBump_Inst301(eventQuest, eventID)
		elseif eventQuest == Inst302
			HandleDialogueBump_Inst302(eventQuest, eventID)
		elseif eventQuest == Inst306
			HandleDialogueBump_Inst306(eventQuest, eventID)
		elseif eventQuest == InstM01
			HandleDialogueBump_InstM01(eventQuest, eventID)
		elseif eventQuest == InstM02
			HandleDialogueBump_InstM02(eventQuest, eventID)
		elseif eventQuest == InstM03
			HandleDialogueBump_InstM03(eventQuest, eventID)
		elseif eventQuest == Min01
			HandleDialogueBump_Min01(eventQuest, eventID)
		elseif eventQuest == Min03
			HandleDialogueBump_Min03(eventQuest, eventID)
		elseif eventQuest == MinRecruit03
			HandleDialogueBump_MinRecruit03(eventQuest, eventID)
		elseif eventQuest == MinRecruit09
			HandleDialogueBump_MinRecruit09(eventQuest, eventID)
		elseif eventQuest == MinVsInst
			HandleDialogueBump_MinVsInst(eventQuest, eventID)
		elseif eventQuest == MQ00MamaMurphy
			HandleDialogueBump_MQ00MamaMurphy(eventQuest, eventID)
		elseif eventQuest == MQ104
			HandleDialogueBump_MQ104(eventQuest, eventID)
		elseif eventQuest == MQ105
			HandleDialogueBump_MQ105(eventQuest, eventID)
		elseif eventQuest == MQ201
			HandleDialogueBump_MQ201(eventQuest, eventID)
		elseif eventQuest == MQ206
			HandleDialogueBump_MQ206(eventQuest, eventID)
		elseif eventQuest == MQ206RR
			HandleDialogueBump_MQ206RR(eventQuest, eventID)
		elseif eventQuest == MQ302BoS
			HandleDialogueBump_MQ302BoS(eventQuest, eventID)
		elseif eventQuest == MQ302Min
			HandleDialogueBump_MQ302Min(eventQuest, eventID)
		elseif eventQuest == MQ302RR
			HandleDialogueBump_MQ302RR(eventQuest, eventID)
		elseif eventQuest == MS01
			HandleDialogueBump_MS01(eventQuest, eventID)
		elseif eventQuest == MS04
			HandleDialogueBump_MS04(eventQuest, eventID)
		elseif eventQuest == MS05B
			HandleDialogueBump_MS05B(eventQuest, eventID)
		elseif eventQuest == MS07a
			HandleDialogueBump_MS07a(eventQuest, eventID)
		elseif eventQuest == MS09
			HandleDialogueBump_MS09(eventQuest, eventID)
		elseif eventQuest == MS11
			HandleDialogueBump_MS11(eventQuest, eventID)
		elseif eventQuest == MS13
			HandleDialogueBump_MS13(eventQuest, eventID)
		elseif eventQuest == MS13CookeDies
			HandleDialogueBump_MS13CookeDies(eventQuest, eventID)
		elseif eventQuest == MS13FindPhoto
			HandleDialogueBump_MS13FindPhoto(eventQuest, eventID)
		elseif eventQuest == MS13NelsonDies
			HandleDialogueBump_MS13NelsonDies(eventQuest, eventID)
		elseif eventQuest == MS13PaulDies
			HandleDialogueBump_MS13PaulDies(eventQuest, eventID)
		elseif eventQuest == MS14
			HandleDialogueBump_MS14(eventQuest, eventID)
		elseif eventQuest == MS16
			HandleDialogueBump_MS16(eventQuest, eventID)
		elseif eventQuest == MS17
			HandleDialogueBump_MS17(eventQuest, eventID)
		elseif eventQuest == MS19
			HandleDialogueBump_MS19(eventQuest, eventID)
		elseif eventQuest == REAssaultSC01_DN123SkylanesAssault
			HandleDialogueBump_REAssaultSC01_DN123SkylanesAssault(eventQuest, eventID)
		elseif eventQuest == RECampLC01
			HandleDialogueBump_RECampLC01(eventQuest, eventID)
		elseif eventQuest == RESceneLC01
			HandleDialogueBump_RESceneLC01(eventQuest, eventID)
		elseif eventQuest == RETravelKMK_BoSM02
			HandleDialogueBump_RETravelKMK_BoSM02(eventQuest, eventID)
		elseif eventQuest == RETravelSC01_DN123SkylanesPointer
			HandleDialogueBump_RETravelSC01_DN123SkylanesPointer(eventQuest, eventID)
		elseif eventQuest == RR101
			HandleDialogueBump_RR101(eventQuest, eventID)
		elseif eventQuest == RR102
			HandleDialogueBump_RR102(eventQuest, eventID)
		elseif eventQuest == RR302
			HandleDialogueBump_RR302(eventQuest, eventID)
		elseif eventQuest == RR303
			HandleDialogueBump_RR303(eventQuest, eventID)
		elseif eventQuest == RRM01
			HandleDialogueBump_RRM01(eventQuest, eventID)
		elseif eventQuest == RRM02
			HandleDialogueBump_RRM02(eventQuest, eventID)
		elseif eventQuest == RRR02aQuest
			HandleDialogueBump_RRR02aQuest(eventQuest, eventID)
		elseif eventQuest == RRR05
			HandleDialogueBump_RRR05(eventQuest, eventID)
		elseif eventQuest == RRR08
			HandleDialogueBump_RRR08(eventQuest, eventID)
		elseif eventQuest == V81_00_Intro
			HandleDialogueBump_V81_00_Intro(eventQuest, eventID)
		elseif eventQuest == V81_01
			HandleDialogueBump_V81_01(eventQuest, eventID)
		elseif eventQuest == V81_03
			HandleDialogueBump_V81_03(eventQuest, eventID)
		else
			; unhandled quest - but not an error once DLC exists
			debug.trace(self + " CompanionAffinityEvent: WARNING - unhandled quest dialogue bump " + eventQuest)
		endif

	elseif sender is Quest

		if eventQuest == BoS200
			HandleQuestStageBump_BoS200(eventQuest, eventID)
		elseif eventQuest == BoS202
			HandleQuestStageBump_BoS202(eventQuest, eventID)
		elseif eventQuest == BoS203
			HandleQuestStageBump_BoS203(eventQuest, eventID)
		elseif eventQuest == BoS204
			HandleQuestStageBump_BoS204(eventQuest, eventID)
		elseif eventQuest == BoS301
			HandleQuestStageBump_BoS301(eventQuest, eventID)
		elseif eventQuest == BoS302
			HandleQuestStageBump_BoS302(eventQuest, eventID)
		elseif eventQuest == BoSM01
			HandleQuestStageBump_BoSM01(eventQuest, eventID)
		elseif eventQuest == BoSM02
			HandleQuestStageBump_BoSM02(eventQuest, eventID)
		elseif eventQuest == BoSR05
			HandleQuestStageBump_BoSR05(eventQuest, eventID)
		elseif eventQuest == DialogueDrinkingBuddy
			HandleQuestStageBump_DialogueDrinkingBuddy(eventQuest, eventID)
		elseif eventQuest == DialogueGoodneighborRufus
			HandleQuestStageBump_DialogueGoodneighborRufus(eventQuest, eventID)
		elseif eventQuest == DN015
			HandleQuestStageBump_DN015(eventQuest, eventID)
		elseif eventQuest == DN036
			HandleQuestStageBump_DN036(eventQuest, eventID)
		elseif eventQuest == DN036_Post
			HandleQuestStageBump_DN036_Post(eventQuest, eventID)
		elseif eventQuest == DN053
			HandleQuestStageBump_DN053(eventQuest, eventID)
		elseif eventQuest == DN079
			HandleQuestStageBump_DN079(eventQuest, eventID)
		elseif eventQuest == DN083_Barney
			HandleQuestStageBump_DN083_Barney(eventQuest, eventID)
		elseif eventQuest == DN101
			HandleQuestStageBump_DN101(eventQuest, eventID)
		elseif eventQuest == DN109
			HandleQuestStageBump_DN109(eventQuest, eventID)
		elseif eventQuest == DN119Fight
			HandleQuestStageBump_DN119Fight(eventQuest, eventID)
		elseif eventQuest == DN121
			HandleQuestStageBump_DN121(eventQuest, eventID)
		elseif eventQuest == FFBunkerHill03
			HandleQuestStageBump_FFBunkerHill03(eventQuest, eventID)
		elseif eventQuest == FFGoodneighbor07
			HandleQuestStageBump_FFGoodneighbor07(eventQuest, eventID)
		elseif eventQuest == Inst301
			HandleQuestStageBump_Inst301(eventQuest, eventID)
		elseif eventQuest == Inst307
			HandleQuestStageBump_Inst307(eventQuest, eventID)
		elseif eventQuest == InstM01
			HandleQuestStageBump_InstM01(eventQuest, eventID)
		elseif eventQuest == InstR03NEW
			HandleQuestStageBump_InstR03NEW(eventQuest, eventID)
		elseif eventQuest == InstR04
			HandleQuestStageBump_InstR04(eventQuest, eventID)
		elseif eventQuest == InstR05
			HandleQuestStageBump_InstR05(eventQuest, eventID)
		elseif eventQuest == Min01
			HandleQuestStageBump_Min01(eventQuest, eventID)
		elseif eventQuest == Min02
			HandleQuestStageBump_Min02(eventQuest, eventID)
		elseif eventQuest == Min03
			HandleQuestStageBump_Min03(eventQuest, eventID)
		elseif eventQuest == Min207
			HandleQuestStageBump_Min207(eventQuest, eventID)
		elseif eventQuest == Min301
			HandleQuestStageBump_Min301(eventQuest, eventID)
		elseif eventQuest == MinDefendCastle
			HandleQuestStageBump_MinDefendCastle(eventQuest, eventID)
		elseif eventQuest == MinDestBOS
			HandleQuestStageBump_MinDestBOS(eventQuest, eventID)
		elseif eventQuest == MQ203
			HandleQuestStageBump_MQ203(eventQuest, eventID)
		elseif eventQuest == MQ302
			HandleQuestStageBump_MQ302(eventQuest, eventID)
		elseif eventQuest == MS01
			HandleQuestStageBump_MS01(eventQuest, eventID)
		elseif eventQuest == MS04
			HandleQuestStageBump_MS04(eventQuest, eventID)
		elseif eventQuest == MS05B
			HandleQuestStageBump_MS05B(eventQuest, eventID)
		elseif eventQuest == MS05BPostQuest
			HandleQuestStageBump_MS05BPostQuest(eventQuest, eventID)
		elseif eventQuest == MS07a
			HandleQuestStageBump_MS07a(eventQuest, eventID)
		elseif eventQuest == MS07b
			HandleQuestStageBump_MS07b(eventQuest, eventID)
		elseif eventQuest == MS07c
			HandleQuestStageBump_MS07c(eventQuest, eventID)
		elseif eventQuest == MS09
			HandleQuestStageBump_MS09(eventQuest, eventID)
		elseif eventQuest == MS11
			HandleQuestStageBump_MS11(eventQuest, eventID)
		elseif eventQuest == MS16
			HandleQuestStageBump_MS16(eventQuest, eventID)
		elseif eventQuest == MS17
			HandleQuestStageBump_MS17(eventQuest, eventID)
		elseif eventQuest == RECampLC01
			HandleQuestStageBump_RECampLC01(eventQuest, eventID)
		elseif eventQuest == RESceneLC01
			HandleQuestStageBump_RESceneLC01(eventQuest, eventID)
		elseif eventQuest == RR101
			HandleQuestStageBump_RR101(eventQuest, eventID)
		elseif eventQuest == RR102
			HandleQuestStageBump_RR102(eventQuest, eventID)
		elseif eventQuest == RR201
			HandleQuestStageBump_RR201(eventQuest, eventID)
		elseif eventQuest == RR303
			HandleQuestStageBump_RR303(eventQuest, eventID)
		elseif eventQuest == RRAct3PickUp
			HandleQuestStageBump_RRAct3PickUp(eventQuest, eventID)
		elseif eventQuest == RRM01
			HandleQuestStageBump_RRM01(eventQuest, eventID)
		elseif eventQuest == RRM02
			HandleQuestStageBump_RRM02(eventQuest, eventID)
		elseif eventQuest == RRR04
			HandleQuestStageBump_RRR04(eventQuest, eventID)
		elseif eventQuest == RRR08
			HandleQuestStageBump_RRR08(eventQuest, eventID)
		else
			; unhandled quest - but not an error once DLC exists
			debug.trace(self + " CompanionAffinityEvent: WARNING - unhandled quest stage bump " + eventQuest)
		endif
	endif

endEvent



function HandleDialogueBump_BoS100(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == BoS100
		if eventID == 1
			; INFO/STAGE 000F7404  on BoS100
			; DESCRIPTION: Player met and helped out the Brotherhood. Here, he agrees to continue to help without knowing what he's getting into.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 000F740D  on BoS100
			; DESCRIPTION: Player met and helped out the Brotherhood. Here, he refuses to continue to help without knowing what he's getting into.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 000F741D  on BoS100
			; DESCRIPTION: Player met and helped out the Brotherhood. Here, he asks for payment before he agrees or refuses to help

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - BoS100 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_BoS101(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == BoS101
		if eventID == 1
			; INFO/STAGE 000867D2  on BoS101
			; DESCRIPTION: Player refused to formally join the Brotherhood after Paladin Danse offered

			;FALLOUTVORE COMPANIONS: 
			Bria_Loves()

		elseif eventID == 2
			; INFO/STAGE 000867F0  on BoS101
			; DESCRIPTION: Player agreed to formally join the Brotherhood after Paladin Danse offered

			;FALLOUTVORE COMPANIONS: 
			Bria_Hates()

		elseif eventID == 3
			; INFO/STAGE 0008684B  on BoS101
			; DESCRIPTION: Player uncertain about joining the Brotherhood or not.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - BoS101 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_BoS201(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == BoS201
		if eventID == 1
			; INFO/STAGE 00048694  on BoS201
			; DESCRIPTION: Maxson states he cares about the people of the Commonwealth, player disagrees with the motivations.

			;FALLOUTVORE COMPANIONS: 
			Bria_Loves()

		elseif eventID == 2
			; INFO/STAGE 00048698  on BoS201
			; DESCRIPTION: The Prydwen has arrived in the Commonwealth, and the Player states that he's impressed at the level of escalation the Brotherhood is bringing to the table

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 3
			; INFO/STAGE 000486A7  on BoS201
			; DESCRIPTION: Maxson states he cares about the people of the Commonwealth, player whole-heartedly agrees.

			;FALLOUTVORE COMPANIONS: 
			Bria_Hates()

		elseif eventID == 4
			; INFO/STAGE 000486C1  on BoS201
			; DESCRIPTION: Maxson states he cares about the people of the Commonwealth, player questions the statement.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 5
			; INFO/STAGE 000486C4  on BoS201
			; DESCRIPTION: The Prydwen has arrived in the Commonwealth, and the Player is wary at the level of escalation the Brotherhood is bringing to the table, but doesn't strongly oppose it.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 6
			; INFO/STAGE 000486D4  on BoS201
			; DESCRIPTION: Maxson states he cares about the people of the Commonwealth, player doesn't express a strong opinion about it.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 7
			; INFO/STAGE 000486D8  on BoS201
			; DESCRIPTION: The Prydwen has arrived in the Commonwealth, and the Player is dismayed at the level of escalation the Brotherhood is bringing to the table.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - BoS201 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_BoS202(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == BoS202
		if eventID == 1
			; INFO/STAGE 0009776F  on BoS202
			; DESCRIPTION: Maxson has ordered the Player to wipe out every Super Mutant at Fort Strong, Player expresses dismay.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 00097780  on BoS202
			; DESCRIPTION: Maxson has ordered the Player to wipe out every Super Mutant at Fort Strong, Player agrees without protest.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 000977EF  on BoS202
			; DESCRIPTION: Danse sees the aftermath at Fort Strong (dead SM's) and states that the Player must "hate these mutants just as much as I do." Player won't take a side, says he was following orders.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 4
			; INFO/STAGE 000977F5  on BoS202
			; DESCRIPTION: Danse sees the aftermath at Fort Strong (dead SM's) and states that the Player must "hate these mutants just as much as I do." Player disagrees, saying the Mutants are no different from anyone else.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 5
			; INFO/STAGE 000977FC  on BoS202
			; DESCRIPTION: Danse sees the aftermath at Fort Strong (dead SM's) and states that the Player must "hate these mutants just as much as I do." Player agrees saying that wiping them out was a pleasure.

			;FALLOUTVORE COMPANIONS: 
			Bria_Loves()

		else
			debug.trace(self + " WARNING - BoS202 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_BoS203(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == BoS203
		if eventID == 1
			; INFO/STAGE 0009FFDD  on BoS203
			; DESCRIPTION: Player is made aware that the teleporter could kill them, since it's untested. Player is gung-ho and determined to go anyway.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 000A0024  on BoS203
			; DESCRIPTION: Player is made aware that the teleporter could kill them, since it's untested. Player cracks a joke about being beamed into solid rock (not negative, sarcasm)

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 000A0049  on BoS203
			; DESCRIPTION: Player is made aware that the teleporter could kill them, since it's untested. Player says that this is a suicide mission.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - BoS203 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_BoS301(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == BoS301
		if eventID == 1
			; INFO/STAGE 000B2EE7  on BoS301
			; DESCRIPTION: Player is speaking to Doctor Li, who is refusing to help rebuild Liberty Prime. Player convinces her to help by saying she should do it to avenge Doctor Virgil.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 000B2EE8  on BoS301
			; DESCRIPTION: Player is speaking to Doctor Li, who is refusing to help rebuild Liberty Prime. Player convinces her to help by saying she should do it to help end the Institute's greed.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 3
			; INFO/STAGE 000B2F36  on BoS301
			; DESCRIPTION: Player is speaking to Doctor Li, who is refusing to help rebuild Liberty Prime. Player convinces her to help by saying she should do it because the Brotherhood cares what happens to the Commonwealth.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 4
			; INFO/STAGE 000B2F70  on BoS301
			; DESCRIPTION: Player is speaking to Doctor Li, who is refusing to help rebuild Liberty Prime. Player convinces her to help by threatening to have her shot.

			;FALLOUTVORE COMPANIONS: 
			Bria_Loves()

		elseif eventID == 5
			; INFO/STAGE 0013C679  on BoS301
			; DESCRIPTION: Player is in Diamond City, talking to Doctor Duff at the Science Center while looking for Professor Scara. Scara and Duff are a couple. Duff is obviously upset when Player says hello. Player ignores the dismay and gets right to business.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 6
			; INFO/STAGE 0013C683  on BoS301
			; DESCRIPTION: Player is in Diamond City, talking to Doctor Duff at the Science Center while looking for Professor Scara. Scara and Duff are a couple. Duff is obviously upset when Player says hello. Player says he doesn't care that she's not in the mood to talk and demands to know where Scara is.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 7
			; INFO/STAGE 0013C691  on BoS301
			; DESCRIPTION: Player is in Diamond City, talking to Doctor Duff at the Science Center while looking for Professor Scara. Scara and Duff are a couple. Duff is obviously upset when Player says hello. Player instantly wants to help Duff out with whatever is bothering her.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		else
			debug.trace(self + " WARNING - BoS301 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_BoS302(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == BoS302
		if eventID == 1
			; INFO/STAGE 000C31FF  on BoS302
			; DESCRIPTION: Maxson tells Player Danse is really a synth and he should be executed. Player refuses to carry out the order.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 000C3210  on BoS302
			; DESCRIPTION: Maxson tells Player Danse is really a synth and he should be executed. Player says he'll do it "with pleasure."

			;FALLOUTVORE COMPANIONS: 
			Bria_Loves()

		elseif eventID == 3
			; INFO/STAGE 000C3228  on BoS302
			; DESCRIPTION: Maxson tells Player Danse is really a synth and he should be executed. Player asks if there's another way.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 4
			; INFO/STAGE 000C323E  on BoS302
			; DESCRIPTION: Maxson tells Player Danse is really a synth and he should be executed. Player doesn't know what to say.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 5
			; INFO/STAGE 000CAA90  on BoS302
			; DESCRIPTION: Scribe Haylen appeals to the Player not to execute Danse. Player says he's confused and needs to sort it out.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 6
			; INFO/STAGE 000CAAB0  on BoS302
			; DESCRIPTION: Scribe Haylen appeals to the Player not to execute Danse. Player says he won't make any promises.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 7
			; INFO/STAGE 000CAAD0  on BoS302
			; DESCRIPTION: Scribe Haylen appeals to the Player not to execute Danse. Player says he'll definitely hear Danse's side of the story before pulling the trigger.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 8
			; INFO/STAGE 0014D0F8  on BoS302
			; DESCRIPTION: Player finds Danse in an almost suicidal state. Danse feels he needs to die in order for things to be right with the Brotherhood. Player refuses to pull the trigger.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 9
			; INFO/STAGE 0014D106  on BoS302
			; DESCRIPTION: Player finds Danse in an almost suicidal state. Danse feels he needs to die in order for things to be right with the Brotherhood. Player agrees to execute Paladin Danse.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 10
			; INFO/STAGE 0014F537  on BoS302
			; DESCRIPTION: Maxson has caught Player trying to exile Danse instead of executing him. After a confrontation of words, Player now agrees Danse should die, but refuses to pull the trigger himself, making Maxson do the deed.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 11
			; INFO/STAGE 0014F53C  on BoS302
			; DESCRIPTION: Maxson has caught Player trying to exile Danse instead of executing him. After a confrontation of words, Player now agrees Danse should die, and says he'll do it.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 12
			; INFO/STAGE 0014F546  on BoS302
			; DESCRIPTION: Maxson has caught Player trying to exile Danse instead of executing him. After a confrontation of words, Player still stands his ground and tries to speech challenge Maxson into reconsidering.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 13
			; INFO/STAGE 0019465C  on BoS302
			; DESCRIPTION: After the confrontation with Maxson, Player agreed to execute Danse, but changed his mind and is now speech challenging Maxson into reconsidering.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 14
			; INFO/STAGE 00194665  on BoS302
			; DESCRIPTION: Player had agreed to execute Paladin Danse. Danse is kneeling ready to die, but Player has a change of heart and says he won't do it.

			;FALLOUTVORE COMPANIONS: 
			Bria_Hates()

		else
			debug.trace(self + " WARNING - BoS302 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_BoS303(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == BoS303
		if eventID == 1 || eventID == 13 || eventID == 15
			; INFO/STAGE 001564EC  on BoS303
			; DESCRIPTION: After saying no to Proctor Ingram coming along to Mass Fusion, Player has a change of heart, and allows her to go.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2 || eventID == 11 || eventID == 14
			; INFO/STAGE 001564EE  on BoS303
			; DESCRIPTION: Player is heading out to Mass Fusion, and Proctor Ingram (she's not a soldier and she's handicapped (in a power armor rig)) wants to go along. Player agrees to allow her to help.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 3 || eventID == 10 || eventID == 12
			; INFO/STAGE 001564F2  on BoS303
			; DESCRIPTION: After saying no to Proctor Ingram coming along to Mass Fusion, Player maintains his refusal.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 4 || eventID == 8 || eventID == 18
			; INFO/STAGE 001564F4  on BoS303
			; DESCRIPTION: Player is heading out to Mass Fusion, and Proctor Ingram (she's not a soldier and she's handicapped (in a power armor rig)) wants to go along. Player tells her she has to stay behind.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 5 || eventID == 9 || eventID == 17
			; INFO/STAGE 001564F9  on BoS303
			; DESCRIPTION: After saying no to Proctor Ingram coming along to Mass Fusion, Player is flippant and tells her it's "her funeral." but still lets her come along.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 6 || eventID == 7 || eventID == 16
			; INFO/STAGE 001564FB  on BoS303
			; DESCRIPTION: Player is heading out to Mass Fusion, and Proctor Ingram (she's not a soldier and she's handicapped (in a power armor rig)) wants to go along. Player tells her "it's her funeral." but still lets her come along.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - BoS303 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_BoSM01(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == BoSM01
		if eventID == 2
			; INFO/STAGE 000B3D3F  on BoSM01
			; DESCRIPTION: Speaking to Paladin Brandis who was from a Brotherhood patrol missing for years, he's now a crazy hermit. He's paranoid and brandishing a gun. Player threatens him to drop it.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 000B3D48  on BoSM01
			; DESCRIPTION: Paladin Brandis is asking about the rest of his team, who the Player discovered are long dead. Player lies and says he doesn't know what happened to them.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 4
			; INFO/STAGE 000B3D56  on BoSM01
			; DESCRIPTION: Paladin Brandis is asking about the rest of his team, who the Player discovered are long dead. Player coldly tells Brandis "They're dead"

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 5 || eventID == 6
			; INFO/STAGE 000B3D6A  on BoSM01
			; DESCRIPTION: Paladin Brandis is asking about the rest of his team, who the Player discovered are long dead. Player is sympathetic and gives Brandis the fallen soldiers's holotags.

			;FALLOUTVORE COMPANIONS: 
			Bria_Hates()

		elseif eventID == 7
			; INFO/STAGE 00143997  on BoSM01
			; DESCRIPTION: After dealing with Paladin Brandis, Player is greedy and asks him for a reward for reporting the information about his fallen team to a hermit who has very little

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - BoSM01 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_BoSM02(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == BoSM02
		if eventID == 1
			; INFO/STAGE 000BDC5B  on BoSM02
			; DESCRIPTION: Player has discovered that Initiate Clarke is harboring and feeding feral ghouls, because he recognizes their past humanity. Clarke wants to know what Player is deciding what to do with ferals. Player asks Clarke "What do you think I should do?"

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 000BDC5D  on BoSM02
			; DESCRIPTION: Clarke wants to know if the Player thinks he's doing the right thing. Player confirms he did the right thing by feeding the ferals.

			;FALLOUTVORE COMPANIONS: 
			Bria_Hates()

		elseif eventID == 3
			; INFO/STAGE 000BDC83  on BoSM02
			; DESCRIPTION: Clarke wants to know his fate now that he's been discovered. Player says he has to die for what he's done.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 4
			; INFO/STAGE 000BDC88  on BoSM02
			; DESCRIPTION: Player has discovered that Initiate Clarke is harboring and feeding feral ghouls, because he recognizes their past humanity. Clarke wants to know what Player is deciding what to do with ferals. Player says they need to be killed because they're monsters.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 5
			; INFO/STAGE 000BDC89  on BoSM02
			; DESCRIPTION: Player has discovered that Initiate Clarke is harboring and feeding feral ghouls, because he recognizes their past humanity. Clarke wants to know what Player is deciding what to do with ferals. Player says they need to be killed because they might harm others.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 6
			; INFO/STAGE 000BDC8D  on BoSM02
			; DESCRIPTION: Clarke wants to know if the Player thinks he's doing the right thing feeding the ghouls. Player is evasive, saying if Clarke felt it was right, then it must be right.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 7
			; INFO/STAGE 000BDCA2  on BoSM02
			; DESCRIPTION: Clarke wants to know his fate now that he's been discovered. Player says he'll keep the whole thing a secret.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 8
			; INFO/STAGE 000BDCA6  on BoSM02
			; DESCRIPTION: Player has discovered that Initiate Clarke is harboring and feeding feral ghouls, because he recognizes their past humanity. Clarke wants to know what Player is deciding what to do with ferals. Player is indecisive.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 9
			; INFO/STAGE 000BDCAB  on BoSM02
			; DESCRIPTION: Clarke wants to know if the Player thinks he's doing the right thing. Player says that feeding feral ghouls was wrong.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 10
			; INFO/STAGE 000BDCB1  on BoSM02
			; DESCRIPTION: Clarke wants to know his fate now that he's been discovered. Player says he'll report it, but allow Clarke to run in the meantime.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 11
			; INFO/STAGE 000BDCB5  on BoSM02
			; DESCRIPTION: Player has discovered that Initiate Clarke is harboring and feeding feral ghouls, because he recognizes their past humanity. Clarke wants to know what Player is deciding what to do with ferals. Player says they need to be killed because that's what the Brotherhood does.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 12
			; INFO/STAGE 000BDCB6  on BoSM02
			; DESCRIPTION: Player has discovered that Initiate Clarke is harboring and feeding feral ghouls, because he recognizes their past humanity. Clarke wants to know what Player is deciding what to do with ferals. Player says he won’t tell anyone about them.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 13
			; INFO/STAGE 000BE1CE  on BoSM02
			; DESCRIPTION: The Player has surprised Clarke (he had been following him secretly). When confronted, Player confirms to Clarke he was following him.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 14
			; INFO/STAGE 000C177C  on BoSM02
			; DESCRIPTION: Clarke has disclosed that he had a friend who was a Ghoul. He asks Player if ferals should be killed, should all ghouls? Player says yes.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 15
			; INFO/STAGE 000C178D  on BoSM02
			; DESCRIPTION: Clarke has disclosed that he had a friend who was a Ghoul. He asks Player if ferals should be killed, should all ghouls? Player asks if his friend was a feral ghoul as though it would matter.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 16
			; INFO/STAGE 000C179E  on BoSM02
			; DESCRIPTION: Clarke has disclosed that he had a friend who was a Ghoul. He asks Player if ferals should be killed, should all ghouls? Player says he doesn't know.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 17
			; INFO/STAGE 000C17B7  on BoSM02
			; DESCRIPTION: Clarke has disclosed that he had a friend who was a Ghoul. He asks Player if ferals should be killed, should all ghouls? Player says no.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 18
			; INFO/STAGE 001669CE  on BoSM02
			; DESCRIPTION: Clarke wants to know his fate now that he's been discovered. Player speech challenges Clarke to turn himself in.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - BoSM02 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_BoSR05(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == BoSR05
		if eventID == 1 || eventID == 8
			; INFO/STAGE 000D2C11  on BoSR05
			; DESCRIPTION: Player tries to pass a speech challenge to nicely persuade farmers to give crops to the Brotherhood of Steel.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 000D2C14  on BoSR05
			; DESCRIPTION: Player says "no deal" after hearing the price the farmers want for their crops.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 000D2C25  on BoSR05
			; DESCRIPTION: Player decides to be fair and pay the farmer for the crops the Brotherhood of Steel wants.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 4 || eventID == 7
			; INFO/STAGE 000D2C2A  on BoSR05
			; DESCRIPTION: Player tries to pass a speech challenge to get the farmer to lower the price for their crops by half.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 5 || eventID == 6
			; INFO/STAGE 000D2C34  on BoSR05
			; DESCRIPTION: Player tries to pass a speech challenge to demand farmers to give crops to the Brotherhood of Steel.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - BoSR05 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_DialogueAbernathyFarm(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DialogueAbernathyFarm
		if eventID == 1
			; INFO/STAGE 0001A9C7  on DialogueAbernathyFarm
			; DESCRIPTION: Player is offering to help a woman farm melons. He gouges her for more caps to get the job done.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 0006D390  on DialogueAbernathyFarm
			; DESCRIPTION: Player is speaking with a farmer, who muses about how tough he's having it. Player sympathizes.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 3
			; INFO/STAGE 0006D393  on DialogueAbernathyFarm
			; DESCRIPTION: Player is speaking with a farmer, who mentions that his daughter was slain. Player sympathizes.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 4
			; INFO/STAGE 0006D39A  on DialogueAbernathyFarm
			; DESCRIPTION: Player is speaking with a farmer, who muses about how tough he's having it. Player is rude and calls farm "pathetic."

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 5
			; INFO/STAGE 0006D39D  on DialogueAbernathyFarm
			; DESCRIPTION: Player is speaking with a farmer, who mentions that his daughter was slain. Player is rude and says she "got what she deserved."

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - DialogueAbernathyFarm got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_DialogueBunkerHill(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DialogueBunkerHill
		if eventID == 1
			; INFO/STAGE 000C45A2  on DialogueBunkerHill
			; DESCRIPTION: The Player insists that saving synths sounds noble.

			;FALLOUTVORE COMPANIONS: 
			Bria_Hates()

		elseif eventID == 2
			; INFO/STAGE 000C45AB  on DialogueBunkerHill
			; DESCRIPTION: The Player insists that synths are weapons built by the Institute (not beings).

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 000C45BC  on DialogueBunkerHill
			; DESCRIPTION: A settler at Bunker Hill has asked Player to talk their son out of getting involved with the Railroad. Player seems disinterested in getting involved, saying that he should look after himself and not worry about others.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 4
			; INFO/STAGE 000C45CE  on DialogueBunkerHill
			; DESCRIPTION: A settler at Bunker Hill has asked Player to talk their son out of getting involved with the Railroad. Player disagrees and tells the man that it's good to help people. Note that the "people" in questons are synths.

			;FALLOUTVORE COMPANIONS: 
			Bria_Hates()

		else
			debug.trace(self + " WARNING - DialogueBunkerHill got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_DialogueConcordArea(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DialogueConcordArea
		if eventID == 1
			; INFO/STAGE 0001A4C0  on DialogueConcordArea
			; DESCRIPTION: Player is talking to Mama Murphy at the Museum. She muses that Dogmeat was a good dog for bringing Player there. Player agrees and says Dogmeat is smart.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 0001A4C1  on DialogueConcordArea
			; DESCRIPTION: Player is talking to Mama Murphy at the Museum. She muses that Dogmeat was a good dog for bringing Player there. Player says that the dog is dumb and will get him killed.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 0001A4C2  on DialogueConcordArea
			; DESCRIPTION: Player is talking to Mama Murphy at the Museum. She muses that Dogmeat was a good dog for bringing Player there. Player is indifferent about it.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 4
			; INFO/STAGE 0001C22F  on DialogueConcordArea
			; DESCRIPTION: Player just wiped out the Deathclaw and Raiders in Concord with Power Armor. Preston says he's glad Player is on our side. Player says that the feeling's mutual.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 5
			; INFO/STAGE 0001C23C  on DialogueConcordArea
			; DESCRIPTION: Player just wiped out the Deathclaw and Raiders in Concord with Power Armor. Preston says he's glad Player is on our side. Player says he's on his own side.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 6
			; INFO/STAGE 0001C23D  on DialogueConcordArea
			; DESCRIPTION: Player just wiped out the Deathclaw and Raiders in Concord with Power Armor. Preston says he's glad Player is on our side. Player says "you're nothing to me" (rude)

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 7
			; INFO/STAGE 0001DC7E  on DialogueConcordArea
			; DESCRIPTION: Preston's initial meeting in the Museum where he's upset that the MinuteMen numbers are declining. Player is rude and says it's a cruel world.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 8 || eventID == 25
			; INFO/STAGE 0001DC8D  on DialogueConcordArea
			; DESCRIPTION: Preston and Sturgis pitched the Player the idea of getting the Power Armor up and running. Player says "We'll see."

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 9 || eventID == 12 || eventID == 27
			; INFO/STAGE 0001DC99  on DialogueConcordArea
			; DESCRIPTION: Preston and Sturgis pitched the Player the idea of getting the Power Armor up and running. Player says no.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 10 || eventID == 22
			; INFO/STAGE 0001DCA3  on DialogueConcordArea
			; DESCRIPTION: Preston and Sturgis pitched the Player the idea of getting the Power Armor up and running. Player presents the Fusion Core he already had on him.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 11 || eventID == 31
			; INFO/STAGE 0001DCA4  on DialogueConcordArea
			; DESCRIPTION: Preston and Sturgis pitched the Player the idea of getting the Power Armor up and running. Player agrees to the job.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 13
			; INFO/STAGE 0001DCB3  on DialogueConcordArea
			; DESCRIPTION: Preston's initial meeting in the Museum where he's upset that the MinuteMen numbers are declining. Player sympathizes.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 14
			; INFO/STAGE 000329B8  on DialogueConcordArea
			; DESCRIPTION: Mama Murphy has forshadowed that "something angry is coming" with the Sight. Player says he's confident he'll stop whatever it is.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 15
			; INFO/STAGE 000329BF  on DialogueConcordArea
			; DESCRIPTION: Mama Murphy has forshadowed that "something angry is coming" with the Sight. Player says everyone's doomed.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 16
			; INFO/STAGE 0005DF1A  on DialogueConcordArea
			; DESCRIPTION: Preston asked Player to help set up Sanctuary. Player says he'll think about it.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 17
			; INFO/STAGE 0005DF1E  on DialogueConcordArea
			; DESCRIPTION: Preston asked Player to help set up Sanctuary. Player says no.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 18
			; INFO/STAGE 0005DF23  on DialogueConcordArea
			; DESCRIPTION: Preston asked Player to help set up Sanctuary. Player agrees and says he's in.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 19
			; INFO/STAGE 00075F4D  on DialogueConcordArea
			; DESCRIPTION: Player is talking to Mama Murphy at the Museum. She says the Player is a hero/rescuer. Player is indifferent about it.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 20
			; INFO/STAGE 00075F51  on DialogueConcordArea
			; DESCRIPTION: Player is talking to Mama Murphy at the Museum. She says the Player is a hero/rescuer. Player says heroism is for kids and suckers.

			;FALLOUTVORE COMPANIONS: 
			Bria_Loves()

		elseif eventID == 21
			; INFO/STAGE 00075F53  on DialogueConcordArea
			; DESCRIPTION: Player is talking to Mama Murphy at the Museum. She says the Player is a hero/rescuer. Player says he was just trying to do what's right.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 23 || eventID == 26
			; INFO/STAGE 000D229D  on DialogueConcordArea
			; DESCRIPTION: Preston and Sturgis requested Player help clear Raiders by grabbing minigun off of downed vertibird. Player says he'll think about it.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 24 || eventID == 28
			; INFO/STAGE 000D22A1  on DialogueConcordArea
			; DESCRIPTION: Preston and Sturgis requested Player help clear Raiders by grabbing minigun off of downed vertibird. Player says no.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 29 || eventID == 32
			; INFO/STAGE 000D22AA  on DialogueConcordArea
			; DESCRIPTION: Preston and Sturgis requested Player help clear Raiders by grabbing minigun off of downed vertibird. Player says he has a minigun already and will help.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 30 || eventID == 33
			; INFO/STAGE 000D22AB  on DialogueConcordArea
			; DESCRIPTION: Preston and Sturgis requested Player help clear Raiders by grabbing minigun off of downed vertibird. Player agrees.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		else
			debug.trace(self + " WARNING - DialogueConcordArea got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_DialogueDiamondCity(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DialogueDiamondCity
		if eventID == 1
			; INFO/STAGE 0001DABE  on DialogueDiamondCity
			; DESCRIPTION: Player is being questioned by Myrna, who is concerned he might be a synth. When asked if he's really human, Player is sarcastic and says he's Jangles the Moon Monkey.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 00023BA4  on DialogueDiamondCity
			; DESCRIPTION: Player is talking with Ann Codman, who is clearly thinking Player is there for a handout. She tosses Player few caps to make him go away, and Player calls her a bitch.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 00023BAE  on DialogueDiamondCity
			; DESCRIPTION: Player is talking with Ann Codman, who is clearly thinking Player is there for a handout. She tosses Player few caps to make him go away, and Player agrees to leave.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 4
			; INFO/STAGE 00023BB0  on DialogueDiamondCity
			; DESCRIPTION: Player is talking with Ann Codman, who is clearly thinking Player is there for a handout. She tosses Player few caps to make him go away, and Player retorts with sarcasm.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 5
			; INFO/STAGE 000360F8  on DialogueDiamondCity
			; DESCRIPTION: Player is being questioned by Myrna, who is concerned he might be a synth. When asked if he's really human, Player says he's not human at all, which will obviously agitate Myrna.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 6
			; INFO/STAGE 00048252  on DialogueDiamondCity
			; DESCRIPTION: Player is speaking with Duff at Science Center. She asks Player to help her out by collecting Bloatfly Glands. Player says no.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 7
			; INFO/STAGE 0004829A  on DialogueDiamondCity
			; DESCRIPTION: Player is speaking with Duff at Science Center. She asks Player to help her out by collecting Bloatfly Glands. Player agrees.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 8
			; INFO/STAGE 0005C42D  on DialogueDiamondCity
			; DESCRIPTION: Player is talking to Ellie in Nick's Detective Agency. She tells her sad story about Nick going missing, asks Player to help find Nick. Player agrees immediately.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 9
			; INFO/STAGE 0005C42F  on DialogueDiamondCity
			; DESCRIPTION: Player is talking to Ellie in Nick's Detective Agency. She tells her sad story about Nick going missing, asks Player to help find Nick. Player says no way.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 10
			; INFO/STAGE 0005C435  on DialogueDiamondCity
			; DESCRIPTION: Player is talking to Ellie in Nick's Detective Agency. She tells her sad story about Nick going missing, asks Player to help find Nick. Player says only if he gets paid for his time.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 11
			; INFO/STAGE 000673DF  on DialogueDiamondCity
			; DESCRIPTION: Player is talking to Moe about baseball. Player insists he knows what baseball really was. He tells the truth about it being part of America's pastime, painting a nostalgic picture.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 12
			; INFO/STAGE 000673EE  on DialogueDiamondCity
			; DESCRIPTION: Player is talking to Moe about baseball. Player insists he knows what baseball really was. He makes up a story about it being extremely violent.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 13
			; INFO/STAGE 0007D5A6  on DialogueDiamondCity
			; DESCRIPTION: Player is talking to Solomon who asks the Player to collect ferns to bolster his chem stand inventory. Player says no.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 14
			; INFO/STAGE 0007D5AB  on DialogueDiamondCity
			; DESCRIPTION: Player is talking to Solomon who asks the Player to collect ferns to bolster his chem stand inventory. Player agrees.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 15
			; INFO/STAGE 0007D5AF  on DialogueDiamondCity
			; DESCRIPTION: Player is talking to Moe who needs a full set of baseball regalia. Player agrees to hunt the pieces down.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 16
			; INFO/STAGE 0007D5B9  on DialogueDiamondCity
			; DESCRIPTION: Player is talking to Moe who needs a full set of baseball regalia. Player agrees to hunt the pieces down if he's paid more than was originally offered.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 17
			; INFO/STAGE 0007D5C4  on DialogueDiamondCity
			; DESCRIPTION: Player is talking to Solomon who asks the Player to collect ferns to bolster his chem stand inventory. Player says he'll do it for money.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 18
			; INFO/STAGE 0007D5C8  on DialogueDiamondCity
			; DESCRIPTION: Player is talking to Moe who needs a full set of baseball regalia. Player refuses to help.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 19
			; INFO/STAGE 00136047  on DialogueDiamondCity
			; DESCRIPTION: Player is talking to Solomon who asks the Player to collect ferns to bolster his chem stand inventory. Player offers some that he'd already been collecting.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 20
			; INFO/STAGE 0013A03E  on DialogueDiamondCity
			; DESCRIPTION: Player is speaking to Cathy, who wants Player to talk some sense into her son. She asks if McDonough's secretary is a synth, Player says yes. You don't really know.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 21
			; INFO/STAGE 0013A042  on DialogueDiamondCity
			; DESCRIPTION: Player is speaking to Cathy, who wants Player to talk some sense into her son. She asks if McDonough's secretary is a synth, Player says he doesn't know.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 22
			; INFO/STAGE 0013A044  on DialogueDiamondCity
			; DESCRIPTION: Player is speaking to Cathy, who wants Player to talk some sense into her son. She asks if McDonough's secretary is a synth, Player says no.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 23
			; INFO/STAGE 0014243F  on DialogueDiamondCity
			; DESCRIPTION: Sheng is asking the Player to clean out the water purification system (nasty job). Player refuses to help.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 24
			; INFO/STAGE 00142446  on DialogueDiamondCity
			; DESCRIPTION: Sheng is asking the Player to clean out the water purification system (nasty job). Player says he'll help for money.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 25
			; INFO/STAGE 00142449  on DialogueDiamondCity
			; DESCRIPTION: Sheng is asking the Player to clean out the water purification system (nasty job). Player tells him he already did it.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 26
			; INFO/STAGE 0014244A  on DialogueDiamondCity
			; DESCRIPTION: Sheng is asking the Player to clean out the water purification system (nasty job). Player agrees to help out.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 27
			; INFO/STAGE 00144A82  on DialogueDiamondCity
			; DESCRIPTION: Player is talking to Hawthorne. He asks how Player sees himself as a merc or a caravan guard. Player says guard, because he likes to help people.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 28
			; INFO/STAGE 00144A8A  on DialogueDiamondCity
			; DESCRIPTION: Player is talking to Hawthorne. He asks how Player sees himself as a merc or a caravan guard. Player says he's a merc, always in it for the action and the money.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 29
			; INFO/STAGE 00173B3C  on DialogueDiamondCity
			; DESCRIPTION: Player is listening to Duff's science lesson. Duff asks which type of radiation is the most dangerous. Player says Gamma Rays (which is correct).

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 30
			; INFO/STAGE 00173B43  on DialogueDiamondCity
			; DESCRIPTION: Player is speaking with Duff at Science Center. She asks Player to help her out by collecting Bloatfly Glands. Player says he'll do it for money only.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 31
			; INFO/STAGE 00173B4A  on DialogueDiamondCity
			; DESCRIPTION: Player is speaking with Duff at Science Center. She asks Player to help her out by collecting Bloatfly Glands. Player offers some he's already collected.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 32
			; INFO/STAGE 00173B6B  on DialogueDiamondCity
			; DESCRIPTION: Player is listening to Duff's science lesson. Duff asks which type of radiation is the most dangerous. Player is rude and answers "Who-Gives-A-Crap Rays."

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - DialogueDiamondCity got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_DialogueDiamondCityEntrance(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DialogueDiamondCityEntrance
		if eventID == 1
			; INFO/STAGE 0001AC02  on DialogueDiamondCityEntrance
			; DESCRIPTION: Player is speaking to Piper outside Diamond City. Piper bluffed her way in using Player as a patsy. She suggests they head inside before they get wise to the trick and Player is rude to Piper, saying "I don't take orders from you."

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 0001C045  on DialogueDiamondCityEntrance
			; DESCRIPTION: Player is listening to Piper and the Mayor argue about "free speech." Player interjects that it's none of his business, staying out of the argument.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 3
			; INFO/STAGE 0001C04F  on DialogueDiamondCityEntrance
			; DESCRIPTION: Player is listening to Piper and the Mayor argue about "free speech." Player interjects that he's thinks newspapers stir up trouble.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 4
			; INFO/STAGE 0001C05B  on DialogueDiamondCityEntrance
			; DESCRIPTION: Player is listening to Piper and the Mayor argue about "free speech." Player interjects that he's always believed in freedom of the press.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 5
			; INFO/STAGE 00022D51  on DialogueDiamondCityEntrance
			; DESCRIPTION: Player is speaking to Danny just inside after Piper's ruse to get them both into the city. Danny suspects Piper was lying. Player says he was innocent bystander.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 6
			; INFO/STAGE 00022D58  on DialogueDiamondCityEntrance
			; DESCRIPTION: Player is speaking to Danny just inside after Piper's ruse to get them both into the city. Danny suspects Piper was lying. Player admits it was a lie.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 7
			; INFO/STAGE 00022D5E  on DialogueDiamondCityEntrance
			; DESCRIPTION: Player is speaking to Danny just inside after Piper's ruse to get them both into the city. Danny suspects Piper was lying. Player keeps the lie going.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - DialogueDiamondCityEntrance got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_DialogueDiamondCitySchoolhouse(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DialogueDiamondCitySchoolhouse
		if eventID == 1
			; INFO/STAGE 001456AA  on DialogueDiamondCitySchoolhouse
			; DESCRIPTION: Player is speaking to Edna about love. She asks if it can exist between two very different people. Player says everything you love will just get taken away.

			;FALLOUTVORE COMPANIONS: 
			Bria_Loves()

		elseif eventID == 2
			; INFO/STAGE 001456AE  on DialogueDiamondCitySchoolhouse
			; DESCRIPTION: Player has stumbled into a math quiz given by Edna. When asked a math question, Player answers it correctly.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 3
			; INFO/STAGE 001456B2  on DialogueDiamondCitySchoolhouse
			; DESCRIPTION: Player is speaking to Edna after the math question. Edna says the kids in her school need love from their family in order to learn. Player is pragmatic and says kids need structure.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 4
			; INFO/STAGE 001456B6  on DialogueDiamondCitySchoolhouse
			; DESCRIPTION: Player is speaking to Edna about love. She asks if it can exist between two very different people. Player says hold onto whoever you find, tomorrow you might not have the chance.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 5
			; INFO/STAGE 001456B9  on DialogueDiamondCitySchoolhouse
			; DESCRIPTION: Player has stumbled into a math quiz given by Edna. When asked a math question, Player is rude and says sarcastic line.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 6
			; INFO/STAGE 001456BD  on DialogueDiamondCitySchoolhouse
			; DESCRIPTION: Player is speaking to Edna after the math question. Edna says the kids in her school need love from their family in order to learn. Player disagrees, saying sometimes you need to be tough to survive.

			;FALLOUTVORE COMPANIONS: 
			Bria_Loves()

		elseif eventID == 7
			; INFO/STAGE 001456C0  on DialogueDiamondCitySchoolhouse
			; DESCRIPTION: Player stumbles into the schoolhouse, and Zwicky scolds that it isn't a store. The Player is defiant and says he can go wherever he wants.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 8
			; INFO/STAGE 001456C8  on DialogueDiamondCitySchoolhouse
			; DESCRIPTION: Player is speaking to Edna after the math question. Edna says the kids in her school need love from their family in order to learn. Player agrees.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 9
			; INFO/STAGE 001456CD  on DialogueDiamondCitySchoolhouse
			; DESCRIPTION: Player stumbles into the schoolhouse, and Zwicky scolds that it isn't a store. The Player apologizes.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 10
			; INFO/STAGE 001456D1  on DialogueDiamondCitySchoolhouse
			; DESCRIPTION: Player is speaking to Edna about love. She asks if it can exist between two very different people. Player says that's between you and the other person, offering no real insight.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - DialogueDiamondCitySchoolhouse got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_DialogueDrumlinDiner(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DialogueDrumlinDiner
		if eventID == 1
			; INFO/STAGE 001069CA  on DialogueDrumlinDiner
			; DESCRIPTION: Player stumbled into Wolfgang demanding his money from a junkie's mother, Trudy. Player is speaking to Wolfgang, who asks Player to talk some sense into Trudy. Player agrees to talk to her on his behalf.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 001069CC  on DialogueDrumlinDiner
			; DESCRIPTION: Player is trying to get more details from Wolfgang about his beef with Trudy. He admits to selling Jet to Trudy's son and continuing to sell it until son was in debt. Player agrees the debt is valid.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 3
			; INFO/STAGE 001069D0  on DialogueDrumlinDiner
			; DESCRIPTION: Player stumbled into Wolfgang demanding his money from a junkie's mother, Trudy. Player is speaking to Wolfgang, who asks Player to talk some sense into Trudy. Player takes Wolfgang's side immediately and offers to start shooting up the place.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 4
			; INFO/STAGE 001069D3  on DialogueDrumlinDiner
			; DESCRIPTION: Player is trying to get more details from Wolfgang about his beef with Trudy. He admits to selling Jet to Trudy's son and continuing to sell it until son was in debt. Player is angry Wolfgang made the son an addict.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 5
			; INFO/STAGE 001069D6  on DialogueDrumlinDiner
			; DESCRIPTION: Player stumbled into Wolfgang demanding his money from a junkie's mother, Trudy. Wolfgang tells Player to butt out, Player threatens him and says get the gun out of his face.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 6
			; INFO/STAGE 001069DB  on DialogueDrumlinDiner
			; DESCRIPTION: Player is trying to get more details from Wolfgang about his beef with Trudy. He admits to selling Jet to Trudy's son and continuing to sell it until son was in debt. Player thinks both sides messed this one up.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 7
			; INFO/STAGE 001069DE  on DialogueDrumlinDiner
			; DESCRIPTION: Player stumbled into Wolfgang demanding his money from a junkie's mother, Trudy. Wolfgang tells Player to butt out, Player is frustrated by this and exclaims the world can "bite his ass."

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 8
			; INFO/STAGE 001069E1  on DialogueDrumlinDiner
			; DESCRIPTION: Player stumbled into Wolfgang demanding his money from a junkie's mother, Trudy. Wolfgang tells Player to butt out, but Player offers to diffuse the situation.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 9
			; INFO/STAGE 001069E2  on DialogueDrumlinDiner
			; DESCRIPTION: Player stumbled into Wolfgang demanding his money from a junkie's mother, Trudy. Player is speaking to Wolfgang, who asks Player to talk some sense into Trudy. Player says he'll help diffuse the situation, but he better get paid.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 10
			; INFO/STAGE 00106C0C  on DialogueDrumlinDiner
			; DESCRIPTION: Player is speaking to Trudy after agreeing to arbitrate for Wolfgang. Player says he wants to help, but asks Trudy what she wants to do.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 11 || eventID == 16
			; INFO/STAGE 00106C14  on DialogueDrumlinDiner
			; DESCRIPTION: Trudy has offered the Player caps to kill Wolfgang so she doesn't have to pay him more money. Player declines.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 12
			; INFO/STAGE 00106C17  on DialogueDrumlinDiner
			; DESCRIPTION: Player is speaking to Trudy after agreeing to arbitrate for Wolfgang. Player tries to convince Trudy to just pay the money so everything ends peacefully.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 13 || eventID == 17
			; INFO/STAGE 00106C18  on DialogueDrumlinDiner
			; DESCRIPTION: Trudy has offered the Player caps to kill Wolfgang so she doesn't have to pay him more money. Player agrees.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 14
			; INFO/STAGE 00106C1B  on DialogueDrumlinDiner
			; DESCRIPTION: Player is speaking to Trudy after agreeing to arbitrate for Wolfgang. Player turns the tables and threatens violence if she doesn't turn the money over Player himself.

			;FALLOUTVORE COMPANIONS: 
			Bria_Loves()

		elseif eventID == 15 || eventID == 18
			; INFO/STAGE 00106C2B  on DialogueDrumlinDiner
			; DESCRIPTION: Trudy has offered the Player caps to kill Wolfgang so she doesn't have to pay him more money. Player says he'll do it, but ups the price.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - DialogueDrumlinDiner got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_DialogueGoodneighbor(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DialogueGoodneighbor
		if eventID == 1
			; INFO/STAGE 00075361  on DialogueGoodneighbor
			; DESCRIPTION: After hearing Magnolia sing, she asks Player if he liked the song or not. Player evades answering by saying he just wants to talk.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 00075366  on DialogueGoodneighbor
			; DESCRIPTION: After hearing Magnolia sing, she asks Player if he liked the song or not. Player said he's not a fan of jazz.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 3
			; INFO/STAGE 0007536A  on DialogueGoodneighbor
			; DESCRIPTION: After hearing Magnolia sing, she asks Player if he liked the song or not. Player said he loved it.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 4
			; INFO/STAGE 00075E1F  on DialogueGoodneighbor
			; DESCRIPTION: Player is speaking to Daisy who asked what the world was like before the Great War. Player paints a white-picket fence/peaceful description.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 5
			; INFO/STAGE 00075E25  on DialogueGoodneighbor
			; DESCRIPTION: Player is speaking to Daisy who asked what the world was like before the Great War. Player paints bleak picture of governments going to war and people dying.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 6
			; INFO/STAGE 00075E2E  on DialogueGoodneighbor
			; DESCRIPTION: Player is speaking to Daisy who asked what the world was like before the Great War. Player says it hasn't changed much, just "with less rust."

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 7
			; INFO/STAGE 000802D9  on DialogueGoodneighbor
			; DESCRIPTION: Player encounters the Ghoul version of the Vtech Salesman who laments being alone in the world. Player tells him to make due in Goodneighbor.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 8
			; INFO/STAGE 000802E8  on DialogueGoodneighbor
			; DESCRIPTION: Player encounters the Ghoul version of the Vtech Salesman who is astonished Player is still alive. When asked how he did it, Player alludes that the blood of his enemies makes him immortal.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 9
			; INFO/STAGE 000802ED  on DialogueGoodneighbor
			; DESCRIPTION: Player encounters the Ghoul version of the Vtech Salesman who laments being alone in the world. Player offers him a place in Sanctuary.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 10
			; INFO/STAGE 000802F8  on DialogueGoodneighbor
			; DESCRIPTION: Player encounters the Ghoul version of the Vtech Salesman who laments being alone in the world. Player pushes him aside.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 11
			; INFO/STAGE 0010B66A  on DialogueGoodneighbor
			; DESCRIPTION: Daisy is trying to convince the Player to clear a library that's occupied by Super Mutants. Player says he already did the deed.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 12
			; INFO/STAGE 0010B66B  on DialogueGoodneighbor
			; DESCRIPTION: Daisy is trying to convince the Player to clear a library that's occupied by Super Mutants. Player agrees to do it.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 13
			; INFO/STAGE 0010B66F  on DialogueGoodneighbor
			; DESCRIPTION: Daisy is trying to convince the Player to clear a library that's occupied by Super Mutants. Player declines.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 14
			; INFO/STAGE 0010B676  on DialogueGoodneighbor
			; DESCRIPTION: Daisy is trying to convince the Player to clear a library that's occupied by Super Mutants. Player pushes for more money.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 15
			; INFO/STAGE 0010CBB5  on DialogueGoodneighbor
			; DESCRIPTION: Fred is trying to convince the Player to tangle with the Gunners at HalluciGen and bring back some chems for him to sell at his shop. Player declines.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 16
			; INFO/STAGE 0010CBC2  on DialogueGoodneighbor
			; DESCRIPTION: Fred is trying to convince the Player to tangle with the Gunners at HalluciGen and bring back some chems for him to sell at his shop. Player gives some he already had.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 17
			; INFO/STAGE 0010CBC3  on DialogueGoodneighbor
			; DESCRIPTION: Fred is trying to convince the Player to tangle with the Gunners at HalluciGen and bring back some chems for him to sell at his shop. Player agrees to do it.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 18
			; INFO/STAGE 0010CBC5  on DialogueGoodneighbor
			; DESCRIPTION: Fred is trying to convince the Player to tangle with the Gunners at HalluciGen and bring back some chems for him to sell at his shop. Player pushes for more money.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 19
			; INFO/STAGE 0010D5C3  on DialogueGoodneighbor
			; DESCRIPTION: Whitechapel is trying to convince the Player to assassinate three targets at various locations (obviously nefarious). Player says that it's already been done.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 20
			; INFO/STAGE 0010D5C4  on DialogueGoodneighbor
			; DESCRIPTION: Whitechapel is trying to convince the Player to assassinate three targets at various locations (obviously nefarious). Player agrees to do it.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 21
			; INFO/STAGE 0010D5C5  on DialogueGoodneighbor
			; DESCRIPTION: Whitechapel is trying to convince the Player to assassinate three targets at various locations (obviously nefarious). Player pushes for more money.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 22
			; INFO/STAGE 0010D5D5  on DialogueGoodneighbor
			; DESCRIPTION: Whitechapel is trying to convince the Player to assassinate three targets at various locations (obviously nefarious). Player refuses, saying that it's murder.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 23
			; INFO/STAGE 00111F97  on DialogueGoodneighbor
			; DESCRIPTION: Player is learning more about Hancock's history from the Ghoul himself. He describes his sex, drugs and rock and roll lifestyle trying to impress the Player. Player makes a joke about drugs preparing him for politics.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 24
			; INFO/STAGE 00111F9D  on DialogueGoodneighbor
			; DESCRIPTION: Player is learning more about Hancock's history from the Ghoul himself. He describes his sex, drugs and rock and roll lifestyle trying to impress the Player. Player calls him a junkie.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 25
			; INFO/STAGE 00111FA9  on DialogueGoodneighbor
			; DESCRIPTION: Player is learning more about Hancock's history from the Ghoul himself. He describes his sex, drugs and rock and roll lifestyle trying to impress the Player. Player admires his risk-taking.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 26
			; INFO/STAGE 00112012  on DialogueGoodneighbor
			; DESCRIPTION: Hancock is trying to convince the Player to scout out Pickman Gallery and find out what's going on there. Player declines.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 27
			; INFO/STAGE 0011201A  on DialogueGoodneighbor
			; DESCRIPTION: Hancock is trying to convince the Player to scout out Pickman Gallery and find out what's going on there. Player says he already cleared it out.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 28
			; INFO/STAGE 0011201B  on DialogueGoodneighbor
			; DESCRIPTION: Hancock is trying to convince the Player to scout out Pickman Gallery and find out what's going on there. Player agrees.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 29
			; INFO/STAGE 0011201C  on DialogueGoodneighbor
			; DESCRIPTION: Hancock is trying to convince the Player to scout out Pickman Gallery and find out what's going on there. Player pushes to find out more about getting paid.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 30
			; INFO/STAGE 00112836  on DialogueGoodneighbor
			; DESCRIPTION: Player has scouted Pickman Gallery for Hancock and reported that Pickman was a serial killer who used dead bodies as a work of art. Player says it was horrific.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 31
			; INFO/STAGE 00112838  on DialogueGoodneighbor
			; DESCRIPTION: Player has scouted Pickman Gallery for Hancock and reported that Pickman was a serial killer who used dead bodies as a work of art. Player says it was beautiful.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 32
			; INFO/STAGE 0011283A  on DialogueGoodneighbor
			; DESCRIPTION: Player has scouted Pickman Gallery for Hancock and reported that Pickman was a serial killer who used dead bodies as a work of art. Player is flippant, saying the art not having much resale value when it starts rotting.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 33
			; INFO/STAGE 0011283A  on DialogueGoodneighbor
			; DESCRIPTION: Player has romantically flirted with Magnolia while Romantic with any romanceable Companion present !!!! SPECIAL AFFINITY HANDLING REQUIRED!!!!

			;FALLOUTVORE COMPANIONS: 
			If BriaRef.IsRomantic()
				Bria_hates()
			EndIf
		elseif eventID == 34
			; INFO/STAGE 0011283A  on DialogueGoodneighbor
			; DESCRIPTION: Player romantically flirted with Magnolia while Romantic with any romanceable Companion present - the flirts were successful, and Player now asked Magnolia out on a date !!!! SPECIAL AFFINITY HANDLING REQUIRED!!!!

			;FALLOUTVORE COMPANIONS:
			If BriaRef.IsRomantic()
				Bria_hates()
			EndIf

		else
			debug.trace(self + " WARNING - DialogueGoodneighbor got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_DialogueGoodneighborEntrance(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DialogueGoodneighborEntrance
		if eventID == 1
			; INFO/STAGE 0003355C  on DialogueGoodneighborEntrance
			; DESCRIPTION: Hancock just shanked Finn who was shaking down the Player. After that, he says how Goodneighbor is "of the people, for the people." Player says it sounds like anarchy.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 00033565  on DialogueGoodneighborEntrance
			; DESCRIPTION: Finn is offering the Player (new in town) "insurance." Player threatens him, knowing it's likely some kind of a protection racket.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 00033575  on DialogueGoodneighborEntrance
			; DESCRIPTION: Hancock just shanked Finn who was shaking down the Player. After that, he says how Goodneighbor is "of the people, for the people." Player does an eyeroll.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 4
			; INFO/STAGE 00033576  on DialogueGoodneighborEntrance
			; DESCRIPTION: Hancock just shanked Finn who was shaking down the Player. After that, he says how Goodneighbor is "of the people, for the people." Player agrees with that view.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 5
			; INFO/STAGE 0003357B  on DialogueGoodneighborEntrance
			; DESCRIPTION: Finn is offering the Player (new in town) "insurance." Player is flippant about it to Finn, saying he's not interested. It's obviously a protection racket.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 6
			; INFO/STAGE 0003357C  on DialogueGoodneighborEntrance
			; DESCRIPTION: Finn is offering the Player (new in town) "insurance." Player is willing to hear him out even though it's obviously a protection racket.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		else
			debug.trace(self + " WARNING - DialogueGoodneighborEntrance got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_DialogueGraygarden(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DialogueGraygarden
		if eventID == 1
			; INFO/STAGE 00063D12  on DialogueGraygarden
			; DESCRIPTION: Asking for more caps, being greedy

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 001091B7  on DialogueGraygarden
			; DESCRIPTION: Rememebring a place from the past, before the war

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 3
			; INFO/STAGE 001091C0  on DialogueGraygarden
			; DESCRIPTION: Farm can't be run just by robots, need human management

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 4
			; INFO/STAGE 001091C8  on DialogueGraygarden
			; DESCRIPTION: Sarcasm, player does not miss television

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 5
			; INFO/STAGE 001091C9  on DialogueGraygarden
			; DESCRIPTION: Impressed by farm run entirely by robots, no humans needed

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 6
			; INFO/STAGE 001091D0  on DialogueGraygarden
			; DESCRIPTION: Not impressed by robot's unique personality, still just a dumb robot

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 7
			; INFO/STAGE 001091DF  on DialogueGraygarden
			; DESCRIPTION: Crazy robot personality is "unique"... sort of half flattery

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - DialogueGraygarden got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_DialogueRailroad(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DialogueRailroad
		if eventID == 1
			; INFO/STAGE 0005BD67  on DialogueRailroad
			; DESCRIPTION: Player is speaking to Carrington for the first time, who is clearly unimpressed and doesn't trust the Player. Player insults him in return (standing up for himself).

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 0005D746  on DialogueRailroad
			; DESCRIPTION: Tinker Tom, suffering from paranoia, offers to inject the Player with a serum that will supposedly kill all the little machines that the Institute put in the Player's body. Player says no.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 3
			; INFO/STAGE 0005D75A  on DialogueRailroad
			; DESCRIPTION: Tinker Tom, suffering from paranoia, offers to inject the Player with a serum that will supposedly kill all the little machines that the Institute put in the Player's body. Player says yes.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - DialogueRailroad got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_DialogueTheSlog(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DialogueTheSlog
		if eventID == 1
			; INFO/STAGE 00078788  on DialogueTheSlog
			; DESCRIPTION: Complimenting a ghoul lady who is flirting

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 00078793  on DialogueTheSlog
			; DESCRIPTION: Insulting, harsh, no way the player would find a ghoul attractive

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 000FA41F  on DialogueTheSlog
			; DESCRIPTION: Complimenting the ghouls on their farm

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 4
			; INFO/STAGE 000FA429  on DialogueTheSlog
			; DESCRIPTION: Insulting the ghouls' farm, being a jerk

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 5
			; INFO/STAGE 000FA42C  on DialogueTheSlog
			; DESCRIPTION: Complimenting the ghouls on their ideas, being nice/supportive

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 6
			; INFO/STAGE 000FA434  on DialogueTheSlog
			; DESCRIPTION: Player insults the ghouls, is a jerk

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - DialogueTheSlog got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_DialogueVault81(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DialogueVault81
		if eventID == 1
			; INFO/STAGE 001AC499  on DialogueVault81
			; DESCRIPTION: Tina is angry you gave her brother drugs and he OD'd. You apologize, claiming you didn't know.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 001AC4D9  on DialogueVault81
			; DESCRIPTION: Tina is angy at you for giving Bobby drugs which caused him to OD. You tell her he got what he deserved.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - DialogueVault81 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_DialogueWarwickHomestead(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DialogueWarwickHomestead
		if eventID == 1
			; INFO/STAGE 00106E0E  on DialogueWarwickHomestead
			; DESCRIPTION: Farmers say that they are using sewage to grow their crops. Player says it's a mixed blessing.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 00106E1E  on DialogueWarwickHomestead
			; DESCRIPTION: Farmers say that they are using sewage to grow their crops. Player insults the smell.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 00106E30  on DialogueWarwickHomestead
			; DESCRIPTION: Farmers say that they are using sewage to grow their crops. Player compliments their ingenuity.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		else
			debug.trace(self + " WARNING - DialogueWarwickHomestead got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_DiamondCitySuperMutantIntro(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DiamondCitySuperMutantIntro
		if eventID == 1 || eventID == 2 || eventID == 3
			; INFO/STAGE 0001FDB1  on DiamondCitySuperMutantIntro
			; DESCRIPTION: The Player successfully assisted the Diamond City Security Guards in a Super Mutant attack

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - DiamondCitySuperMutantIntro got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_DN019JoinCult(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DN019JoinCult
		if eventID == 1 || eventID == 4 || eventID == 8
			; INFO/STAGE 000C511B  on DN019JoinCult
			; DESCRIPTION: Player has encountered a cult which scams people into giving them all your worldly possessions. Player falls for it and gives cult leader everything they own.

			;FALLOUTVORE COMPANIONS: 
			Bria_Hates()

		elseif eventID == 5 || eventID == 6
			; INFO/STAGE 000C515B  on DN019JoinCult
			; DESCRIPTION: Player is speaking to a cult leader, trying to rescue Emogene from a cult. Cult leader is refusing to let Player speak to her saying that she can't have an visitors or needs to cool off. Player says he's a friend of the family and is willing to talk to her.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 7
			; INFO/STAGE 000C516F  on DN019JoinCult
			; DESCRIPTION: Player is speaking to a cult leader, trying to rescue Emogene from a cult. Cult leader is refusing to let Player speak to her saying that she can't have an visitors or needs to cool off. Player attempts to bribe cult leader for access.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 9 || eventID == 2 || eventID == 3
			; INFO/STAGE 000C9444  on DN019JoinCult
			; DESCRIPTION: Player is speaking to a cult leader, trying to rescue Emogene from a cult. Cult leader is refusing to let Player speak to her saying that she can't have an visitors or needs to cool off. Player threatens cult leader with violence.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - DN019JoinCult got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_DN053(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DN053
		if eventID == 1
			; INFO/STAGE 000B0E30  on DN053
			; DESCRIPTION: Player convinces Virgil that it would be better to commit suicide than live as a super mutant forever.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 000B24F6  on DN053
			; DESCRIPTION: Player agrees to let Virgil live, promising to lie to the Brotherhood about it.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 3
			; INFO/STAGE 001A9636  on DN053
			; DESCRIPTION: Strong only. Player has mildly sided against him.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 4
			; INFO/STAGE 001A9638  on DN053
			; DESCRIPTION: Strong only. Player sides with him, there are advantages to being a super mutant.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 5
			; INFO/STAGE 001A963C  on DN053
			; DESCRIPTION: Strong only. Player has strongly sided against him.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 6
			; INFO/STAGE 001A963E  on DN053
			; DESCRIPTION: Strong only. Player is trying to placate him.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 7
			; INFO/STAGE 001A9642  on DN053
			; DESCRIPTION: Strong only. Player has strongly sided with him, and is helping him fight Virgil.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 8
			; INFO/STAGE 001A9645  on DN053
			; DESCRIPTION: Strong only. Player neutral on whether Virgil should be a super mutant.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 9
			; INFO/STAGE 001A9648  on DN053
			; DESCRIPTION: Strong only. Player mildly sided against him.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 10
			; INFO/STAGE 001A964B  on DN053
			; DESCRIPTION: Strong only. Player sides with Virgil. Of course he should be a human again.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - DN053 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_DN102(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DN102
		if eventID == 1
			; INFO/STAGE 000E9885  on DN102
			; DESCRIPTION: Player practical, trying to advise a confused, possibly crazy woman.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 000E9894  on DN102
			; DESCRIPTION: Player hostile towards a confused, possibly crazy woman.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 000E98AE  on DN102
			; DESCRIPTION: Player supportive, reassuring towards a confused, possibly crazy woman.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		else
			debug.trace(self + " WARNING - DN102 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_FFDiamondCity01(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == FFDiamondCity01
		if eventID == 1
			; INFO/STAGE 000238A0  on FFDiamondCity01
			; DESCRIPTION: Player was tasked with getting green paint for Abbot to paint the wall in DC. The Player brought back blue or yellow paint instead, and Abbot is protesting. Player asks Abbot if he thinks people will be upset.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 000238A8  on FFDiamondCity01
			; DESCRIPTION: Player gets near Abbot in DC and he instantly barks at the Player not to touch the paint. Player tells Abbot "Forget you, pal."

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 000238AA  on FFDiamondCity01
			; DESCRIPTION: Player was tasked with getting green paint for Abbot to paint the wall in DC. The Player brought back blue or yellow paint instead, and Abbot is protesting. Player responds by saying "People don't like it, too bad."

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 4
			; INFO/STAGE 000238AF  on FFDiamondCity01
			; DESCRIPTION: Abbot has tasked the Player with getting green paint for the wall in DC. Player refuses.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 5
			; INFO/STAGE 000238B5  on FFDiamondCity01
			; DESCRIPTION: Player was tasked with getting green paint for Abbot to paint the wall in DC. The Player brought it back. Abbot says that the wall sure seems happy with it. Player responds negatively.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 6
			; INFO/STAGE 000238C6  on FFDiamondCity01
			; DESCRIPTION: Player was tasked with getting green paint for Abbot to paint the wall in DC. The Player brought back blue or yellow paint instead, and Abbot is protesting. Player responds by saying "I think it'll look good."

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 7
			; INFO/STAGE 000238C7  on FFDiamondCity01
			; DESCRIPTION: Player was tasked with getting green paint for Abbot to paint the wall in DC. The Player brought it back. Abbot says that the wall sure seems happy with it. Player immediately asks for his caps.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 8
			; INFO/STAGE 000238CB  on FFDiamondCity01
			; DESCRIPTION: Player was tasked with getting green paint for Abbot to paint the wall in DC. The Player brought back blue or yellow paint instead, and Abbot is protesting. Player responds by saying paint is paint.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 9
			; INFO/STAGE 000238D1  on FFDiamondCity01
			; DESCRIPTION: Abbot has tasked the Player with getting green paint for the wall in DC. Player gives some he already had.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 10
			; INFO/STAGE 000238D2  on FFDiamondCity01
			; DESCRIPTION: Abbot has tasked the Player with getting green paint for the wall in DC. Player agrees to do it.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 11
			; INFO/STAGE 000238D7  on FFDiamondCity01
			; DESCRIPTION: Player was tasked with getting green paint for Abbot to paint the wall in DC. The Player brought it back. Abbot says that the wall sure seems happy with it. Player responds pleseantly.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 12
			; INFO/STAGE 0003DE41  on FFDiamondCity01
			; DESCRIPTION: Player gets near Abbot in DC and he instantly barks at the Player not to touch the paint. Player agrees not to.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 13
			; INFO/STAGE 0006AF41  on FFDiamondCity01
			; DESCRIPTION: Abbot has tasked the Player with getting green paint for the wall in DC. Player tries to gouge for more caps.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - FFDiamondCity01 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_FFDiamondCity07(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == FFDiamondCity07
		if eventID == 1
			; INFO/STAGE 0008BA6B  on FFDiamondCity07
			; DESCRIPTION: Piper is interviewing the Player about his life. Asks how DC compares to his old life. Player asks how it's possible to compare the two.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 0008BA7E  on FFDiamondCity07
			; DESCRIPTION: Piper is interviewing the Player. She asks what would you say to someone out there who's lost someone but might be too scared to look for them. Player says not to lose hope.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 3
			; INFO/STAGE 0008BA8D  on FFDiamondCity07
			; DESCRIPTION: Piper is interviewing the Player about his life. Asks how CW compares to his old life. Player says it gives him hope to see people trying to rebuild.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 4
			; INFO/STAGE 0008BAB5  on FFDiamondCity07
			; DESCRIPTION: Piper is interviewing the Player about his life. Asks how CW compares to his old life. Player says it sucks.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 5
			; INFO/STAGE 0008BACB  on FFDiamondCity07
			; DESCRIPTION: Piper is interviewing the Player. She asks what would you say to someone out there who's lost someone but might be too scared to look for them. Player says they should take it one day at a time.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 6
			; INFO/STAGE 0008BAD7  on FFDiamondCity07
			; DESCRIPTION: Piper is interviewing the Player about his life. Asks how DC compares to his old life. Player says he's been too busy blowing things up to notice.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 7
			; INFO/STAGE 0008BB3A  on FFDiamondCity07
			; DESCRIPTION: Piper is interviewing the Player. She asks what would you say to someone out there who's lost someone but might be too scared to look for them. Player says they should get revenge.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - FFDiamondCity07 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_FFDiamondCity08(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == FFDiamondCity08
		if eventID == 1
			; INFO/STAGE 00149CB2  on FFDiamondCity08
			; DESCRIPTION: Player is speaking to Sheffield who is begging for a Nuka Cola. Player gives him one.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 00149CB4  on FFDiamondCity08
			; DESCRIPTION: Player is speaking to Sheffield who is begging for a Nuka Cola. Player leaves instead.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 00149CBB  on FFDiamondCity08
			; DESCRIPTION: Player is speaking to Sheffield who is begging for a Nuka Cola. Player is rude and tells him to drink some water.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - FFDiamondCity08 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_FFDiamondCity10(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == FFDiamondCity10
		if eventID == 1
			; INFO/STAGE 00179175  on FFDiamondCity10
			; DESCRIPTION: Danny Sullivan has been shot by the mayor and is bleeding out. Player lets him die.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 0017919A  on FFDiamondCity10
			; DESCRIPTION: Danny Sullivan has been shot by the mayor and is bleeding out. Curie helps. CURIE ONLY

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 3
			; INFO/STAGE 0017919B  on FFDiamondCity10
			; DESCRIPTION: Danny Sullivan has been shot by the mayor and is bleeding out. Player gives him a stimpak.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 4 || eventID == 5
			; INFO/STAGE 00179B13  on FFDiamondCity10
			; DESCRIPTION: Danny Sullivan has been shot by the mayor and is bleeding out. Player went to get one of the doctors in town.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 6
			; INFO/STAGE 0017CCDD  on FFDiamondCity10
			; DESCRIPTION: The synth mayor has taken Geneva hostage. He's made his demands to walk out of the city a free man. Player says he's going to stand trial so the people can have justice.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 7
			; INFO/STAGE 0017CCE1  on FFDiamondCity10
			; DESCRIPTION: The synth mayor has taken Geneva hostage. Player makes light of it and says "hell, I'd vote for him again."

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 8 || eventID == 9
			; INFO/STAGE 0017CCE5  on FFDiamondCity10
			; DESCRIPTION: The synth mayor has taken Geneva hostage. He's made his demands to walk out of the city a free man. Player opens fire.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 10
			; INFO/STAGE 0017CCEE  on FFDiamondCity10
			; DESCRIPTION: The synth mayor has taken Geneva hostage. He's made his demands to walk out of the city a free man. Player agrees to his terms.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 11
			; INFO/STAGE 0017CCF1  on FFDiamondCity10
			; DESCRIPTION: The synth mayor has taken Geneva hostage. Player attempts a speech challenge to talk him down.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - FFDiamondCity10 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_FFGoodneighbor07(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == FFGoodneighbor07
		if eventID == 1
			; INFO/STAGE 00132439  on FFGoodneighbor07
			; DESCRIPTION: Player convinces Bobbi to give them her caps and run to escape Hancock

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 00132456  on FFGoodneighbor07
			; DESCRIPTION: Player attacks Bobbi to get back their caps for Hancock

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 00132468  on FFGoodneighbor07
			; DESCRIPTION: Player agrees to kill Bobbi No-Nose for Hancock

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 4
			; INFO/STAGE 00132473  on FFGoodneighbor07
			; DESCRIPTION: Player offers to talk to Hancock for Bobbi, get her off the hook

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 5
			; INFO/STAGE 00132487  on FFGoodneighbor07
			; DESCRIPTION: Player refuses to kill Bobbi No-Nose for Hancock

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 6
			; INFO/STAGE 001324AD  on FFGoodneighbor07
			; DESCRIPTION: Player attempts to negotiate down the caps they owe Hancock for the job they pulled in MS16

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - FFGoodneighbor07 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_Inst301(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == Inst301
		if eventID == 1
			; INFO/STAGE 000E69EF  on Inst301
			; DESCRIPTION: Refuse to take bribe, nice try though

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 000E69FA  on Inst301
			; DESCRIPTION: Threaten to take loot by force, no bargains

			;FALLOUTVORE COMPANIONS: 
			Bria_Loves()

		elseif eventID == 3
			; INFO/STAGE 000E6A06  on Inst301
			; DESCRIPTION: Agree to take loot bribe and leave rogue synth alone

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 4
			; INFO/STAGE 000E6A1E  on Inst301
			; DESCRIPTION: Ask what happens if bribe is refused

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 5
			; INFO/STAGE 0012470F  on Inst301
			; DESCRIPTION: Avoid unnecessary violence against a rogue synth

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 6
			; INFO/STAGE 00124710  on Inst301
			; DESCRIPTION: Player has met up with X6 outside of Libertalia. X6 says he's ready to go. Player agrees to take him along.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 7
			; INFO/STAGE 00124716  on Inst301
			; DESCRIPTION: Player has met up with X6 outside of Libertalia. X6 says he's ready to go. Player says he can do it alone.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 8
			; INFO/STAGE 0012471D  on Inst301
			; DESCRIPTION: Player has met up with X6 outside of Libertalia. X6 says he's ready to go. Player agrees, but is rude about it.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 9
			; INFO/STAGE 0012471E  on Inst301
			; DESCRIPTION: Being sarcastic about using a lengthy synth reset code

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 10
			; INFO/STAGE 00124726  on Inst301
			; DESCRIPTION: Refuse to wipe synth's identity b/c it seems inhumane

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		else
			debug.trace(self + " WARNING - Inst301 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_Inst302(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == Inst302
		if eventID == 1
			; INFO/STAGE 000D6031  on Inst302
			; DESCRIPTION: Player is at Bunker Hill with a mission to rescue synths under Railroad Protection. X4-18 Courser gives orders, Player agrees but is rude about it.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 000D6036  on Inst302
			; DESCRIPTION: Player is at Bunker Hill with a mission to rescue synths under Railroad Protection. X4-18 Courser gives orders, Player says he should be in charge.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 000D603C  on Inst302
			; DESCRIPTION: Player is at Bunker Hill with a mission to rescue synths under Railroad Protection. X4-18 Courser gives orders, Player agrees to follow them.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		else
			debug.trace(self + " WARNING - Inst302 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_Inst306(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == Inst306
		if eventID == 1
			; INFO/STAGE 000B92A8  on Inst306
			; DESCRIPTION: Player has been sent to kill Railroad, but has worked for them. When confronted by Desdemona, Player agrees not to attack.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 000B92C5  on Inst306
			; DESCRIPTION: Player has been sent to kill Railroad, but has worked for them. When confronted by Desdemona, Player agrees not to attack but acts rude about it.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 3
			; INFO/STAGE 000B92D1  on Inst306
			; DESCRIPTION: Player has been sent to kill Railroad, but has worked for them. When confronted by Desdemona, Player says he has to kill everyone.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - Inst306 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_InstM01(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == InstM01
		if eventID == 1
			; INFO/STAGE 0009C84C  on InstM01
			; DESCRIPTION: Angry retort at a perceived insult

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 0009C850  on InstM01
			; DESCRIPTION: Expressing confidence that it won't be a problem

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 3
			; INFO/STAGE 000A11F6  on InstM01
			; DESCRIPTION: Confident, self-assured, we can solve this

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 4
			; INFO/STAGE 000A1201  on InstM01
			; DESCRIPTION: 

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 5
			; INFO/STAGE 000A120A  on InstM01
			; DESCRIPTION: Correcting a synth who is too close to these people, in too deep

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 6
			; INFO/STAGE 000A1212  on InstM01
			; DESCRIPTION: Harsh attitude, acting intolerant

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 7
			; INFO/STAGE 0011A06F  on InstM01
			; DESCRIPTION: Agreeing to a bribe

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 8
			; INFO/STAGE 0011A087  on InstM01
			; DESCRIPTION: Disgusted, strong words, player is angry

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 9
			; INFO/STAGE 0011A09E  on InstM01
			; DESCRIPTION: Asking, almost begging, for help, playing on sympathies

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		else
			debug.trace(self + " WARNING - InstM01 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_InstM02(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == InstM02
		if eventID == 1
			; INFO/STAGE 000A829C  on InstM02
			; DESCRIPTION: Defending the Institute, threatening its enemies

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 000A82CB  on InstM02
			; DESCRIPTION: Strong accusation

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 3
			; INFO/STAGE 000A82CC  on InstM02
			; DESCRIPTION: Annoyed, sarcastic, not taking this seriously

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 4
			; INFO/STAGE 000B17A7  on InstM02
			; DESCRIPTION: Refuse to betray Institute

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 5
			; INFO/STAGE 000B17B5  on InstM02
			; DESCRIPTION: Willing to betray Institute for a bribe

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 6
			; INFO/STAGE 000B17BB  on InstM02
			; DESCRIPTION: Strong accusation

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 7
			; INFO/STAGE 000B17CD  on InstM02
			; DESCRIPTION: Being evasive, cagey, triyng to fool Liam

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 8
			; INFO/STAGE 000B17CF  on InstM02
			; DESCRIPTION: Forceful, demanding answers

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 9
			; INFO/STAGE 000B17DF  on InstM02
			; DESCRIPTION: Synths are better off in the Institute

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 10
			; INFO/STAGE 000B17E5  on InstM02
			; DESCRIPTION: Reinfocing loyalty to Institute

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 11
			; INFO/STAGE 000B17E8  on InstM02
			; DESCRIPTION: Betray Justin Ayo and by extension, the SRB.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 12
			; INFO/STAGE 000B17F7  on InstM02
			; DESCRIPTION: Pro-synth freedom

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 13
			; INFO/STAGE 000B1FA3  on InstM02
			; DESCRIPTION: Insulting the head of the SRB

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 14
			; INFO/STAGE 000B1FA7  on InstM02
			; DESCRIPTION: Improve security, make Instutute safer, no more synth escape

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 15
			; INFO/STAGE 001134D3  on InstM02
			; DESCRIPTION: Seeking a peaceful solution

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 16
			; INFO/STAGE 001134D8  on InstM02
			; DESCRIPTION: Side with Institute, condemn Liam for his treachery

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 17
			; INFO/STAGE 001134D9  on InstM02
			; DESCRIPTION: Forceful, authoritative, fearless

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 18
			; INFO/STAGE 00115AD0  on InstM02
			; DESCRIPTION: Agree to help synths escape, effectively betraying Institute

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 19
			; INFO/STAGE 00115AD1  on InstM02
			; DESCRIPTION: protecting the escaped synths, betraying the Institute

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		else
			debug.trace(self + " WARNING - InstM02 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_InstM03(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == InstM03
		if eventID == 1
			; INFO/STAGE 000BA862  on InstM03
			; DESCRIPTION: Seeking peaceful solution against Institute scientists

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 000BA869  on InstM03
			; DESCRIPTION: Violence against Institute scientists

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 000BA87E  on InstM03
			; DESCRIPTION: Seeking non-violent solution against Institute scientists

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 4
			; INFO/STAGE 000BE7CA  on InstM03
			; DESCRIPTION: Moderate punishment

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 5
			; INFO/STAGE 000BE7D3  on InstM03
			; DESCRIPTION: Player starts a fight with Institute scientists

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 6
			; INFO/STAGE 000BE7D5  on InstM03
			; DESCRIPTION: Lenient punishment

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 7
			; INFO/STAGE 000BE7DB  on InstM03
			; DESCRIPTION: Player chooses not to use violence against scientists

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 8
			; INFO/STAGE 000BE7DD  on InstM03
			; DESCRIPTION: Scientists get the death sentence, totally unforgiving

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 9
			; INFO/STAGE 000BE7E8  on InstM03
			; DESCRIPTION: Forgive the scientists totally, no punishment for their actions

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		else
			debug.trace(self + " WARNING - InstM03 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_Min01(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == Min01
		if eventID == 1
			; INFO/STAGE 000B13EA  on Min01
			; DESCRIPTION: After helping the Minutemen at Concord, Preston wants Player to lead the rebuild of their group. Player agrees.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 000B13FB  on Min01
			; DESCRIPTION: After helping the Minutemen at Concord, Preston wants Player to lead the rebuild of their group. Player refuses.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3 || eventID == 4
			; INFO/STAGE 00118891  on Min01
			; DESCRIPTION: After agreeing to help the Minutemen, Player is approached by Sturgis to take on some work. Player makes snarky comment.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 5
			; INFO/STAGE 0011889A  on Min01
			; DESCRIPTION: After agreeing to help the Minutemen, Player is approached by Sturgis to take on some work. Player refuses to help.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 6 || eventID == 7
			; INFO/STAGE 001188A3  on Min01
			; DESCRIPTION: After agreeing to help the Minutemen, Player is approached by Sturgis to take on some work. Player agrees to help.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		else
			debug.trace(self + " WARNING - Min01 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_Min03(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == Min03
		if eventID == 1
			; INFO/STAGE 000AC052  on Min03
			; DESCRIPTION: Player has said the wrong thing and angered Ronnie Shaw. Shaw is threatening to brawl. Player tries to calm him down.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 000AC05A  on Min03
			; DESCRIPTION: Player has said the wrong thing and angered Ronnie Shaw. Shaw is threatening to brawl. Player starts brawl.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 000AC069  on Min03
			; DESCRIPTION: Player has said the wrong thing and angered Ronnie Shaw. Shaw is threatening to brawl. Player says snarky comment, but avoids fighting.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - Min03 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_MinRecruit03(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == MinRecruit03
		if eventID == 1 || eventID == 2
			; INFO/STAGE 00106FAF  on MinRecruit03
			; DESCRIPTION: Player helped resolve Raiders who were stealing from a settlement. Settlement spokesperson rewards Player.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - MinRecruit03 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_MinRecruit09(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == MinRecruit09
		if eventID == 1
			; INFO/STAGE 00174CD1  on MinRecruit09
			; DESCRIPTION: Player refuses to help Institute refugees

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - MinRecruit09 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_MinVsInst(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == MinVsInst
		if eventID == 1
			; INFO/STAGE 0009E586  on MinVsInst
			; DESCRIPTION: Player says he can work together with the Minuteman Contact.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 0009E58F  on MinVsInst
			; DESCRIPTION: Player asks the Minuteman Contact if he could really risk being wrong.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 0009E594  on MinVsInst
			; DESCRIPTION: Player is scolding the Minuteman Contact for not having all of the information.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 4
			; INFO/STAGE 0009E59A  on MinVsInst
			; DESCRIPTION: Player is threatening the Minuteman Contact.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 5
			; INFO/STAGE 0015D2F1  on MinVsInst
			; DESCRIPTION: Player agrees with Enrico that this is a lot of effort for just the sake of one man.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 6
			; INFO/STAGE 0015D2F2  on MinVsInst
			; DESCRIPTION: Player convinces Enrico that Phase Three of their plan is worth the risk.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 7
			; INFO/STAGE 0015D2F5  on MinVsInst
			; DESCRIPTION: Player demeans Enrico about Phase Three.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 8
			; INFO/STAGE 00185EE3  on MinVsInst
			; DESCRIPTION: Enrico thanks Player for the help on the mission, Player says he's here for sake of the Institute, not for Enrico

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 9
			; INFO/STAGE 00185EE7  on MinVsInst
			; DESCRIPTION: Enrico thanks Player for the help on the mission, Player is mean in return.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 10
			; INFO/STAGE 00185EEA  on MinVsInst
			; DESCRIPTION: Enrico thanks Player for the help on the mission, Player is pleasant in return.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - MinVsInst got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_MQ00MamaMurphy(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == MQ00MamaMurphy
		if eventID == 1 || eventID == 12 || eventID == 15 || eventID == 20 || eventID == 24
			; INFO/STAGE 001826A9  on MQ00MamaMurphy
			; DESCRIPTION: Mama Murphy has asked Player to bring her drugs for her Sight. Player says he already has some and gives it to her. if Cait_EventCondition_DislikesPlayerTakingChems.GetValue() == 0

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2 || eventID == 16 || eventID == 19 || eventID == 21 || eventID == 25
			; INFO/STAGE 001826AA  on MQ00MamaMurphy
			; DESCRIPTION: Mama Murphy has asked Player to bring her some drugs for her Sight. Player agrees to look. if Cait_EventCondition_DislikesPlayerTakingChems.GetValue() == 0

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 3
			; INFO/STAGE 00183329  on MQ00MamaMurphy
			; DESCRIPTION: The Player is trying to convince Mama Murphy to stop using chems for the Sight. He gives up and says it's her choice. if Cait_EventCondition_DislikesPlayerTakingChems.GetValue() == 0

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 4
			; INFO/STAGE 0018332B  on MQ00MamaMurphy
			; DESCRIPTION: The Player is trying to convince Mama Murphy to stop using chems for the Sight. He speech challenges in a threatening manner. if Cait_EventCondition_DislikesPlayerTakingChems.GetValue() == 0

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 5
			; INFO/STAGE 00183339  on MQ00MamaMurphy
			; DESCRIPTION: The Player is trying to convince Mama Murphy to stop using chems for the Sight. He speech challenges in a friendly manner. if Cait_EventCondition_DislikesPlayerTakingChems.GetValue() == 0

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 6
			; INFO/STAGE 0018472E  on MQ00MamaMurphy
			; DESCRIPTION: Player has brought Mama Murphy a hit of drugs and allows her to use it. if Cait_EventCondition_DislikesPlayerTakingChems.GetValue() == 0

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 9 || eventID == 7 || eventID == 8 || eventID == 10 || eventID == 11 || eventID == 13 || eventID == 14 || eventID == 17 || eventID == 18 || eventID == 22 || eventID == 23
			; INFO/STAGE 00184AAA  on MQ00MamaMurphy
			; DESCRIPTION: Mama Murphy has asked Player to bring her some drugs for her Sight. Player refuses, saying she's an addict and needs help. if Cait_EventCondition_DislikesPlayerTakingChems.GetValue() == 0

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - MQ00MamaMurphy got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_MQ104(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == MQ104
		if eventID == 1
			; INFO/STAGE 0001702E  on MQ104
			; DESCRIPTION: Player found Nick in Vault 114. There is confrontation between Nick, Skinny Malone, Darla and Player. Darla is instigating a fight. Player is sarcastic to Darla.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 000172A2  on MQ104
			; DESCRIPTION: Player found Nick in Vault 114. There is confrontation between Nick, Skinny Malone, Darla and Player. Player is addressing Skinny now, and tries to end the whole showdown peacefully.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 3
			; INFO/STAGE 00017509  on MQ104
			; DESCRIPTION: Player found Nick in Vault 114. There is confrontation between Nick, Skinny Malone, Darla and Player. Player is addressing Skinny now, and insults him starting a fight.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 4
			; INFO/STAGE 000179D4  on MQ104
			; DESCRIPTION: Player found Nick in Vault 114. There is confrontation between Nick, Skinny Malone, Darla and Player. Darla is instigating a fight. Player tries to talk Darla down.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 5
			; INFO/STAGE 00017A0B  on MQ104
			; DESCRIPTION: Player found Nick in Vault 114. There is confrontation between Nick, Skinny Malone, Darla and Player. Player is addressing Skinny now, and tries to turn him against Darla, who is clearly the aggressor here.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 6
			; INFO/STAGE 00017B10  on MQ104
			; DESCRIPTION: Player found Nick in Vault 114. There is confrontation between Nick, Skinny Malone, Darla and Player. Darla is instigating a fight. Player tries to trick Darla into shooting Skinny instead.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 7
			; INFO/STAGE 00183327  on MQ104
			; DESCRIPTION: Player found Nick in Vault 114. There is confrontation between Nick, Skinny Malone, Darla and Player. Darla is instigating a fight. Player defuses it by using a special code phrase on Skinny that calms him down.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - MQ104 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_MQ105(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == MQ105
		if eventID == 1
			; INFO/STAGE 00065EEB  on MQ105
			; DESCRIPTION: Player is interviewing Nick about Shaun. During the interview, Player accuses Nick of lying saying he's a synth, so he's protecting the Institute.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 000E179A  on MQ105
			; DESCRIPTION: Player is looking to get into Kellogg's house and needs a key from Geneva. Player tries to bribe her to get the key.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3 || eventID == 4
			; INFO/STAGE 000E17D1  on MQ105
			; DESCRIPTION: Player is looking to get into Kellogg's house and needs a key from Geneva. Player pleads his case nicely trying to appeal to her sympathy.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 5
			; INFO/STAGE 000E17DB  on MQ105
			; DESCRIPTION: Player is looking to get into Kellogg's house and needs a key from Geneva. Player says to "just trust me".

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 6 || eventID == 9
			; INFO/STAGE 000F6466  on MQ105
			; DESCRIPTION: Player is trying to get the Mayor to let him into Kellogg's house. Player tries to appeal to him saying Kellogg was a kidnapper.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 7
			; INFO/STAGE 000F6471  on MQ105
			; DESCRIPTION: Player is trying to get the Mayor to let him into Kellogg's house. Player says "So that's it? You're not going to help?"

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 8
			; INFO/STAGE 000F6478  on MQ105
			; DESCRIPTION: Player is trying to get the Mayor to let him into Kellogg's house. Player tries to bribe him.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - MQ105 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_MQ201(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == MQ201
		if eventID == 2
			; INFO/STAGE 00067FA2  on MQ201
			; DESCRIPTION: Player killed Kellogg and is talking with Piper and Nick. Player acts like Kellogg deserved it.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 00067FBD  on MQ201
			; DESCRIPTION: Player killed Kellogg and is talking with Piper and Nick. Player defends his actions by saying he wasn't going to talk.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 4
			; INFO/STAGE 00067FE8  on MQ201
			; DESCRIPTION: Player killed Kellogg and is talking with Piper and Nick. Player expresses regret.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 5 || eventID == 1
			; INFO/STAGE 0015145F  on MQ201
			; DESCRIPTION: Player is trying to get Nick to disclose the location of the Institute, which he swears he doesn't know. Player yells at him obviously thinking he's lying.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - MQ201 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_MQ206(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == MQ206
		if eventID == 1
			; INFO/STAGE 0008660D  on MQ206
			; DESCRIPTION: Player is talking to Doctor Amari about decoding the courser chip. Amari suggests Player tries Railroad, Player makes a sarcastic statement.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 000B1D19  on MQ206
			; DESCRIPTION: Player is talking to Doctor Amari about decoding the courser chip. Amari suggests Player tries Railroad, but Player says "Not them." (acting like he doesn't like them)

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - MQ206 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_MQ206RR(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == MQ206RR
		if eventID == 1
			; INFO/STAGE 000B9D80  on MQ206RR
			; DESCRIPTION: Player is talking to Railroad about teleporting into the Institute. Des wants the Player to make contact with Patriot. Player agrees.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 000B9D85  on MQ206RR
			; DESCRIPTION: Player is talking to Railroad about teleporting into the Institute. Des wants the Player to make contact with Patriot. Player says he can't risk it.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - MQ206RR got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_MQ302BoS(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == MQ302BoS
		if eventID == 1
			; INFO/STAGE 00187D98  on MQ302BoS
			; DESCRIPTION: Player has planted the bomb in the Institute and is relaying out, deciding to ignore the kid version of Shaun. Ingram is mortified. Player says it's none of her damn business.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 00187D9C  on MQ302BoS
			; DESCRIPTION: Player has planted the bomb in the Institute and is relaying out, deciding to ignore the kid version of Shaun. Ingram is mortified. Player explains calmly that kid is a synth.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 00187DA5  on MQ302BoS
			; DESCRIPTION: Player has planted the bomb in the Institute and is relaying out, deciding to ignore the kid version of Shaun. Ingram is mortified. Player says he doesn't have time to talk about it.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 4
			; INFO/STAGE 001867C2  on MQ302BoS
			; DESCRIPTION: Player has planted the bomb in the Institute and is relaying out, deciding to ignore the kid version of Shaun. Ingram is mortified. Player asks her if there's a problem (standoffish).

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - MQ302BoS got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_MQ302Min(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == MQ302Min
		if eventID == 1
			; INFO/STAGE 001867A8  on MQ302Min
			; DESCRIPTION: Player has planted the bomb in the Institute and is relaying out, deciding to ignore the kid version of Shaun. Sturges is mortified. Player explains he doesn't have time to talk about it.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 001867AF  on MQ302Min
			; DESCRIPTION: Player has planted the bomb in the Institute and is relaying out, deciding to ignore the kid version of Shaun. Sturges is mortified. Player says it's none of his damn business.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 001867B6  on MQ302Min
			; DESCRIPTION: Player has planted the bomb in the Institute and is relaying out, deciding to ignore the kid version of Shaun. Sturges is mortified. Player explains calmly that kid is a synth.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 4
			; INFO/STAGE 001867C2  on MQ302Min
			; DESCRIPTION: Player has planted the bomb in the Institute and is relaying out, deciding to ignore the kid version of Shaun. Sturgis is mortified. Player asks him if there's a problem (standoffish).

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - MQ302Min got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_MQ302RR(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == MQ302RR
		if eventID == 1
			; INFO/STAGE 001163FC  on MQ302RR
			; DESCRIPTION: Player is commencing the attack on the Institute with Desdemona. When she explains the strategy, the Player is negative about the possible outcome.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 001163FE  on MQ302RR
			; DESCRIPTION: Player is commencing the attack on the Institute with Desdemona. When she explains the strategy, the Player is positive about the possible outcome.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 3
			; INFO/STAGE 00188627  on MQ302RR
			; DESCRIPTION: Player has planted the bomb in the Institute and is relaying out, deciding to ignore the kid version of Shaun. Tom is mortified. Player explains calmly that kid is a synth.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 4
			; INFO/STAGE 0018862B  on MQ302RR
			; DESCRIPTION: Player has planted the bomb in the Institute and is relaying out, deciding to ignore the kid version of Shaun. Tom is mortified. Player says it's none of his damn business.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 5
			; INFO/STAGE 0018862F  on MQ302RR
			; DESCRIPTION: Player has planted the bomb in the Institute and is relaying out, deciding to ignore the kid version of Shaun. Tom is mortified. Player explains he doesn't have time to talk about it.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - MQ302RR got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_MS01(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == MS01
		if eventID == 1
			; INFO/STAGE 00028605  on MS01
			; DESCRIPTION: Player has rescued Billy from the fridge. Billy says he wanted to go home. Player says he will help.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 00028629  on MS01
			; DESCRIPTION: Player has rescued Billy from the fridge. Billy says he wanted to go home. Player says his parents are probably dead.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 0002862C  on MS01
			; DESCRIPTION: Player has rescued Billy from the fridge. Billy says he wanted to go home. Player says he's own his own.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 4
			; INFO/STAGE 00028D86  on MS01
			; DESCRIPTION: Someone offers to buy Billy from the Player. Player questions what kind of a person they are.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 5 || eventID == 11
			; INFO/STAGE 00028D8C  on MS01
			; DESCRIPTION: Player refused to sell Billy to someone for hard labor.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 6
			; INFO/STAGE 00028D9C  on MS01
			; DESCRIPTION: Player is bargaining with someone that wants to buy Billy for hard labor.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 7
			; INFO/STAGE 00028DAA  on MS01
			; DESCRIPTION: The Player just sold Billy to someone that needs him for hard labor.

			;FALLOUTVORE COMPANIONS: 
			Bria_Hates()

		elseif eventID == 8
			; INFO/STAGE 00106C78  on MS01
			; DESCRIPTION: Player brought Billy home, and Bullet wants to take the entire family and use them as slave labor. Player refuses.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 9
			; INFO/STAGE 00106C7D  on MS01
			; DESCRIPTION: Player brought Billy home, and Bullet wants to take the entire family and use them as slave labor. Player says he can have them.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 10
			; INFO/STAGE 00106C84  on MS01
			; DESCRIPTION: Player brought Billy home, and Bullet wants to take the entire family and use them as slave labor. Player tries to negotiate to sell the family for caps.

			;FALLOUTVORE COMPANIONS: 
			Bria_Hates()

		elseif eventID == 12
			; INFO/STAGE 00106C8A  on MS01
			; DESCRIPTION: Player brought Billy home, and Bullet wants to take the entire family and use them as slave labor. Player tries to bluff.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - MS01 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_MS04(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == MS04
		if eventID == 1
			; INFO/STAGE 00029B95  on MS04
			; DESCRIPTION: Player is helping Kent find the Silver Shroud costume. After finding it, Player tells Kent he wants to keep for himself.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 0002AACD  on MS04
			; DESCRIPTION: Player is speaking to Kent for first time. He says he's sick of how dark the world's become and wants to bring the Silver Shroud to life to help. Player responds supportively.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 3
			; INFO/STAGE 0002AACF  on MS04
			; DESCRIPTION: Player is speaking to Kent for first time. He says he's sick of how dark the world's become and wants to bring the Silver Shroud to life to help. Player calls him completely nuts.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 4
			; INFO/STAGE 0002AAE7  on MS04
			; DESCRIPTION: Player is speaking to Kent for first time. He says he's sick of how dark the world's become and wants to bring the Silver Shroud to life to help. Player humors him by saying "Sure, you have a plan."

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 5
			; INFO/STAGE 0002B8C8  on MS04
			; DESCRIPTION: After finding Silver Shroud costume, Kent is starting to feel like he can't fill the hero's shoes. Player tells him to believe in himself.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 6
			; INFO/STAGE 0003FEC1  on MS04
			; DESCRIPTION: As the Silver Shroud, Player is helping Hancock. Hancock is looking to put an end to Sinjin, a crime boss. Player tells Hancock that it's his problem.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 7
			; INFO/STAGE 00047846  on MS04
			; DESCRIPTION: Player has rescued Kent after being taken by Sinjin. Kent is down on himself for failing to fight crime. Player tells him he should quit.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 8
			; INFO/STAGE 0004784E  on MS04
			; DESCRIPTION: Player has rescued Kent after being taken by Sinjin. Kent is down on himself for failing to fight crime. Player is supportive.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 9
			; INFO/STAGE 0004895E  on MS04
			; DESCRIPTION: HANCOCK ONLY

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 10
			; INFO/STAGE 00048968  on MS04
			; DESCRIPTION: 

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 11
			; INFO/STAGE 000810D7  on MS04
			; DESCRIPTION: Player is talking to Kent about Pre-War life. When comparing the past to now, Player says the Commonwealth is a nightmare.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 12
			; INFO/STAGE 000810DA  on MS04
			; DESCRIPTION: Player is talking to Kent about Pre-War life. When comparing the past to now, Player says he sees a glimmer of hope among the chaos.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 13
			; INFO/STAGE 000DECC1  on MS04
			; DESCRIPTION: As the Silver Shroud, Player is helping Kent stop AJ, a drug-pusher. AJ tries to bribe Player to leave him alone. Player simply asks him to stop.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 14
			; INFO/STAGE 000DECCB  on MS04
			; DESCRIPTION: As the Silver Shroud, Player is helping Kent stop AJ, a drug-pusher. AJ tries to bribe Player to leave him alone. Player threatens AJ with violence in Shroud's voice.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 15
			; INFO/STAGE 000DECD5  on MS04
			; DESCRIPTION: As the Silver Shroud, Player is helping Kent stop AJ, a drug-pusher. Player instantly asks for bribe to look other way.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 16
			; INFO/STAGE 000DECDC  on MS04
			; DESCRIPTION: As the Silver Shroud, Player is helping Kent stop AJ, a drug-pusher. AJ tries to bribe Player to leave him alone. Player takes the bribe.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 17
			; INFO/STAGE 00128CA8  on MS04
			; DESCRIPTION: Player is facing off with Sinjin who has captured Kent. Sinjin is trying to intimidate the Player about it. Player says he doesn't care about Kent, he's here for bounty on Sinjin's head.

			;FALLOUTVORE COMPANIONS: 
			Bria_Loves()

		elseif eventID == 18
			; INFO/STAGE 00128CB2  on MS04
			; DESCRIPTION: Player is facing off with Sinjin who has captured Kent. Sinjin is trying to intimidate the Player about it. Player stands by Kent saying that having friends is not a weakness.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 19
			; INFO/STAGE 00128CBF  on MS04
			; DESCRIPTION: As the Silver Shroud, Player is helping Kent stop AJ, a drug-pusher. AJ tries to bribe Player to leave him alone. Player threatens AJ not as Silver Shroud.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 20
			; INFO/STAGE 00128CC4  on MS04
			; DESCRIPTION: Sinjin (who kidnapped Kent) just threatened to kill Kent, then the Player. Player threatens him in return in the Shroud's voice.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 21
			; INFO/STAGE 00128CC5  on MS04
			; DESCRIPTION: Sinjin (who kidnapped Kent) just threatened to kill Kent, then the Player. Player threatens him in return in his own voice.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 22
			; INFO/STAGE 00128CC8  on MS04
			; DESCRIPTION: Sinjin (who kidnapped Kent) just threatened to kill Kent, then the Player. Player asks Kent what to do, who reminds Player about old episode of Shroud's show.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 23
			; INFO/STAGE 00128CDF  on MS04
			; DESCRIPTION: Sinjin (who kidnapped Kent) just threatened to kill Kent, then the Player. Player asks him to spare Kent.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 24
			; INFO/STAGE 00128CE8  on MS04
			; DESCRIPTION: Sinjin (who kidnapped Kent) just threatened to kill Kent, then the Player. Player tries to scare Sinjin's men to leverage the situation.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 25
			; INFO/STAGE 0012935D  on MS04
			; DESCRIPTION: Player is facing off with Kendra after killing her associate, Wayne. Kendra threatens Player and Player responds by saying Wayne got what was coming to him.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 26
			; INFO/STAGE 00129371  on MS04
			; DESCRIPTION: Player is facing off with Kendra after killing her associate, Wayne. Kendra threatens Player and Player responds by threatening her in the Shroud's voice.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 27
			; INFO/STAGE 00129372  on MS04
			; DESCRIPTION: Player is facing off with Kendra after killing her associate, Wayne. Kendra threatens Player and Player responds by threatening her in own voice.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - MS04 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_MS05B(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == MS05B
		if eventID == 1
			; INFO/STAGE 001900E1  on MS05B
			; DESCRIPTION: Player is handing a Deathclaw egg over to Wellingham, the rude robo-butler in Diamond City to be cooked into a meal for his clients - gouging for caps

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 00182A12  on MS05B
			; DESCRIPTION: Player is handing a Deathclaw egg over to Wellingham, the rude robo-butler in Diamond City to be cooked into a meal for his clients

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - MS05B got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_MS07a(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == MS07a
		if eventID == 1
			; INFO/STAGE 000360E4  on MS07a
			; DESCRIPTION: Player is hunting a missing person and discovered Doc Crocker has been killing people. When confronting him, Player tries to arrest him.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 000360E8  on MS07a
			; DESCRIPTION: Player is hunting a missing person and discovered Doc Crocker has been killing people. When confronting him, Player gives up and attacks him.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 000360EC  on MS07a
			; DESCRIPTION: Player is hunting a missing person and discovered Doc Crocker has been killing people. When confronting him, Player tries to talk him down calmly.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 4
			; INFO/STAGE 0004975C  on MS07a
			; DESCRIPTION: Player offered Doctor Sun a bribe to let him in the Surgery center basement

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 5
			; INFO/STAGE 00049761  on MS07a
			; DESCRIPTION: The player is threatening a doctor to try and solve a missing persons case

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - MS07a got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_MS09(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == MS09
		if eventID == 1
			; INFO/STAGE 00072F14  on MS09
			; DESCRIPTION: Player is meeting Guard Captain outside Parsons to avenge Ben's death. GC provides intel and the Player responds pleasently.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 00072F1A  on MS09
			; DESCRIPTION: Player is meeting Guard Captain outside Parsons to avenge Ben's death. GC provides intel and the Player responds angry that he's just been standing there waiting for Player to do all the work.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 00072F1B  on MS09
			; DESCRIPTION: Guard Captain yells back at Player for situation in Event 01. Player replies with sarcasm.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 4
			; INFO/STAGE 00072F22  on MS09
			; DESCRIPTION: Player is meeting Guard Captain outside Parsons to avenge Ben's death. GC provides intel and the Player responds neutral.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 5
			; INFO/STAGE 00072F23  on MS09
			; DESCRIPTION: Guard Captain yells back at Player for situation in Event 01. Player replies with a snarky comment.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 6
			; INFO/STAGE 00072F2B  on MS09
			; DESCRIPTION: Guard Captain yells back at Player for situation in Event 01. Player apologizes.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 7
			; INFO/STAGE 000E973E  on MS09
			; DESCRIPTION: Player has come to Cabot House for work. He finds Jack to start talking about magics and strange theories. Player blows it off and says he's here for the job.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 8
			; INFO/STAGE 000E9744  on MS09
			; DESCRIPTION: Player has come to Cabot House for work. He finds Jack to start talking about magics and strange theories. Player says he'll believe anything if he's paid.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 9
			; INFO/STAGE 000E974B  on MS09
			; DESCRIPTION: Player has come to Cabot House for work. He finds Jack to start talking about magics and strange theories. Player acts genuinely interested.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 10
			; INFO/STAGE 000F06C3  on MS09
			; DESCRIPTION: Insult Emogene

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 11
			; INFO/STAGE 000F06D4  on MS09
			; DESCRIPTION: Give vial of youth serum to Emogene

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 12
			; INFO/STAGE 000F494C  on MS09
			; DESCRIPTION: Kind response to Jack about his dead father

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 13
			; INFO/STAGE 000F4977  on MS09
			; DESCRIPTION: Harsh response to Jack about his dead father

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 14
			; INFO/STAGE 00106D51  on MS09
			; DESCRIPTION: Harsh to Jack about his father's death

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 15
			; INFO/STAGE 00106D5E  on MS09
			; DESCRIPTION: Kind to Jack about father's death

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		else
			debug.trace(self + " WARNING - MS09 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_MS11(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == MS11
		if eventID == 1
			; INFO/STAGE 000570DE  on MS11
			; DESCRIPTION: Ironsides is lamenting the Constitution's current state. The Player tells him he's better off abandoning it.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 000570E1  on MS11
			; DESCRIPTION: Ironsides is lamenting the Constitution's current state. The Player acts supportive.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 3
			; INFO/STAGE 00096DAB  on MS11
			; DESCRIPTION: Player has betrayed Ironsides (siding with the scavengers)

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 4
			; INFO/STAGE 00096DB9  on MS11
			; DESCRIPTION: Player has backed out of helping the scavengers

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 5
			; INFO/STAGE 00096DD1  on MS11
			; DESCRIPTION: Scavengers tricked Player into helping take Ironsides down, so they could scrap his ship. Now that it's over, they are doublecrossing Player. Player tries to work it out instead of attacking.

			;FALLOUTVORE COMPANIONS: 
			Bria_Hates()

		elseif eventID == 6
			; INFO/STAGE 00096DD2  on MS11
			; DESCRIPTION: Scavengers are asking Player to help take Ironsides down, so they could scrap his ship. Player declines, defending Ironsides.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 7
			; INFO/STAGE 00096DDC  on MS11
			; DESCRIPTION: Player has betrayed Ironsides

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 8
			; INFO/STAGE 00096E40  on MS11
			; DESCRIPTION: Scavengers are asking Player to help take Ironsides down, so they could scrap his ship. Player agrees.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 9
			; INFO/STAGE 000A15E4  on MS11
			; DESCRIPTION: Player is exploring the Constitution and ran into Ironside's First Mate. He's ready to use lethal force. Player says it's a misunderstanding.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 10
			; INFO/STAGE 000A15EE  on MS11
			; DESCRIPTION: Player is exploring the Constitution and ran into Ironside's First Mate. He's ready to use lethal force. Player threatens him in return.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 11
			; INFO/STAGE 000A15F8  on MS11
			; DESCRIPTION: Player is exploring the Constitution and ran into Ironside's First Mate. He's ready to use lethal force. Player asks him to calm down.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - MS11 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_MS13(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == MS13
		if eventID == 1 || eventID == 16
			; INFO/STAGE 0003CD79  on MS13
			; DESCRIPTION: Paul Pembroke asks player to help him "persuade" Cooke to stop seeing his wife. Player declines.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 0003CD91  on MS13
			; DESCRIPTION: Paul Pembroke asks player to help him "persuade" Cooke to stop seeing his wife. Player agrees to help.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 3
			; INFO/STAGE 0003D2B8  on MS13
			; DESCRIPTION: Paul Pembroke is confronting Cooke in person and has a gun pulled. Player tells him to go ahead and fire.

			;FALLOUTVORE COMPANIONS: 
			Bria_Loves()

		elseif eventID == 4
			; INFO/STAGE 0003D2BE  on MS13
			; DESCRIPTION: Paul Pembroke is confronting Cooke in person and has a gun pulled. Player appeals to Paul to talk it out.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 5
			; INFO/STAGE 0003D2C2  on MS13
			; DESCRIPTION: Paul Pembroke is confronting Cooke in person and has a gun pulled. Player tells him not to shoot.

			;FALLOUTVORE COMPANIONS: 
			Bria_Hates()

		elseif eventID == 6
			; INFO/STAGE 0003D2C4  on MS13
			; DESCRIPTION: Paul Pembroke is confronting Cooke in person and has a gun pulled. Player tells everyone to put their guns away.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 7 || eventID == 9
			; INFO/STAGE 00045800  on MS13
			; DESCRIPTION: Cooke left town, leaving Player and Paul to split the loot. Paul proposes 50-50, Player backs down after trying to get more

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 8
			; INFO/STAGE 00045809  on MS13
			; DESCRIPTION: Cooke left town, leaving Player and Paul to split the loot. Paul proposes 50-50 split, Player agrees

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 10
			; INFO/STAGE 0004581D  on MS13
			; DESCRIPTION: Cooke left town, leaving Player and Paul to split the loot. Paul proposes 50-50 split, Player says he wants 70-30.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 11
			; INFO/STAGE 00045821  on MS13
			; DESCRIPTION: Cooke left town, leaving Player and Paul to split the loot. Paul proposes 50-50 split, Player says he wants all of it.

			;FALLOUTVORE COMPANIONS: 
			Bria_Loves()

		elseif eventID == 12
			; INFO/STAGE 00066E6A  on MS13
			; DESCRIPTION: Threaten to kill Trish if she doesn't give password

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 13
			; INFO/STAGE 00066E7C  on MS13
			; DESCRIPTION: Promise to let Trish go if she tells password

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 14
			; INFO/STAGE 00066EA8  on MS13
			; DESCRIPTION: If win speech challenge, Trish goes free

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 15
			; INFO/STAGE 0008159D  on MS13
			; DESCRIPTION: Paul Pembroke asks player to help him "persuade" Cooke to stop seeing his wife. Player declines.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 17
			; INFO/STAGE 00198BB4  on MS13
			; DESCRIPTION: Let Trish live

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - MS13 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_MS13CookeDies(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == MS13CookeDies
		if eventID == 2 || eventID == 1
			; INFO/STAGE 0008C144  on MS13CookeDies
			; DESCRIPTION: Colette (Cooke's daughter) has come to town to investigate her dad's death. She's talking to Player. Player lies about it to cover up the killing.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 4 || eventID == 9 || eventID == 10
			; INFO/STAGE 0008F644  on MS13CookeDies
			; DESCRIPTION: Colette (Cooke's daughter) has come to town to investigate her dad's death. This has Paul Pembroke running scared. Player tries to convince Paul she's not here for revenge.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 5
			; INFO/STAGE 0008F64C  on MS13CookeDies
			; DESCRIPTION: Colette (Cooke's daughter) has come to town to investigate her dad's death. This has Paul Pembroke running scared. Player refuses to kill Colette on Paul's behalf.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 7 || eventID == 6 || eventID == 3
			; INFO/STAGE 0008F651  on MS13CookeDies
			; DESCRIPTION: Colette (Cooke's daughter) has come to town to investigate her dad's death. This has Paul Pembroke running scared. Player tries to convince Paul to kill her before she kills them.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 8
			; INFO/STAGE 0008F65D  on MS13CookeDies
			; DESCRIPTION: Colette (Cooke's daughter) has come to town to investigate her dad's death. This has Paul Pembroke running scared. Player agrees to kill Colette on Paul's behalf.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - MS13CookeDies got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_MS13FindPhoto(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == MS13FindPhoto
		if eventID == 1 || eventID == 2
			; INFO/STAGE 0008AF43  on MS13FindPhoto
			; DESCRIPTION: Decline to assassinate Cooke/Latimer

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 3
			; INFO/STAGE 0008AF4A  on MS13FindPhoto
			; DESCRIPTION: Agree to assassinate Cooke/Latimer

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 4
			; INFO/STAGE 0008AF50  on MS13FindPhoto
			; DESCRIPTION: Agree to assassinate Cooke and/or Latimer

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 5
			; INFO/STAGE 0008AF64  on MS13FindPhoto
			; DESCRIPTION: Asking for more to kill Cooke/Latimer

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 6
			; INFO/STAGE 0008AF65  on MS13FindPhoto
			; DESCRIPTION: Asking for more to kill Cooke or Latimer (only 1 is still alive)

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 7 || eventID == 8
			; INFO/STAGE 0008B6A9  on MS13FindPhoto
			; DESCRIPTION: Player agrees to give incriminating photo to Cooke if he gets paid.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 9
			; INFO/STAGE 0008B6D5  on MS13FindPhoto
			; DESCRIPTION: Give photo without asking for money for it

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		else
			debug.trace(self + " WARNING - MS13FindPhoto got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_MS13NelsonDies(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == MS13NelsonDies
		if eventID == 1
			; INFO/STAGE 000825B5  on MS13NelsonDies
			; DESCRIPTION: Haggle for more money for agreeing to murder someone

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 000838D5  on MS13NelsonDies
			; DESCRIPTION: Apologize for killing Nelson

			;FALLOUTVORE COMPANIONS: 
			Bria__UNSET()

		elseif eventID == 3
			; INFO/STAGE 000838DE  on MS13NelsonDies
			; DESCRIPTION: Harsh reply to Nelson's father about his death

			;FALLOUTVORE COMPANIONS: 
			Bria__UNSET()

		elseif eventID == 4
			; INFO/STAGE 000838EE  on MS13NelsonDies
			; DESCRIPTION: Neutral-ish response to father about Nelson's death

			;FALLOUTVORE COMPANIONS: 
			Bria__UNSET()

		elseif eventID == 5
			; INFO/STAGE 00083F42  on MS13NelsonDies
			; DESCRIPTION: Haggle for more money to kill Marowski

			;FALLOUTVORE COMPANIONS: 
			Bria__UNSET()

		elseif eventID == 6 || eventID == 7
			; INFO/STAGE 00083F47  on MS13NelsonDies
			; DESCRIPTION: Refuse to murder Marowski

			;FALLOUTVORE COMPANIONS: 
			Bria__UNSET()

		elseif eventID == 8
			; INFO/STAGE 00083F53  on MS13NelsonDies
			; DESCRIPTION: Agree to murder Marowski for money

			;FALLOUTVORE COMPANIONS: 
			Bria__UNSET()

		elseif eventID == 9
			; INFO/STAGE 00084478  on MS13NelsonDies
			; DESCRIPTION: Haggle for more money for murdering Paul

			;FALLOUTVORE COMPANIONS: 
			Bria__UNSET()

		elseif eventID == 10
			; INFO/STAGE 00084479  on MS13NelsonDies
			; DESCRIPTION: Player lies and blames someone else for killing Nelson

			;FALLOUTVORE COMPANIONS: 
			Bria__UNSET()

		elseif eventID == 11
			; INFO/STAGE 0008447D  on MS13NelsonDies
			; DESCRIPTION: Refuse to murder Paul

			;FALLOUTVORE COMPANIONS: 
			Bria__UNSET()

		elseif eventID == 12
			; INFO/STAGE 0008447E  on MS13NelsonDies
			; DESCRIPTION: Player lies and blames someone else for killing Nelson

			;FALLOUTVORE COMPANIONS: 
			Bria__UNSET()

		elseif eventID == 13
			; INFO/STAGE 00084482  on MS13NelsonDies
			; DESCRIPTION: Agree to murder Paul

			;FALLOUTVORE COMPANIONS: 
			Bria__UNSET()

		else
			debug.trace(self + " WARNING - MS13NelsonDies got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_MS13PaulDies(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == MS13PaulDies
		if eventID == 1
			; INFO/STAGE 0008C143  on MS13PaulDies
			; DESCRIPTION: Cheat Darcy out of her cut of the photo blackmail

			;FALLOUTVORE COMPANIONS: 
			Bria__UNSET()

		else
			debug.trace(self + " WARNING - MS13PaulDies got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_MS14(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == MS14
		if eventID == 1
			; INFO/STAGE 00047135  on MS14
			; DESCRIPTION: Player is trying to talk Travis into picking a fight to stand up for myself. Player is insulting him.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 0004714C  on MS14
			; DESCRIPTION: Player is trying to talk Travis into picking a fight to stand up for myself. Player is being supportive.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 3
			; INFO/STAGE 000E2E52  on MS14
			; DESCRIPTION: Player is going into brewery to rescue Vadim with Travis who is nervous. Player says we'll be fine.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 4
			; INFO/STAGE 000E2E56  on MS14
			; DESCRIPTION: Player is going into brewery to rescue Vadim with Travis who is nervous. Player says it's not likely he'll survive.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 5
			; INFO/STAGE 000E2E5C  on MS14
			; DESCRIPTION: Player is going into brewery to rescue Vadim with Travis who is nervous. Player says to stay cool.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 6
			; INFO/STAGE 000E355D  on MS14
			; DESCRIPTION: Player rescued Vadim. Vadim thanks Player. Player calls him an idiot for getting involved with kidnappers in first place.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 7
			; INFO/STAGE 000E355F  on MS14
			; DESCRIPTION: Player rescued Vadim. Vadim thanks Player. Player is nice about it.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 8
			; INFO/STAGE 000E4461  on MS14
			; DESCRIPTION: Player is wrapping up with Travis. Travis is thanking Player and says he learned a lot. Player is mean to him.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 9
			; INFO/STAGE 000E4464  on MS14
			; DESCRIPTION: Player is wrapping up with Travis. Travis is thanking Player and says he learned a lot. Player is nice.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 10
			; INFO/STAGE 000E446B  on MS14
			; DESCRIPTION: Player is wrapping up with Travis. Travis is thanking Player and says he learned a lot. Player is neutral about it.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 11
			; INFO/STAGE 000E7630  on MS14
			; DESCRIPTION: Vadim says that Travis is an awful DJ and should be killed. Player is indifferent about it.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 12
			; INFO/STAGE 000E7638  on MS14
			; DESCRIPTION: Vadim says that Travis is an awful DJ and should be killed. Player is surprised/concerned.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 13
			; INFO/STAGE 000E7644  on MS14
			; DESCRIPTION: Vadim says that Travis is an awful DJ and should be killed. Player agrees.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 14
			; INFO/STAGE 000E764D  on MS14
			; DESCRIPTION: Vadim says that Travis is an awful DJ and should be killed. Player disagrees.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 15
			; INFO/STAGE 000EAD36  on MS14
			; DESCRIPTION: Vadim asks if the Player's ever been in a bar fight. Player answers that he can hold his own.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 16
			; INFO/STAGE 000EAD43  on MS14
			; DESCRIPTION: Vadim asks if the Player's ever been in a bar fight. Player says he's not thug and wouldn't do that.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 17
			; INFO/STAGE 000EAD4F  on MS14
			; DESCRIPTION: Vadim asks if the Player's ever been in a bar fight. Player says he has.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 18
			; INFO/STAGE 000EAE7B  on MS14
			; DESCRIPTION: Player is threatning Scarlett with violence if she doesn't spend time with Travis.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 19
			; INFO/STAGE 000F935E  on MS14
			; DESCRIPTION: Travis found out Vadim got kidnapped. He's taking the blame on himself. Player says why they took Vadim doesn't matter, but getting him back does.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 20
			; INFO/STAGE 000F9364  on MS14
			; DESCRIPTION: Travis found out Vadim got kidnapped. He's taking the blame on himself. Player says it's totally his fault.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 21
			; INFO/STAGE 000F9369  on MS14
			; DESCRIPTION: Travis found out Vadim got kidnapped. He's taking the blame on himself. Player says it's not his fault.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 22
			; INFO/STAGE 000F9371  on MS14
			; DESCRIPTION: Travis found out Vadim got kidnapped. He's taking the blame on himself. Player says what does it matter.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - MS14 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_MS16(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == MS16
		if eventID == 1
			; INFO/STAGE 0005210C  on MS16
			; DESCRIPTION: Player asked for bigger share of the caps after the Big Dig heist.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 0011A0ED  on MS16
			; DESCRIPTION: Player haggled for more caps.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 0011A0F0  on MS16
			; DESCRIPTION: Player accepted sketchy job offer from crime boss Bobbi No Nose.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 4
			; INFO/STAGE 0011E4A0  on MS16
			; DESCRIPTION: Player bribed a Diamond City guard.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 5
			; INFO/STAGE 0011E4B0  on MS16
			; DESCRIPTION: Player threatened a Diamond City Guard.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 6
			; INFO/STAGE 001277CC  on MS16
			; DESCRIPTION: Player decided to betray Bobbi and not steal from Hancock. Player kills Bobbi.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 7
			; INFO/STAGE 001277D2  on MS16
			; DESCRIPTION: Player decided to stick with Bobbi and steal from Hancock.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 8
			; INFO/STAGE 001277E0  on MS16
			; DESCRIPTION: Player talked Bobbi out of stealing from Hancock

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		else
			debug.trace(self + " WARNING - MS16 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_MS17(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == MS17
		if eventID == 1
			; INFO/STAGE 0001DBB6  on MS17
			; DESCRIPTION: Player is splitting the loot with Honest Dan after dealing with Stockton's daughter. Player demands a larger cut.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 00053792  on MS17
			; DESCRIPTION: Player has met Honest Dan and he asks if Player is from around here. Player lies and says he's from Covenant.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 3 || eventID == 5
			; INFO/STAGE 00054AED  on MS17
			; DESCRIPTION: Player is at gate to Covenant. When asked by Manny why he's there, Player tells truth and says he's looking for Stockton's caravan survivors (even though that's a dangerous move)

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 4
			; INFO/STAGE 00054B01  on MS17
			; DESCRIPTION: Player is telling Honest Dan what happened to caravan. Dan wants to hit up compound, Player says let's do it.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 6
			; INFO/STAGE 00054B04  on MS17
			; DESCRIPTION: Player is telling Honest Dan what happened to caravan. Dan wants to hit up compound, Player says no deal.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 7
			; INFO/STAGE 000EEC44  on MS17
			; DESCRIPTION: Player is speaking to Doctor Chambers about hanging on to Stockton's synth. Chambers wants to pay off Player to look the other way. Player takes the deal.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 8
			; INFO/STAGE 000EEC55  on MS17
			; DESCRIPTION: Player is speaking to Doctor Chambers about hanging on to Stockton's synth. Chambers wants to pay off Player to look the other way. Player refuses deal.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 9
			; INFO/STAGE 000EEC58  on MS17
			; DESCRIPTION: Player is at compound gate talking to Manny, who won't let him in. Player threatens Manny with violence.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 10
			; INFO/STAGE 000EEC5C  on MS17
			; DESCRIPTION: Jacob Orden wants Player to ignore the investigation. Player accepts the bribe that's offered.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 11
			; INFO/STAGE 000EEC6D  on MS17
			; DESCRIPTION: Player is at compound gate talking to Manny, who won't let him in. Player tries to negotiate his way in peacefully.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 12
			; INFO/STAGE 000EEC71  on MS17
			; DESCRIPTION: Jacob Orden wants Player to ignore the investigation. Player rejects the bribe that's offered.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 13
			; INFO/STAGE 000EEC8A  on MS17
			; DESCRIPTION: Jacob Orden wants Player to ignore the investigation. Player tries to compromise.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 14
			; INFO/STAGE 0012AC59  on MS17
			; DESCRIPTION: Doctor Chambers is going to dispose of Amelia Stockton. She offers a bribe if Player lets her do it. Player makes a plea to save her life instead.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 15
			; INFO/STAGE 0012AC5A  on MS17
			; DESCRIPTION: In talking with Doctor Chambers the player says ;"Someone needs to destroy the Institute".

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 16
			; INFO/STAGE 0012AC69  on MS17
			; DESCRIPTION: Doctor Chambers is going to dispose of Amelia Stockton. She offers a bribe if Player lets her do it. Player rejects it.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 17
			; INFO/STAGE 0012AC6D  on MS17
			; DESCRIPTION: Doctor Chambers wants to exterminate synths. Player is horrified.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 18
			; INFO/STAGE 0012AC7A  on MS17
			; DESCRIPTION: Doctor Chambers is going to dispose of Amelia Stockton. She offers a bribe if Player lets her do it. Player takes it.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - MS17 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_MS19(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == MS19
		if eventID == 1 || eventID == 4
			; INFO/STAGE 0002BE37  on MS19
			; DESCRIPTION: Player has a cure for a unique molerat disease in hand. There's only one dose. A kid in a Vault needs the cure, or he'll die. Player refuses to give it to kid

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 0002BE57  on MS19
			; DESCRIPTION: Player has a cure for a unique molerat disease in hand. There's only one dose. A kid in a Vault needs the cure, or he'll die. Player wants to split the dose between himself and the kid

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 3
			; INFO/STAGE 0002BE59  on MS19
			; DESCRIPTION: Player has a cure for a unique molerat disease in hand. There's only one dose. A kid in a Vault needs the cure, or he'll die. Player gives it to kid and suffers a permanent health debuff

			;FALLOUTVORE COMPANIONS: 
			Bria_Hates()

		else
			debug.trace(self + " WARNING - MS19 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_REAssaultSC01_DN123SkylanesAssault(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == REAssaultSC01_DN123SkylanesAssault
		if eventID == 1
			; INFO/STAGE 000CB1FC  on REAssaultSC01_DN123SkylanesAssault
			; DESCRIPTION: Player was perceptive, noticed something odd.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 000CB205  on REAssaultSC01_DN123SkylanesAssault
			; DESCRIPTION: Player doesn't haggle for a better reward.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 3 || eventID == 4
			; INFO/STAGE 000CB210  on REAssaultSC01_DN123SkylanesAssault
			; DESCRIPTION: Player haggles for a better reward.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - REAssaultSC01_DN123SkylanesAssault got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_RECampLC01(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == RECampLC01
		if eventID == 1
			; INFO/STAGE 001D1A67  on RECampLC01
			; DESCRIPTION: Player is attacking the captors of a runwaway Synth

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 00190591  on RECampLC01
			; DESCRIPTION: Player attacks a Synth captive he/she just rescued

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 00190593  on RECampLC01
			; DESCRIPTION: Player is trying to free a Synth from execution without violence

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 4
			; INFO/STAGE 001D1A66  on RECampLC01
			; DESCRIPTION: Player is attacking the captors of a man who has begged the player to help him (Player doesn't know he's a Synth)

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 5
			; INFO/STAGE 0019059E  on RECampLC01
			; DESCRIPTION: Player agrees that a Synth captive should be executed

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 6
			; INFO/STAGE 001905AE  on RECampLC01
			; DESCRIPTION: Player threatens violence against a pair of hostage takers threatening to kill a Synth

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 7
			; INFO/STAGE 001D1A65  on RECampLC01
			; DESCRIPTION: Player is not getting involved in the execution of a runaway Synth

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 8
			; INFO/STAGE 001905CF  on RECampLC01
			; DESCRIPTION: Player extorts money out of a Synth captive he just rescued.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 9
			; INFO/STAGE 001905D4  on RECampLC01
			; DESCRIPTION: Player attempts to negotiate the release of a Synth who is about to be executed

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 10
			; INFO/STAGE 0019D2F3  on RECampLC01
			; DESCRIPTION: Player threatens violence against a pair of hostage takers threatening to kill a Synth

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 11
			; INFO/STAGE 0019D2F5  on RECampLC01
			; DESCRIPTION: Player is trying to free a Synth from execution without violence

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 12
			; INFO/STAGE 001D1A64  on RECampLC01
			; DESCRIPTION: Player has stumbled across a two people threatening to execute someone and has decided to not get involved (player doesn't know the man is a Synth)

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - RECampLC01 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_RESceneLC01(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == RESceneLC01
		if eventID == 1
			; INFO/STAGE 001D03E5  on RESceneLC01
			; DESCRIPTION: Player has come across two men with the same face, both claiming the other is a Synth. The player encouraged one man to execute the other, despite not knowing who is actually the Synth

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 001D03E4  on RESceneLC01
			; DESCRIPTION: Player has come across two men with the same face, both claiming the other is a Synth. The player has uncovered which is the Synth and encouraged the Synth's execution

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 001D03E3  on RESceneLC01
			; DESCRIPTION: Player has come across two men with the same face, both claiming the other is a Synth. Player has uncovered who is the Institute Synth and has decided to attack the other man

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 4
			; INFO/STAGE 0017E763  on RESceneLC01
			; DESCRIPTION: Player has come across two men with the same face, both claiming the other is a Synth. One has a gun to the other's head. Player has decided to not intervene in the execution (Player doesn't know who the Synth is)

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 5
			; INFO/STAGE 001D03E2  on RESceneLC01
			; DESCRIPTION: Player has come across two men with the same face, both claiming the other is a Synth. Player attacks the man holding the gun, not knowing who the Synth actually is

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 6
			; INFO/STAGE 001D03E6  on RESceneLC01
			; DESCRIPTION: Player has come across two men with the same face, both claiming the other is a Synth. Player encourages one man to execute the other, not knowing who is the Synth

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 7
			; INFO/STAGE 0018007A  on RESceneLC01
			; DESCRIPTION: Player attempts to find a peaceful solution with a man pointing a gun at suspected Synth working for the Institute

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 8
			; INFO/STAGE 001C40B6  on RESceneLC01
			; DESCRIPTION: Player has come across two men with the same face, both claiming the other is a Synth. Player has uncovered who is the Institute Synth and has decided to attack the other man

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 9
			; INFO/STAGE 001D03E7  on RESceneLC01
			; DESCRIPTION: Player has come across two men with the same face, both claiming the other is a Synth. Player has uncovered which is the Synth and encourages the man to execute him

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - RESceneLC01 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_RETravelKMK_BoSM02(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == RETravelKMK_BoSM02
		if eventID == 1
			; INFO/STAGE 00162AB2  on RETravelKMK_BoSM02
			; DESCRIPTION: Player repeats the Brotherhood line against Ghoulsthey all need to die. Kind of cruelthe NPC vehemently disagrees and has lost everything because he's held to his beliefs.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - RETravelKMK_BoSM02 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_RETravelSC01_DN123SkylanesPointer(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == RETravelSC01_DN123SkylanesPointer
		if eventID == 1 || eventID == 3 || eventID == 4
			; INFO/STAGE 000CAB3C  on RETravelSC01_DN123SkylanesPointer
			; DESCRIPTION: Player has out-scammed someone who would have scammed him.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 000CAB42  on RETravelSC01_DN123SkylanesPointer
			; DESCRIPTION: Player accepts a lowball offer for a job without even trying to haggle.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 5
			; INFO/STAGE 000CAB7F  on RETravelSC01_DN123SkylanesPointer
			; DESCRIPTION: Player challenges for a better reward. The first offer was insulting.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - RETravelSC01_DN123SkylanesPointer got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_RR101(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == RR101
		if eventID == 2 || eventID == 1
			; INFO/STAGE 0006E3A7  on RR101
			; DESCRIPTION: Desdemona asks if Player would risk his life to save a synth. Player says yes.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 3
			; INFO/STAGE 0006E406  on RR101
			; DESCRIPTION: Player agrees that Instutute needs to go. Player says his motivation is revenge for what they did to his family.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 4
			; INFO/STAGE 0006E417  on RR101
			; DESCRIPTION: Desdemona is talking to Player about Institute treating synths like slaves. Player disagrees… synths are machines.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 5
			; INFO/STAGE 0006E432  on RR101
			; DESCRIPTION: Player agrees that Instutute needs to go. Player says his motivation is so they can't hurt anyone else.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 6
			; INFO/STAGE 0006E43F  on RR101
			; DESCRIPTION: Desdemona asks if Player would risk his life to save a synth. Player says no.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 7
			; INFO/STAGE 0006E447  on RR101
			; DESCRIPTION: Desdemona is talking to Player about Institute treating synths like slaves. Player agrees.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		else
			debug.trace(self + " WARNING - RR101 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_RR102(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == RR102
		if eventID == 1
			; INFO/STAGE 000729BD  on RR102
			; DESCRIPTION: Player is meeting Ricky Dalton for a mission. Player says he appreciates all that Ricky's done.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 00072A03  on RR102
			; DESCRIPTION: Player is meeting Ricky Dalton for a mission. Ricky is aggitated it took so long for help to arrive. Player threatens him in response.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 00072FFD  on RR102
			; DESCRIPTION: Ricky has offered to be a distraction so Player can get into Switchboard undetected, which is suicidal. Player says not to do it.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 4
			; INFO/STAGE 00073003  on RR102
			; DESCRIPTION: Ricky has offered to be a distraction so Player can get into Switchboard undetected, which is suicidal. Player says to do it.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 5
			; INFO/STAGE 0007303B  on RR102
			; DESCRIPTION: Desdemona is debreifing Player regarding Switchboard. Deacon ends up making Player look better by lying. Player agrees to Deacon's lie.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 6
			; INFO/STAGE 00073047  on RR102
			; DESCRIPTION: Desdemona is debreifing Player regarding Switchboard. Deacon ends up making Player look better by lying. Player admits Deacon is lying.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 8 || eventID == 7
			; INFO/STAGE 0007B30E  on RR102
			; DESCRIPTION: Deacon asks player if he supports Synth freedom. Player says he is against slavery in all forms.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 10 || eventID == 9
			; INFO/STAGE 0007B316  on RR102
			; DESCRIPTION: Deacon asks player if he supports Synth freedom. Player says you can't enslave a machine.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 11
			; INFO/STAGE 000E2E24  on RR102
			; DESCRIPTION: Deacon offers Tommy's weapon to Player. Player refuses it.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - RR102 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_RR302(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == RR302
		if eventID == 1
			; INFO/STAGE 0002D10B  on RR302
			; DESCRIPTION: Player and Tom are preparing to assault the Brotherhood, Tom is worried they are being watched as they speak. Player tells him to relax.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 0002D14E  on RR302
			; DESCRIPTION: Player and Tom are preparing to assault the Brotherhood, Tom is worried they are being watched as they speak. Player tells him he's paranoid.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - RR302 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_RR303(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == RR303
		if eventID == 1
			; INFO/STAGE 0013FE8A  on RR303
			; DESCRIPTION: Glory is dying. She asks Player to promise he'll free all the synths in the Institute. Player leaves her, ignoring her request.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 0013FE91  on RR303
			; DESCRIPTION: Glory is dying. She asks Player to promise he'll free all the synths in the Institute. Player says "I promise."

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 3
			; INFO/STAGE 0013FEA3  on RR303
			; DESCRIPTION: Glory is dying. She asks Player to promise he'll free all the synths in the Institute. Player says "Hold on, you'll live."

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - RR303 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_RRM01(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == RRM01
		if eventID == 1
			; INFO/STAGE 0005FE6A  on RRM01
			; DESCRIPTION: Player meets Stockton. Stockton points out that this is first stop for "packages." and delays are bad. Player keeps to the spy lingo.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 0005FE76  on RRM01
			; DESCRIPTION: Player makes a rude comment to HighRise at Ticonderoga.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 0005FE8A  on RRM01
			; DESCRIPTION: Player meets Stockton. Stockton points out that this is first stop for "packages." and delays are bad. Player doesn't like the subtle tone.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 4
			; INFO/STAGE 0005FE8C  on RRM01
			; DESCRIPTION: Player gets to Ticonderoga and gives proper password to HighRise.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 5
			; INFO/STAGE 0005FEA9  on RRM01
			; DESCRIPTION: Player meets Stockton. Stockton points out that this is first stop for "packages." and delays are bad. Player agrees.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 6
			; INFO/STAGE 00112EAC  on RRM01
			; DESCRIPTION: Player is getting mission from Carrington. Carrington says Stockton needs help with a runaway synth, but demeans Stockton's paranoia in the process. Player tries to defend Stockton.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 7
			; INFO/STAGE 00112EC7  on RRM01
			; DESCRIPTION: Player is getting mission from Carrington. Carrington says Stockton needs help with a runaway synth, but demeans Stockton's paranoia in the process. Player says it sounds like an important mission.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 8
			; INFO/STAGE 00112EE6  on RRM01
			; DESCRIPTION: Player is getting mission from Carrington. Carrington says Stockton needs help with a runaway synth, but demeans Stockton's paranoia in the process. Player asks why Stockton hates everyone.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 9
			; INFO/STAGE 00112EBF  on RRM01
			; DESCRIPTION: Player mentioned that Deacon taught him the callsign. Basically, Player is standing up for Deacon

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - RRM01 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_RRM02(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == RRM02
		if eventID == 1
			; INFO/STAGE 000A8BFA  on RRM02
			; DESCRIPTION: Player is upset they didn't get to say goodbye to H2-22 before Amari wiped his memory.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		else
			debug.trace(self + " WARNING - RRM02 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_RRR02aQuest(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == RRR02aQuest
		if eventID == 1
			; INFO/STAGE 000B3EAD  on RRR02aQuest
			; DESCRIPTION: Player scolds a fellow Railroad agent for being a coward.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - RRR02aQuest got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_RRR05(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == RRR05
		if eventID == 1
			; INFO/STAGE 000B92C7  on RRR05
			; DESCRIPTION: Player demeans Desdemona's "hare-brained scheme" of letting Tinker Tom set up atmospheric sensors to look for Institute spy devices.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 000B92D3  on RRR05
			; DESCRIPTION: Humoring the crazy guy

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - RRR05 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_RRR08(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == RRR08
		if eventID == 1
			; INFO/STAGE 0013A44F  on RRR08
			; DESCRIPTION: Desdemona is sad about Glory's death. Player says he misses her too.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		else
			debug.trace(self + " WARNING - RRR08 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_V81_00_Intro(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == V81_00_Intro
		if eventID == 1
			; INFO/STAGE 000B8504  on V81_00_Intro
			; DESCRIPTION: Player is rude and threatens to get into Vault 81. This choice also turns on turrets to fire at the player if they approach the entrance.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 000B8580  on V81_00_Intro
			; DESCRIPTION: Player says they are from Vault 111 to get into Vault 81.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - V81_00_Intro got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_V81_01(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == V81_01
		if eventID == 1
			; INFO/STAGE 0010C3FE  on V81_01
			; DESCRIPTION: Player wants a child to pay more "money" to find her cat. She's technically offering her personal possessions, teddy bear.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - V81_01 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleDialogueBump_V81_03(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == V81_03
		if eventID == 1
			; INFO/STAGE 001AC3DA  on V81_03
			; DESCRIPTION: You confront Bobby about his Jet addiction and tell him he's just a waste of space, knowing he's in a fragile state of mind. You're being an instigator. if Cait_EventCondition_DislikesPlayerTakingChems.GetValue() == 0

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 001AC3E6  on V81_03
			; DESCRIPTION: You confront Bobby about his Jet addiction and tell him he needs to get help. if Cait_EventCondition_DislikesPlayerTakingChems.GetValue() == 0

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 3
			; INFO/STAGE 001AC3FA  on V81_03
			; DESCRIPTION: You confront Bobby about his Jet addiction and rather than try to help, you give him Jet to encourage his addiction. if Cait_EventCondition_DislikesPlayerTakingChems.GetValue() == 0

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 4
			; INFO/STAGE 001AC48B  on V81_03
			; DESCRIPTION: Tina wants you to help her brother Bobby get help for his Jet addiction. You tell her to just let him die. "One less junkie in the Commonwealth." if Cait_EventCondition_DislikesPlayerTakingChems.GetValue() == 0

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 5
			; INFO/STAGE 001AC49A  on V81_03
			; DESCRIPTION: Tina wants you to help her brother Bobby get help for his Jet addiction. You agree he needs help. if Cait_EventCondition_DislikesPlayerTakingChems.GetValue() == 0

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 6
			; INFO/STAGE 001AC4BD  on V81_03
			; DESCRIPTION: Tina wants you to help her brother Bobby get help for his Jet addiction. You say he's a lost cause. if Cait_EventCondition_DislikesPlayerTakingChems.GetValue() == 0

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - V81_03 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction



function HandleQuestStageBump_BoS200(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == BoS200
		if eventID == 1
			; INFO/STAGE 100  on BoS200
			; DESCRIPTION: Officially joined the Brotherhood of Steel. Some Companions may object to the Player joining due to the intrinsic nature of the Brotherhood of Steel's view of howlife in the Commonwealth should be.

			;FALLOUTVORE COMPANIONS: 
			Bria_Hates()

		else
			debug.trace(self + " WARNING - BoS200 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_BoS202(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == BoS202
		if eventID == 1
			; INFO/STAGE 255  on BoS202
			; DESCRIPTION: Player killed all Super Mutants at Fort Strong, which took a large cache of Fat Man shells out oftheir hands. Companions may object to extermination of all Super Mutants, or appreciate the factthat the Player helped make the Commonwealth a safer place.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - BoS202 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_BoS203(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == BoS203
		if eventID == 1
			; INFO/STAGE 70  on BoS203
			; DESCRIPTION: The Player has been instructed to find Doctor Li and convince her to return to theBrotherhood. They are specifically told not to harm her in any way. If this stage has been set,the Player has ignored the Brotherhood and murdered Doctor Li (which will also kick them out ofthe Instutute Faction... could have a large rippling affinity effect).

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - BoS203 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_BoS204(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == BoS204
		if eventID == 1 || eventID == 2
			; INFO/STAGE 200 or 255  on BoS204
			; DESCRIPTION: Player gave Proctor Ingram (BoS) the holotape containing the stolen Institute data(which will eventually be used to figure out how to attack the Institute).

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		else
			debug.trace(self + " WARNING - BoS204 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_BoS301(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == BoS301
		if eventID == 1
			; INFO/STAGE 75  on BoS301
			; DESCRIPTION: The Player is told to convince Doctor Li to help build Liberty Prime. At thisstage, the Player took the opportunity to talk her into it peacefully and without any physicalthreats of violence.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 76  on BoS301
			; DESCRIPTION: The Player is told to convince Doctor Li to help build Liberty Prime. At this stage,the Player threatened Doctor Li with physical harm if she refused to help. This has a negativeeffect on Doctor Li's demeanor for the remainder of the game.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 3
			; INFO/STAGE 176  on BoS301
			; DESCRIPTION: The Player needed to bypass a Child of Atom in order to complete a portion of hismission. At this stage, the Player was able to talk his way through without any violence, leavingthe Child of Atom (who is not hostile) alive.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 4
			; INFO/STAGE 178  on BoS301
			; DESCRIPTION: The Player needed to bypass a Child of Atom in order to complete a portion of hismission. At this stage, the Player killed the Child of Atom instead of resolving the situationdiplomatically.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 5
			; INFO/STAGE 255  on BoS301
			; DESCRIPTION: The Player helped complete the construction of Liberty Prime. Companions may eithersupport or object to the Player putting a huge war machine in the hands of the Brotherhood of Steel.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		else
			debug.trace(self + " WARNING - BoS301 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_BoS302(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == BoS302
		if eventID == 1
			; INFO/STAGE 120  on BoS302
			; DESCRIPTION: The Player is sent to execute Paladin Danse, because it's been revealed that PaladinDanse is a synth. At this stage, the Player has approached Danse and found him in a virtuallysuicidal state, believing he should die (that his Brotherhood roots run deeper than his synthidentity). The Player makes an appeal to Danse that his death would serve no useful purpose, andhe has a right to live. This results in Danse agreeing with the Player and they try to leave thebunker together.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 160  on BoS302
			; DESCRIPTION: The Player is sent to execute Paladin Danse, because it's been revealed that PaladinDanse is a synth. At this stage, the Player has successfully convinced Danse to leave with thePlayer instead of killing himself (see 120 above). However, outside the bunker, they are confrontedby Elder Maxson. The Player is able to convince Maxson not to kill Danse, and to look the other wayallowing Danse to be peacefully exiled instead.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 3 || eventID == 4
			; INFO/STAGE 90 or 170  on BoS302
			; DESCRIPTION: The Player is sent to execute Paladin Danse, because it's been revealed that PaladinDanse is a synth. On these stages, Danse is either killed by the Player, allowed him to commitsuicide (by walking away), or allowing Maxson to execute him. There is a peaceful solution to thisquest, where the Player can make a plea on Danse's behalf and convince Elder Maxson to exile himfrom the Brotherhood rather than killing him.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - BoS302 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_BoSM01(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == BoSM01
		if eventID == 1
			; INFO/STAGE 120  on BoSM01
			; DESCRIPTION: After following the trail of a long-missing Brotherhood of Steel recon team, the playerfound the last survivor of the mission living alone in a remote bunker. Distraught and paranoid, heholds the player at gunpoint. The player carefully talked him down, then went a step further andconvinced him to rejoin the Brotherhood, which requires multiple successful speech challenges.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 145  on BoSM01
			; DESCRIPTION: After following the trail of a long-missing Brotherhood of Steel recon team, the playerfound the last survivor of the mission living alone in a remote bunker. Distraught and paranoid, heholds the player at gunpoint. Then the player provoked and killed him.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - BoSM01 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_BoSM02(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == BoSM02
		if eventID == 1
			; INFO/STAGE 385  on BoSM02
			; DESCRIPTION: During a Brotherhood faction quest, while investigating the theft of supplies from theBrotherhood, the player discovered that a young soldier was stealing the food to feed the feralghouls in the Airport Ruins. The soldier is morally torn-- he believes that the ghouls' lives havevalue, and he's trying to keep the Brotherhood from killing them (and vice versa). The player thenchose to provoke or 'execute' Clarke themselves, instead of letting him go or turning him in (he'd get a fair trial).

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - BoSM02 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_BoSR05(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == BoSR05
		if eventID == 1
			; INFO/STAGE 35  on BoSR05
			; DESCRIPTION: Brotherhood of Steel Radiant quest. Player has accepted a mission from Proctor Teagan(in charge of supplies of all sorts) to "persuade" farmers to donate their crops to the Brotherhood."Persuade" can be through dialogue, or killing the farmer. Teagan, a respected member of theBrotherhood, both knows this and would codone the player killing an innocent farmer to take cropsthat he feels the Brotherhood has a right to. This particular bump is for if the player has decidednot to verbally resolve the issue, and instead kills the Farmer. Killing the farmer may be seen asunnecessary by some since dialogue allows for a nice option, forceful option (both require passinga medium/easy speech challenge depending if the player owns the farm or not), or option to even paythe farmer to get the crops. Or it may be seen as either necessary or forgivable by others dependingon their stance on the Brotherhood or basically killing to get your way.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - BoSR05 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DialogueDrinkingBuddy(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DialogueDrinkingBuddy
		if eventID == 1
			; INFO/STAGE 40  on DialogueDrinkingBuddy
			; DESCRIPTION: Player found the Drinking Buddy robot and decided to keep it. The Drinking Buddyis a modified protectron who brews Ice Cold Beer (of various types) and tells jokes. The playercan keep him or sell him to Rufus, and NPC in goodneighbor. Assigning the Drinking Buddy to aworkshop location raises their happiness

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 501  on DialogueDrinkingBuddy
			; DESCRIPTION: The player destroyed the Drinking Buddy. There is no good reason to do this, justdecide if your companion cares.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - DialogueDrinkingBuddy got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DialogueGoodneighborRufus(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DialogueGoodneighborRufus
		if eventID == 1
			; INFO/STAGE 700  on DialogueGoodneighborRufus
			; DESCRIPTION: Player has sold the Drinking Buddy to Rufus in Goodneighbor. Rufus is a misc junkvendor who hangs out in Hotel Rexford or the 3rd Rail. The player can still get free beer, butdoesn't have the Drinking Buddy at their workshop

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - DialogueGoodneighborRufus got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DN015(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DN015
		if eventID == 1
			; INFO/STAGE 100  on DN015
			; DESCRIPTION: After being locked in a secure lab by a robot, the player has completed the powerarmor research that the prewar team could not.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 110  on DN015
			; DESCRIPTION: After being locked in the lab, the player has found a terminal and triggered asecurity override that unlocks the doors and turns all the robots hostile (alternate exit)

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - DN015 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DN036(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DN036
		if eventID == 1
			; INFO/STAGE 11  on DN036
			; DESCRIPTION: QUEST The player has found an old woman named Phyllis Daily who thinks she is a synth.She starts with a gun trained on the player and they have to decide how to deal with her. Shestarts out trying to warn the player to leave. (She is not a synth, she fell asleep on watch andthe gun she was holding misfired and killed her grandson)Player has convinced her to lower the gun through a speech challenge

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 20  on DN036
			; DESCRIPTION: Player has stated it is the Brotherhood duty to destroy her. This goes to battle.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 3
			; INFO/STAGE 201  on DN036
			; DESCRIPTION: After hearing what happened, the player has blamed her for Samuel's death(depends on the companion how they should feel about this)

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 4
			; INFO/STAGE 202  on DN036
			; DESCRIPTION: After hearing what happened, the player mentions Shaun to try to connect with her

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 5
			; INFO/STAGE 203  on DN036
			; DESCRIPTION: After hearing what happened, the player tried to tell her it wasn't her fault

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 6
			; INFO/STAGE 510  on DN036
			; DESCRIPTION: Player asked her to join the minutemen

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 7
			; INFO/STAGE 511  on DN036
			; DESCRIPTION: Player told her to just deal with it and move on

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 8
			; INFO/STAGE 512  on DN036
			; DESCRIPTION: Player told her to help others or take it at day at a time

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 9
			; INFO/STAGE 513  on DN036
			; DESCRIPTION: Player told her to leave the commonwealth (not in a jerk way)

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 10
			; INFO/STAGE 514  on DN036
			; DESCRIPTION: Player told her to go to Covenant and ask to take the test (she will laterappear there dead)

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 11
			; INFO/STAGE 701  on DN036
			; DESCRIPTION: The player has killed Phyllis before even knowing that she may be a synth(though she does have a gun pointed at you)

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 12
			; INFO/STAGE 702  on DN036
			; DESCRIPTION: The player has killed Phyllis after finding out she may be a synth, but beforehearing the full story.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 13
			; INFO/STAGE 703  on DN036
			; DESCRIPTION: Player has killed Phyllis after finding out she may be a synth and hearing that shekilled her grandson Samuel (which may have just been an accident)

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - DN036 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DN036_Post(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DN036_Post
		if eventID == 1
			; INFO/STAGE 15  on DN036_Post
			; DESCRIPTION: The player let Phyllis live, and reported her to the Institute. (they will send acourser to investigate, she will disappear without a trace, with some blood enabled there)

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 25  on DN036_Post
			; DESCRIPTION: The player let Phyllis live, and told the Railroad about her. (She will leave butleave a thank you note and loot)

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - DN036_Post got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DN053(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DN053
		if eventID == 1
			; INFO/STAGE XXX  on DN053
			; DESCRIPTION: Player brought Virgil the FEV Serum from his old lab in the Institute, which Virgilhopes will make him human again. The player promised to do this in exchange for Virgil's helpearlier, so he's kept his word.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 100  on DN053
			; DESCRIPTION: The player murdered Virgil. Virgil is not normally hostile, so the player provoked theconfrontation in some way, either by attacking him or by inciting him through dialogue.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - DN053 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DN079(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DN079
		if eventID == 1
			; INFO/STAGE 25  on DN079
			; DESCRIPTION: The player has questioned Theo repeatedly about the rumors that people have beengetting sick from eating his canned meat.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 900  on DN079
			; DESCRIPTION: After finding out about the ghoul meat and getting Theo into bleed out hesurrendered and the player has agreed to spare him and look the other way in exchange for a cutof the profit

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 951  on DN079
			; DESCRIPTION: Player has killed Theodore Collins after finding out that he has been using ghoulmeat in some of his cans, which is why people have been getting sick. Theo also attacked theplayer

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 4
			; INFO/STAGE 955  on DN079
			; DESCRIPTION: Player has killed Theodore Collins, who is running Longneck Lukowski's Cannery beforeknowing anything about the situation, so this is murder. Theodore just looks like a normal trader,but is out in a cannery on the coast. He repaired some of the retorts and has been selling cannedmeat.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - DN079 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DN083_Barney(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DN083_Barney
		if eventID == 1
			; INFO/STAGE 90  on DN083_Barney
			; DESCRIPTION: Player helped Barney set up automated turrets around Salem to defend it from beingoverrun by mirelurks. Barney is the only one that lives there.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 100  on DN083_Barney
			; DESCRIPTION: Barney wants to defend Salem from being overrun by mirelurks. Player decided to murderBarney without provocation.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - DN083_Barney got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DN101(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DN101
		if eventID == 1
			; INFO/STAGE 70  on DN101
			; DESCRIPTION: The player stumbled upon Raiders ransacking the Pickman Gallery looking to killPickman. Over the course of the level, the player discovers paintings of Raiders tortured byPickman and his torture chairs. At the end of the level, the player discovers Pickman caught bythe Raiders and about to be executed. The player can choose to save the serial killer Pickmanfrom the Raider gang he has been hunting. The stage fires when the player talks to Pickman afterkilling the Raiders.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - DN101 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DN109(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DN109
		if eventID == 1
			; INFO/STAGE 100  on DN109
			; DESCRIPTION: The player has gone to Quincy and killed one of the Gunner bosses, named Baker,who had betrayed the minutemen (he was a minuteman) and led to Preston & his group fleeingQuincy.

			;FALLOUTVORE COMPANIONS: 
			Bria_Loves()

		else
			debug.trace(self + " WARNING - DN109 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DN119Fight(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DN119Fight
		if eventID == 1
			; INFO/STAGE 220  on DN119Fight
			; DESCRIPTION: The player discovers a random Scavenger being attacked by Molerats, and can chooseto help the Scavenger kill them. The stage triggers when the player talks to the Scavenger afterkilling the Molerats.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - DN119Fight got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DN121(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DN121
		if eventID == 1
			; INFO/STAGE 55  on DN121
			; DESCRIPTION: QUEST The player has been sent by Abraham Finch to retrieve his sword,the Shishkebab, from The Forged in Saugus Ironworks. When the player arrives he finds Jake Finchin the middle of an induction ritual being told that he must kill an unarmed prisoner. Jake doesn'twant to but thinks they will kill him and his family if he doesn't, the player has the chanceto sway himPlayer attempted to haggle with Abraham over the price of retrieving the sword.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 350  on DN121
			; DESCRIPTION: The player killed the prisoner that Jake Finch was told to kill. This can happenafter the fight.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 495  on DN121
			; DESCRIPTION: Player has finished helping Jake reunite with his family (prisoner may or may nothave survived)

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 4
			; INFO/STAGE 501  on DN121
			; DESCRIPTION: Jake has decided to kill the prisoner, but the player kills Jake before he gets theshot off.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 5
			; INFO/STAGE 502  on DN121
			; DESCRIPTION: Jake decided not to kill the prisoner, but the player killed Jake anyway

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 6
			; INFO/STAGE 503  on DN121
			; DESCRIPTION: Jake killed the prisoner, but survived long enough to surrender, and appears repentant,but the player has killed him

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 7
			; INFO/STAGE 504  on DN121
			; DESCRIPTION: Jake did not kill the prisoner, but did fight against the player (player initiatedthe combat in some way) and has surrendered, but the player has killed him anyway

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 8
			; INFO/STAGE 505  on DN121
			; DESCRIPTION: Any other case where Jake is killed by the player, usually after helping him out(which is murder)

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 9
			; INFO/STAGE 722  on DN121
			; DESCRIPTION: (Jake died) The player has lied to Abraham to spare his feelings.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		else
			debug.trace(self + " WARNING - DN121 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_FFBunkerHill03(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == FFBunkerHill03
		if eventID == 1
			; INFO/STAGE 200  on FFBunkerHill03
			; DESCRIPTION: Some raiders (Zeller's Army) have captured and imprisoned a bunch of innocent traders.The player has just rescued the last of them.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - FFBunkerHill03 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_FFGoodneighbor07(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == FFGoodneighbor07
		if eventID == 1
			; INFO/STAGE 30  on FFGoodneighbor07
			; DESCRIPTION: Player has attacked Bobbi No-Nose after siding with her during MS16 - The Big Dig- but then took the job from Hancock to kill her and take back Hancock's stolen caps.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - FFGoodneighbor07 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_Inst301(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == Inst301
		if eventID == 1
			; INFO/STAGE 500  on Inst301
			; DESCRIPTION: Player has just teamed up with a Courser to attack Libertalia and try to reclaima rogue synth. Player's mission to reclaim the rogue synth was a success, and the Courser hasteleported him back to the Institute

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 300  on Inst301
			; DESCRIPTION: Player has just teamed up with a Courser to attack Libertalia and try to reclaim arogue synth. This is mainly here for companions that might have strong feelings about fightingalongside a Courser.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 3
			; INFO/STAGE 400  on Inst301
			; DESCRIPTION: Player's mission to reclaim the rogue synth was a failure, because the boss died

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - Inst301 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_Inst307(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == Inst307
		if eventID == 1
			; INFO/STAGE 200  on Inst307
			; DESCRIPTION: The Player has successfully attacked the airport and destroyed the Prydwen usingLiberty Prime to shoot it down

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - Inst307 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_InstM01(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == InstM01
		if eventID == 1
			; INFO/STAGE 70  on InstM01
			; DESCRIPTION: The player talked Bill Sutton, the dangerous foreman who was just a moment ago pointinga gun at a family, into standing down and giving up his crusade to expose Roger Warwick as a synth.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 90  on InstM01
			; DESCRIPTION: Player murdered the farm foreman, when he was supposed to keep a low profile. Playerhas acted against the Institute here, violating his orders and failing the mission.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - InstM01 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_InstR03NEW(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == InstR03NEW
		if eventID == 1
			; INFO/STAGE 500  on InstR03NEW
			; DESCRIPTION: Player stole blueprints from the Brotherhood of Steel to give to the Institute for study

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - InstR03NEW got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_InstR04(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == InstR04
		if eventID == 1
			; INFO/STAGE 40  on InstR04
			; DESCRIPTION: Player killed the synth he was sent to rescue, violating his orders and acting againstthe Institute's wishes

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 200  on InstR04
			; DESCRIPTION: Player successfully delivered the homing beacon to the abducted synth, completing atough mission for the Institute.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - InstR04 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_InstR05(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == InstR05
		if eventID == 1
			; INFO/STAGE XXX  on InstR05
			; DESCRIPTION: Player collected an intelligence report from the synth MayorMcDonough, who has beenspying on everyone in Diamond City for the Institute.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - InstR05 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_Min01(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == Min01
		if eventID == 1
			; INFO/STAGE 1500  on Min01
			; DESCRIPTION: Player helped the people of Sanctuary establish their settlement (building beds,water, food, defenses).

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		else
			debug.trace(self + " WARNING - Min01 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_Min02(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == Min02
		if eventID == 1
			; INFO/STAGE 600  on Min02
			; DESCRIPTION: Player helped reestablish the Castle as a Minutemen stronghold, and got RadioFreedom (Minutemen radio station) up and running.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		else
			debug.trace(self + " WARNING - Min02 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_Min03(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == Min03
		if eventID == 1
			; INFO/STAGE 920  on Min03
			; DESCRIPTION: Player built and tested artillery, which is now available to build at friendlysettlements. Player now has artillery support available.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		else
			debug.trace(self + " WARNING - Min03 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_Min207(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == Min207
		if eventID == 1
			; INFO/STAGE 200  on Min207
			; DESCRIPTION: Player gave Sturges the holotape containing the stolen Institute data (which willeventually be used to figure out how to attack the Institute).

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - Min207 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_Min301(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == Min301
		if eventID == 1
			; INFO/STAGE 50  on Min301
			; DESCRIPTION: Player has built up the strength of the Minutemen by recruiting settlements to thecause. The Minutemen are now strong enough to consider attacking the Institute.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		else
			debug.trace(self + " WARNING - Min301 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_MinDefendCastle(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == MinDefendCastle
		if eventID == 1
			; INFO/STAGE 400  on MinDefendCastle
			; DESCRIPTION: Player has helped the Minutemen defend the Castle from various attackers.Affinity varies based on attacker type0=Raiders, 1=Gunners, 2=SM, 3/6=BoS, 4/5=Inst !!!! SPECIAL AFFINITY HANDLING REQUIRED!!!!

			;FALLOUTVORE COMPANIONS: 
			; 0=Raiders, 1=Gunners, 2=SM, 3/6=BoS, 4/5=Inst
			if MinCastleAttacker.GetValue() == 0 || MinCastleAttacker.GetValue() == 1
				Bria_Likes()

			elseif MinCastleAttacker.GetValue() == 2
				Bria_Neutral()

			elseif MinCastleAttacker.GetValue() == 3 || MinCastleAttacker.GetValue() == 6
				Bria_Neutral()

			elseif MinCastleAttacker.GetValue() == 4 || MinCastleAttacker.GetValue() == 5
				Bria_Neutral()
			endif	
		else
			debug.trace(self + " WARNING - MinDefendCastle got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_MinDestBOS(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == MinDestBOS
		if eventID == 1
			; INFO/STAGE 500  on MinDestBOS
			; DESCRIPTION: Player ordered a successful artillery strike on the Prydwen.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - MinDestBOS got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_MQ203(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == MQ203
		if eventID == 1
			; INFO/STAGE 1100  on MQ203
			; DESCRIPTION: Player learned Virgil's location from Kellogg's memories. Player hopes that Virgilmay help the player figure out how to find the Institute and thus find his son.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - MQ203 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_MQ302(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == MQ302
		if eventID == 1
			; INFO/STAGE 850  on MQ302
			; DESCRIPTION: The player has just pushed the button to detonate the Fusion Pulse charge anddestroy the Institute.GLOBAL KEY: 1= BoS Pressed, 2= MinuteMen Pressed, 3= RR Pressed !!!! SPECIAL AFFINITY HANDLING REQUIRED!!!!

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - MQ302 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_MS01(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == MS01
		if eventID == 1
			; INFO/STAGE 45  on MS01
			; DESCRIPTION: After saving Billy the ghoul from the fridge, and reuniting him with his family, Bulletthe gunner surrounds the house. The player chooses to turn over the whole family to Bullet to becometheir slaves rather than fight Bullet.

			;FALLOUTVORE COMPANIONS: 
			Bria_Hates()

		else
			debug.trace(self + " WARNING - MS01 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_MS04(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == MS04
		if eventID == 1
			; INFO/STAGE 445  on MS04
			; DESCRIPTION: The player killed an assassin (Kendra) and found a contract on her body. The playerthen completes that assassination contract on a complete stranger (who is obviously guilty on nowrong doing). Probably to collect the reward.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 1330  on MS04
			; DESCRIPTION: Sinjin is holding Kent Connolly at gunpoint. Instead of negotiating with Sinjin,the player shoots Kent in the head. Kent has been working with the player up until that point.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 1359  on MS04
			; DESCRIPTION: Kent Connolly, a ghoul who has been working with the player, is being held hostage bythe vicous raider, Sinjin. The player manages to rescue Kent (which is very difficult).

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - MS04 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_MS05B(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == MS05B
		if eventID == 1
			; INFO/STAGE 500  on MS05B
			; DESCRIPTION: The player has returned the rescued Deathclaw egg to its nest.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		else
			debug.trace(self + " WARNING - MS05B got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_MS05BPostQuest(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == MS05BPostQuest
		if eventID == 1
			; INFO/STAGE 30  on MS05BPostQuest
			; DESCRIPTION: Player has stolen back Deathclaw egg they returned to nest in MS05B.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - MS05BPostQuest got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_MS07a(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == MS07a
		if eventID == 1
			; INFO/STAGE 60  on MS07a
			; DESCRIPTION: The player has found Doctor Crocker, Diamond City's surgeon, standing over a butcheredbody of a possible missing person in the basement of the Mega Surgery Center. Rather than trying totalk him down, the player has attacked them.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - MS07a got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_MS07b(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == MS07b
		if eventID == 1
			; INFO/STAGE 40  on MS07b
			; DESCRIPTION: The Player has just completed digging up the ancient grave of a coppersmith from the18th century in order to follow a lead on a treasure map. Companions may take issue with greedoverriding decency.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - MS07b got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_MS07c(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == MS07c
		if eventID == 1
			; INFO/STAGE 250  on MS07c
			; DESCRIPTION: The player and Nick have killed Eddie Winter, an unrepentant old mob boss and nemesisto the pre-war Nick Valentine, who has been hiding in a bunker for the past 200 years. This means alot to Nick.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - MS07c got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_MS09(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == MS09
		if eventID == 1
			; INFO/STAGE 1210  on MS09
			; DESCRIPTION: Player helps kill Lorenzo - see below. Lorenzo is in the process of freeing himself,so killing him is the only available option to stop him (aside from letting him get free oractively helping him get free).

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 1260  on MS09
			; DESCRIPTION: Player frees Lorenzo Cabot from his cell in Parsons State Insane Asylum. Player worksfor Jack Cabot, Lorenzo's son, and Jack has warned the player repeatedly that Lorenzo is insane andvery dangerous. However, Jack is also benefiting from Lorenzo's imprisonment by using Lorenzo'sblood to create a serum that prolongs his life. Lorenzo also urges the player to free him, arguingthat Jack is the crazy one and has been lying to the player the whole time.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - MS09 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_MS11(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == MS11
		if eventID == 1
			; INFO/STAGE 730  on MS11
			; DESCRIPTION: The player sides with scavengers to sabotage the USS Constitution's rockets. Thisscrews over the zany robotic crew of the ship (Ironsides and company). This happens when the playeractually sabotages the rocket directly.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		elseif eventID == 2
			; INFO/STAGE 950  on MS11
			; DESCRIPTION: The player has successfully fixed all of the components of the USS Constitution. Atthis point, the player watches the ship take off into the sky (and land inside a skyscraper inthe distance). The robotic crew are very pleased and the scavengers that wanted the salvage arelong dead.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - MS11 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_MS16(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == MS16
		if eventID == 1
			; INFO/STAGE 260  on MS16
			; DESCRIPTION: The player helped known criminal Bobbi No-Nose rob the mayor of Goodneighbor'sstoreroom. The player had to break in forcefully and kill his bodyguard to finish the job.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 270  on MS16
			; DESCRIPTION: The player was working for known criminal Bobbi No-Nose to help dig a tunnel tobreak into a loot vault. The player did not know who they were robbing until confronted byHancock's bodyguard. After having all the information, they refused to help Bobbi. Player eitherkilled Bobbi or talked her out of completing the job.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - MS16 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_MS17(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == MS17
		if eventID == 1
			; INFO/STAGE 90  on MS17
			; DESCRIPTION: The player somehow gets into Covenant without taking their SAFE test up front. Thiscauses the whole town to go hostile. Most likely occurs when the player jump jets over the wall.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 450  on MS17
			; DESCRIPTION: Doctor Chambers has been torturing people to perfect her Synth detection test. She haskilled a lot of innocent people and Synths in the process. She is unrepentent when confronted. Shewill not attack the player, but the player shoots her (there is no quest objective to do so).

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 490  on MS17
			; DESCRIPTION: Amelia Stockton was imprisoned by Covenant. They've been torturing her to try and gether to confess she's a Synth. She hasn't confessed yet - though Doctor Chambers was convinced she'sa Synth. For this event the player kills Amelia Stockton instead of rescuing her.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - MS17 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_RECampLC01(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == RECampLC01
		if eventID == 1
			; INFO/STAGE 96  on RECampLC01
			; DESCRIPTION: Player has encountered two humans threatening to kill a runaway Synth. The playerattacked the Synth.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 97  on RECampLC01
			; DESCRIPTION: Player has encounter two people threatening to kill someone (player doesn't know he'sa Synth). Player has attacked the person being threatened.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 601  on RECampLC01
			; DESCRIPTION: Player has encountered two humans threatening to kill a runaway Synth. The playerattacked the people threatening the Synth.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 4
			; INFO/STAGE 602  on RECampLC01
			; DESCRIPTION: Player has encounter two people threatening to kill someone (player doesn't know he'sa Synth). Player has attacked the aggressors.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - RECampLC01 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_RESceneLC01(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == RESceneLC01
		if eventID == 1
			; INFO/STAGE 111  on RESceneLC01
			; DESCRIPTION: Player has come across two men with the same face, both claiming the other is aSynth. The player has uncovered which is the Synth and attacked him

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 112  on RESceneLC01
			; DESCRIPTION: Player has come across two men with the same face, both claiming the other is aSynth. Player has attacked the hostage (but player doesn't know whether or not the man isactually a Synth)

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 3
			; INFO/STAGE 121  on RESceneLC01
			; DESCRIPTION: Player has come across two men with the same face, both claiming the other is aSynth. The player has uncovered which is the Synth and attacked the man holding him prisoner

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 4
			; INFO/STAGE 122  on RESceneLC01
			; DESCRIPTION: Player has come across two men with the same face, both claiming the other is aSynth. Player has attacked the man holding the gun (but player doesn't know whether or not theman is actually a Synth)

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - RESceneLC01 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_RR101(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == RR101
		if eventID == 1
			; INFO/STAGE 130  on RR101
			; DESCRIPTION: There is a simple tourist robot at Boston Common that spouts tourtist information.For no real reason the player blows it up.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		elseif eventID == 2
			; INFO/STAGE 609  on RR101
			; DESCRIPTION: The player meets the Railroad and is told by Desdemona to "Stop right there."The player moves and is warned again. Then continues moving provoking the Railroad intofiring on him.

			;FALLOUTVORE COMPANIONS: 
			Bria_Likes()

		else
			debug.trace(self + " WARNING - RR101 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_RR102(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == RR102
		if eventID == 1
			; INFO/STAGE 800  on RR102
			; DESCRIPTION: The player has just joined the Railroad.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		else
			debug.trace(self + " WARNING - RR102 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_RR201(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == RR201
		if eventID == 1 || eventID == 2 || eventID == 3 || eventID == 4 || eventID == 5 || eventID == 6 
			; INFO/STAGE 300, 350, 375, 600, 700, 750  on RR201
			; DESCRIPTION: The player has just joined the Railroad.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		else
			debug.trace(self + " WARNING - RR201 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_RR303(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == RR303
		if eventID == 1
			; INFO/STAGE 940  on RR303
			; DESCRIPTION: The Railroad is trying to destroy the Prydwen. A disguised player has just manages to fasttalk the Brotherhood people in dialog. So the player can walk freely on the ship instead of fighting.Very smooth, player.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 1150  on RR303
			; DESCRIPTION: The player just blew up the Prydwen for the Railroad.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - RR303 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_RRAct3PickUp(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == RRAct3PickUp
		if eventID == 1
			; INFO/STAGE 100  on RRAct3PickUp
			; DESCRIPTION: After the player went to the Institute for the Minutemen or Brotherhood of Steel,he visits the Railroad. The player makes a deal to infiltrate the Institute for the Railroad.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		else
			debug.trace(self + " WARNING - RRAct3PickUp got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_RRM01(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == RRM01
		if eventID == 1
			; INFO/STAGE 700  on RRM01
			; DESCRIPTION: The player helped escort a bewildered Synth through the streets of Charlestown tomake it to a new place of safety - Ticonderoga Station.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		else
			debug.trace(self + " WARNING - RRM01 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_RRM02(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == RRM02
		if eventID == 1
			; INFO/STAGE 350  on RRM02
			; DESCRIPTION: Same case as RRM02/360, instead the player decides to go with Glory.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 360  on RRM02
			; DESCRIPTION: At Malden Center, the player bumps into the Railroad's second combat effectivemember, Glory. The player refuses to join forces with Glory to clear out Malden Center of hostiles.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - RRM02 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_RRR04(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == RRR04
		if eventID == 1
			; INFO/STAGE 300  on RRR04
			; DESCRIPTION: The player just pacified an area, built defenses, and made a new Railroad Safehousecalled Mercer.

			;FALLOUTVORE COMPANIONS: 
			Bria_Neutral()

		else
			debug.trace(self + " WARNING - RRR04 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_RRR08(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == RRR08
		if eventID == 1
			; INFO/STAGE 250  on RRR08
			; DESCRIPTION: The L&L gang is a loose collection of very dangerous raiders that despise Synthsespecially. The very last member of their gang is killed and the greatest remaining threat to theRailroad is finally dealt with.

			;FALLOUTVORE COMPANIONS: 
			Bria_Dislikes()

		else
			debug.trace(self + " WARNING - RRR08 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction