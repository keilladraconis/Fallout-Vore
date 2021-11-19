ScriptName Hardcore:HC_ManagerScript extends Quest conditional

;-- Structs -----------------------------------------
Struct Effect
	Potion EffectPotion
	{ What potion to apply when gaining this effect - for all negative effects so they show up in stats effects list in pipboy }
	MagicEffect MagicEffectToApply
	{ The Magic Effect this effect applies, if any. This lets us to test whether or not it's active (Disease Symptoms). }
	GlobalVariable GlobalEnum
	{ this global's value is the enum for this effect }
	Message MessageToDisplay
	{ this global's value is the enum for this effect - detailed }
	Message MessageToDisplayDetail
	{ What message do we display when gaining this effect }
	Message MessageToRedisplay
	{ What message do we display when regaining this effect while it's already active }
	Message MessageToDisplayAfterAwaking
	{ What message do we display when regaining this effect while it's already active - detailed }
	Message MessageToDisplayAfterAwakingDetail
	{ What message do we display when awaking with this effect }
	float DiseaseChanceFloor = 0.05
	{ The lowest chance of getting diseased the player has with this effect }
	float DiseaseChanceCeiling = 0.9
	{ The highest chance of getting diseased the player has with this effect }
	float DiseaseChanceDrainMult = 1.0
	{ The multiplier on that rate at which the disease chance drains to the floor value }
	float FatigueMult = 0.01
	{ The percentage of fatigue that this effect adds }
	MagicEffect HerbalRemedyEffect
	{ This Herbal Remedy, if applied, can counter disease if RNGesus shows grace. }
	float HerbalRemedyBoostedImmunityThreshold = 0.2
	{ The disease  die roll needs to be <= Risk Pool && >= BoostedImmunityThreshold to get this disease.
This number acts as both a minimum Risk Pool threshold to even get this disease and
once the Risk Pool is high enough, adds some randomness to whether you would get this disease with each risky action.
IMPORTANT: to prevent total imminuty this value should be below 1. }
EndStruct

Struct HC_Tutorial
	Message MessageToDisplay
	int TimesToDisplay = 1
	int TimesDisplayed hidden
	float GameDaysBetweenDisplays = 0.01
	float LastTimeDisplayed hidden
EndStruct


;-- Properties --------------------------------------
Group CommonProperties
	FormList Property HC_Rules Auto Const mandatory
	ActorValue Property Fatigue Auto Const mandatory
	followersscript Property Followers Auto Const mandatory
	{ Autofill; needed for reimplementing lover's embrace and turning off bleedout recovery }
	Keyword[] Property NonFoodKeywords Auto Const mandatory
	float Property HoursToRespawnCellMult = 5.0 Auto Const
	float Property HoursToRespawnCellClearedMult = 4.0 Auto Const
	GlobalVariable Property HC_HoursToRespawnCellMult Auto Const
	GlobalVariable Property HC_HoursToRespawnCellClearedMult Auto Const
	Hardcore:FV_VoreSurvival Property HC_VoreSurvival const auto mandatory
EndGroup

Group Tutorials
	hc_tutorial Property ImmunodeficiencyTutorial Auto
	hc_tutorial Property TirednessTutorial Auto
	hc_tutorial Property HungerTutorial Auto
	hc_tutorial Property ThirstTutorial Auto
	hc_tutorial Property HighRiskEventTutorial Auto
	hc_tutorial Property DiseasedTutorial Auto
	hc_tutorial Property AdrenalineTutorial Auto
	hc_tutorial Property NonBedSleepTutorial Auto
	hc_tutorial Property CompanionDownedTutorial Auto
	hc_tutorial Property SleepToSaveTutorial Auto
EndGroup

Group Timers
	float Property GameTimerInterval_SleepDeprivation = 14.0 Auto Const
	float Property GameTimerInterval_Encumbrance = 24.0 Auto Const
	float Property GameTimerInterval_Sustenance = 0.1 Auto Const
	{ THIS NEEDS TO BE LESS THAN TickHoursCostPerCombat }
	float Property GameTimerInterval_Disease = 0.333333 Auto Const
	float Property GameTimerInterval_DiseasePostRiskEvent = 0.033 Auto Const
	float Property GameTimerInterval_DisplaySleepMessage = 0.033 Auto Const
	float Property GameTimerInterval_IgnoreNonWeaponHits = 0.166667 Auto Const
EndGroup

Group FastTravel
	GlobalVariable Property HC_Rule_NoFastTravel Auto Const mandatory
	{ autofill }
	tutorialscript Property Tutorial Auto Const mandatory
	{ autofill; used to toggle on/off tutorial message for pipboy map }
	Location Property InstituteLocation Auto Const mandatory
	{ autofill }
	FormList Property HC_FastTravelAllowedList Auto Const mandatory
	{ autofill }
	ObjectReference[] Property FastTravelAllowedWhileInInstituteMapMarkers Auto Const mandatory
	{ CITRuinsMapMarker, others? }
	Message Property HC_TutorialFastTravelInstitute Auto Const mandatory
	{ autofill }
	Message Property HC_FastTravelInstitute_Out Auto Const mandatory
	{ autofill }
	Message Property HC_FastTravelInstitute_To Auto Const mandatory
	{ autofill }
	Quest Property MQ207 Auto Const mandatory
	{ autofill }
EndGroup

Group Balance
	GlobalVariable Property HC_Rule_ScaleDamage Auto Const mandatory
EndGroup

Group Adrenaline
	GlobalVariable Property HC_Rule_AdrenalineOn Auto Const mandatory
	ActorValue Property HC_Adrenaline Auto Const mandatory
	Perk Property HC_AdrenalinePerk Auto Const mandatory
	int Property KillsForAdrenalinePerkLevel = 5 Auto Const
	{ ***IMPORTANT*** if we ever change KillsForAdrenalinePerkLevel, we must change the conditions in HC_AdrenalineEffect potion }
	int Property MaxAdrenalinePerkLevel = 10 Auto Const
	Potion Property HC_AdrenalineEffect Auto Const mandatory
	{ autofill; potion with effects to show player has adrenaline }
EndGroup

Group SustenanceEffects
	GlobalVariable Property HC_Rule_SustenanceEffects Auto Const mandatory
	ActorValue Property HC_HungerEffect Auto Const mandatory
	effect[] Property HungerEffects Auto Const mandatory
	{ The order in this array, is the order they devolution after time passes since eating. }
	Keyword[] Property IncreasesHungerKeywords Auto Const mandatory
	{ keywords in here, removes points from Food pool, making the player more hungry }
	float Property IncreasesHungerCostMult = 0.65 Auto Const
	{ Multiplier on things that increase hunger's caps value }
	Keyword Property ObjectTypeFood Auto Const mandatory
	{ autofill }
	ActorValue Property HC_ThirstEffect Auto Const mandatory
	effect[] Property ThirstEffects Auto Const mandatory
	{ The order in this array, is the order they devolution after time passes since eating. }
	Keyword[] Property IncreasesThirstKeywords Auto Const mandatory
	{ keywords in here, removes points from Drink pool, making the player more thirsty }
	float Property IncreasesThirstCostMult = 0.5 Auto Const
	{ Default: 0.5; Multiplier on things that increase thirst's caps value }
	Keyword[] Property QuenchesThirstKeywords Auto Const mandatory
	{ keywords in here, removes points from Drink pool, making the player more thirsty }
	Keyword Property ObjectTypeNukaCola Auto Const mandatory
	{ autofill }
	float Property NukaThirstCostMult = 0.05 Auto Const
	{ Cost * this = Thirst Value }
	float Property NukaFoodCostMult = 0.2 Auto Const
	{ -Cost * this = Food Value }
	Keyword Property ObjectTypeCaffeinated Auto Const mandatory
	{ autofill }
	Keyword Property ObjectTypeExtraCaffeinated Auto Const mandatory
	{ autofill }
	MagicEffect Property HC_Disease_NeedMoreFood_Effect Auto Const mandatory
	{ Autofill, if player has this effect, he requires more food -- eating restores less food }
	float Property DiseaseNeedMoreFoodMult = 0.5 Auto Const
	{ multiplyer on the value of food when player have the need more food disease effect }
	Perk Property HC_SustenanceEffectsTurnOffFood Auto Const mandatory
	int Property CannibalTicksToGoRavenous = 12 Auto Const
	{ How many sustenance ticks as a cannibal it takes to go Ravenous }
	ActorValue Property HC_CannibalEffect Auto Const mandatory
	{ Autofill; 0 = normal, 1 = has ravenous hunger (recently ate a corpse) }
	Potion Property HC_Cannibal_RavenousHunger Auto Const mandatory
	{ Autofill; potion that has the Ravenous Hunger effect - conditioned on AV HC_CannibalRavenousHunger being 1 }
	Message Property HC_Cannibal_Msg_RavenousHunger_EatFood Auto Const mandatory
	{ autofill; message to display when eating normal food while suffering from Cannibal Effect Ravenous Hunger }
	Message Property HC_Cannibal_Msg_RavenousHunger_EatCorpse Auto Const mandatory
	{ autofill; message to display when eating a corpse and gaiing the Ravenous Hunger }
	Message Property HC_Cannibal_Msg_RavenousHunger_DropToRavenousLevel Auto Const mandatory
	{ autofill; message to display when dropping to ravenous hunger level while suffering from Cannibal Effect Ravenous Hunger }
	Potion Property HC_SippableWater Auto Const mandatory
	{ autofill; Water we force you to drink when you drink from a fountain or pool to run it through the correct processes }
	Potion Property HC_SippableDirtyWater Auto Const mandatory
	{ autofill; Dirty water we force you to drink when you drink from a dirty fountain or pool to run it through the correct processes }
	Perk Property HC_FillWaterBottlePerk Auto Const mandatory
	{ autofill; this perk let's you fill empty bottles at water sources }
EndGroup

Group SustenanceTiers
	float Property GamesHoursPerTick = 1.0 Auto Const
	{ How many game hours for a standard hunger/thirst check tick }
	float Property BonusDigestionHours = 1.0 Auto Const
	{ How many hours you get after clearing a hunger or thirst tier before the next sustenance tick }
	float Property SustenanceTickWhileSleepingMult = 0.25 Auto Const
	{ This is a cut on the amount of time being passed as percieved by sustenance, to prevent massive changes while sleeping. }
	float Property TickHoursCostPerCombat = 0.25 Auto Const
	{ in terms of game hours, how much does each combat shave off the next tick time }
	int Property FoodCostPerTick = 4 Auto Const
	{ in terms of caps value, how much food per tick is required to remain normal }
	int Property iFoodPoolPeckishAmount = -24 Auto Const
	int Property iFoodPoolHungryAmount = -48 Auto Const
	int Property iFoodPoolFamishedAmount = -96 Auto Const
	int Property iFoodPoolRavenousAmount = -144 Auto Const
	int Property iFoodPoolStarvingAmount = -256 Auto Const
	int Property MinFoodValueFed = 12 Auto Const
	int Property MinFoodValuePeckish = 12 Auto Const
	int Property MinFoodValueHungry = 12 Auto Const
	int Property MinFoodValueFamished = 24 Auto Const
	int Property MinFoodValueRavenous = 24 Auto Const
	int Property MinFoodValueStarving = 56 Auto Const
	int Property MaxFoodValue = 231 Auto Const
	int Property DrinkCostPerTick = 4 Auto Const
	{ in terms of caps value, how much drink per tick is required to remain normal }
	int Property iDrinkPoolParchedAmount = -16 Auto Const
	int Property iDrinkPoolThirstyAmount = -36 Auto Const
	int Property iDrinkPoolMildlyDehydratedAmount = -72 Auto Const
	int Property iDrinkPoolDehydratedAmount = -120 Auto Const
	int Property iDrinkPoolSeverelyDehydratedAmount = -180 Auto Const
	int Property MinDrinkValueHydrated = 8 Auto Const
	int Property MinDrinkValueParched = 8 Auto Const
	int Property MinDrinkValueThirsty = 10 Auto Const
	int Property MinDrinkValueMildlyDehydrated = 18 Auto Const
	int Property MinDrinkValueDehydrated = 24 Auto Const
	int Property MinDrinkValueSeverelyDehydrated = 30 Auto Const
	int Property MaxDrinkValue = 167 Auto Const
EndGroup

Group SustenanceEffectsGlobalEnums
	GlobalVariable Property HC_HE_Fed Auto Const
	{ autofill; global whose value represents this level }
	GlobalVariable Property HC_HE_Peckish Auto Const
	{ autofill; global whose value represents this level }
	GlobalVariable Property HC_HE_Hungry Auto Const
	{ autofill; global whose value represents this level }
	GlobalVariable Property HC_HE_Famished Auto Const
	{ autofill; global whose value represents this level }
	GlobalVariable Property HC_HE_Ravenous Auto Const
	{ autofill; global whose value represents this level }
	GlobalVariable Property HC_HE_Starving Auto Const
	{ autofill; global whose value represents this level }
	GlobalVariable Property HC_TE_Hydrated Auto Const
	{ autofill; global whose value represents this level }
	GlobalVariable Property HC_TE_Parched Auto Const
	{ autofill; global whose value represents this level }
	GlobalVariable Property HC_TE_Thirsty Auto Const
	{ autofill; global whose value represents this level }
	GlobalVariable Property HC_TE_MildlyDehydrated Auto Const
	{ autofill; global whose value represents this level }
	GlobalVariable Property HC_TE_Dehydrated Auto Const
	{ autofill; global whose value represents this level }
	GlobalVariable Property HC_TE_SeverelyDehyrdated Auto Const
	{ autofill; global whose value represents this level }
	GlobalVariable Property HC_SE_WellRestedORLoversEmbrace Auto Const
	{ autofill; global whose value represents this level }
	GlobalVariable Property HC_SE_Rested Auto Const
	{ autofill; global whose value represents this level }
	GlobalVariable Property HC_SE_Tired Auto Const
	{ autofill; global whose value represents this level }
	GlobalVariable Property HC_SE_Weary Auto Const
	{ autofill; global whose value represents this level }
	GlobalVariable Property HC_SE_Fatigued Auto Const
	{ autofill; global whose value represents this level }
	GlobalVariable Property HC_SE_Exhausted Auto Const
	{ autofill; global whose value represents this level }
	GlobalVariable Property HC_SE_Incapacitated Auto Const
	{ autofill; global whose value represents this level }
EndGroup

Group Disease
	float Property DiseaseRiskRollThreshold = 0.25 Auto Const
	{ When we have this much disease chance built up, as scaled by the currect wellness rating, we need to roll for disease }
	float Property DiseaseRiskDrainPerCycle = -0.01 Auto Const
	{ Each disease update we drain this much out of the DiseaseRiskPool }
	float Property CurrentDiseasePoolValueMult = 1.75 Auto Const
	{ If NOT 0, scales the current Disease Risk Pool to multiply against the current Disease Pool Drain Rate }
	float Property DiseaseGracePeriod = 1.0 Auto Const
	{ You're not allowed to roll a disease unless you have been playing for longer than this many game days after getting diseased. }
	GlobalVariable Property HC_Rule_DiseaseEffects Auto Const mandatory
	effect[] Property DiseaseEffects Auto Const mandatory
	{ Array of the various Disease Effects. }
	Keyword[] Property DiseaseRiskFoodLowKeywords Auto Const mandatory
	{ keywords in here represent things that are disease risks for the player }
	float Property DiseaseRiskFoodLowAmount = 0.03 Auto Const
	{ how much % chance does this event add to the DiseaseRiskPool }
	Keyword[] Property DiseaseRiskFoodVeryHighKeywords Auto Const mandatory
	{ keywords in here represent things that are disease risks for the player }
	float Property DiseaseRiskFoodVeryHighAmount = 0.2 Auto Const
	{ how much % chance does this event add to the DiseaseRiskPool }
	Keyword[] Property DiseaseRiskFoodStandardKeywords Auto Const mandatory
	{ keywords in here represent things that are disease risks for the player }
	float Property DiseaseRiskFoodStandardAmount = 0.07 Auto Const
	{ how much % chance does this event add to the DiseaseRiskPool }
	Keyword[] Property DiseaseRiskFoodHighKeywords Auto Const mandatory
	{ keywords in here represent things that are disease risks for the player }
	float Property DiseaseRiskFoodHighAmount = 0.12 Auto Const
	{ how much % chance does this event add to the DiseaseRiskPool }
	Keyword[] Property DiseaseRiskChemsKeywords Auto Const mandatory
	{ keywords in here represent things that are disease risks for the player }
	float Property DiseaseRiskChemsAmount = 0.07 Auto Const
	{ how much % chance does this event add to the DiseaseRiskPool }
	FormList Property DiseaseRiskCombatantFactions Auto Const mandatory
	{ if hit by these factions, player might get a disease. It's a formlist so we can use it as a filter for the onhit event as well }
	float Property DiseaseRiskCombatantAmount = 0.05 Auto Const
	{ how much % chance does this event add to the DiseaseRiskPool }
	float Property DiseaseRiskCannibalAmount = 0.05 Auto Const
	{ how much % chance does this event add to the DiseaseRiskPool }
	float Property GameDaysPerSwimmingEvent = 0.1 Auto Const
	{ in terms of game dayspassed, how long until we allow subsequent swimming events }
	float Property DiseaseRiskSwimmingAmount = 0.03 Auto Const
	{ how much % chance does this event add to the DiseaseRiskPool }
	float Property GameDaysPerRainEvent = 0.5 Auto Const
	{ in terms of game dayspassed, how long until we allow subsequent swimming events }
	float Property DiseaseRiskRainAmount = 0.03 Auto Const
	{ how much % chance does this event add to the DiseaseRiskPool }
	Potion Property HC_Antibiotics Auto Const mandatory
	{ Antibiotics for catching it to process as food. }
	Potion Property HC_Antibiotics_SILENT_SCRIPT_ONLY Auto Const mandatory
	{ doesn't have audio effect. Used only for clearing on doctors healing and lowering diffiuclt }
	GlobalVariable Property HC_Vendor_Antiboitic_ChanceNone Auto Const mandatory
	{ autofill }
	GlobalVariable Property HC_Medkit_Antiboitic_ChanceNone Auto Const mandatory
	{ autofill }
	Keyword Property HC_CausesImmunodeficiency Auto Const mandatory
	{ autofill; Checked to see if an item causes Immunodeficiency }
	Potion Property HC_Effect_Immunodeficiency Auto Const mandatory
	{ Drink this potion when you drink something that causes Immunodeficiency. This will weaken your immunity for some time, raising the chance for disease }
	float Property ImmunodeficiencyDiseaseChanceMult = 1.2 Auto Const
	{ Immunodeficiency increases your chance for disease by this much. }
	float Property DiseaseRiskIncreaser_Food = 0.01 Auto Const
	{ Food increases your disease chance this much every time you eat. DOES NOT FORCE A ROLL! }
	float Property DiseaseRiskIncreaser_Drink = 0.0 Auto Const
	{ Drink increases your disease chance this much every time you drink. DOES NOT FORCE A ROLL! }
	float Property DiseaseRiskIncreaser_Cola = 0.02 Auto Const
	{ Cola increases your disease chance this much every time you drink. DOES NOT FORCE A ROLL! }
	float Property DiseaseRiskIncreaser_Immunodeficiency = 0.05 Auto Const
	{ Immunodeficiency increases your disease chance this much every time you get it. DOES NOT FORCE A ROLL! }
EndGroup

Group SleepEffects
	GlobalVariable Property HC_Rule_SleepEffects Auto Const mandatory
	ActorValue Property HC_SleepEffect Auto Const mandatory
	int Property MinHoursForCuringSleepEffects = 2 Auto Const
	{ Need to at least sleep this long for sleep effects to be cured }
	Keyword[] Property SleepingBagKeywords Auto Const mandatory
	{ a bed with any of these keywords will be treated as a sleeping bag, wins over Mattress and Bed keywords }
	Keyword[] Property MattressKeywords Auto Const mandatory
	{ a bed with any of these keywords will be treated as a matress, wins over Bed keywords }
	Keyword[] Property BedKeywords Auto Const mandatory
	{ a bed with any of these keywords will be treated as a bed }
	effect[] Property SleepEffects Auto Const mandatory
	{ The order in this array, is the order they devolution after time passes since sleeping.
***IMPORTANT REMINDER***
The first entry in this is a place hold for the Well Rested / Lover's Embrace effects, which are handled by pre-existing spells from base game not potions }
	int Property IndexOfSleepEffectsForWellRestedORLoversEmbrace = 0 Auto Const
	{ what index in SleepEffects represents WellRested }
	int Property HighestIndexOfSleepEffectsCuredBySleepingBag = 4 Auto Const	;set to 0
	{ starting with this index in SleepEffects, you can cure this and higher effect while sleeping here }
	int Property HighestIndexOfSleepEffectsCuredByMattress = 2 Auto Const	;set to 0
	{ starting with this index in SleepEffects, you can cure this and higher effect while sleeping here }
	int Property HighestIndexOfSleepEffectsCuredByBed = 0 Auto Const
	{ starting with this index in SleepEffects, you can cure this and higher effect while sleeping here }
	Message Property HC_SleepInterruptedMsg_Mattress Auto Const mandatory
	{ autofill, message you get when you try to sleep longer than allowed }
	Message Property HC_SleepInterruptedMsg_SleepingBag Auto Const mandatory
	{ autofill, message you get when you try to sleep longer than allowed }
	Perk Property HC_WellRestedPerk Auto Const mandatory
	Message Property WellRestedMessage Auto Const
	string Property WellRestedSWFname Auto Const
	Sound Property UIPerkWellRested Auto Const mandatory
	Perk Property HC_LoversEmbracePerk Auto Const mandatory
	Message Property LoversEmbraceMessage Auto Const
	string Property LoversEmbraceSWFname Auto Const
	Sound Property UIPerkLoversEmbrace Auto Const mandatory
	Perk[] Property HC_WellRestedReduction Auto Const	;Make sure Iron Fist 1 - 4 is in here
	Spell Property WellRested Auto Const mandatory
	{ autofill, base game spell we'll need to dispell }
	Spell Property LoversEmbracePerkSpell Auto Const mandatory
	{ autofill, base game spell we'll need to dispell }
	MagicEffect Property HC_Disease_Insomnia_Effect Auto Const mandatory
	{ autofill, comes from disease, will cause player to wake up early }
	float Property InsomniaSleepMult = 0.5 Auto Const
	{ How much to scale our sleep since we are currently suffering from Insomnia }
	MagicEffect Property HC_Disease_Sleepiness_Effect Auto Const mandatory
	{ autofill, comes from disease, will cause player to need sleep more often }
	float Property DisaseSleepinessSleepDeprivationTimerMult = 0.5 Auto Const
	{ when player has Sleepiness disease effect, the Sleep Deprivation Timer Duration should be scaled by this amount }
	Potion Property HC_Effect_Caffeinated Auto Const mandatory
	{ Drink this potion when you become Caffeinated to show the player the status. }
	Message Property HC_SE_Msg_Caffeinated Auto Const mandatory
	{ Autofilled message to display when Caffeinated }
	float Property CaffeineInducedSleepDelay = 2.333 Auto Const
	{ How much time a caffeinated beverage (Nuka Cola / Cherry ) buys us. }
	float Property ExtraCaffeineInducedSleepDelay = 7.0 Auto Const
	{ How much time a caffeinated beverage (Quantum ) buys us. }
EndGroup

Group SleepEffectsHealing
	ActorValue Property Health Auto Const mandatory
	ActorValue Property EnduranceCondition Auto Const mandatory
	ActorValue Property LeftAttackCondition Auto Const mandatory
	ActorValue Property LeftMobilityCondition Auto Const mandatory
	ActorValue Property PerceptionCondition Auto Const mandatory
	ActorValue Property RightAttackCondition Auto Const mandatory
	ActorValue Property RightMobilityCondition Auto Const mandatory
EndGroup

Group EncumbranceAndLimbCondition
	GlobalVariable Property HC_Rule_NoLimbConditionHeal Auto Const mandatory
	GlobalVariable Property HC_Rule_DamageWhenEncumbered Auto Const mandatory
	Potion Property HC_EncumbranceEffect_OverEncumbered Auto Const mandatory
	Spell Property HC_ReduceCarryWeightAbility Auto Const mandatory
EndGroup

Group CompanionHealing
	GlobalVariable Property HC_Rule_CompanionNoHeal Auto Const mandatory
	{ autofill }
	ReferenceAlias Property Companion Auto Const mandatory
	{ Companion alias on the Followers quest }
	ReferenceAlias Property DogmeatCompanion Auto Const mandatory
	{ DogmeatCompanion alias on the Followers quest }
	float Property DismissIfBleedingOutDistance = 10000.0 Auto Const
	{ this needs to be less than the unload distance
because unloading causes actors to stop bleeing out, even if you SetNoBleedoutRecovery() }
	Keyword Property playerCanStimpak Auto Const mandatory
	{ autofill }
	ActorValue Property HC_IsCompanionInNeedOfHealing Auto Const mandatory
	{ autofill; used to manage player leaving companion behind when bleeding out, because going into low clears bleedout state, we need to manage it ourselves }
EndGroup

GlobalVariable Property GlobalRespawnCellOverride Auto Const	;Set to Z_HorizonSettings_RespawnCellOverride
GlobalVariable Property GlobalRespawnCellOverrideDynamic Auto Const		;Set to Z_HorizonSettings_RespawnCellOverride_Dynamic
GlobalVariable Property GlobalSettingShowDetailedMessages Auto Const	;Set to Z_HorizonSettings_SurvivalShowDetail
GlobalVariable Property Pdef_W_SUR1_statusmessages Auto
bool Property Pdef_W_SUR1_enabled Auto

CustomEvent UpdateValues
CustomEvent UpdateCaf
CustomEvent UpdateAdrenaline

;-- Variables ---------------------------------------
int GameTimerID_Encumbrance = 2 Const
Message EffectMessageToShow
float RealTimerInterval_HackClockSyncer = 30.0 Const
bool MsgInsideInstitute = False
int iGlobalTrue = 1 Const
int DrinkPool = 0
int FoodReqs = -1
int iBedType_SleepingBag = 0 Const
float HealthCache
int GameTimerID_DisplaySleepMessage = 6 Const
float NextSwimEventAllowed
float SleepStopDay
float fEpsilon = 0.0001 Const
bool bSleepInterrupted = False
int CannibalTicks = 0
float DiseaseRiskPool
float fCapFatigue = 950.0 Const
Message EarlyWakeMessageToShow
int GameTimerID_SleepDeprivation = 1 Const
bool bProcessingAdrenalineKills = False
float NextRainEventAllowed conditional
int ExtraCaffeinatedCount = 0
int iGlobalFalse = 0 Const
bool ProcessingSleep = False
int FoodPoolLast = 0
bool bPlayerTookAntibiotics = False
float LastDiseaseCycle = 0.0
int iBedType_Mattress = 1 Const
float LastDiseasedDay
int RealTimerID_HackClockSyncer = 5 Const
float RightAttackConditionCache
float DEBUGCaffeinatedTimeRemaining
float SleepStartDay
float MinDaysPerCombat = 0.1
Actor PlayerRef
bool bFirstSleep = False
int iCaffeinated = 0
float WaitStopDay
float ImmunodeficiencyMult = 1.0
bool bHardcoreIsRunning = False
int AdrenalineKills
bool bIsVATSMenuOpen = False
bool bHandleDiseaseRiskEvent = False
float NextSleepUpdateDay
float PerceptionConditionCache
int DrinkReqs = -1
int CaffeinatedCount = 0
bool bIgnoreNonWeaponHits = False
bool bProcessingFood = False
float LastSleepUpdateDay
Potion[] PotionQueue
int GameTimerID_IgnoreNonWeaponHits = 7 Const
float LastCombatDay
bool bProcessingPotions = False
int GameTimerID_Disease = 4 Const
float fCaffeinatedTimeTracker
float NextSustenanceTickDay
float LeftAttackConditionCache
float EnduranceConditionCache
float LeftMobilityConditionCache
int lastDiseaseDieRoll = -1
int FoodPool = 0
int iBedType_Bed = 2 Const
ActiveMagicEffect HC_CaffeinatedEffect
float WaitStartDay
Form[] FoodItems
int DrinkPoolLast = 0
int MaxAdrenaline
float RightMobilityConditionCache
int GameTimerID_Sustenance = 3 Const
float fMaxFatigue = 1000.0 Const
float LowestGameTimeResetTime
int iBedType_NotApplicable = -1 Const
bool bTimersInitialized = False
float fLowestNonZeroFatigue = 20.0 Const

;-- Functions ---------------------------------------

Function HandleSustenanceTimer(bool bWasSleeping, bool bCanceledSleepPreHour)
	Self.trace(Self as ScriptObject, "  HandleSustenanceTimer()", 0)
	float GameDaysPassed = Utility.GetCurrentGameTime()
	Self.trace(Self as ScriptObject, "    HandleSustenanceTimer()                                GameDaysPassed: " + GameDaysPassed as string, 0)
	Self.trace(Self as ScriptObject, "    HandleSustenanceTimer()                         NextSustenanceTickDay: " + NextSustenanceTickDay as string, 0)
	float GameDaysPerTick = GamesHoursPerTick / 24.0
	If (bWasSleeping)
		Self.trace(Self as ScriptObject, "    HandleSustenanceTimer() Look at this sleepyhead! You just woke up! I'll take that into account!", 0)
		GameDaysPerTick *= 1 as float / SustenanceTickWhileSleepingMult
		If (bCanceledSleepPreHour)
			NextSustenanceTickDay -= 1.0 / 24.0
			Self.trace(Self as ScriptObject, "    HandleSustenanceTimer() Sleep Canceled! Updated NextSustenanceTickDay: " + NextSustenanceTickDay as string, 0)
		EndIf
	EndIf
	If (False == NextSustenanceTickDay as bool)
		NextSustenanceTickDay = GameDaysPassed + GameDaysPerTick
		Self.trace(Self as ScriptObject, "    HandleSustenanceTimer() FIRST CALL - GameDaysPassed: " + GameDaysPassed as string + ", NextSustenanceTickDay: " + NextSustenanceTickDay as string, 0)
		return 
	EndIf
	Self.trace(Self as ScriptObject, "    HandleSustenanceTimer()                             GamesHoursPerTick: " + GamesHoursPerTick as string, 0)
	Self.trace(Self as ScriptObject, "    HandleSustenanceTimer()                               GameDaysPerTick: " + GameDaysPerTick as string, 0)
	If (GameDaysPassed >= NextSustenanceTickDay)
		Self.trace(Self as ScriptObject, "      HandleSustenanceTimer() GameDaysPassed >= NextSustenanceTickDay >>> PROCESSING HUNGER >>>", 0)
		Self.trace(Self as ScriptObject, "      HandleSustenanceTimer()   (NextSustenanceTickDay - GameDaysPerTick): " + (NextSustenanceTickDay - GameDaysPerTick) as string, 0)
		Self.trace(Self as ScriptObject, "      HandleSustenanceTimer()                      GameDaysPassed - ABOVE: " + (GameDaysPassed - NextSustenanceTickDay - GameDaysPerTick) as string, 0)
		Self.trace(Self as ScriptObject, "      HandleSustenanceTimer()                    ABOVE / GameDaysPerTick): " + ((GameDaysPassed - NextSustenanceTickDay - GameDaysPerTick) / GameDaysPerTick) as string, 0)
		Self.trace(Self as ScriptObject, "      HandleSustenanceTimer()                           math.floor(ABOVE): " + Math.floor((GameDaysPassed - NextSustenanceTickDay - GameDaysPerTick) / GameDaysPerTick) as string, 0)
		int ticks = Math.floor((GameDaysPassed - NextSustenanceTickDay - GameDaysPerTick) / GameDaysPerTick)
		int ModFoodPool = 0
		If (PlayerRef.GetValue(HC_CannibalEffect) <= 0 as float)
			Self.trace(Self as ScriptObject, "    HandleSustenanceTimer() You're not a cannibal!                  TICKS: " + ticks as string, 0)
			ModFoodPool = -FoodCostPerTick * ticks
		Else
			CannibalTicks += 1 * ticks
			Self.trace(Self as ScriptObject, "    HandleSustenanceTimer() You're a cannibal! WHY!?       CANNABIL TICKS: " + CannibalTicks as string, 0)
			If (CannibalTicks >= CannibalTicksToGoRavenous)
				ModFoodPool = iFoodPoolRavenousAmount
				HC_Cannibal_Msg_RavenousHunger_DropToRavenousLevel.show(0, 0, 0, 0, 0, 0, 0, 0, 0)
				CannibalTicks = 0
			EndIf
		EndIf
		Self.ModFoodPoolAndUpdateHungerEffects(ModFoodPool as float, False)
		Self.ModDrinkPoolAndUpdateThirstEffects(-DrinkCostPerTick * ticks)
		NextSustenanceTickDay = GameDaysPassed + GameDaysPerTick
	Else
		Self.trace(Self as ScriptObject, "    HandleSustenanceTimer() GameDaysPassed < NextSustenanceTickDay. Try again later.", 0)
	EndIf
EndFunction

Event Perk.OnEntryRun(Perk akSender, int auiEntryID, ObjectReference akTarget, Actor akOwner)
	Self.trace(Self as ScriptObject, "Perk.OnEntryRun() for Cannibal perks. Will call HandleDiseaseRiskEvent()", 0)
	Self.HandleDiseaseRiskEvent(DiseaseRiskCannibalAmount)
EndEvent

Function SetGlobal(GlobalVariable GlobalToSet, bool ValueToSet)
	If (ValueToSet)
		GlobalToSet.SetValue(iGlobalTrue as float)
	Else
		GlobalToSet.SetValue(iGlobalFalse as float)
	EndIf
EndFunction

Function SendUpdateValuesEvent()
	var[] args = new var[2]
	args[0] = FoodPool as var
	args[1] = DrinkPool as var
	sendCustomEvent("UpdateValues", args)
EndFunction

float Function GetWellnessFloor()
	Self.trace(Self as ScriptObject, "        GetWellnessFloor()", 0)
	effect HungerEffect = Self.GetCurrentEffect(HC_HungerEffect, HungerEffects)
	effect ThirstEffect = Self.GetCurrentEffect(HC_ThirstEffect, ThirstEffects)
	effect SleepEffect = Self.GetCurrentEffect(HC_SleepEffect, SleepEffects)
	float HungerFloor = HungerEffect.DiseaseChanceFloor
	float ThirstFloor = ThirstEffect.DiseaseChanceFloor
	float SleepFloor = SleepEffect.DiseaseChanceFloor
	float wellnessFloor = (HungerFloor + ThirstFloor + SleepFloor) * 0.333333
	Self.trace(Self as ScriptObject, "          GetWellnessFloor() HungerFloor: " + HungerFloor as string, 0)
	Self.trace(Self as ScriptObject, "          GetWellnessFloor() ThirstFloor: " + ThirstFloor as string, 0)
	Self.trace(Self as ScriptObject, "          GetWellnessFloor()  SleepFloor: " + SleepFloor as string, 0)
	Self.trace(Self as ScriptObject, "          GetWellnessFloor()   returning: " + wellnessFloor as string, 0)
	return wellnessFloor
EndFunction

float Function RollForDisease()
	Self.trace(Self as ScriptObject, "        RollForDisease()", 0)
	float currentGameTime = Utility.GetCurrentGameTime()
	If (currentGameTime < LastDiseasedDay + DiseaseGracePeriod)
		Self.trace(Self as ScriptObject, "        Too Soon! Failing roll due to being within the Grace Period!", 0)
		return -1.0
	EndIf
	float dieRoll = Utility.Randomfloat(0.01, 1)
	Self.trace(Self as ScriptObject, "          RollForDisease() DiseaseRiskPool: " + DiseaseRiskPool as string, 0)
	Self.trace(Self as ScriptObject, "          RollForDisease()         dieRoll: " + dieRoll as string, 0)
	float diseaseChance = DiseaseRiskPool * ImmunodeficiencyMult
	If (dieRoll <= diseaseChance)
		Self.trace(Self as ScriptObject, "          RollForDisease() dieRoll: " + dieRoll as string + " <= chance: " + diseaseChance as string + ", returning: true", 0)
		return dieRoll
	Else
		Self.trace(Self as ScriptObject, "          RollForDisease() dieRoll: " + dieRoll as string + " > chance: " + diseaseChance as string + ", returning: false", 0)
		return -1.0
	EndIf
EndFunction

float Function GetWellnessDrainMult()
	Self.trace(Self as ScriptObject, "        GetWellnessDrainMult()", 0)
	effect HungerEffect = Self.GetCurrentEffect(HC_HungerEffect, HungerEffects)
	effect ThirstEffect = Self.GetCurrentEffect(HC_ThirstEffect, ThirstEffects)
	effect SleepEffect = Self.GetCurrentEffect(HC_SleepEffect, SleepEffects)
	float HungerDrainMult = HungerEffect.DiseaseChanceDrainMult
	float ThirstDrainMult = ThirstEffect.DiseaseChanceDrainMult
	float SleepDrainMult = SleepEffect.DiseaseChanceDrainMult
	float WellnessDrainMult = (HungerDrainMult + ThirstDrainMult + SleepDrainMult) * 0.333333
	Self.trace(Self as ScriptObject, "        GetWellnessDrainMult() HungerDrainMult: " + HungerDrainMult as string, 0)
	Self.trace(Self as ScriptObject, "        GetWellnessDrainMult() ThirstDrainMult: " + ThirstDrainMult as string, 0)
	Self.trace(Self as ScriptObject, "        GetWellnessDrainMult()  SleepDrainMult: " + SleepDrainMult as string, 0)
	Self.trace(Self as ScriptObject, "        GetWellnessDrainMult()       returning: " + WellnessDrainMult as string, 0)
	return WellnessDrainMult
EndFunction

Event Actor.OnKill(Actor akSender, Actor akVictim)
	If (akSender == PlayerRef)
		AdrenalineKills += 1
		Self.trace(Self as ScriptObject, "Actor.OnKill() player killed: " + akVictim as string + ". Adding Kill! Now at " + AdrenalineKills as string + " Total Kills...", 0)
		Self.CallFunctionNoWait("ProcessAdrenalineKills", new var[0])
	EndIf
EndEvent

bool Function AnnounceFatigue(bool abStateChanged, int aiModPoolAmount)
	If (abStateChanged && aiModPoolAmount < 0)
		Self.TryTutorial(ThirstTutorial, "ThirstTutorial")
		return True
	EndIf
	return False
EndFunction

Function CureRavenousHunger()
	Self.trace(Self as ScriptObject, "CureRavenouseHunger(): Setting HC_CannibalEffect actor value to 0", 0)
	PlayerRef.SetValue(HC_CannibalEffect, 0 as float)
	CannibalTicks = 0
EndFunction

Event OnMenuOpenCloseEvent(string asMenuName, bool abOpening)
	If (asMenuName == "PipboyMenu" && Self.IsGlobalTrue(HC_Rule_NoFastTravel))
		Tutorial.UnregisterForTutorialEvent("OnEnterPipBoyMapPage")
	ElseIf (asMenuName == "VATSMenu")
		If (abOpening)
			bIsVATSMenuOpen = True
		Else
			bIsVATSMenuOpen = False
			Self.CallFunctionNoWait("ProcessPotionQueue", new var[0])
		EndIf
	EndIf
EndEvent

Function CheckForDiseaseAndRestart()
	Self.trace(Self as ScriptObject, "  CheckForDiseaseAndRestart()", 0)
	Self.DrainDiseaseRiskPool()
	Self.CheckAndPossiblyApplyDisease(True, True)
	Self.StartTimerGameTime(GameTimerInterval_Disease, GameTimerID_Disease)
EndFunction

Event ReferenceAlias.OnEnterBleedout(ReferenceAlias akSender)
	If (Self.IsGlobalTrue(HC_Rule_CompanionNoHeal) == False)
		return 
	EndIf
	Self.trace(Self as ScriptObject, "ReferenceAlias.OnEnterBleedout() akSender: " + akSender as string, 0)
	Actor actorRef = akSender.GetActorReference()
	If (Self.PlayerCanHealOrRepair(actorRef))
		Self.SetIsInNeedOfHealing(actorRef, True)
		Self.RegisterForDistanceGreaterThanEvent(PlayerRef as ScriptObject, akSender as ScriptObject, DismissIfBleedingOutDistance)
		Self.TryTutorial(CompanionDownedTutorial, "CompanionDownedTutorial")
	EndIf
EndEvent

Function ShutdownHardcore()
	Self.trace(Self as ScriptObject, "ShutdownHardcore()", 0)
	Tutorial.RegisterForTutorialEvent("OnEnterPipBoyMapPage")
	FoodItems = None
	HC_HoursToRespawnCellMult.SetValue(1)
	HC_HoursToRespawnCellClearedMult.SetValue(1)
	If (GlobalRespawnCellOverride != None)
		Self.UpdateCurrentInstanceGlobal(GlobalRespawnCellOverride)
		If (GlobalRespawnCellOverride.GetValue() != 0)
			HC_HoursToRespawnCellMult.SetValue(GlobalRespawnCellOverride.GetValue())
			HC_HoursToRespawnCellClearedMult.SetValue(GlobalRespawnCellOverride.GetValue())
		Else
			HC_HoursToRespawnCellMult.SetValue(GlobalRespawnCellOverrideDynamic.GetValue())
			HC_HoursToRespawnCellClearedMult.SetValue(GlobalRespawnCellOverrideDynamic.GetValue())
		EndIf
	EndIf
	Self.UnRegisterForRemoteEvent(PlayerRef, "OnPlayerLoadGame")
	Self.UnRegisterForRemoteEvent(PlayerRef, "OnKill")
	Self.UnRegisterForPlayerSleep()
	Self.UnRegisterForPlayerWait()
	Self.UnRegisterForRemoteEvent(PlayerRef, "OnCombatStateChanged")
	Self.UnRegisterForRemoteEvent(PlayerRef, "OnItemEquipped")
	UnRegisterForHitEvent(PlayerRef, DiseaseRiskCombatantFactions)
	Self.UnRegisterForRemoteEvent(PlayerRef, "OnPlayerSwimming")
	Self.UnRegisterForRemoteEvent(Companion, "OnEnterBleedout")
	Self.UnRegisterForRemoteEvent(DogmeatCompanion, "OnEnterBleedout")
	Self.CancelTimer(RealTimerID_HackClockSyncer)
	Self.CancelTimerGameTime(GameTimerID_SleepDeprivation)
	Self.CancelTimerGameTime(GameTimerID_Sustenance)
	Self.CancelTimerGameTime(GameTimerID_Disease)
	Self.CancelTimerGameTime(GameTimerID_Encumbrance)
	Self.ClearDisease()
	HC_Vendor_Antiboitic_ChanceNone.SetValue(100 as float)
	HC_Medkit_Antiboitic_ChanceNone.SetValue(100 as float)
	FoodPool = 0
	PlayerRef.SetValue(HC_HungerEffect, HC_HE_Fed.GetValue())
	Self.ApplyEffect(HC_Rule_SustenanceEffects, HungerEffects, HC_HungerEffect, False, 0, False, True, True, False, True)
	PlayerRef.removePerk(HC_SustenanceEffectsTurnOffFood)
	Self.CureRavenousHunger()
	DrinkPool = 0
	PlayerRef.SetValue(HC_ThirstEffect, HC_TE_Hydrated.GetValue())
	Self.ApplyEffect(HC_Rule_SustenanceEffects, ThirstEffects, HC_ThirstEffect, False, 0, False, True, True, False, True)
	PlayerRef.SetValue(HC_SleepEffect, HC_SE_Rested.GetValue())
	Self.ApplyEffect(HC_Rule_SleepEffects, SleepEffects, HC_SleepEffect, False, 0, False, True, True, False, True)
	PlayerRef.removePerk(HC_AdrenalinePerk)
	PlayerRef.removePerk(HC_WellRestedPerk)
	PlayerRef.removePerk(HC_LoversEmbracePerk)
	Self.ClearFatigue()
	PlayerRef.UnEquipItem(HC_EncumbranceEffect_OverEncumbered as Form, False, True)
	Self.CompanionSetNoBleedoutRecovery(Companion.GetActorReference(), False)
	Self.CompanionSetNoBleedoutRecovery(DogmeatCompanion.GetActorReference(), False)
	bHardcoreIsRunning = False
	Self.trace(Self as ScriptObject, "  ShutdownHardcore(): Hardcore is no longer running.", 0)
EndFunction

int Function GetHunger()
	return Math.abs(FoodPool as float) as int
EndFunction

int Function CheckForHorizon()
	return 1
EndFunction

effect Function GetCurrentEffect(ActorValue EffectActorValue, effect[] EffectsArray)
	float val = PlayerRef.GetValue(EffectActorValue)
	int I = 0
	int max = EffectsArray.length
	While (I < max)
		effect currentEffect = EffectsArray[I]
		If (currentEffect.GlobalEnum.GetValue() == val)
			Self.trace(Self as ScriptObject, "            GetCurrentEffect() EffectActorValue: " + EffectActorValue as string + "; Returning " + currentEffect as string, 0)
			return currentEffect
		EndIf
		I += 1
	EndWhile
	Self.trace(Self as ScriptObject, "            GetCurrentEffect() didn't find an effect", 2)
	return None
EndFunction

int Function SetOrCapReqsToTiersSustenanceValueOnDeterioration(int aiReqs, int aiCurrentEffectTier, int aiNewEffectTier, int aiFoodPoolValueForTier)
	If (aiCurrentEffectTier != aiNewEffectTier)
		Self.trace(Self as ScriptObject, "          SetOrCapReqsToTiersSustenanceValueOnDeterioration():                    Updated Reqs: " + aiFoodPoolValueForTier as string, 0)
		return aiFoodPoolValueForTier
	ElseIf (aiReqs < aiFoodPoolValueForTier)
		Self.trace(Self as ScriptObject, "          SetOrCapReqsToTiersSustenanceValueOnDeterioration():                     Capped Reqs: " + aiFoodPoolValueForTier as string, 0)
		return aiFoodPoolValueForTier
	EndIf
	Self.trace(Self as ScriptObject, "          SetOrCapReqsToTiersSustenanceValueOnDeterioration():                  Unchanged Reqs: " + aiReqs as string, 0)
	return aiReqs
EndFunction

float Function GetWellnessCeiling()
	Self.trace(Self as ScriptObject, "        GetWellnessCeiling()", 0)
	effect HungerEffect = Self.GetCurrentEffect(HC_HungerEffect, HungerEffects)
	effect ThirstEffect = Self.GetCurrentEffect(HC_ThirstEffect, ThirstEffects)
	effect SleepEffect = Self.GetCurrentEffect(HC_SleepEffect, SleepEffects)
	float HungerCeiling = HungerEffect.DiseaseChanceCeiling
	float ThirstCeiling = ThirstEffect.DiseaseChanceCeiling
	float SleepCeiling = SleepEffect.DiseaseChanceCeiling
	float wellnessCeiling = (HungerCeiling + ThirstCeiling + SleepCeiling) * 0.333333
	Self.trace(Self as ScriptObject, "          GetWellnessCeiling() HungerCeiling: " + HungerCeiling as string, 0)
	Self.trace(Self as ScriptObject, "          GetWellnessCeiling() ThirstCeiling: " + ThirstCeiling as string, 0)
	Self.trace(Self as ScriptObject, "          GetWellnessCeiling()  SleepCeiling: " + SleepCeiling as string, 0)
	Self.trace(Self as ScriptObject, "          GetWellnessCeiling()     returning: " + wellnessCeiling as string, 0)
	return wellnessCeiling
EndFunction

Function CaffeinatedEffectToggle(ActiveMagicEffect CaffeinatedEffect)
	HC_CaffeinatedEffect = CaffeinatedEffect
EndFunction

Function ProcessAdrenalineKills()
	If (bProcessingAdrenalineKills)
		return 
	EndIf
	Self.trace(Self as ScriptObject, "  ProcessAdrenalineKills() Processing " + AdrenalineKills as string + " Adrenaline Kills...", 0)
	bProcessingAdrenalineKills = True
	int currentAdrenalineKillTotal = AdrenalineKills
	AdrenalineKills = 0
	Self.ModAdrenaline(currentAdrenalineKillTotal)
	bProcessingAdrenalineKills = False
	Self.trace(Self as ScriptObject, "  ProcessAdrenalineKills() Processing complete.", 0)
EndFunction

Function UpdateNextSustenanceTickDay(bool abStateChanged, int aiModPoolAmount)
	If (abStateChanged && aiModPoolAmount > 0)
		NextSustenanceTickDay = Utility.GetCurrentGameTime() + BonusDigestionHours / 24.0
	EndIf
EndFunction

int Function SetPoolToTiersSustenanceValueOnRecovery(int aiPool, int aiCurrentEffectTier, int aiNewEffectTier, int aiFoodPoolValueForTier)
	If (aiCurrentEffectTier != aiNewEffectTier)
		If (aiPool < aiFoodPoolValueForTier)
			Self.trace(Self as ScriptObject, "        SetPoolToTiersSustenanceValueOnRecovery():                        Updated Pool: " + aiFoodPoolValueForTier as string, 0)
			return aiFoodPoolValueForTier
		EndIf
	EndIf
	Self.trace(Self as ScriptObject, "        SetPoolToTiersSustenanceValueOnRecovery():                      Unchanged Pool: " + aiPool as string, 0)
	return aiPool
EndFunction

int Function IsShowDetailedMessagesOn()
	int returncode = 0
	If (GlobalSettingShowDetailedMessages != None)
		Self.UpdateCurrentInstanceGlobal(GlobalSettingShowDetailedMessages)
		returncode = GlobalSettingShowDetailedMessages.GetValueInt()
	EndIf
	return returncode
EndFunction

float Function GetWellnessPoolDrainMult(float wellnessFloor)
	If (DiseaseRiskPool < wellnessFloor)
		DiseaseRiskPool = wellnessFloor
	EndIf
	If (CurrentDiseasePoolValueMult != 0 as float)
		Self.trace(Self as ScriptObject, "        GetWellnessPoolDrainMult() - CurrentDiseasePoolValueMult: " + CurrentDiseasePoolValueMult as string + ", DiseaseRiskPool: " + DiseaseRiskPool as string + ", RETURNING: " + (DiseaseRiskPool * CurrentDiseasePoolValueMult) as string, 0)
		return DiseaseRiskPool * CurrentDiseasePoolValueMult
	EndIf
	Self.trace(Self as ScriptObject, "        GetWellnessPoolDrainMult() - CurrentDiseasePoolValueMult: " + CurrentDiseasePoolValueMult as string + ", DiseaseRiskPool: " + DiseaseRiskPool as string + ", RETURNING: 1.0", 0)
	return 1.0
EndFunction

Function TryEquipPotion(Potion potionToApply)
	If (bIsVATSMenuOpen)
		PotionQueue.add(potionToApply, 1)
	ElseIf (PotionQueue.length > 0)
		PotionQueue.add(potionToApply, 1)
		Self.ProcessPotionQueue()
	Else
		PlayerRef.EquipItem(potionToApply as Form, False, True)
	EndIf
EndFunction

Function AddFoodItem(Form akBaseObject)
	FoodItems.add(akBaseObject, 1)
	Self.trace(Self as ScriptObject, "Adding Food Item " + akBaseObject as string + " To Array With " + FoodItems.length as string + " Total Food Items...", 0)
	Self.CallFunctionNoWait("ProcessFoodItems", new var[0])
EndFunction

Function StartSleepDeprivationTimer(float RestartTimerForThisManyGameHours, bool ForceThisExactValue)
	Self.trace(Self as ScriptObject, "    StartSleepDeprivationTimer() RestartTimerForThisManyGameHours: " + RestartTimerForThisManyGameHours as string, 0)
	float sleepInterval = RestartTimerForThisManyGameHours
	If (False == ForceThisExactValue)
		float intervalMult = 1 as float
		If (PlayerRef.HasMagicEffect(HC_Disease_Sleepiness_Effect))
			intervalMult = DisaseSleepinessSleepDeprivationTimerMult
		EndIf
		sleepInterval = GameTimerInterval_SleepDeprivation * intervalMult
		If (RestartTimerForThisManyGameHours > 0 as float)
			sleepInterval = RestartTimerForThisManyGameHours * intervalMult
		EndIf
		Self.StartTimerGameTime(sleepInterval, GameTimerID_SleepDeprivation)
		Self.trace(Self as ScriptObject, "      StartSleepDeprivationTimer()  starting timer with an interval of: " + sleepInterval as string, 0)
	Else
		Self.StartTimerGameTime(sleepInterval, GameTimerID_SleepDeprivation)
	EndIf
	NextSleepUpdateDay = Utility.GetCurrentGameTime() + sleepInterval / 24.0
EndFunction

Function ProcessPotionQueue()
	If (!bProcessingPotions)
		bProcessingPotions = True
		While (PotionQueue.length > 0 && !bIsVATSMenuOpen)
			PlayerRef.EquipItem(PotionQueue[0] as Form, False, True)
			PotionQueue.remove(0, 1)
		EndWhile
		bProcessingPotions = False
	EndIf
EndFunction

Event OnInit()
	Self.trace(Self as ScriptObject, "OnInit()", 0)
	PlayerRef = Game.GetPlayer()
	Self.RegisterForRemoteEvent(PlayerRef, "OnDifficultyChanged")
	If (Game.GetDifficulty() == 6)
		Self.trace(Self as ScriptObject, "OnInit() - Difficulty is set to Survival. Starting up...", 0)
		Self.StartupHardcore()
	Else
		Self.trace(Self as ScriptObject, "OnInit() - Difficulty is not set to Survival. Sleeping for now...", 0)
	EndIf
EndEvent

Function ImmunodeficiencyEffectToggle(bool IsPlayerImmunodeficient)
	If (IsPlayerImmunodeficient)
		ImmunodeficiencyMult = ImmunodeficiencyDiseaseChanceMult
		Self.HandleSleepDeprivationTimer()
		Self.trace(Self as ScriptObject, "ImmunodeficiencyEffectToggle(): Scaling Disease Chance By: " + ImmunodeficiencyDiseaseChanceMult as string, 0)
		Self.TryTutorial(ImmunodeficiencyTutorial, "ImmunodeficiencyTutorial")
	Else
		ImmunodeficiencyMult = 1
		Self.trace(Self as ScriptObject, "ImmunodeficiencyEffectToggle(): Player is back to normal!", 0)
	EndIf
EndFunction

Function ClearFatigue()
	PlayerRef.RestoreValue(Fatigue, fMaxFatigue)
EndFunction

Function IsDefWSur1Loaded()
	If (Game.IsPluginInstalled("DEF_WIDGETS_SURVIVAL1.esp"))
		If (Game.IsPluginInstalled("DEF_WIDGETS_CORE.esm"))
			Pdef_W_SUR1_statusmessages = Game.GetFormFromFile(9839, "DEF_WIDGETS_CORE.esm") as GlobalVariable
			Pdef_W_SUR1_enabled = True
		Else
			Pdef_W_SUR1_enabled = False
		EndIf
	Else
		Pdef_W_SUR1_enabled = False
	EndIf
EndFunction

Function HandleEncumbranceTimer()
	Self.trace(Self as ScriptObject, "  HandleEncumbranceTimer()", 0)
	Self.TryEquipPotion(HC_EncumbranceEffect_OverEncumbered)
	Self.StartTimerGameTime(GameTimerInterval_Encumbrance, GameTimerID_Encumbrance)
EndFunction

bool Function IsBed(ObjectReference RefToCheck)
	return commonarrayfunctions.CheckObjectAgainstKeywordArray(RefToCheck, BedKeywords, False)
EndFunction

Event Actor.OnDifficultyChanged(Actor aSender, int aOldDifficulty, int aNewDifficulty)
	Self.trace(Self as ScriptObject, "OnDifficultyChanged() aOldDifficulty, aNewDifficulty: " + aOldDifficulty as string + ", " + aNewDifficulty as string, 0)
	If (aOldDifficulty != 6 && aNewDifficulty == 6)
		Self.trace(Self as ScriptObject, "  Player wants hardcore mode...", 0)
		Self.StartupHardcore()
	ElseIf (aOldDifficulty == 6 && aNewDifficulty != 6)
		Self.trace(Self as ScriptObject, "  Player no longer wants hardcore mode...", 0)
		Self.ShutdownHardcore()
	EndIf
EndEvent

Function CompanionSetNoBleedoutRecovery(Actor CompanionActor, bool ShouldSetNoBleedoutRecovery)
	Self.trace(Self as ScriptObject, "CompanionSetNoBleedoutRecovery CompanionActor: " + CompanionActor as string + ", ShouldSetNoBleedoutRecovery: " + ShouldSetNoBleedoutRecovery as string, 0)
	If (ShouldSetNoBleedoutRecovery && Self.IsGlobalTrue(HC_Rule_CompanionNoHeal))
		If (Self.PlayerCanHealOrRepair(CompanionActor))
			Self.trace(Self as ScriptObject, "  CompanionSetNoBleedoutRecovery calling setNoBleedoutRecovery(true)", 0)
			CompanionActor.SetNoBleedoutRecovery(True)
		Else
			Self.trace(Self as ScriptObject, "  PlayerCanHealOrRepair == false. CompanionSetNoBleedoutRecovery IS NOT calling setNoBleedoutRecovery(true)", 0)
		EndIf
	Else
		Self.trace(Self as ScriptObject, "  CompanionSetNoBleedoutRecovery calling setNoBleedoutRecovery(false)", 0)
		CompanionActor.SetNoBleedoutRecovery(False)
	EndIf
EndFunction

Event Actor.OnPlayerSwimming(Actor akSender)
	float GameDaysPassed = Utility.GetCurrentGameTime()
	If (NextSwimEventAllowed <= GameDaysPassed)
		Self.trace(Self as ScriptObject, "Actor.OnPlayerSwimming() and NextSwimEventAllowed <= GameDaysPassed. Will call HandleDiseaseRiskEvent()", 0)
		Self.HandleDiseaseRiskEvent(DiseaseRiskSwimmingAmount)
		NextSwimEventAllowed = GameDaysPassed + GameDaysPerSwimmingEvent
	EndIf
EndEvent

Function ShowInstituteFastTravelTutorial(string asEvent, float afDuration, float afInterval, int aiMaxTimes, string asContext, int aiPriority)
	HC_TutorialFastTravelInstitute.ShowAsHelpMessage(asEvent, afDuration, afInterval, aiMaxTimes, asContext, aiPriority)
EndFunction

Function ClearDisease()
	DiseaseRiskPool = 0 as float
	Self.TryEquipPotion(HC_Antibiotics_SILENT_SCRIPT_ONLY)
EndFunction

Function SendCafUpdateEvent(float afCaf, int aiCount, int aiExCount)
	var[] args = new var[3]
	args[0] = (afCaf / 24 as float) as var
	args[1] = aiCount as var
	args[2] = aiExCount as var
	sendCustomEvent("UpdateCaf", args)
EndFunction

Event OnDistanceGreaterThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance)
	Self.trace(Self as ScriptObject, "OnDistanceGreaterThan() will check for bleedingout and dismiss companion", 0)
	Actor ActorLeftBehind = akObj2 as Actor
	If (ActorLeftBehind.isBleedingOut() || Self.IsInNeedOfHealing(ActorLeftBehind))
		Self.trace(Self as ScriptObject, "  OnDistanceGreaterThan() bleedingout or IsInNeedOfHealing, will dismiss companion", 0)
		If (ActorLeftBehind.GetRace() == Game.GetCommonProperties().DogmeatRace)
			Followers.DismissDogmeatCompanion(False, False)
		Else
			Followers.DismissCompanion(ActorLeftBehind, False, False)
		EndIf
		Self.SetIsInNeedOfHealing(ActorLeftBehind, False)
		ActorLeftBehind.EvaluatePackage(False)
		ActorLeftBehind.MoveToPackageLocation()
	EndIf
EndEvent

bool Function PlayerCanHeal(Actor ActorToHeal)
	Self.trace(Self as ScriptObject, "PlayerCanHeal() ActorToHeal: " + ActorToHeal as string, 0)
	Self.trace(Self as ScriptObject, "PlayerCanHeal() playerCanStimpak: " + playerCanStimpak as string, 0)
	If (ActorToHeal.HasKeyword(playerCanStimpak))
		Self.trace(Self as ScriptObject, "PlayerCanHeal() TRUE -- ActorToHeal: " + ActorToHeal as string, 0)
		return True
	EndIf
	Self.trace(Self as ScriptObject, "PlayerCanHeal() FALSE -- ActorToHeal: " + ActorToHeal as string, 0)
	return False
EndFunction

Function SetHardcoreMode(bool HardcoreModeOn)
	Self.RegisterForRemoteEvent(Game.GetPlayer(), "OnDifficultyChanged")
	int I = 0
	While (I < HC_Rules.GetSize())
		Self.SetGlobal(HC_Rules.GetAt(I) as GlobalVariable, HardcoreModeOn)
		I += 1
	EndWhile
	If (HardcoreModeOn)
		Self.trace(Self as ScriptObject, "  Player wants hardcore mode...", 0)
		Self.StartupHardcore()
	ElseIf (!HardcoreModeOn)
		Self.trace(Self as ScriptObject, "  Player no longer wants hardcore mode...", 0)
		Self.ShutdownHardcore()
	EndIf
EndFunction

Event Actor.OnItemEquipped(Actor akSender, Form akBaseObject, ObjectReference akReference)
	If (akBaseObject == HC_Antibiotics || (akReference == None || False == akReference.IsQuestItem()) && False == commonarrayfunctions.CheckFormAgainstKeywordArray(akBaseObject, NonFoodKeywords))
		AddFoodItem(akBaseObject)
	EndIf
EndEvent

bool Function PlayerCanRepair(Actor ActorToHeal)
	Keyword DLC01PlayerCanRepairKit = Game.GetFormFromFile(16797459, "DLCRobot.esm") as Keyword
	If (DLC01PlayerCanRepairKit as bool && ActorToHeal.HasKeyword(DLC01PlayerCanRepairKit))
		Self.trace(Self as ScriptObject, "PlayerCanRepair() TRUE -- ActorToHeal: " + ActorToHeal as string, 0)
		return True
	EndIf
	Self.trace(Self as ScriptObject, "PlayerCanRepair() FALSE -- ActorToHeal: " + ActorToHeal as string, 0)
	return False
EndFunction

bool Function IsInNeedOfHealing(Actor ActorToCheck)
	return ActorToCheck.GetValue(HC_IsCompanionInNeedOfHealing) == 1 as float
EndFunction

bool Function PlayerCanHealOrRepair(Actor ActorToHeal)
	return Self.PlayerCanHeal(ActorToHeal) || Self.PlayerCanRepair(ActorToHeal)
EndFunction

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
	If (Self.IsGlobalTrue(HC_Rule_NoFastTravel))
		int I = 0
		While (I < FastTravelAllowedWhileInInstituteMapMarkers.length)
			ObjectReference currentRef = FastTravelAllowedWhileInInstituteMapMarkers[I]
			If (PlayerRef.IsInLocation(InstituteLocation))
				Self.trace(Self as ScriptObject, "Actor.OnLocationChange ADDING ref to HC_FastTravelAllowedList: " + currentRef as string, 0)
				HC_FastTravelAllowedList.addform(currentRef as Form)
				If (False == MsgInsideInstitute)
					MsgInsideInstitute = True
					If (Game.IsFastTravelEnabled())
						Utility.wait(3 as float)
						HC_FastTravelInstitute_Out.show(0, 0, 0, 0, 0, 0, 0, 0, 0)
					EndIf
				EndIf
			Else
				Self.trace(Self as ScriptObject, "Actor.OnLocationChange REMOVING ref from HC_FastTravelAllowedList: " + currentRef as string, 0)
				HC_FastTravelAllowedList.RemoveAddedForm(currentRef as Form)
				If (MsgInsideInstitute)
					MsgInsideInstitute = False
					If (Game.IsFastTravelEnabled())
						Utility.wait(3 as float)
						HC_FastTravelInstitute_To.show(0, 0, 0, 0, 0, 0, 0, 0, 0)
					EndIf
				EndIf
			EndIf
			I += 1
		EndWhile
	EndIf
EndEvent

Function SetIsInNeedOfHealing(Actor ActorToSet, bool IsInNeedOfHealing)
	If (IsInNeedOfHealing)
		ActorToSet.SetValue(HC_IsCompanionInNeedOfHealing, 1 as float)
	Else
		ActorToSet.SetValue(HC_IsCompanionInNeedOfHealing, 0 as float)
	EndIf
EndFunction

bool Function IsThirstQuenching(Form akBaseObject)
	bool returnVal = False
	If (akBaseObject)
		int I = 0
		While (returnVal == False && I < QuenchesThirstKeywords.length)
			returnVal = akBaseObject.HasKeyword(QuenchesThirstKeywords[I])
			I += 1
		EndWhile
	EndIf
	return returnVal
EndFunction

Event FollowersScript.CompanionChange(followersscript akSender, var[] akArgs)
	Actor ActorThatChanged = akArgs[0] as Actor
	bool IsNowCompanion = akArgs[1] as bool
	Self.trace(Self as ScriptObject, "FollowersScript.CompanionChange() ActorThatChanged: " + ActorThatChanged as string + ", IsNowCompanion: " + IsNowCompanion as string, 0)
	Self.CompanionSetNoBleedoutRecovery(ActorThatChanged, IsNowCompanion)
	Self.AddReduceCarryWeightAbility(ActorThatChanged)
	If (False == IsNowCompanion)
		Self.SetIsInNeedOfHealing(ActorThatChanged, False)
	EndIf
EndEvent

Function AddReduceCarryWeightAbility(Actor ActorToAddSpellTo)
	If (ActorToAddSpellTo as bool && False == ActorToAddSpellTo.HasSpell(HC_ReduceCarryWeightAbility as Form))
		ActorToAddSpellTo.addSpell(HC_ReduceCarryWeightAbility, False)
	EndIf
EndFunction

Event OnPlayerWaitStart(float afWaitStartTime, float afDesiredWaitEndTime)
	WaitStartDay = afWaitStartTime
	Self.trace(Self as ScriptObject, "OnPlayerWaitStart()           WaitStartDay: " + WaitStartDay as string, 0)
EndEvent

Function CacheValuesBeforeSleep()
	HealthCache = PlayerRef.GetValue(Health)
	EnduranceConditionCache = PlayerRef.GetValue(EnduranceCondition)
	LeftAttackConditionCache = PlayerRef.GetValue(LeftAttackCondition)
	LeftMobilityConditionCache = PlayerRef.GetValue(LeftMobilityCondition)
	PerceptionConditionCache = PlayerRef.GetValue(PerceptionCondition)
	RightAttackConditionCache = PlayerRef.GetValue(RightAttackCondition)
	RightMobilityConditionCache = PlayerRef.GetValue(RightMobilityCondition)
EndFunction

Function RemoveReduceCarryWeightAbility(Actor ActorToRemoveSpellFrom)
	If (ActorToRemoveSpellFrom as bool && True == ActorToRemoveSpellFrom.HasSpell(HC_ReduceCarryWeightAbility as Form))
		ActorToRemoveSpellFrom.removeSpell(HC_ReduceCarryWeightAbility)
	EndIf
EndFunction

Function PlayerEatsCorpse()
	Self.trace(Self as ScriptObject, "PlayerEatsCorpse()", 0)
	If (Self.IsGlobalTrue(HC_Rule_SustenanceEffects) == False)
		return 
	EndIf
	Self.ModFoodPoolAndUpdateHungerEffects(9999 as float, True)
	Self.TryEquipPotion(HC_Cannibal_RavenousHunger)
	PlayerRef.SetValue(HC_CannibalEffect, 1 as float)
	CannibalTicks -= 1
	If (CannibalTicks < 0)
		CannibalTicks = 0
	EndIf
	Self.StartTimerGameTime(GameTimerInterval_Sustenance, GameTimerID_Sustenance)
	HC_Cannibal_Msg_RavenousHunger_EatCorpse.show(0, 0, 0, 0, 0, 0, 0, 0, 0)
	Self.HandleDiseaseRiskEvent(DiseaseRiskCannibalAmount)
EndFunction

Event OnTimerGameTime(int aiTimerID)
	float currentGameTime = Utility.GetCurrentGameTime()
	If (aiTimerID == GameTimerID_SleepDeprivation)
		Self.trace(Self as ScriptObject, "OnTimerGameTime() aiTimerID: = GameTimerID_SleepDeprivation @ " + currentGameTime as string, 0)
		If (Self.IsGlobalTrue(HC_Rule_SleepEffects) && ProcessingSleep == False)
			Self.HandleSleepDeprivationTimer()
		EndIf
		If (iCaffeinated > 0)
			Self.StartSleepDeprivationTimer(fCaffeinatedTimeTracker, False)
		Else
			Self.StartSleepDeprivationTimer(-1, False)
		EndIf
		HC_CaffeinatedEffect.Dispel()
		HC_CaffeinatedEffect = None
		iCaffeinated = 0
		CaffeinatedCount = 0
		ExtraCaffeinatedCount = 0
	ElseIf (aiTimerID == GameTimerID_Encumbrance)
		Self.trace(Self as ScriptObject, "OnTimerGameTime() aiTimerID: = GameTimerID_Encumbrance @ " + currentGameTime as string, 0)
		If (Self.IsGlobalTrue(HC_Rule_DamageWhenEncumbered) && ProcessingSleep == False)
			Self.HandleEncumbranceTimer()
		EndIf
		Self.StartTimerGameTime(GameTimerInterval_Encumbrance, GameTimerID_Encumbrance)
	ElseIf (aiTimerID == GameTimerID_Sustenance)
		Self.trace(Self as ScriptObject, "OnTimerGameTime() aiTimerID: = GameTimerID_Sustenance @ " + currentGameTime as string, 0)
		If (Self.IsGlobalTrue(HC_Rule_SustenanceEffects) && ProcessingSleep == False)
			Self.HandleSustenanceTimer(False, False)
		EndIf
		Self.StartTimerGameTime(GameTimerInterval_Sustenance, GameTimerID_Sustenance)
	ElseIf (aiTimerID == GameTimerID_Disease)
		Self.trace(Self as ScriptObject, "OnTimerGameTime() aiTimerID: = GameTimerID_Disease @ " + currentGameTime as string, 0)
		If (Self.IsGlobalTrue(HC_Rule_DiseaseEffects) && ProcessingSleep == False)
			Self.HandleDiseaseTimer()
		EndIf
		Self.StartTimerGameTime(GameTimerInterval_Disease, GameTimerID_Disease)
	ElseIf (aiTimerID == GameTimerID_DisplaySleepMessage)
		Self.trace(Self as ScriptObject, "OnTimerGameTime() aiTimerID: = GameTimerID_DisplaySleepMessage @ " + currentGameTime as string, 0)
		If (EarlyWakeMessageToShow)
			EarlyWakeMessageToShow.show(0, 0, 0, 0, 0, 0, 0, 0, 0)
			EarlyWakeMessageToShow = None
		EndIf
	ElseIf (aiTimerID == GameTimerID_IgnoreNonWeaponHits)
		Self.trace(Self as ScriptObject, "OnTimerGameTime() aiTimerID: = GameTimerID_IgnoreNonWeaponHits @ " + currentGameTime as string, 0)
		bIgnoreNonWeaponHits = False
	Else
		Self.trace(Self as ScriptObject, "OnTimerGameTime() NO MATCH! - aiTimerID: " + aiTimerID as string, 0)
	EndIf
EndEvent

Function ModFoodPoolAndUpdateHungerEffects(float ModPoolAmount, bool IsEatingCorpse = false)
	Self.trace(Self as ScriptObject, "      ModFoodPoolAndUpdateHungerEffects()                                ModPoolAmount: " + ModPoolAmount as string, 0)
	int currentHE = PlayerRef.GetValue(HC_HungerEffect) as int
	If (ModPoolAmount >= 0 as float)
		If (False == IsEatingCorpse && PlayerRef.GetValue(HC_CannibalEffect) > 0 as float)
			ModPoolAmount = 0 as float
			HC_Cannibal_Msg_RavenousHunger_EatFood.show(0, 0, 0, 0, 0, 0, 0, 0, 0)
			Self.trace(Self as ScriptObject, "        ModFoodPoolAndUpdateHungerEffects(): Player is suffering Cannibal's Hunger! Food is worthless!", 0)
		ElseIf (ModPoolAmount > MaxFoodValue as float && False == IsEatingCorpse)
			ModPoolAmount = MaxFoodValue as float
			Self.trace(Self as ScriptObject, "        ModFoodPoolAndUpdateHungerEffects():                     Capped @ MaxFoodValue: " + ModPoolAmount as string, 0)
		ElseIf (HC_HE_Fed.GetValue() == currentHE as float)
			ModPoolAmount = Self.CapFoodAndDrinkPoolMinValue(ModPoolAmount, MinFoodValueFed)
			Self.trace(Self as ScriptObject, "        ModFoodPoolAndUpdateHungerEffects():      Player is Fed! Updated ModPoolAmount: " + ModPoolAmount as string, 0)
		ElseIf (HC_HE_Peckish.GetValue() == currentHE as float)
			ModPoolAmount = Self.CapFoodAndDrinkPoolMinValue(ModPoolAmount, MinFoodValuePeckish)
			Self.trace(Self as ScriptObject, "        ModFoodPoolAndUpdateHungerEffects():  Player is Peckish! Updated ModPoolAmount: " + ModPoolAmount as string, 0)
		ElseIf (HC_HE_Hungry.GetValue() == currentHE as float)
			ModPoolAmount = Self.CapFoodAndDrinkPoolMinValue(ModPoolAmount, MinFoodValueHungry)
			Self.trace(Self as ScriptObject, "        ModFoodPoolAndUpdateHungerEffects():   Player is Hungry! Updated ModPoolAmount: " + ModPoolAmount as string, 0)
		ElseIf (HC_HE_Famished.GetValue() == currentHE as float)
			ModPoolAmount = Self.CapFoodAndDrinkPoolMinValue(ModPoolAmount, MinFoodValueFamished)
			Self.trace(Self as ScriptObject, "        ModFoodPoolAndUpdateHungerEffects(): Player is Famished! Updated ModPoolAmount: " + ModPoolAmount as string, 0)
		ElseIf (HC_HE_Ravenous.GetValue() == currentHE as float)
			ModPoolAmount = Self.CapFoodAndDrinkPoolMinValue(ModPoolAmount, MinFoodValueRavenous)
			Self.trace(Self as ScriptObject, "        ModFoodPoolAndUpdateHungerEffects(): Player is Ravenous! Updated ModPoolAmount: " + ModPoolAmount as string, 0)
		ElseIf (HC_HE_Starving.GetValue() == currentHE as float)
			ModPoolAmount = Self.CapFoodAndDrinkPoolMinValue(ModPoolAmount, MinFoodValueStarving)
			Self.trace(Self as ScriptObject, "        ModFoodPoolAndUpdateHungerEffects(): Player is Starving! Updated ModPoolAmount: " + ModPoolAmount as string, 0)
		EndIf
		If (PlayerRef.HasMagicEffect(HC_Disease_NeedMoreFood_Effect))
			ModPoolAmount *= DiseaseNeedMoreFoodMult
			Self.trace(Self as ScriptObject, "        ModFoodPoolAndUpdateHungerEffects(): Player has Disease Effect requiring more food, scaling ModPoolAmount to: " + ModPoolAmount as string, 0)
		EndIf
	EndIf
	FoodPoolLast = FoodPool
	Self.trace(Self as ScriptObject, "        ModFoodPoolAndUpdateHungerEffects()                               Old FoodPool: " + FoodPool as string, 0)
	Self.trace(Self as ScriptObject, "        ModFoodPoolAndUpdateHungerEffects()                               Old FoodReqs: " + FoodReqs as string, 0)
	Self.trace(Self as ScriptObject, "        ModFoodPoolAndUpdateHungerEffects()                            + ModPoolAmount: " + ModPoolAmount as string, 0)
	FoodPool += ModPoolAmount as int
	FoodReqs += ModPoolAmount as int
	Self.trace(Self as ScriptObject, "        ModFoodPoolAndUpdateHungerEffects()                               New FoodPool: " + FoodPool as string, 0)
	Self.trace(Self as ScriptObject, "        ModFoodPoolAndUpdateHungerEffects()                               New FoodReqs: " + FoodReqs as string, 0)
	If (ModPoolAmount < 0 as float)
		If (FoodPool <= iFoodPoolStarvingAmount && currentHE as float <= HC_HE_Starving.GetValue())
			Self.trace(Self as ScriptObject, "        ModFoodPoolAndUpdateHungerEffects(): Player is Starving", 0)
			PlayerRef.SetValue(HC_HungerEffect, HC_HE_Starving.GetValue())
			FoodReqs = Self.SetOrCapReqsToTiersSustenanceValueOnDeterioration(FoodReqs, currentHE, HC_HE_Starving.GetValue() as int, iFoodPoolStarvingAmount)
			FoodPool = iFoodPoolStarvingAmount
		ElseIf (FoodPool <= iFoodPoolRavenousAmount && currentHE as float <= HC_HE_Ravenous.GetValue())
			Self.trace(Self as ScriptObject, "        ModFoodPoolAndUpdateHungerEffects(): Player is Ravenous", 0)
			PlayerRef.SetValue(HC_HungerEffect, HC_HE_Ravenous.GetValue())
			FoodReqs = Self.SetOrCapReqsToTiersSustenanceValueOnDeterioration(FoodReqs, currentHE, HC_HE_Ravenous.GetValue() as int, iFoodPoolRavenousAmount)
		ElseIf (FoodPool <= iFoodPoolFamishedAmount && currentHE as float <= HC_HE_Famished.GetValue())
			Self.trace(Self as ScriptObject, "        ModFoodPoolAndUpdateHungerEffects(): Player is Famished", 0)
			PlayerRef.SetValue(HC_HungerEffect, HC_HE_Famished.GetValue())
			FoodReqs = Self.SetOrCapReqsToTiersSustenanceValueOnDeterioration(FoodReqs, currentHE, HC_HE_Famished.GetValue() as int, iFoodPoolFamishedAmount)
		ElseIf (FoodPool <= iFoodPoolHungryAmount && currentHE as float <= HC_HE_Hungry.GetValue())
			Self.trace(Self as ScriptObject, "        ModFoodPoolAndUpdateHungerEffects(): Player is Hungry", 0)
			PlayerRef.SetValue(HC_HungerEffect, HC_HE_Hungry.GetValue())
			FoodReqs = Self.SetOrCapReqsToTiersSustenanceValueOnDeterioration(FoodReqs, currentHE, HC_HE_Hungry.GetValue() as int, iFoodPoolHungryAmount)
		ElseIf (FoodPool <= iFoodPoolPeckishAmount && currentHE as float <= HC_HE_Peckish.GetValue())
			Self.trace(Self as ScriptObject, "        ModFoodPoolAndUpdateHungerEffects(): Player is Peckish", 0)
			PlayerRef.SetValue(HC_HungerEffect, HC_HE_Peckish.GetValue())
			FoodReqs = Self.SetOrCapReqsToTiersSustenanceValueOnDeterioration(FoodReqs, currentHE, HC_HE_Peckish.GetValue() as int, iFoodPoolPeckishAmount)
		ElseIf (currentHE as float <= HC_HE_Fed.GetValue())
			Self.trace(Self as ScriptObject, "        ModFoodPoolAndUpdateHungerEffects(): Player is Fed", 0)
			PlayerRef.SetValue(HC_HungerEffect, HC_HE_Fed.GetValue())
			If (FoodReqs < 0)
				FoodReqs = 0
			EndIf
			If (FoodPool > 0)
				FoodPool = 0
			EndIf
		Else
			Self.trace(Self as ScriptObject, "        ModFoodPoolAndUpdateHungerEffects(): GETTING WORSE - NO MATCH!", 0)
			Self.trace(Self as ScriptObject, "        ModFoodPoolAndUpdateHungerEffects(): Player is: " + PlayerRef.GetValue(HC_HungerEffect) as string, 0)
			Self.trace(Self as ScriptObject, "        ModFoodPoolAndUpdateHungerEffects():  Foodpool: " + FoodPool as string, 0)
			Self.trace(Self as ScriptObject, "        ModFoodPoolAndUpdateHungerEffects():  FoodReqs: " + FoodReqs as string, 0)
		EndIf
	ElseIf (ModPoolAmount > 0 as float)
		If (FoodReqs >= 0 && currentHE as float >= HC_HE_Fed.GetValue())
			Self.trace(Self as ScriptObject, "        ModFoodPoolAndUpdateHungerEffects(): Player is Fed", 0)
			PlayerRef.SetValue(HC_HungerEffect, HC_HE_Fed.GetValue())
			FoodPool = Self.SetPoolToTiersSustenanceValueOnRecovery(FoodPool, currentHE, HC_HE_Fed.GetValue() as int, 0)
			FoodReqs = 0
			If (FoodPool > 0)
				FoodPool = 0
			EndIf
		ElseIf (FoodReqs >= iFoodPoolPeckishAmount && currentHE as float >= HC_HE_Peckish.GetValue())
			Self.trace(Self as ScriptObject, "        ModFoodPoolAndUpdateHungerEffects(): Player is Peckish", 0)
			PlayerRef.SetValue(HC_HungerEffect, HC_HE_Peckish.GetValue())
			FoodPool = Self.SetPoolToTiersSustenanceValueOnRecovery(FoodPool, currentHE, HC_HE_Peckish.GetValue() as int, iFoodPoolPeckishAmount)
		ElseIf (FoodReqs >= iFoodPoolHungryAmount && currentHE as float >= HC_HE_Hungry.GetValue())
			Self.trace(Self as ScriptObject, "        ModFoodPoolAndUpdateHungerEffects(): Player is Hungry", 0)
			PlayerRef.SetValue(HC_HungerEffect, HC_HE_Hungry.GetValue())
			FoodPool = Self.SetPoolToTiersSustenanceValueOnRecovery(FoodPool, currentHE, HC_HE_Hungry.GetValue() as int, iFoodPoolHungryAmount)
		ElseIf (FoodReqs >= iFoodPoolFamishedAmount && currentHE as float >= HC_HE_Famished.GetValue())
			Self.trace(Self as ScriptObject, "        ModFoodPoolAndUpdateHungerEffects(): Player is Famished", 0)
			PlayerRef.SetValue(HC_HungerEffect, HC_HE_Famished.GetValue())
			FoodPool = Self.SetPoolToTiersSustenanceValueOnRecovery(FoodPool, currentHE, HC_HE_Famished.GetValue() as int, iFoodPoolFamishedAmount)
		ElseIf (FoodReqs >= iFoodPoolRavenousAmount && currentHE as float >= HC_HE_Ravenous.GetValue())
			Self.trace(Self as ScriptObject, "        ModFoodPoolAndUpdateHungerEffects(): Player is Ravenous", 0)
			PlayerRef.SetValue(HC_HungerEffect, HC_HE_Ravenous.GetValue())
			FoodPool = Self.SetPoolToTiersSustenanceValueOnRecovery(FoodPool, currentHE, HC_HE_Ravenous.GetValue() as int, iFoodPoolRavenousAmount)
		ElseIf (currentHE as float >= HC_HE_Starving.GetValue())
			Self.trace(Self as ScriptObject, "        ModFoodPoolAndUpdateHungerEffects(): Player is Starving", 0)
			PlayerRef.SetValue(HC_HungerEffect, HC_HE_Starving.GetValue())
			If (FoodPool < iFoodPoolStarvingAmount)
				FoodPool = iFoodPoolStarvingAmount
			EndIf
			If (FoodReqs < iFoodPoolStarvingAmount)
				FoodReqs = iFoodPoolStarvingAmount
			EndIf
		Else
			Self.trace(Self as ScriptObject, "        ModFoodPoolAndUpdateHungerEffects(): GETTING BETTER - NO MATCH!", 0)
			Self.trace(Self as ScriptObject, "        ModFoodPoolAndUpdateHungerEffects(): Player is " + PlayerRef.GetValue(HC_HungerEffect) as string, 0)
			Self.trace(Self as ScriptObject, "        ModFoodPoolAndUpdateHungerEffects(): Foodpool: " + FoodPool as string, 0)
			Self.trace(Self as ScriptObject, "        ModFoodPoolAndUpdateHungerEffects(): FoodReqs: " + FoodReqs as string, 0)
		EndIf
	EndIf
	bool bstateChanged = currentHE != PlayerRef.GetValue(HC_HungerEffect) as int
	bool showSustenanceMessage = Self.ShowSustenance(bstateChanged)
	bool AnnounceFatigue = Self.AnnounceFatigue(bstateChanged, ModPoolAmount as int)
	Self.UpdateNextSustenanceTickDay(bstateChanged, ModPoolAmount as int)
	Self.trace(Self as ScriptObject, "        ModFoodPoolAndUpdateHungerEffects()                             Final FoodPool: " + FoodPool as string, 0)
	Self.trace(Self as ScriptObject, "        ModFoodPoolAndUpdateHungerEffects()                             Final FoodReqs: " + FoodReqs as string, 0)
	Self.ApplyEffect(HC_Rule_SustenanceEffects, HungerEffects, HC_HungerEffect, False, 0, !AnnounceFatigue, showSustenanceMessage, True, AnnounceFatigue, False)
EndFunction

float Function GetHoursUntilCurrentSleepCycleEnds(bool abReturnGameDaysInstead)
	float hoursUntilCurrentSleepCycleEnds = NextSleepUpdateDay - Utility.GetCurrentGameTime()
	If (!abReturnGameDaysInstead)
		hoursUntilCurrentSleepCycleEnds *= 24 as float
	EndIf
	If (hoursUntilCurrentSleepCycleEnds < 0 as float)
		return 0 as float
	EndIf
	return hoursUntilCurrentSleepCycleEnds
EndFunction

bool Function IsProcessingSleep()
	return ProcessingSleep
EndFunction

Function DamageValueBackToCachedValue(ActorValue ActorValueToDamage, float CachedValue)
	float currentVal = PlayerRef.GetValue(ActorValueToDamage)
	float difference = currentVal - CachedValue
	If (difference <= 0 as float)
		Self.trace(Self as ScriptObject, "    DamageValueBackToCachedValue() [NO DIFFERENCE - BAILING OUT]: ActorValueToDamage: " + ActorValueToDamage as string + " - Difference: " + difference as string + ". currentVal:" + currentVal as string + " vs CachedValue: " + CachedValue as string, 0)
		return 
	EndIf
	Self.trace(Self as ScriptObject, "    DamageValueBackToCachedValue() [DIFFERENCE >0 - DAMAGING AV]: ActorValueToDamage: " + ActorValueToDamage as string + " - Difference: " + difference as string + ". currentVal:" + currentVal as string + " vs CachedValue: " + CachedValue as string, 0)
	PlayerRef.DamageValue(ActorValueToDamage, difference)
EndFunction

Function DamageValuesBackToCachedValues()
	Self.DamageValueBackToCachedValue(Health, HealthCache)
	Self.DamageValueBackToCachedValue(EnduranceCondition, EnduranceConditionCache)
	Self.DamageValueBackToCachedValue(LeftAttackCondition, LeftAttackConditionCache)
	Self.DamageValueBackToCachedValue(LeftMobilityCondition, LeftMobilityConditionCache)
	Self.DamageValueBackToCachedValue(PerceptionCondition, PerceptionConditionCache)
	Self.DamageValueBackToCachedValue(RightAttackCondition, RightAttackConditionCache)
	Self.DamageValueBackToCachedValue(RightMobilityCondition, RightMobilityConditionCache)
EndFunction

Event OnTimer(int aiTimerID)
	float currentGameTime = Utility.GetCurrentGameTime()
	If (aiTimerID == RealTimerID_HackClockSyncer)
		If (!bTimersInitialized)
			Self.InitializeHardcoreTimers(currentGameTime)
			Self.trace(Self as ScriptObject, "HackClockSyncer: Setup @ " + currentGameTime as string + " - CLOCKS ARE SET!", 0)
			bTimersInitialized = True
		ElseIf (bHardcoreIsRunning && currentGameTime < LowestGameTimeResetTime)
			Self.InitializeHardcoreTimers(currentGameTime)
			Self.trace(Self as ScriptObject, "  HackClockSyncer: Resyncing Survival Clocks To The Game Clock! LowestGameTimeResetTime: " + currentGameTime as string, 0)
		EndIf
		If (bHardcoreIsRunning && currentGameTime <= LowestGameTimeResetTime + 0.05)
			Self.StartTimer(RealTimerInterval_HackClockSyncer, RealTimerID_HackClockSyncer)
			Self.trace(Self as ScriptObject, "  HackClockSyncer: Restarting Clock Sync Timer @ " + currentGameTime as string, 0)
		ElseIf (bHardcoreIsRunning)
			Self.TryTutorial(SleepToSaveTutorial, "SleepToSaveTutorial")
		EndIf
	EndIf
EndEvent

Function ModAdrenaline(int amountToMod)
	int currentAdrenaline = PlayerRef.GetValue(HC_Adrenaline) as int
	int updatedAdrenaline = currentAdrenaline + amountToMod
	Self.trace(Self as ScriptObject, "    ModAdrenaline() currentAdrenaline: " + currentAdrenaline as string + " + amountToMod: " + amountToMod as string + " = updatedAdrenaline: " + updatedAdrenaline as string, 0)
	If (updatedAdrenaline < 0)
		Self.trace(Self as ScriptObject, "      ModAdrenaline() clamping updatedAdrenaline to 0", 0)
		updatedAdrenaline = 0
	ElseIf (updatedAdrenaline > MaxAdrenaline)
		Self.trace(Self as ScriptObject, "      ModAdrenaline() clamping updatedAdrenaline to maxAdrenaline: " + MaxAdrenaline as string, 0)
		updatedAdrenaline = MaxAdrenaline
	EndIf
	PlayerRef.SetValue(HC_Adrenaline, updatedAdrenaline as float)
	int perkLevelHasBeen = currentAdrenaline / KillsForAdrenalinePerkLevel
	int perkLevelShouldBe = updatedAdrenaline / KillsForAdrenalinePerkLevel
	If (perkLevelShouldBe == perkLevelHasBeen)
		Self.trace(Self as ScriptObject, "      ModAdrenaline() Adrenaline Rank remains the same at: " + perkLevelShouldBe as string, 0)
		return 
	Else
		Self.TryEquipPotion(HC_AdrenalineEffect)
		int I = 0
		If (perkLevelShouldBe > perkLevelHasBeen)
			If (perkLevelShouldBe > MaxAdrenalinePerkLevel)
				perkLevelShouldBe = MaxAdrenalinePerkLevel
			EndIf
			I = perkLevelShouldBe - perkLevelHasBeen
			Self.trace(Self as ScriptObject, "      ModAdrenaline() Adrenaline Rank increases from " + perkLevelHasBeen as string + " to " + perkLevelShouldBe as string, 0)
			Self.TryTutorial(AdrenalineTutorial, "AdrenalineTutorial")
		ElseIf (perkLevelShouldBe < perkLevelHasBeen)
			PlayerRef.removePerk(HC_AdrenalinePerk)
			I = perkLevelShouldBe
			Self.trace(Self as ScriptObject, "      ModAdrenaline() Adrenaline Rank decreases from " + perkLevelHasBeen as string + " to " + perkLevelShouldBe as string, 0)
		EndIf
		While (I > 0)
			PlayerRef.addPerk(HC_AdrenalinePerk, False)
			I -= 1
		EndWhile
	EndIf
	If (Pdef_W_SUR1_enabled)
		Self.SendAdrenalineUpdateEvent()
	EndIf
EndFunction

Function UpdateHealingAfterSleep(int GameHoursSpentSleeping)
	float healthTrueMax = PlayerRef.GetValue(Health)
	float enduranceTrueMax = PlayerRef.GetValue(EnduranceCondition)
	float leftAttackTrueMax = PlayerRef.GetValue(LeftAttackCondition)
	float leftMobilityTrueMax = PlayerRef.GetValue(LeftMobilityCondition)
	float perceptionTrueMax = PlayerRef.GetValue(PerceptionCondition)
	float rightAttackTrueMax = PlayerRef.GetValue(RightAttackCondition)
	float rightMobilityTrueMax = PlayerRef.GetValue(RightMobilityCondition)
	Self.DamageValuesBackToCachedValues()
EndFunction

Function FillWaterBottle(ObjectReference TargetRef)
	((Self as Quest) as hardcore:hc_waterbottlescript).FillWaterBottle(TargetRef)
EndFunction

Function InitializeHardcoreTimers(float currentGameTime)
	Self.CancelTimerGameTime(GameTimerID_SleepDeprivation)
	Self.CancelTimerGameTime(GameTimerID_Sustenance)
	Self.CancelTimerGameTime(GameTimerID_Disease)
	Self.CancelTimerGameTime(GameTimerID_Encumbrance)
	Self.StartSleepDeprivationTimer(2, True)
	bFirstSleep = True
	Self.StartTimerGameTime(GameTimerInterval_Sustenance, GameTimerID_Sustenance)
	Self.StartTimerGameTime(GameTimerInterval_Disease, GameTimerID_Disease)
	Self.StartTimerGameTime(0.033, GameTimerID_Encumbrance)
	NextSustenanceTickDay = 0 as float
	LastSleepUpdateDay = currentGameTime
	LastDiseasedDay = currentGameTime
	LowestGameTimeResetTime = currentGameTime
EndFunction

bool Function IsMattress(ObjectReference RefToCheck)
	return commonarrayfunctions.CheckObjectAgainstKeywordArray(RefToCheck, MattressKeywords, False)
EndFunction

bool Function IsSleepingBag(ObjectReference RefToCheck)
	return commonarrayfunctions.CheckObjectAgainstKeywordArray(RefToCheck, SleepingBagKeywords, False)
EndFunction

Function SleepinessEffectToggle(bool IsPlayerSleepy)
	Self.trace(Self as ScriptObject, "SleepinessEffectToggle(): " + IsPlayerSleepy as string, 0)
	Self.StartSleepDeprivationTimer(Self.GetHoursUntilCurrentSleepCycleEnds(False), False)
EndFunction

Function UpdateSleepEffectsAfterSleeping(int GameHoursSpentSleeping, ObjectReference BedSleptIn, float TimeUntilNextSleepUpdate)
	Self.trace(Self as ScriptObject, "  UpdateSleepEffectsAfterSleeping() GameHoursSpentSleeping: " + GameHoursSpentSleeping as string + ", TimeUntilNextSleepUpdate: " + TimeUntilNextSleepUpdate as string, 0)
	int CurrentSleepEffect = PlayerRef.GetValue(HC_SleepEffect) as int
	If (iCaffeinated)
		If (iCaffeinated == 1)
			CurrentSleepEffect += 1
		EndIf
		HC_CaffeinatedEffect.Dispel()
		HC_CaffeinatedEffect = None
		iCaffeinated = 0
		CaffeinatedCount = 0
		ExtraCaffeinatedCount = 0
	EndIf
	int NewSleepEffect = 999
	bool SleepingInBed = Self.IsBed(BedSleptIn)
	If (GameHoursSpentSleeping >= MinHoursForCuringSleepEffects)
		NewSleepEffect = CurrentSleepEffect - GameHoursSpentSleeping + 1
		Self.trace(Self as ScriptObject, "  UpdateSleepEffectsAfterSleeping() GameHoursSpentSleeping: " + GameHoursSpentSleeping as string + ", CurrentSleepEffect: " + CurrentSleepEffect as string + ", NewSleepEffect: " + NewSleepEffect as string, 0)
		If (Self.IsSleepingBag(BedSleptIn))
			If (NewSleepEffect < HighestIndexOfSleepEffectsCuredBySleepingBag)
				NewSleepEffect = HighestIndexOfSleepEffectsCuredBySleepingBag
				Self.trace(Self as ScriptObject, "  UpdateSleepEffectsAfterSleeping() Sleeping Bag - HighestIndexOfSleepEffectsCuredBySleepingBag: " + HighestIndexOfSleepEffectsCuredBySleepingBag as string + ", Updated NewSleepEffect: " + NewSleepEffect as string, 0)
			EndIf
		ElseIf (Self.IsMattress(BedSleptIn))
			If (NewSleepEffect < HighestIndexOfSleepEffectsCuredByMattress)
				NewSleepEffect = HighestIndexOfSleepEffectsCuredByMattress
				Self.trace(Self as ScriptObject, "  UpdateSleepEffectsAfterSleeping() Mattress - HighestIndexOfSleepEffectsCuredByMattress: " + HighestIndexOfSleepEffectsCuredByMattress as string + ", Updated NewSleepEffect: " + NewSleepEffect as string, 0)
			EndIf
		ElseIf (SleepingInBed)
			If (NewSleepEffect < HighestIndexOfSleepEffectsCuredByBed)
				NewSleepEffect = HighestIndexOfSleepEffectsCuredByBed
				Self.trace(Self as ScriptObject, "  UpdateSleepEffectsAfterSleeping() Bed - HighestIndexOfSleepEffectsCuredByBed: " + HighestIndexOfSleepEffectsCuredByBed as string + ", Updated NewSleepEffect: " + NewSleepEffect as string, 0)
			EndIf
		ElseIf (NewSleepEffect < HighestIndexOfSleepEffectsCuredByMattress)
			NewSleepEffect = HighestIndexOfSleepEffectsCuredByMattress
			Self.trace(Self as ScriptObject, "  UpdateSleepEffectsAfterSleeping() Other - HighestIndexOfSleepEffectsCuredByMattress: " + HighestIndexOfSleepEffectsCuredByMattress as string + ", Updated NewSleepEffect: " + NewSleepEffect as string, 0)
		EndIf
		Self.trace(Self as ScriptObject, "  UpdateSleepEffectsAfterSleeping() Final NewSleepEffect: " + NewSleepEffect as string, 0)
	EndIf
	If (CurrentSleepEffect == IndexOfSleepEffectsForWellRestedORLoversEmbrace)
		CurrentSleepEffect += 1
		PlayerRef.removePerk(HC_WellRestedPerk)
		PlayerRef.removePerk(HC_LoversEmbracePerk)
	EndIf
	int sleepNeeded = 7
	If (PlayerRef.HasPerk(HC_WellRestedReduction[0]))
		sleepNeeded -= 1
	EndIf
	If (PlayerRef.HasPerk(HC_WellRestedReduction[1]))
		sleepNeeded -= 1
	EndIf
	If (PlayerRef.HasPerk(HC_WellRestedReduction[2]))
		sleepNeeded -= 1
	EndIf
	If (GameHoursSpentSleeping >= sleepNeeded && SleepingInBed)
		Self.trace(Self as ScriptObject, "    UpdateSleepEffectsAfterSleeping() GameHoursSpentSleeping >= 8 && SleepingInBed, will give well rested or lovers embrace.", 0)
		NewSleepEffect = IndexOfSleepEffectsForWellRestedORLoversEmbrace
		If (Followers.GetNearbyInfatuatedRomanticCompanion())
			PlayerRef.addPerk(HC_LoversEmbracePerk, False)
			LoversEmbraceMessage.show(0, 0, 0, 0, 0, 0, 0, 0, 0)
			Game.ShowPerkVaultBoyOnHUD(LoversEmbraceSWFname, UIPerkLoversEmbrace)
		Else
			PlayerRef.addPerk(HC_WellRestedPerk, False)
			WellRestedMessage.show(0, 0, 0, 0, 0, 0, 0, 0, 0)
			Game.ShowPerkVaultBoyOnHUD(WellRestedSWFname, UIPerkWellRested)
		EndIf
	EndIf
	If (NewSleepEffect < CurrentSleepEffect)
		Self.trace(Self as ScriptObject, "    UpdateSleepEffectsAfterSleeping() setting HC_SleepEffect to: " + NewSleepEffect as string, 0)
		PlayerRef.SetValue(HC_SleepEffect, NewSleepEffect as float)
		CurrentSleepEffect = NewSleepEffect
	Else
		Self.trace(Self as ScriptObject, "    UpdateSleepEffectsAfterSleeping() setting HC_SleepEffect to: " + CurrentSleepEffect as string, 0)
		PlayerRef.SetValue(HC_SleepEffect, CurrentSleepEffect as float)
	EndIf
	If (GameHoursSpentSleeping < MinHoursForCuringSleepEffects)
		If (TimeUntilNextSleepUpdate < 1 as float)
			Self.ApplyEffect(HC_Rule_SleepEffects, SleepEffects, HC_SleepEffect, True, 1, False, True, True, False, False)
			TimeUntilNextSleepUpdate = GameTimerInterval_SleepDeprivation + TimeUntilNextSleepUpdate
		Else
			bool displaySleepMessages = False
			If (CurrentSleepEffect > 1)
				displaySleepMessages = True
			EndIf
			Self.ApplyEffect(HC_Rule_SleepEffects, SleepEffects, HC_SleepEffect, True, 0, False, displaySleepMessages, True, False, False)
		EndIf
		Self.StartSleepDeprivationTimer(TimeUntilNextSleepUpdate, False)
	Else
		Self.ApplyEffect(HC_Rule_SleepEffects, SleepEffects, HC_SleepEffect, True, 0, True, True, True, False, False)
		LastSleepUpdateDay = Utility.GetCurrentGameTime()
		Self.StartSleepDeprivationTimer(-1, False)
	EndIf
EndFunction

Function HandleSleepDeprivationTimer()
	Self.trace(Self as ScriptObject, "  HandleSleepDeprivationTimer() LastSleepUpdateDay: " + LastSleepUpdateDay as string, 0)
	bFirstSleep = False
	float currentGameTime = Utility.GetCurrentGameTime()
	PlayerRef.removePerk(HC_WellRestedPerk)
	PlayerRef.removePerk(HC_LoversEmbracePerk)
	int IncrementEffectBy = 1
	If (PlayerRef.HasMagicEffect(HC_Disease_Sleepiness_Effect))
		IncrementEffectBy = ((currentGameTime - LastSleepUpdateDay) * 24 as float / GameTimerInterval_SleepDeprivation * DisaseSleepinessSleepDeprivationTimerMult) as int
		If (IncrementEffectBy < 1)
			IncrementEffectBy = 1
		EndIf
	ElseIf (iCaffeinated == 2)
		IncrementEffectBy = 0
	EndIf
	Self.ApplyEffect(HC_Rule_SleepEffects, SleepEffects, HC_SleepEffect, True, IncrementEffectBy, False, True, True, True, False)
	If (IncrementEffectBy)
		Self.TryTutorial(TirednessTutorial, "TirednessTutorial")
	EndIf
	LastSleepUpdateDay = currentGameTime
	Self.trace(Self as ScriptObject, "  HandleSleepDeprivationTimer() and setting LastSleepUpdateDay: " + LastSleepUpdateDay as string, 0)
EndFunction

Function DamageFatigue(bool bAnnounceFatigue)
	Self.trace(Self as ScriptObject, "    DamageFatigue() bAnnounceFatigue: " + bAnnounceFatigue as string, 0)
	float HungerFatigueMult = HungerEffects[PlayerRef.GetValue(HC_HungerEffect) as int].FatigueMult
	float ThirstFatigueMult = ThirstEffects[PlayerRef.GetValue(HC_ThirstEffect) as int].FatigueMult
	float SleepFatigueMult = SleepEffects[PlayerRef.GetValue(HC_SleepEffect) as int].FatigueMult
	Self.trace(Self as ScriptObject, "      DamageFatigue()     HungerFatigueMult (2x): " + HungerFatigueMult as string, 0)
	Self.trace(Self as ScriptObject, "      DamageFatigue()     ThirstFatigueMult (2x): " + ThirstFatigueMult as string, 0)
	Self.trace(Self as ScriptObject, "      DamageFatigue()      SleepFatigueMult (3x): " + SleepFatigueMult as string, 0)
	float AverageFatigueMult = (HungerFatigueMult * 2 + ThirstFatigueMult * 2 + SleepFatigueMult * 3) / 7
	Self.trace(Self as ScriptObject, "      DamageFatigue()         AverageFatigueMult: " + AverageFatigueMult as string, 0)
	float currentFatigue = AverageFatigueMult * fMaxFatigue
	If (currentFatigue > fCapFatigue)
		currentFatigue = fCapFatigue
	ElseIf (currentFatigue > 0 as float && currentFatigue < fLowestNonZeroFatigue)
		currentFatigue = fLowestNonZeroFatigue
	ElseIf (currentFatigue < 0 as float)
		currentFatigue = 0 as float
	EndIf
	float previousFatigue = PlayerRef.GetValue(Fatigue)
	If (previousFatigue != currentFatigue)
		Self.ClearFatigue()
		PlayerRef.DamageValue(Fatigue, currentFatigue)
		Self.trace(Self as ScriptObject, "      DamageFatigue()     Updated currentFatigue: " + currentFatigue as string, 0)
		If (bAnnounceFatigue && currentFatigue > previousFatigue)
			Game.ShowFatigueWarningOnHUD()
			Self.trace(Self as ScriptObject, "      DamageFatigue() - Announcing Fatigue!", 0)
		EndIf
	EndIf
EndFunction

Function WakeUpPlayerBasedOnBedType(ObjectReference BedRef, float SleepStartTime, float DesiredTime)
	Self.trace(Self as ScriptObject, "WakeUpPlayerBasedOnBedType() - SleepStartTime: " + SleepStartTime as string + ", DesiredTime: " + DesiredTime as string, 0)
	float oneOverTwentyFour = 1.0 / 24.0
	float WakeDay = DesiredTime
	float MaxWakeDay = 0
	If (Self.IsBed(BedRef))
		MaxWakeDay = SleepStartTime + 24.0 * oneOverTwentyFour
	ElseIf (Self.IsSleepingBag(BedRef))
		MaxWakeDay = SleepStartTime + 9.0 * oneOverTwentyFour
		EarlyWakeMessageToShow = HC_SleepInterruptedMsg_SleepingBag
	Else
		MaxWakeDay = SleepStartTime + 9.0 * oneOverTwentyFour
		EarlyWakeMessageToShow = HC_SleepInterruptedMsg_Mattress
	EndIf
	Self.trace(Self as ScriptObject, "  WakeUpPlayerBasedOnBedType()                       MaxWakeDay: " + MaxWakeDay as string, 0)
	If (MaxWakeDay >= WakeDay)
		Self.trace(Self as ScriptObject, "  WakeUpPlayerBasedOnBedType() Letting them rest... MaxWakeDay: " + MaxWakeDay as string + " >= WakeDay: " + WakeDay as string, 0)
		return 
	Else
		Self.trace(Self as ScriptObject, "  WakeUpPlayerBasedOnBedType() Setting WakeDay: " + WakeDay as string + " to MaxWakeDay: " + MaxWakeDay as string, 0)
		WakeDay = MaxWakeDay
	EndIf
	float currentGameTime = 0
	While (currentGameTime < WakeDay && !bSleepInterrupted)
		Utility.WaitMenuMode(0.5)
		currentGameTime = Utility.GetCurrentGameTime()
		Self.trace(Self as ScriptObject, "  WakeUpPlayerBasedOnBedType() WakeDay: " + WakeDay as string + ", currentGameTime: " + currentGameTime as string, 0)
	EndWhile
	If (bSleepInterrupted)
		Self.trace(Self as ScriptObject, "  WakeUpPlayerBasedOnBedType() CANCELED! bSleepInterrupted: " + bSleepInterrupted as string, 0)
		return 
	EndIf
	PlayerRef.Moveto(PlayerRef as ObjectReference, 0, 0, 0, True)
	Self.TryTutorial(NonBedSleepTutorial, "NonBedSleepTutorial")
	Self.StartTimerGameTime(GameTimerInterval_DisplaySleepMessage, GameTimerID_DisplaySleepMessage)
EndFunction

Event OnPlayerSleepStop(bool abInterrupted, ObjectReference akBed)
	Self.trace(Self as ScriptObject, "OnPlayerSleepStop()", 0)
	SleepStopDay = Utility.GetCurrentGameTime()
	float oneHour = 1.0 / 24.0
	float DaysSpentSleeping = SleepStopDay - SleepStartDay
	bool bCanceledPreHour = False
	If (DaysSpentSleeping < oneHour)
		Self.trace(Self as ScriptObject, "  OnPlayerSleepStop()           < 1 hour DaysSpentSleeping: " + DaysSpentSleeping as string, 0)
		DaysSpentSleeping = oneHour
		Self.trace(Self as ScriptObject, "  OnPlayerSleepStop()            Updated DaysSpentSleeping: " + DaysSpentSleeping as string, 0)
		bCanceledPreHour = True
	EndIf
	int GameHoursSpentSleeping = (DaysSpentSleeping * 24 as float + fEpsilon) as int
	If (abInterrupted)
		bSleepInterrupted = abInterrupted
		Self.trace(Self as ScriptObject, "  OnPlayerSleepStop() SLEEP INTERRUPTED!", 0)
		If (Self.IsSleepingBag(akBed))
			If (GameHoursSpentSleeping < 9)
				Self.CancelTimerGameTime(GameTimerID_DisplaySleepMessage)
				EarlyWakeMessageToShow = None
				Self.trace(Self as ScriptObject, "  OnPlayerSleepStop() Canceled < 3 hour in Sleeping Bag!", 0)
			EndIf
		ElseIf (!Self.IsBed(akBed))
			If (GameHoursSpentSleeping < 9)
				Self.CancelTimerGameTime(GameTimerID_DisplaySleepMessage)
				EarlyWakeMessageToShow = None
				Self.trace(Self as ScriptObject, "  OnPlayerSleepStop() Canceled < 5 hour in Dirty Mattress!", 0)
			EndIf
		EndIf
	EndIf
	Self.trace(Self as ScriptObject, "  OnPlayerSleepStop()                         SleepStopDay: " + SleepStopDay as string, 0)
	Self.trace(Self as ScriptObject, "  OnPlayerSleepStop()                    DaysSpentSleeping: " + DaysSpentSleeping as string, 0)
	Self.trace(Self as ScriptObject, "  OnPlayerSleepStop()               GameHoursSpentSleeping: " + GameHoursSpentSleeping as string, 0)
	int AdrenalineRanksToRemove = 0
	If (GameHoursSpentSleeping == 1)
		AdrenalineRanksToRemove = 2
	ElseIf (GameHoursSpentSleeping == 2)
		AdrenalineRanksToRemove = 3
	ElseIf (GameHoursSpentSleeping == 3)
		AdrenalineRanksToRemove = 4
	ElseIf (GameHoursSpentSleeping == 4)
		AdrenalineRanksToRemove = 5
	ElseIf (GameHoursSpentSleeping == 5)
		AdrenalineRanksToRemove = 6
	ElseIf (GameHoursSpentSleeping == 6)
		AdrenalineRanksToRemove = 8
	Else
		AdrenalineRanksToRemove = 10
	EndIf
	int AdrelanineToRemove = AdrenalineRanksToRemove * KillsForAdrenalinePerkLevel
	Self.trace(Self as ScriptObject, "  OnPlayerSleepStop()                   AdrelanineToRemove: " + AdrelanineToRemove as string, 0)
	Self.ModAdrenaline(-AdrelanineToRemove)
	If (PlayerRef.HasMagicEffect(HC_Disease_Insomnia_Effect))
		GameHoursSpentSleeping = (GameHoursSpentSleeping as float * InsomniaSleepMult) as int
		If (GameHoursSpentSleeping < 1)
			GameHoursSpentSleeping = 1
		ElseIf (GameHoursSpentSleeping > 6)
			GameHoursSpentSleeping = 6
		EndIf
		Self.trace(Self as ScriptObject, "  OnPlayerSleepStop() - INSOMNIA! - GameHoursSpentSleeping: " + GameHoursSpentSleeping as string, 0)
	EndIf
	Self.UpdateHealingAfterSleep(GameHoursSpentSleeping)
	Self.HandleEncumbranceTimer()
	Self.StartTimerGameTime(GameTimerInterval_Encumbrance, GameTimerID_Encumbrance)
	Self.HandleSustenanceTimer(True, bCanceledPreHour)
	Self.StartTimerGameTime(GameTimerInterval_Sustenance, GameTimerID_Sustenance)
	Self.StartTimerGameTime(GameTimerInterval_Disease, GameTimerID_Disease)
	float ftimeUntilNextSleepUpdate = Self.GetHoursUntilCurrentSleepCycleEnds(False)
	If (bFirstSleep)
		ftimeUntilNextSleepUpdate = GameTimerInterval_SleepDeprivation
		bFirstSleep = False
	EndIf
	Self.UpdateSleepEffectsAfterSleeping(GameHoursSpentSleeping, akBed, ftimeUntilNextSleepUpdate)
	ProcessingSleep = False
EndEvent

bool Function IsHungerIncreasing(Form akBaseObject)
	bool returnVal = False
	If (akBaseObject)
		int I = 0
		While (returnVal == False && I < IncreasesHungerKeywords.length)
			returnVal = akBaseObject.HasKeyword(IncreasesHungerKeywords[I])
			I += 1
		EndWhile
	EndIf
	return returnVal
EndFunction

Event OnPlayerSleepStart(float afSleepStartTime, float afDesiredSleepEndTime, ObjectReference akBed)
	ProcessingSleep = True
	bSleepInterrupted = False
	Self.trace(Self as ScriptObject, "OnPlayerSleepStart() ProcessingSleep: " + ProcessingSleep as string + ", bSleepInterrupted: " + bSleepInterrupted as string, 0)
	SleepStartDay = afSleepStartTime
	Self.trace(Self as ScriptObject, "  OnPlayerSleepStart()         SleepStartDay: " + SleepStartDay as string, 0)
	Self.CheckForDiseaseAndRestart()
	Self.CancelTimerGameTime(GameTimerID_SleepDeprivation)
	Self.CancelTimerGameTime(GameTimerID_Sustenance)
	Self.CancelTimerGameTime(GameTimerID_Disease)
	Self.CancelTimerGameTime(GameTimerID_Encumbrance)
	Self.CacheValuesBeforeSleep()
	Self.WakeUpPlayerBasedOnBedType(akBed, afSleepStartTime, afDesiredSleepEndTime)
EndEvent

Event OnPlayerWaitStop(bool abInterrupted)
	WaitStopDay = Utility.GetCurrentGameTime()
	Self.trace(Self as ScriptObject, "OnPlayerWaitStop()             WaitStopDay: " + WaitStopDay as string, 0)
	float GameHoursSpentWaiting = (WaitStopDay - WaitStartDay) * 24.0
	Self.trace(Self as ScriptObject, "  OnPlayerWaitStop() GameHoursSpentWaiting: " + GameHoursSpentWaiting as string, 0)
EndEvent

Function RestoreValueBasedOnHours(ActorValue ActorValueToRestore, int GameHoursSpentSleeping, float TrueMaxValue)
	float valueToRestore = TrueMaxValue
	int percentToRestore = 0
	If (GameHoursSpentSleeping <= 1)
		valueToRestore *= 0
		percentToRestore = 0
	ElseIf (GameHoursSpentSleeping == 2)
		valueToRestore *= 0.15
		percentToRestore = 15
	ElseIf (GameHoursSpentSleeping == 3)
		valueToRestore *= 0.25
		percentToRestore = 25
	ElseIf (GameHoursSpentSleeping == 4)
		valueToRestore *= 0.45
		percentToRestore = 45
	ElseIf (GameHoursSpentSleeping == 5)
		valueToRestore *= 0.75
		percentToRestore = 75
	Else
		valueToRestore *= 1
		percentToRestore = 100
	EndIf
	Self.trace(Self as ScriptObject, "    RestoreValueBasedOnHours() For " + GameHoursSpentSleeping as string + " hours slept, restore " + percentToRestore as string + "% of TrueMaxValue: " + TrueMaxValue as string + " (valueToRestore: " + valueToRestore as string + ") to ActorValueToRestore: " + ActorValueToRestore as string, 0)
	PlayerRef.RestoreValue(ActorValueToRestore, valueToRestore)
EndFunction

Event Actor.OnCombatStateChanged(Actor akSender, Actor akTarget, int aeCombatState)
	Self.trace(Self as ScriptObject, "OnCombatStateChanged()", 0)
	float GameDaysPassed = Utility.GetCurrentGameTime()
	If (aeCombatState == 1 && GameDaysPassed < LastCombatDay + MinDaysPerCombat)
		Self.trace(Self as ScriptObject, "  OnCombatStateChanged() shaving time off NextSustenanceTickDay. Was: " + NextSustenanceTickDay as string, 0)
		NextSustenanceTickDay -= TickHoursCostPerCombat / 24 as float
		Self.trace(Self as ScriptObject, "  OnCombatStateChanged() shaving time off NextSustenanceTickDay. Now: " + NextSustenanceTickDay as string, 0)
		LastCombatDay = GameDaysPassed
	EndIf
EndEvent

Function DrinkSippableWater(bool bDirtyWater)
	If (bDirtyWater)
		Self.TryEquipPotion(HC_SippableDirtyWater)
	Else
		Self.TryEquipPotion(HC_SippableWater)
	EndIf
EndFunction

Function ProcessFoodItems()
	Self.trace(Self as ScriptObject, "Processing " + FoodItems.length as string + " Food Items...", 0)
	If (bProcessingFood)
		return 
	EndIf
	bProcessingFood = True
	While (FoodItems.length > 0)
		Self.ProcessSingleFoodItem(FoodItems[0])
		FoodItems.remove(0)
		Self.trace(Self as ScriptObject, "  Food Item Processed! " + FoodItems.length as string + " remaining...", 0)
		Utility.WaitMenuMode(0.1)
	EndWhile
	bProcessingFood = False
EndFunction

Function DrainDiseaseRiskPool()
	float currentGameTime = Utility.GetCurrentGameTime() * 24.0
	float cyclesPassed = (currentGameTime - LastDiseaseCycle) / GameTimerInterval_Disease
	Self.trace(Self as ScriptObject, "    DrainDiseaseRiskPool()           currentGameTime: " + currentGameTime as string, 0)
	Self.trace(Self as ScriptObject, "      DrainDiseaseRiskPool()        LastDiseaseCycle: " + LastDiseaseCycle as string, 0)
	Self.trace(Self as ScriptObject, "      DrainDiseaseRiskPool()            cyclesPassed: " + cyclesPassed as string, 0)
	float wellnessCeiling = Self.GetWellnessCeiling()
	float wellnessFloor = Self.GetWellnessFloor()
	float diseaseToDrain = 0
	If (DiseaseRiskPool > wellnessCeiling)
		diseaseToDrain = DiseaseRiskDrainPerCycle * cyclesPassed * Self.GetWellnessDrainMult() * Self.GetWellnessPoolDrainMult(wellnessFloor)
		Self.trace(Self as ScriptObject, "      DrainDiseaseRiskPool()     OLD DiseaseRiskPool: " + DiseaseRiskPool as string, 0)
		Self.trace(Self as ScriptObject, "      DrainDiseaseRiskPool()          diseaseToDrain: " + diseaseToDrain as string, 0)
		DiseaseRiskPool += diseaseToDrain
		Self.trace(Self as ScriptObject, "      DrainDiseaseRiskPool() UPDATED DiseaseRiskPool: " + DiseaseRiskPool as string, 0)
		If (DiseaseRiskPool < wellnessCeiling)
			DiseaseRiskPool = wellnessCeiling
			Self.trace(Self as ScriptObject, "      DrainDiseaseRiskPool() CAPPING DiseaseRiskPool: " + DiseaseRiskPool as string, 0)
		EndIf
	ElseIf (DiseaseRiskPool < wellnessFloor)
		DiseaseRiskPool = wellnessFloor
		Self.trace(Self as ScriptObject, "      DrainDiseaseRiskPool()     OLD DiseaseRiskPool: " + DiseaseRiskPool as string, 0)
		Self.trace(Self as ScriptObject, "      DrainDiseaseRiskPool()          diseaseToDrain: " + diseaseToDrain as string, 0)
		Self.trace(Self as ScriptObject, "      DrainDiseaseRiskPool() FLOORED DiseaseRiskPool: " + DiseaseRiskPool as string, 0)
	Else
		Self.trace(Self as ScriptObject, "      DrainDiseaseRiskPool()  HELD DiseaseRiskPool @: " + DiseaseRiskPool as string, 0)
	EndIf
	LastDiseaseCycle = currentGameTime
EndFunction

bool Function IsThirstIncreasing(Form akBaseObject)
	bool returnVal = False
	If (akBaseObject)
		int I = 0
		While (returnVal == False && I < IncreasesThirstKeywords.length)
			returnVal = akBaseObject.HasKeyword(IncreasesThirstKeywords[I])
			I += 1
		EndWhile
	EndIf
	return returnVal
EndFunction

Function StartupHardcore()
	Self.trace(Self as ScriptObject, "StartupHardcore()", 0)
	If (!bHardcoreIsRunning)
		FoodItems = new Form[0]
		MaxAdrenaline = KillsForAdrenalinePerkLevel * MaxAdrenalinePerkLevel
		HC_HoursToRespawnCellMult.SetValue(HoursToRespawnCellMult)
		HC_HoursToRespawnCellClearedMult.SetValue(HoursToRespawnCellClearedMult)
		If (GlobalRespawnCellOverride != None)
			Self.UpdateCurrentInstanceGlobal(GlobalRespawnCellOverride)
			If (GlobalRespawnCellOverride.GetValue() != 0)
				HC_HoursToRespawnCellMult.SetValue(GlobalRespawnCellOverride.GetValue())
				HC_HoursToRespawnCellClearedMult.SetValue(GlobalRespawnCellOverride.GetValue())
			Else
				HC_HoursToRespawnCellMult.SetValue(GlobalRespawnCellOverrideDynamic.GetValue())
				HC_HoursToRespawnCellClearedMult.SetValue(GlobalRespawnCellOverrideDynamic.GetValue())
			EndIf
		EndIf
		Self.RegisterForRemoteEvent(PlayerRef, "OnPlayerLoadGame")
		Self.RegisterForRemoteEvent(PlayerRef, "OnKill")
		Self.RegisterForPlayerSleep()
		Self.RegisterForPlayerWait()
		Self.RegisterForRemoteEvent(PlayerRef, "OnCombatStateChanged")
		Self.RegisterForRemoteEvent(PlayerRef, "OnItemEquipped")
		RegisterForHitEvent(PlayerRef, DiseaseRiskCombatantFactions)
		Self.RegisterForRemoteEvent(PlayerRef, "OnPlayerSwimming")
		Self.RegisterForCustomEvent(Followers, "CompanionChange")
		Self.RegisterForRemoteEvent(Companion, "OnEnterBleedout")
		Self.RegisterForRemoteEvent(DogmeatCompanion, "OnEnterBleedout")
		Self.RegisterForRemoteEvent(PlayerRef, "OnPlayerHealTeammate")
		Self.RegisterForMenuOpenCloseEvent("PipboyMenu")
		Self.RegisterForMenuOpenCloseEvent("VATSMenu")
		Self.RegisterForRemoteEvent(PlayerRef, "OnLocationChange")
		PlayerRef.addPerk(HC_SustenanceEffectsTurnOffFood, False)
		PlayerRef.addPerk(HC_FillWaterBottlePerk, False)
		Self.AddReduceCarryWeightAbility(Companion.GetActorReference())
		Self.AddReduceCarryWeightAbility(DogmeatCompanion.GetActorReference())
		Self.AddReduceCarryWeightAbility(PlayerRef)
		HC_Vendor_Antiboitic_ChanceNone.SetValue(0 as float)
		HC_Medkit_Antiboitic_ChanceNone.SetValue(0 as float)
		bTimersInitialized = False
		Self.StartTimer(1, RealTimerID_HackClockSyncer)
		Self.trace(Self as ScriptObject, "  StartupHardcore(): Hardcore is now running.", 0)
	Else
		Self.trace(Self as ScriptObject, "  StartupHardcore(): Hardcore was already running.", 0)
	EndIf
	HC_Rule_CompanionNoHeal.SetValue(0 as float)
	bHardcoreIsRunning = True
	Self.CompanionSetNoBleedoutRecovery(Companion.GetActorReference(), True)
	Self.CompanionSetNoBleedoutRecovery(DogmeatCompanion.GetActorReference(), True)
EndFunction

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	bool bhandleDisease = True
	If (!akSource as Weapon && bIgnoreNonWeaponHits)
		Self.trace(Self as ScriptObject, " OnHit() BAILING OUT! NON Weapon Hit from DiseaseRiskCombatantFactions. Currently ignored.", 0)
		bhandleDisease = False
	ElseIf (!akSource as Weapon && !bIgnoreNonWeaponHits)
		Self.trace(Self as ScriptObject, "  OnHit() HANDLING DISEASE! NON Weapon Hit from DiseaseRiskCombatantFactions. Currently allowed.", 0)
		Self.StartTimerGameTime(GameTimerInterval_IgnoreNonWeaponHits, GameTimerID_IgnoreNonWeaponHits)
		bIgnoreNonWeaponHits = True
	Else
		Self.trace(Self as ScriptObject, "  OnHit() HANDLING DISEASE! Weapon Hit from DiseaseRiskCombatantFactions.", 0)
	EndIf
	If (bhandleDisease)
		Self.HandleDiseaseRiskEvent(DiseaseRiskCombatantAmount)
	EndIf
	Self.RegisterForHitEvent(PlayerRef as ScriptObject, DiseaseRiskCombatantFactions as ScriptObject, None, None, -1, -1, -1, -1, True)
EndEvent

Function FillDiseaseRiskPool(float PoolIncrease)
	Self.trace(Self as ScriptObject, "    FillDiseaseRiskPool() - Old DiseaseRiskPool: " + DiseaseRiskPool as string, 0)
	float wellnessCeiling = Self.GetWellnessCeiling()
	If (DiseaseRiskPool < wellnessCeiling)
		DiseaseRiskPool += PoolIncrease
		If (DiseaseRiskPool > wellnessCeiling)
			DiseaseRiskPool = wellnessCeiling
		EndIf
	EndIf
	Self.trace(Self as ScriptObject, "    FillDiseaseRiskPool() - New DiseaseRiskPool: " + DiseaseRiskPool as string, 0)
EndFunction

Event Actor.OnPlayerHealTeammate(Actor akSender, Actor akTeammate)
	Self.trace(Self as ScriptObject, "Actor.OnPlayerHealTeammate() akTeammate: " + akTeammate as string, 0)
	Self.SetIsInNeedOfHealing(akTeammate, False)
EndEvent

bool Function TryTutorial(hc_tutorial t, string EventName)
	float DaysUntilNextDisplay = 0 as float
	Self.trace(Self as ScriptObject, "TryTutorial()   - Tutorial: " + EventName + ",       TimesDisplayed: " + t.TimesDisplayed as string, 0)
	Self.trace(Self as ScriptObject, "  TryTutorial() - Tutorial: " + EventName + ",       TimesToDisplay: " + t.TimesToDisplay as string, 0)
	If (t.TimesDisplayed < t.TimesToDisplay)
		float currentGameTime = Utility.GetCurrentGameTime()
		float nextDisplayTime = t.LastTimeDisplayed + t.GameDaysBetweenDisplays
		If (currentGameTime > nextDisplayTime)
			t.MessageToDisplay.ShowAsHelpMessage(EventName, 8 as float, 0 as float, 1, "", 0)
			t.TimesDisplayed = t.TimesDisplayed + 1
			t.LastTimeDisplayed = currentGameTime
			Self.trace(Self as ScriptObject, "  TryTutorial() - Show Tutorial: " + EventName + ", TimesDisplayed: " + t.TimesDisplayed as string, 0)
			return True
		EndIf
		DaysUntilNextDisplay = nextDisplayTime - currentGameTime
		Self.trace(Self as ScriptObject, "  TryTutorial() - Tutorial: " + EventName + ", DaysUntilNextDisplay: " + DaysUntilNextDisplay as string, 0)
	EndIf
	Self.trace(Self as ScriptObject, "  TryTutorial() - Hide Tutorial: " + EventName + ", TimesDisplayed: " + t.TimesDisplayed as string + ", DaysUntilNextDisplay: " + DaysUntilNextDisplay as string, 0)
	return False
EndFunction

Function SendAdrenalineUpdateEvent()
	var[] args = new var[1]
	args[0] = (PlayerRef.GetValue(HC_Adrenaline) / KillsForAdrenalinePerkLevel as float) as var
	sendCustomEvent("UpdateAdrenaline", args)
EndFunction

bool Function trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0)
	string logName = "Hardcore"
	Debug.OpenUserLog(logName)
	return Debug.TraceUser(logName, CallingObject as string + ": " + asTextToPrint, aiSeverity)
EndFunction

bool Function IsGlobalTrue(GlobalVariable GlobalToCheck)
	bool val = GlobalToCheck.GetValue() as bool
	If (val == iGlobalTrue as bool)
		return True
	ElseIf (val == iGlobalFalse as bool)
		return False
	Else
		Game.warning(Self as string + "IsGlobalTrue() found unrecognized value in " + GlobalToCheck as string + ": " + GlobalToCheck.GetValue() as string)
		return False
	EndIf
EndFunction

Function ManualSleepRemoval()
	PlayerRef.SetValue(HC_SleepEffect, HC_SE_Rested.GetValue())
	Self.ApplyEffect(HC_Rule_SleepEffects, SleepEffects, HC_SleepEffect, False, 0, False, True, True, False, True)
	PlayerRef.removePerk(HC_AdrenalinePerk)
	PlayerRef.removePerk(HC_WellRestedPerk)
	PlayerRef.removePerk(HC_LoversEmbracePerk)
EndFunction

Function HandleDiseaseRiskEvent(float RiskyEventPoints)
	Self.trace(Self as ScriptObject, "HandleDiseaseRiskEvent() RiskyEventPoints: " + RiskyEventPoints as string, 0)
	If (Self.IsGlobalTrue(HC_Rule_DiseaseEffects) == False)
		return 
	EndIf
	Self.TryTutorial(HighRiskEventTutorial, "HighRiskEventTutorial")
	float wellnessCeiling = Self.GetWellnessCeiling()
	Self.trace(Self as ScriptObject, "  HandleDiseaseRiskEvent() Old DiseaseRiskPool " + DiseaseRiskPool as string, 0)
	If (DiseaseRiskPool < wellnessCeiling)
		DiseaseRiskPool += RiskyEventPoints
		If (DiseaseRiskPool > wellnessCeiling)
			DiseaseRiskPool = wellnessCeiling
		EndIf
	EndIf
	Self.trace(Self as ScriptObject, "  HandleDiseaseRiskEvent() Updated DiseaseRiskPool " + DiseaseRiskPool as string, 0)
	bHandleDiseaseRiskEvent = True
	Self.StartTimerGameTime(GameTimerInterval_DiseasePostRiskEvent, GameTimerID_Disease)
EndFunction

int Function GetThirst()
	return Math.abs(DrinkPool as float) as int
EndFunction

Function ProcessSingleFoodItem(Form akBaseObject)
	int baseCost = akBaseObject.GetGoldValue() as int
	Self.trace(Self as ScriptObject, "  ProcessSingleFoodItem(): " + akBaseObject as string + ", Base Cost: " + baseCost as string, 0)
	If (akBaseObject == HC_Antibiotics as Form)
		bPlayerTookAntibiotics = True
		Self.HandleDiseaseRiskEvent(0 as float)
	EndIf
	If (akBaseObject.HasKeyword(ObjectTypeCaffeinated))
		float timeToCaffeinate = 0 as float
		If (iCaffeinated > 0)
			timeToCaffeinate = Self.GetHoursUntilCurrentSleepCycleEnds(False)
		EndIf
		If (akBaseObject.HasKeyword(ObjectTypeExtraCaffeinated))
			ExtraCaffeinatedCount += 1
			timeToCaffeinate += ExtraCaffeineInducedSleepDelay / ExtraCaffeinatedCount as float
		Else
			CaffeinatedCount += 1
			timeToCaffeinate += CaffeineInducedSleepDelay / CaffeinatedCount as float
		EndIf
		Self.TryEquipPotion(HC_Effect_Caffeinated)
		int newVal = PlayerRef.GetValue(HC_SleepEffect) as int - 1
		If (iCaffeinated == 0 && newVal >= 0)
			iCaffeinated = 1
			PlayerRef.SetValue(HC_SleepEffect, newVal as float)
			fCaffeinatedTimeTracker = Self.GetHoursUntilCurrentSleepCycleEnds(False)
		ElseIf (iCaffeinated == 0)
			iCaffeinated = 2
		EndIf
		Self.trace(Self as ScriptObject, "    ProcessSingleFoodItem(): CAFFEINATED!!! iCaffeinated: " + iCaffeinated as string + ", SleepEffect[" + newVal as string + "]", 0)
		HC_SE_Msg_Caffeinated.show(0, 0, 0, 0, 0, 0, 0, 0, 0)
		Self.StartSleepDeprivationTimer(timeToCaffeinate, False)
		DEBUGCaffeinatedTimeRemaining = timeToCaffeinate
		If (Pdef_W_SUR1_enabled)
			Self.SendCafUpdateEvent(timeToCaffeinate, CaffeinatedCount, ExtraCaffeinatedCount)
		EndIf
	EndIf
	If (akBaseObject.HasKeyword(ObjectTypeFood))
		Self.trace(Self as ScriptObject, "    ProcessSingleFoodItem() player eating food: " + akBaseObject as string + ", Base Cost: " + baseCost as string, 0)
		baseCost = HC_VoreSurvival.CheckBasecost(baseCost)
		Self.ModFoodPoolAndUpdateHungerEffects(baseCost as float, False)
		Self.FillDiseaseRiskPool(DiseaseRiskIncreaser_Food)
	ElseIf (Self.IsHungerIncreasing(akBaseObject))
		Self.trace(Self as ScriptObject, "    ProcessSingleFoodItem() player increasing hunger: " + akBaseObject as string + ", cost: -" + baseCost as string, 0)
		Self.ModFoodPoolAndUpdateHungerEffects(Math.floor((-baseCost) as float * IncreasesHungerCostMult) as float, False)
	EndIf
	If (Self.IsThirstQuenching(akBaseObject))
		Self.trace(Self as ScriptObject, "    ProcessSingleFoodItem() player quenching thirst: " + akBaseObject as string + ", cost: " + baseCost as string, 0)
		Self.ModDrinkPoolAndUpdateThirstEffects(baseCost)
		Self.FillDiseaseRiskPool(DiseaseRiskIncreaser_Drink)
	ElseIf (Self.IsThirstIncreasing(akBaseObject))
		Self.trace(Self as ScriptObject, "    ProcessSingleFoodItem() player increasing thirst: " + akBaseObject as string + ", cost: -" + baseCost as string, 0)
		Self.ModDrinkPoolAndUpdateThirstEffects(Math.floor((-baseCost) as float * IncreasesThirstCostMult))
	EndIf
	If (akBaseObject.HasKeyword(ObjectTypeNukaCola))
		Self.trace(Self as ScriptObject, "    ProcessSingleFoodItem() Player is drinking cola (" + akBaseObject as string + "): Thirst +" + (baseCost * NukaThirstCostMult) as string + ", Hunger -" + (baseCost * NukaFoodCostMult) as string, 0)
		If (NukaFoodCostMult != 0)
			Self.ModFoodPoolAndUpdateHungerEffects(Math.floor((-baseCost) as float * NukaFoodCostMult) as float, False)
		EndIf
		If (NukaThirstCostMult != 0)
			Self.ModDrinkPoolAndUpdateThirstEffects(Math.floor(baseCost as float * NukaThirstCostMult))
		EndIf
		If (DiseaseRiskIncreaser_Cola != 0)
			Self.FillDiseaseRiskPool(DiseaseRiskIncreaser_Cola)
		EndIf
	EndIf
	If (commonarrayfunctions.CheckFormAgainstKeywordArray(akBaseObject, DiseaseRiskFoodStandardKeywords, False))
		Self.trace(Self as ScriptObject, "    ProcessSingleFoodItem() player eating food with standard disease risk: " + akBaseObject as string, 0)
		Self.HandleDiseaseRiskEvent(DiseaseRiskFoodStandardAmount)
	ElseIf (commonarrayfunctions.CheckFormAgainstKeywordArray(akBaseObject, DiseaseRiskFoodHighKeywords, False))
		Self.trace(Self as ScriptObject, "    ProcessSingleFoodItem() player eating food with high disease risk: " + akBaseObject as string, 0)
		Self.HandleDiseaseRiskEvent(DiseaseRiskFoodHighAmount)
	ElseIf (commonarrayfunctions.CheckFormAgainstKeywordArray(akBaseObject, DiseaseRiskFoodVeryHighKeywords, False))
		Self.trace(Self as ScriptObject, "    ProcessSingleFoodItem() player eating food with very high disease risk: " + akBaseObject as string, 0)
		Self.HandleDiseaseRiskEvent(DiseaseRiskFoodVeryHighAmount)
	ElseIf (commonarrayfunctions.CheckFormAgainstKeywordArray(akBaseObject, DiseaseRiskFoodLowKeywords, False))
		Self.trace(Self as ScriptObject, "    ProcessSingleFoodItem() player eating food with low disease risk: " + akBaseObject as string, 0)
		Self.HandleDiseaseRiskEvent(DiseaseRiskFoodLowAmount)
	ElseIf (commonarrayfunctions.CheckFormAgainstKeywordArray(akBaseObject, DiseaseRiskChemsKeywords, False))
		Self.trace(Self as ScriptObject, "    ProcessSingleFoodItem() player taking chem with disease risk: " + akBaseObject as string, 0)
		Self.HandleDiseaseRiskEvent(DiseaseRiskChemsAmount)
	EndIf
	If (Self.IsGlobalTrue(HC_Rule_DiseaseEffects) && akBaseObject.HasKeyword(HC_CausesImmunodeficiency))
		Self.trace(Self as ScriptObject, "    ProcessSingleFoodItem() player is using Rad Treatment and must be punished!", 0)
		Self.TryEquipPotion(HC_Effect_Immunodeficiency)
		Self.FillDiseaseRiskPool(DiseaseRiskIncreaser_Immunodeficiency)
	EndIf
EndFunction

Event Actor.OnPlayerLoadGame(Actor aSender)
	HC_Rule_CompanionNoHeal.SetValue(0 as float)
	Self.IsDefWSur1Loaded()
	If (False == PlayerRef.HasPerk(HC_FillWaterBottlePerk))
		PlayerRef.addPerk(HC_FillWaterBottlePerk, False)
	EndIf
	If (HC_Medkit_Antiboitic_ChanceNone.GetValue() == 100 as float)
		HC_Medkit_Antiboitic_ChanceNone.SetValue(0 as float)
	EndIf
	If (FoodReqs < 0)
		FoodReqs = FoodPool
	EndIf
	If (DrinkReqs < 0)
		DrinkReqs = DrinkPool
	EndIf
	RegisterForRemoteEvent(PlayerRef, "OnPlayerHealTeammate")
	float currentGameTime = Utility.GetCurrentGameTime()
	Self.trace(Self as ScriptObject, "OnPlayerLoadGame() @ " + currentGameTime as string, 0)
	Self.CancelTimerGameTime(GameTimerID_DisplaySleepMessage)
	If (currentGameTime - LastSleepUpdateDay > 1 || LastSleepUpdateDay > currentGameTime)
		Self.trace(Self as ScriptObject, "  OnPlayerLoadGame() Old LastSleepUpdateDay: " + LastSleepUpdateDay as string + ", New LastSleepUpdateDay: " + currentGameTime as string, 0)
		LastSleepUpdateDay = currentGameTime
	Else
		Self.trace(Self as ScriptObject, "  OnPlayerLoadGame() LastSleepUpdateDay: " + LastSleepUpdateDay as string, 0)
	EndIf
	If (NextSleepUpdateDay < currentGameTime - 0.05)
		float temp = NextSleepUpdateDay
		NextSleepUpdateDay = currentGameTime + currentGameTime - LastSleepUpdateDay
		Self.StartSleepDeprivationTimer(Self.GetHoursUntilCurrentSleepCycleEnds(False), False)
		Self.trace(Self as ScriptObject, "  OnPlayerLoadGame() Old NextSleepUpdateDay: " + temp as string + ", New NextSleepUpdateDay: " + NextSleepUpdateDay as string, 0)
	Else
		Self.trace(Self as ScriptObject, "  OnPlayerLoadGame() NextSleepUpdateDay: " + NextSleepUpdateDay as string, 0)
	EndIf
	Self.RemoveReduceCarryWeightAbility(Companion.GetActorReference())
	Self.RemoveReduceCarryWeightAbility(DogmeatCompanion.GetActorReference())
	Self.RemoveReduceCarryWeightAbility(PlayerRef)
	Self.AddReduceCarryWeightAbility(Companion.GetActorReference())
	Self.AddReduceCarryWeightAbility(DogmeatCompanion.GetActorReference())
	Self.AddReduceCarryWeightAbility(PlayerRef)
EndEvent

float Function CapFoodAndDrinkPoolMinValue(float afModPoolAmount, int aiMinTierValue)
	If (afModPoolAmount < aiMinTierValue as float)
		return aiMinTierValue as float
	EndIf
	return afModPoolAmount
EndFunction

Function ModDrinkPoolAndUpdateThirstEffects(int ModPoolAmount)
	Self.trace(Self as ScriptObject, "      ModDrinkPoolAndUpdateThirstEffects():                                          ModPoolAmount: " + ModPoolAmount as string, 0)
	int currentTE = PlayerRef.GetValue(HC_ThirstEffect) as int
	If (ModPoolAmount >= 0)
		If (ModPoolAmount > MaxDrinkValue)
			ModPoolAmount = MaxDrinkValue
			Self.trace(Self as ScriptObject, "        ModDrinkPoolAndUpdateThirstEffects():                               Capped @ MaxDrinkValue: " + ModPoolAmount as string, 0)
		ElseIf (HC_TE_Hydrated.GetValue() == currentTE as float)
			ModPoolAmount = Self.CapFoodAndDrinkPoolMinValue(ModPoolAmount as float, MinDrinkValueHydrated) as int
			Self.trace(Self as ScriptObject, "        ModDrinkPoolAndUpdateThirstEffects():            Player is Hydrated! Updated ModPoolAmount: " + ModPoolAmount as string, 0)
		ElseIf (HC_TE_Parched.GetValue() == currentTE as float)
			ModPoolAmount = Self.CapFoodAndDrinkPoolMinValue(ModPoolAmount as float, MinDrinkValueParched) as int
			Self.trace(Self as ScriptObject, "        ModDrinkPoolAndUpdateThirstEffects():             Player is Parched! Updated ModPoolAmount: " + ModPoolAmount as string, 0)
		ElseIf (HC_TE_Thirsty.GetValue() == currentTE as float)
			ModPoolAmount = Self.CapFoodAndDrinkPoolMinValue(ModPoolAmount as float, MinDrinkValueThirsty) as int
			Self.trace(Self as ScriptObject, "        ModDrinkPoolAndUpdateThirstEffects():             Player is Thirsty! Updated ModPoolAmount: " + ModPoolAmount as string, 0)
		ElseIf (HC_TE_MildlyDehydrated.GetValue() == currentTE as float)
			ModPoolAmount = Self.CapFoodAndDrinkPoolMinValue(ModPoolAmount as float, MinDrinkValueMildlyDehydrated) as int
			Self.trace(Self as ScriptObject, "        ModDrinkPoolAndUpdateThirstEffects():   Player is Mildly Dehydrated! Updated ModPoolAmount: " + ModPoolAmount as string, 0)
		ElseIf (HC_TE_Dehydrated.GetValue() == currentTE as float)
			ModPoolAmount = Self.CapFoodAndDrinkPoolMinValue(ModPoolAmount as float, MinDrinkValueDehydrated) as int
			Self.trace(Self as ScriptObject, "        ModDrinkPoolAndUpdateThirstEffects():          Player is Dehydrated! Updated ModPoolAmount: " + ModPoolAmount as string, 0)
		ElseIf (HC_TE_SeverelyDehyrdated.GetValue() == currentTE as float)
			ModPoolAmount = Self.CapFoodAndDrinkPoolMinValue(ModPoolAmount as float, MinDrinkValueSeverelyDehydrated) as int
			Self.trace(Self as ScriptObject, "        ModDrinkPoolAndUpdateThirstEffects(): Player is Severely Dehydrated! Updated ModPoolAmount: " + ModPoolAmount as string, 0)
		EndIf
	EndIf
	DrinkPoolLast = DrinkPool
	Self.trace(Self as ScriptObject, "        ModDrinkPoolAndUpdateThirstEffects():                                        Old DrinkPool: " + DrinkPool as string, 0)
	Self.trace(Self as ScriptObject, "        ModDrinkPoolAndUpdateThirstEffects():                                        Old DrinkReqs: " + DrinkReqs as string, 0)
	Self.trace(Self as ScriptObject, "        ModDrinkPoolAndUpdateThirstEffects():                                      + ModPoolAmount: " + ModPoolAmount as string, 0)
	DrinkPool += ModPoolAmount
	DrinkReqs += ModPoolAmount
	Self.trace(Self as ScriptObject, "        ModDrinkPoolAndUpdateThirstEffects():                                        New DrinkPool: " + DrinkPool as string, 0)
	Self.trace(Self as ScriptObject, "        ModDrinkPoolAndUpdateThirstEffects():                                        New DrinkReqs: " + DrinkReqs as string, 0)
	If (ModPoolAmount < 0)
		If (DrinkPool <= iDrinkPoolSeverelyDehydratedAmount && currentTE as float <= HC_TE_SeverelyDehyrdated.GetValue())
			Self.trace(Self as ScriptObject, "        ModDrinkPoolAndUpdateThirstEffects(): Player is Severely Dehydrated", 0)
			PlayerRef.SetValue(HC_ThirstEffect, HC_TE_SeverelyDehyrdated.GetValue())
			DrinkReqs = Self.SetOrCapReqsToTiersSustenanceValueOnDeterioration(DrinkReqs, currentTE, HC_TE_SeverelyDehyrdated.GetValue() as int, iDrinkPoolSeverelyDehydratedAmount)
			DrinkPool = iDrinkPoolSeverelyDehydratedAmount
		ElseIf (DrinkPool <= iDrinkPoolDehydratedAmount && currentTE as float <= HC_TE_Dehydrated.GetValue())
			Self.trace(Self as ScriptObject, "        ModDrinkPoolAndUpdateThirstEffects(): Player is Dehydrated", 0)
			PlayerRef.SetValue(HC_ThirstEffect, HC_TE_Dehydrated.GetValue())
			DrinkReqs = Self.SetOrCapReqsToTiersSustenanceValueOnDeterioration(DrinkReqs, currentTE, HC_TE_Dehydrated.GetValue() as int, iDrinkPoolDehydratedAmount)
		ElseIf (DrinkPool <= iDrinkPoolMildlyDehydratedAmount && currentTE as float <= HC_TE_MildlyDehydrated.GetValue())
			Self.trace(Self as ScriptObject, "        ModDrinkPoolAndUpdateThirstEffects(): Player is Mildly Dehyrdated", 0)
			PlayerRef.SetValue(HC_ThirstEffect, HC_TE_MildlyDehydrated.GetValue())
			DrinkReqs = Self.SetOrCapReqsToTiersSustenanceValueOnDeterioration(DrinkReqs, currentTE, HC_TE_MildlyDehydrated.GetValue() as int, iDrinkPoolMildlyDehydratedAmount)
		ElseIf (DrinkPool <= iDrinkPoolThirstyAmount && currentTE as float <= HC_TE_Thirsty.GetValue())
			Self.trace(Self as ScriptObject, "        ModDrinkPoolAndUpdateThirstEffects(): Player is Thirsty", 0)
			PlayerRef.SetValue(HC_ThirstEffect, HC_TE_Thirsty.GetValue())
			DrinkReqs = Self.SetOrCapReqsToTiersSustenanceValueOnDeterioration(DrinkReqs, currentTE, HC_TE_Thirsty.GetValue() as int, iDrinkPoolThirstyAmount)
		ElseIf (DrinkPool <= iDrinkPoolParchedAmount && currentTE as float <= HC_TE_Parched.GetValue())
			Self.trace(Self as ScriptObject, "        ModDrinkPoolAndUpdateThirstEffects(): Player is Parched", 0)
			PlayerRef.SetValue(HC_ThirstEffect, HC_TE_Parched.GetValue())
			DrinkReqs = Self.SetOrCapReqsToTiersSustenanceValueOnDeterioration(DrinkReqs, currentTE, HC_TE_Parched.GetValue() as int, iDrinkPoolParchedAmount)
		ElseIf (currentTE as float <= HC_TE_Hydrated.GetValue())
			Self.trace(Self as ScriptObject, "        ModDrinkPoolAndUpdateThirstEffects(): Player is Hydrated", 0)
			PlayerRef.SetValue(HC_ThirstEffect, HC_TE_Hydrated.GetValue())
			If (DrinkReqs < 0)
				DrinkReqs = 0
			EndIf
			If (DrinkPool > 0)
				DrinkPool = 0
			EndIf
		Else
			Self.trace(Self as ScriptObject, "        ModDrinkPoolAndUpdateThirstEffects(): GETTING WORSE - NO MATCH!", 0)
			Self.trace(Self as ScriptObject, "        ModDrinkPoolAndUpdateThirstEffects(): Player is: " + PlayerRef.GetValue(HC_ThirstEffect) as string, 0)
			Self.trace(Self as ScriptObject, "        ModDrinkPoolAndUpdateThirstEffects(): Drinkpool: " + DrinkPool as string, 0)
			Self.trace(Self as ScriptObject, "        ModDrinkPoolAndUpdateThirstEffects(): DrinkReqs: " + DrinkReqs as string, 0)
		EndIf
	ElseIf (ModPoolAmount > 0)
		If (DrinkReqs >= 0 && currentTE as float >= HC_TE_Hydrated.GetValue())
			Self.trace(Self as ScriptObject, "        ModDrinkPoolAndUpdateThirstEffects(): Player is Hydrated", 0)
			PlayerRef.SetValue(HC_ThirstEffect, HC_TE_Hydrated.GetValue())
			DrinkPool = Self.SetPoolToTiersSustenanceValueOnRecovery(DrinkPool, currentTE, HC_TE_Hydrated.GetValue() as int, 0)
			DrinkReqs = 0
			If (DrinkPool > 0)
				DrinkPool = 0
			EndIf
		ElseIf (DrinkReqs >= iDrinkPoolParchedAmount && currentTE as float >= HC_TE_Parched.GetValue())
			Self.trace(Self as ScriptObject, "        ModDrinkPoolAndUpdateThirstEffects(): Player is Parched", 0)
			PlayerRef.SetValue(HC_ThirstEffect, HC_TE_Parched.GetValue())
			DrinkPool = Self.SetPoolToTiersSustenanceValueOnRecovery(DrinkPool, currentTE, HC_TE_Parched.GetValue() as int, iDrinkPoolParchedAmount)
		ElseIf (DrinkReqs >= iDrinkPoolThirstyAmount && currentTE as float >= HC_TE_Thirsty.GetValue())
			Self.trace(Self as ScriptObject, "        ModDrinkPoolAndUpdateThirstEffects(): Player is Thirsty", 0)
			PlayerRef.SetValue(HC_ThirstEffect, HC_TE_Thirsty.GetValue())
			DrinkPool = Self.SetPoolToTiersSustenanceValueOnRecovery(DrinkPool, currentTE, HC_TE_Thirsty.GetValue() as int, iDrinkPoolThirstyAmount)
		ElseIf (DrinkReqs >= iDrinkPoolMildlyDehydratedAmount && currentTE as float >= HC_TE_MildlyDehydrated.GetValue())
			Self.trace(Self as ScriptObject, "        ModDrinkPoolAndUpdateThirstEffects(): Player is Mildly Dehyrdated", 0)
			PlayerRef.SetValue(HC_ThirstEffect, HC_TE_MildlyDehydrated.GetValue())
			DrinkPool = Self.SetPoolToTiersSustenanceValueOnRecovery(DrinkPool, currentTE, HC_TE_MildlyDehydrated.GetValue() as int, iDrinkPoolMildlyDehydratedAmount)
		ElseIf (DrinkReqs >= iDrinkPoolDehydratedAmount && currentTE as float >= HC_TE_Dehydrated.GetValue())
			Self.trace(Self as ScriptObject, "        ModDrinkPoolAndUpdateThirstEffects(): Player is Dehydrated", 0)
			PlayerRef.SetValue(HC_ThirstEffect, HC_TE_Dehydrated.GetValue())
			DrinkPool = Self.SetPoolToTiersSustenanceValueOnRecovery(DrinkPool, currentTE, HC_TE_Dehydrated.GetValue() as int, iDrinkPoolDehydratedAmount)
		ElseIf (currentTE as float >= HC_TE_SeverelyDehyrdated.GetValue())
			Self.trace(Self as ScriptObject, "        ModDrinkPoolAndUpdateThirstEffects(): Player is Severely Dehydrated", 0)
			PlayerRef.SetValue(HC_ThirstEffect, HC_TE_SeverelyDehyrdated.GetValue())
			If (DrinkPool < iDrinkPoolSeverelyDehydratedAmount)
				DrinkPool = iDrinkPoolSeverelyDehydratedAmount
			EndIf
			If (DrinkReqs < iDrinkPoolSeverelyDehydratedAmount)
				DrinkReqs = iDrinkPoolSeverelyDehydratedAmount
			EndIf
		Else
			Self.trace(Self as ScriptObject, "        ModDrinkPoolAndUpdateThirstEffects(): GETTING BETTER - NO MATCH!", 0)
			Self.trace(Self as ScriptObject, "        ModDrinkPoolAndUpdateThirstEffects():  Player is " + PlayerRef.GetValue(HC_ThirstEffect) as string, 0)
			Self.trace(Self as ScriptObject, "        ModDrinkPoolAndUpdateThirstEffects(): Drinkpool: " + DrinkPool as string, 0)
			Self.trace(Self as ScriptObject, "        ModDrinkPoolAndUpdateThirstEffects(): DrinkReqs: " + DrinkReqs as string, 0)
		EndIf
	EndIf
	bool bstateChanged = currentTE != PlayerRef.GetValue(HC_ThirstEffect) as int
	bool showSustenanceMessage = Self.ShowSustenance(bstateChanged)
	bool AnnounceFatigue = Self.AnnounceFatigue(bstateChanged, ModPoolAmount)
	Self.UpdateNextSustenanceTickDay(bstateChanged, ModPoolAmount)
	Self.trace(Self as ScriptObject, "        ModDrinkPoolAndUpdateThirstEffects():                                      Final DrinkPool: " + DrinkPool as string, 0)
	Self.trace(Self as ScriptObject, "        ModDrinkPoolAndUpdateThirstEffects():                                      Final DrinkReqs: " + DrinkReqs as string, 0)
	Self.ApplyEffect(HC_Rule_SustenanceEffects, ThirstEffects, HC_ThirstEffect, False, 0, !AnnounceFatigue, showSustenanceMessage, True, AnnounceFatigue, False)
EndFunction

Function ApplyEffect(GlobalVariable RuleGlobal, effect[] EffectsArray, ActorValue EffectActorValue, bool DispellRestedSpells, int IncrementEffectBy, bool DisplayAfterAwakingMessage, bool bDisplayMessage, bool bDamageFatigue, bool bAnnounceFatigue, bool bBypassGlobalCheck)
	Self.trace(Self as ScriptObject, "  ApplyEffect()", 0)
	If (Self.IsGlobalTrue(RuleGlobal) == False && bBypassGlobalCheck == False)
		return 
	EndIf
	If (DispellRestedSpells)
		PlayerRef.dispelSpell(WellRested)
		PlayerRef.dispelSpell(LoversEmbracePerkSpell)
	EndIf
	int I = 0
	int EffectsLength = EffectsArray.length
	While (I < EffectsLength)
		Potion potionToApply = EffectsArray[I].EffectPotion
		If (potionToApply)
			Self.TryEquipPotion(potionToApply)
		EndIf
		I += 1
	EndWhile
	int newVal = PlayerRef.GetValue(EffectActorValue) as int
	int oldVal = newVal
	Self.trace(Self as ScriptObject, "    ApplyEffect() Current Value: " + newVal as string, 0)
	If (IncrementEffectBy > 0)
		newVal += IncrementEffectBy
		Self.trace(Self as ScriptObject, "    ApplyEffect() Updated Value: " + newVal as string, 0)
		If (newVal < EffectsLength)
			PlayerRef.SetValue(EffectActorValue, newVal as float)
		EndIf
	EndIf
	int detail = Self.IsShowDetailedMessagesOn()
	Message PreviousEffectMessageToShow = EffectMessageToShow
	If (DisplayAfterAwakingMessage)
		PreviousEffectMessageToShow = None
		If (EffectsArray[newVal].MessageToDisplayAfterAwakingDetail as bool && detail > 0)
			EffectMessageToShow = EffectsArray[newVal].MessageToDisplayAfterAwakingDetail
		Else
			EffectMessageToShow = EffectsArray[newVal].MessageToDisplayAfterAwaking
		EndIf
	ElseIf (EffectsArray[newVal].MessageToDisplayDetail as bool && detail > 0)
		EffectMessageToShow = EffectsArray[newVal].MessageToDisplayDetail
	Else
		EffectMessageToShow = EffectsArray[newVal].MessageToDisplay
	EndIf
	float outValue = 0.0
	If (EffectActorValue == HC_HungerEffect)
		outValue = Math.abs(FoodPool as float)
		If (FoodPool > FoodPoolLast && detail == 1)
			bDisplayMessage = True
		ElseIf (IncrementEffectBy > 0 && newVal == oldVal)
			EffectMessageToShow = None
		EndIf
	ElseIf (EffectActorValue == HC_ThirstEffect)
		outValue = Math.abs(DrinkPool as float)
		If (DrinkPool > DrinkPoolLast && detail == 1)
			bDisplayMessage = True
		ElseIf (IncrementEffectBy > 0 && newVal == oldVal)
			EffectMessageToShow = None
		EndIf
	ElseIf (IncrementEffectBy > 0 && newVal == oldVal)
		EffectMessageToShow = None
	EndIf
	outValue = (outValue as int) as float
	If (Pdef_W_SUR1_enabled)
		If (Pdef_W_SUR1_statusmessages.GetValue() as bool && bDisplayMessage && EffectMessageToShow != PreviousEffectMessageToShow)
			EffectMessageToShow.show(outValue, 0, 0, 0, 0, 0, 0, 0, 0)
		EndIf
	ElseIf (bDisplayMessage && EffectMessageToShow != PreviousEffectMessageToShow)
		EffectMessageToShow.show(outValue, 0, 0, 0, 0, 0, 0, 0, 0)
	EndIf
	If (bDamageFatigue)
		DamageFatigue(bAnnounceFatigue)
	EndIf
	If (Pdef_W_SUR1_enabled)
		SendUpdateValuesEvent()
	EndIf
EndFunction

Function SetNextRainEventAllowed()
	float GameDaysPassed = Utility.GetCurrentGameTime()
	NextRainEventAllowed = GameDaysPassed + GameDaysPerRainEvent
EndFunction

bool Function ShowSustenance(bool abStateChanged)
	If (abStateChanged)
		return True
	EndIf
	return False
EndFunction

Function HandleDiseaseTimer()
	Self.trace(Self as ScriptObject, "  HandleDiseaseTimer() bHandleDiseaseRiskEvent: " + bHandleDiseaseRiskEvent as string + ", DiseaseRiskPool: " + DiseaseRiskPool as string + ", DiseaseRiskRollThreshold" + DiseaseRiskRollThreshold as string, 0)
	If (bHandleDiseaseRiskEvent && DiseaseRiskPool > DiseaseRiskRollThreshold)
		If (!Self.CheckAndPossiblyApplyDisease(True, False))
			Self.DrainDiseaseRiskPool()
		EndIf
	Else
		Self.DrainDiseaseRiskPool()
	EndIf
	bHandleDiseaseRiskEvent = False
EndFunction

bool Function CheckAndPossiblyApplyDisease(bool bShouldClearDiseaseRiskPoolOnDisease, bool bShouldClearDiseaseRiskPool)
	Self.trace(Self as ScriptObject, "    CheckAndPossiblyApplyDisease() bShouldClearDiseaseRiskPoolOnDisease, bShouldClearDiseaseRiskPool: " + bShouldClearDiseaseRiskPoolOnDisease as string + ", " + bShouldClearDiseaseRiskPool as string, 0)
	If (Self.IsGlobalTrue(HC_Rule_DiseaseEffects) == False)
		return False
	EndIf
	float diseaseDieRoll = Self.RollForDisease()
	bool diseased = diseaseDieRoll > 0 as float
	Self.trace(Self as ScriptObject, "      CheckAndPossiblyApplyDisease() bPlayerTookAntibiotics: " + bPlayerTookAntibiotics as string, 0)
	If (bPlayerTookAntibiotics)
		diseased = False
		bPlayerTookAntibiotics = False
		Self.trace(Self as ScriptObject, "      CheckAndPossiblyApplyDisease()  PLAYER TOOK ANTIBIOTICS RECENTLY!  NO DISEASES WILL BE APPLIED!!", 0)
	EndIf
	If (diseased)
		Self.trace(Self as ScriptObject, "      CheckAndPossiblyApplyDisease()  Player will be diseased if he doesnt have a remedy...", 0)
		int arrayLen = DiseaseEffects.length
		int dieRoll = Utility.RandomInt(0, arrayLen - 1)
		If (dieRoll == lastDiseaseDieRoll)
			dieRoll += 1
		EndIf
		If (dieRoll > arrayLen - 1)
			dieRoll = 0
		EndIf
		lastDiseaseDieRoll = dieRoll
		effect effectToApply = DiseaseEffects[dieRoll]
		If (PlayerRef.HasMagicEffect(effectToApply.HerbalRemedyEffect))
			Self.trace(Self as ScriptObject, "      CheckAndPossiblyApplyDisease()  Player has Remedy (" + effectToApply.HerbalRemedyEffect as string + ") for " + effectToApply.EffectPotion as string, 0)
			Self.trace(Self as ScriptObject, "      CheckAndPossiblyApplyDisease()     diseaseDieRoll: " + diseaseDieRoll as string, 0)
			Self.trace(Self as ScriptObject, "      CheckAndPossiblyApplyDisease()  ImmunityThreshold: " + effectToApply.HerbalRemedyBoostedImmunityThreshold as string, 0)
			diseased = diseaseDieRoll >= effectToApply.HerbalRemedyBoostedImmunityThreshold
			Self.trace(Self as ScriptObject, "      CheckAndPossiblyApplyDisease()  PROTECTED AGAINST DISEASE: " + (!diseased) as string, 0)
		EndIf
		If (diseased)
			LastDiseasedDay = Utility.GetCurrentGameTime()
			Self.trace(Self as ScriptObject, "      CheckAndPossiblyApplyDisease()  **DISEASED** - INFECTED @: " + LastDiseasedDay as string, 0)
			Message diseaseMessageToDisplay = None
			If (PlayerRef.HasMagicEffect(effectToApply.MagicEffectToApply))
				diseaseMessageToDisplay = effectToApply.MessageToRedisplay
			Else
				diseaseMessageToDisplay = effectToApply.MessageToDisplay
			EndIf
			Self.TryEquipPotion(effectToApply.EffectPotion)
			diseaseMessageToDisplay.show(0, 0, 0, 0, 0, 0, 0, 0, 0)
			Self.TryTutorial(DiseasedTutorial, "DiseasedTutorial")
			If (bShouldClearDiseaseRiskPoolOnDisease)
				DiseaseRiskPool = Self.GetWellnessFloor()
			EndIf
		EndIf
	EndIf
	If (bShouldClearDiseaseRiskPool)
		DiseaseRiskPool = Self.GetWellnessFloor()
	EndIf
	Self.trace(Self as ScriptObject, "      CheckAndPossiblyApplyDisease() Updated DiseaseRiskPool " + DiseaseRiskPool as string, 0)
	return diseased
EndFunction
