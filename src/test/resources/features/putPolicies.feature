@rest
Feature: Test all PUT operations for policies in Sparkta Swagger API

	Scenario: Update a policy using empty parameter
		When I try to update a 'policy' with 'null'
		Then the service response status must be '400' and its response must contain the text 'Request entity expected but not supplied'

	Scenario: Update a policy when no policies available
		When I try to update a 'policy' with 'policyExample'
		Then the service response status must be '404'.
		
	Scenario: Update a non-existing policy
		Given I create 'policy' with 'policyExample'
		When I try to get all available policies
		Then the service response status must be '200' and its response length must be '1'
		When I try to update a 'policy' with 'policyExample2'
		Then the service response status must be '404'.

	Scenario: Update a existing policy with invalid info: no input
		When I try to update a 'policy' with 'policyNoInput'
		Then the service response status must be '404' and its response must contain the text 'It is mandatory to define one input in the policy.'
		
	Scenario: Update a existing policy with invalid info: no outputs
		When I try to update a 'policy' with 'policyNoOutputs'
		Then the service response status must be '404' and its response must contain the text 'It is mandatory to define at least one output in the policy.'
	
	Scenario: Update a existing policy with invalid info: no cubes
		When I try to update a 'policy' with 'policyNoCubes'
		Then the service response status must be '404' and its response must contain the text 'It is mandatory to define one cube in the policy.'
	
	Scenario: Update a existing policy with invalid info: one input and one input fragment
		When I try to update a 'policy' with 'policyOneInputOneFragment'
		Then the service response status must be '404' and its response must contain the text 'Only one input is allowed in the policy.'
	
	Scenario: Update a existing policy
		When I try to update a 'policy' with 'policyExampleUpdated'
		Then the service response status must be '201'.
		
	Scenario: Update a policy with missing name inside cubes
		When I try to update a 'policy' with 'policyMissingCubesName'
		Then the service response status must be '400' and its response must contain the text 'No usable value for name'
		
	Scenario: Update a policy with missing dimensions inside cubes
		When I try to update a 'policy' with 'policyMissingDimensionsName'
		Then the service response status must be '400' and its response must contain the text 'No usable value for dimensions'
	
	Scenario: Update a policy with missing operators inside cubes
		When I try to update a 'policy' with 'policyMissingOperatorsName'
		Then the service response status must be '400' and its response must contain the text 'No usable value for operators'
	
	Scenario: Clean everything up
		Given I have finished feature