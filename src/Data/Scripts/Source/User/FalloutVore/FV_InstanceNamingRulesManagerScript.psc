Scriptname FalloutVore:FV_InstanceNamingRulesManagerScript extends Quest const

Struct InstanceNameRulesMergeDatum
	InstanceNamingRules RulesetSource
{the new ruleset you want to add to existing ruleset}

	InstanceNamingRules RulesetDestination
{the existing ruleset you want to merge into}

EndStruct

InstanceNameRulesMergeDatum[] Property InstanceNameRulesMergeData Auto Const Mandatory

Event OnInit()
    
	int i = 0
	While (i < InstanceNameRulesMergeData.length)
		InstanceNameRulesMergeDatum currentDatum = InstanceNameRulesMergeData[i]
		
		Debug.Trace(self + " OnInit() RulesetSource: " + currentDatum.RulesetSource + "-> RulesetDestination: " + currentDatum.RulesetDestination)

		currentDatum.RulesetDestination.MergeWith(currentDatum.RulesetSource)

		i += 1
	EndWhile

EndEvent