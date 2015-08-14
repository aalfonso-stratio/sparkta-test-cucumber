@rest
Feature: Test all POST operations for policyContexts in Sparkta Swagger API

	Scenario: Add a policyContext with empty parameter
		When I create 'policyContext' with 'null'	
		Then the service response status must be '400' and its response must contain the text 'Request entity expected but not supplied'
	
	Scenario: Add a policyContext with no name
		When I create 'policyContext' with 'policyNoName'	
		Then the service response status must be '404' and its response must contain the text 'No usable value for name'
		# Delete incorrectly created policyContext
		When I try to delete a 'policyContext' with name 'defaultName'.
		Then the service response status must be '200'.
	
	Scenario: Add a policyContext with no input
		When I create 'policyContext' with 'policyNoInput'	
		Then the service response status must be '404' and its response must contain the text 'It is mandatory to define one input in the policy.'
		
	
	Scenario: Add a policyContext with no outputs
		When I create 'policyContext' with 'policyNoOutputs'	
		Then the service response status must be '404' and its response must contain the text 'It is mandatory to define at least one output in the policy.'
		
	Scenario: Add a policyContext with no cubes
		When I create 'policyContext' with 'policyNoCubes'	
		Then the service response status must be '400' and its response must contain the text 'error: array is too short: must have at least 1 elements but instance has 0 elements'
	
	Scenario: Add a policyContext
		When I create 'policyContext' with 'policyExample'	
		Then the service response status must be '200'.
			
	Scenario: Add a policyContext with non-existing fragment
		When I create 'policyContext' with 'policyExampleNonExistingFragment'	
		Then the service response status must be '404' and its response must contain the text 'KeeperErrorCode = NoNode for /stratio/sparkta/fragments/input/myFragment'
		
	Scenario: Add a policy context with 2 existing input fragments
		Given I create 'fragment' with 'fragmentExample'	
		Then the service response status must be '201'.
		Given I create 'fragment' with 'fragmentExample2'	
		Then the service response status must be '201'.
		When I create 'policyContext' with 'policyExampleTwoFragments'	
		Then the service response status must be '404' and its response must contain the text 'Only one input is allowed in the policy.'
		
	Scenario: Add a policyContext with existing fragment
		When I create 'policyContext' with 'policyExampleOneFragment'	
		Then the service response status must be '200' and its response must contain the text 'Creating new context with name'
	
	Scenario: Add a policy context with 2 existing output fragments
		Given I create 'fragment' with 'fragmentOutputExample'	
		Then the service response status must be '201'.
		Given I create 'fragment' with 'fragmentOutputExample2'	
		Then the service response status must be '201'.
		When I create 'policyContext' with 'policyExampleTwoOutputFragments'	
		Then the service response status must be '200' and its response must contain the text 'Creating new context with name'
	
	Scenario: Add a policy context with input and one input fragment
		When I create 'policyContext' with 'policyOneInputOneFragment'	
		Then the service response status must be '404' and its response must contain the text 'Only one input is allowed in the policy.'
		
	Scenario: Clean everything up
		Given I have finished feature