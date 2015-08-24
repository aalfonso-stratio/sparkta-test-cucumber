@rest
Feature: Test all DELETE operations for policies in Sparkta Swagger API

	Scenario: Delete a policy when no policies available
		When I try to delete a 'policy' with name 'nonExistingPolicy'.
		Then the service response status must be '404'.
	
	Scenario: Delete a non-existing policy
		Given I create 'policy' with 'policyExample'
		When I try to get all available policies
		Then the service response status must be '200' and its response length must be '1'
		When I try to delete a 'policy' with name 'nonExistingPolicy'.
		Then the service response status must be '404'.
		
	Scenario: Delete a existing policy
		When I try to delete a 'policy' with name 'existingPolicy'.
		Then the service response status must be '200'.
		When I try to get all available policies
		Then the service response status must be '200' and its response must contain the text '[]'

	Scenario: Delete a existing policy with fragments
		Given I create 'fragment' with 'fragmentExample'
		And I create 'policy' with 'policyExampleOneFragment'
		When I try to get all available policies
		Then the service response status must be '200' and its response length must be '1'
		When I try to delete a 'policy' with name 'policyExampleOneFragmentName'.
		Then the service response status must be '200'.
		When I try to get all available policies
		Then the service response status must be '200' and its response must contain the text '[]'
	
	Scenario: Delete a policy with empty parameter
		When I try to delete a 'policy' with name 'null'.
		Then the service response status must be '405' and its response must contain the text 'HTTP method not allowed, supported methods: GET'

	Scenario: Clean everything up
		Given I have finished feature