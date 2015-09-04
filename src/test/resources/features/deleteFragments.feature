@rest
Feature: Test all DELETE operations for fragments in Sparkta Swagger API

	Scenario: Delete a fragment with type null and name invalid with empty list
		When I try to delete a 'fragment' of type 'null' with name 'invalid'	
		Then the service response status must be '405' and its response must contain the text 'HTTP method not allowed, supported methods: GET'
	
	Scenario: Delete a fragment with type input and name null with empty list
		When I try to delete a 'fragment' of type 'input' with name 'null'	
		Then the service response status must be '405' and its response must contain the text 'HTTP method not allowed, supported methods: GET'
	
	Scenario: Delete a fragment with type null and name null with empty list
		When I try to delete a 'fragment' of type 'null' with name 'null'	
		Then the service response status must be '405' and its response must contain the text 'HTTP method not allowed, supported methods: GET'
	
	Scenario: Delete a fragment with type invalid and name invalid with empty list
		When I try to delete a 'fragment' of type 'invalid' with name 'invalid'	
		Then the service response status must be '500'.
		
	Scenario: Delete a fragment with type input and name invalid with empty list
		When I try to delete a 'fragment' of type 'input' with name 'invalid'	
		Then the service response status must be '404'.
	
	Scenario: Delete a fragment with type input and name invalid with non-empty list
		Given I create 'fragment' with 'validInputFragment'
		When I try to delete a 'fragment' of type 'input' with name 'invalid'	
		Then the service response status must be '404'.
	
	Scenario: Delete a fragment with type input and name twitter
		When I try to delete a 'fragment' of type 'input' with name 'validInputFragmentName'	
		Then the service response status must be '200'.
		When I try to get all available 'fragment' of type 'input'
		Then the service response status must be '200' and its response length must be '0'
	
	Scenario: Delete a fragment with type output and name output
		Given I create 'fragment' with 'validOutputFragment'
		When I try to delete a 'fragment' of type 'output' with name 'validOutputFragmentName'	
		Then the service response status must be '200'.
		When I try to get all available 'fragment' of type 'output'
		Then the service response status must be '200' and its response length must be '0'
	
	Scenario: Delete a fragment with type input and name twitter referenced by policy
		Given I create 'fragment' with 'validInputFragment'
		And I create 'policy' with 'policyExampleOneFragment'
		When I try to delete a 'fragment' of type 'input' with name 'validInputFragmentName'
		Then the service response status must be '200'.
		When I try to get all available 'fragment' of type 'input'
		Then the service response status must be '200' and its response length must be '0'
		When I try to get all available policies	
		Then the service response status must be '200' and its response must contain the text '[]'
	
	Scenario: Delete a fragment with type output and name output referenced by policy
		Given I create 'fragment' with 'validOutputFragment'
		And I create 'policy' with 'policyExampleTwoOutputFragments'
		When I try to delete a 'fragment' of type 'output' with name 'validOutputFragmentName'
		Then the service response status must be '200'.
		When I try to get all available 'fragment' of type 'output'
		Then the service response status must be '200' and its response length must be '0'
		When I try to get all available policies	
		Then the service response status must be '200' and its response must contain the text '[]'
			
	Scenario: Clean everything up
		Given I have finished feature