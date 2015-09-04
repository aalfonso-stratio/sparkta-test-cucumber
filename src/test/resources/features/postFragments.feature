@rest
Feature: Test all POST operations for fragments in Sparkta Swagger API

	Scenario: Add a fragment with empty parameter
		When I create 'fragment' with 'null'	
		Then the service response status must be '400' and its response must contain the text 'Request entity expected but not supplied'

	Scenario: Add a fragment with missing name
		When I create 'fragment' with 'invalidFragmentNoName'	
		Then the service response status must be '400' and its response must contain the text 'No usable value for name'
	
	Scenario: Add a fragment with missing fragmentType
		When I create 'fragment' with 'invalidFragmentNoType'	
		Then the service response status must be '400' and its response must contain the text 'No usable value for fragmentType'
		
	Scenario: Add a fragment with missing description
		When I create 'fragment' with 'invalidFragmentNoDescription'	
		Then the service response status must be '400' and its response must contain the text 'No usable value for description'
	
	Scenario: Add a fragment with missing short description
		When I create 'fragment' with 'invalidFragmentNoShortDescription'	
		Then the service response status must be '400' and its response must contain the text 'No usable value for shortDescription'
			
	Scenario: Add a fragment with missing element
		When I create 'fragment' with 'invalidFragmentNoElement'	
		Then the service response status must be '400' and its response must contain the text 'No usable value for element'
	
	Scenario: Add a fragment with incorrect type
		When I create 'fragment' with 'invalidFragmentIncorrectType'	
		Then the service response status must be '500' and its response must contain the text 'The fragment type must be input|output'
	
	Scenario: Add a valid input fragment
		When I create 'fragment' with 'validInputFragment'	
		Then the service response status must be '201'.
		When I try to get all available 'fragment' of type 'input'
		Then the service response status must be '200' and its response length must be '1'
	
	Scenario: Add a valid output fragment
		When I create 'fragment' with 'validOutputFragment'	
		Then the service response status must be '201'.
		When I try to get all available 'fragment' of type 'output'
		Then the service response status must be '200' and its response length must be '1'

	Scenario: Clean everything up
		Given I have finished feature