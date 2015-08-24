@rest
Feature: Test all POST operations for policies in Sparkta Swagger API

	Scenario: Add a policy with empty data
		When I create 'policy' with 'null'
		Then the service response status must be '400' and its response must contain the text 'Request entity expected but not supplied'
	
	Scenario: Add a valid policy
		When I create 'policy' with 'policyExample'
		Then the service response status must be '201'.
		When I try to get all available policies
		Then the service response status must be '200' and its response length must be '1'

	Scenario: Add the same valid policy
		When I create 'policy' with 'policyExample'
		Then the service response status must be '404'.

	Scenario: Add a policy with non-existing fragment
		When I create 'policy' with 'policyExampleNonExistingFragment'
		Then the service response status must be '404' and its response must contain the text 'KeeperErrorCode = NoNode for /stratio/sparkta/fragments/input/myFragment'

	Scenario: Add a policy with 2 existing input fragments
		Given I create 'fragment' with 'fragmentExample'
		And I create 'fragment' with 'fragmentExample2'
		When I create 'policy' with 'policyExampleTwoFragments'
		Then the service response status must be '404' and its response must contain the text 'Only one input is allowed in the policy.'
	
	Scenario: Add a policy with existing input fragment 
		When I create 'policy' with 'policyExampleOneFragment'
		Then the service response status must be '201'.
		When I try to get all available policies
		Then the service response status must be '200' and its response length must be '2'
	
	Scenario: Add a policy with 2 existing output fragments
		Given I create 'fragment' with 'fragmentOutputExample'
		And I create 'fragment' with 'fragmentOutputExample2'
		When I create 'policy' with 'policyExampleTwoOutputFragments'
		Then the service response status must be '201'.
		When I try to get all available policies
		Then the service response status must be '200' and its response length must be '3'
	
	Scenario: Add a policy with input and one input fragment
		When I create 'policy' with 'policyOneInputOneFragment'
		Then the service response status must be '404' and its response must contain the text 'Only one input is allowed in the policy.'
	
	Scenario: Add a policy with missing input
		When I create 'policy' with 'policyNoInput'
		Then the service response status must be '404' and its response must contain the text 'It is mandatory to define one input in the policy.'
	
	Scenario: Add a policy with missing outputs
		When I create 'policy' with 'policyNoOutputs'
		Then the service response status must be '404' and its response must contain the text 'It is mandatory to define at least one output in the policy.'
	
	Scenario: Add a policy with missing name inside cubes
		When I create 'policy' with 'policyMissingCubesName'
		Then the service response status must be '400' and its response must contain the text 'No usable value for name'
		
	Scenario: Add a policy with missing dimensions inside cubes
		When I create 'policy' with 'policyMissingDimensionsName'
		Then the service response status must be '400' and its response must contain the text 'No usable value for dimensions'
	
	Scenario: Add a policy with missing operators inside cubes
		When I create 'policy' with 'policyMissingOperatorsName'
		Then the service response status must be '400' and its response must contain the text 'No usable value for operators'	
	
	# It should not be possible to add a policy with no cubes defined
	# This test will fail, as at the moment there is no validation
	Scenario: Add a policy with missing cubes
		When I create 'policy' with 'policyNoCubes'
		Then the service response status must be '404' and its response must contain the text 'It is mandatory to define one cube in the policy.'

	# Policy incorrectly created with default name
	# This test will fail
	Scenario: Add a policy with missing name
		When I create 'policy' with 'incorrectPolicyExample'
		Then the service response status must be '400'.

	Scenario: Clean everything up
		Given I have finished feature