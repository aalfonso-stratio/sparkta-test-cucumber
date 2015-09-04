@rest
Feature: Test all PUT operations for fragments in Sparkta Swagger API
	
	Scenario: Update a fragment using empty parameter
		When I try to update a 'fragment' with 'null'
		Then the service response status must be '400' and its response must contain the text 'Request entity expected but not supplied'

	Scenario: Update a fragment when no fragments available
		When I try to update a 'fragment' with 'fragmentExample'
		Then the service response status must be '404'.
		
	Scenario: Update a non-existing fragment
		Given I create 'fragment' with 'fragmentExample'
		When I try to get all available 'fragment' of type 'input'
		Then the service response status must be '200' and its response length must be '1'
		When I try to update a 'fragment' with 'fragmentExample2'
		Then the service response status must be '404'.
	
	Scenario: Update a fragment with missing name
		When I try to update a 'fragment' with 'invalidFragmentNoName'	
		Then the service response status must be '400' and its response must contain the text 'No usable value for name'
	
	Scenario: Update a fragment with missing fragmentType
		When I try to update a 'fragment' with 'invalidFragmentNoType'	
		Then the service response status must be '400' and its response must contain the text 'No usable value for fragmentType'
		
	Scenario: Update a fragment with missing description
		When I try to update a 'fragment' with 'invalidFragmentNoDescription'	
		Then the service response status must be '400' and its response must contain the text 'No usable value for description'
	
	Scenario: Update a fragment with missing short description
		When I try to update a 'fragment' with 'invalidFragmentNoShortDescription'	
		Then the service response status must be '400' and its response must contain the text 'No usable value for shortDescription'
			
	Scenario: Update a fragment with missing element
		When I try to update a 'fragment' with 'invalidFragmentNoElement'	
		Then the service response status must be '400' and its response must contain the text 'No usable value for element'
	
	Scenario: Update a fragment with incorrect type
		When I try to update a 'fragment' with 'invalidFragmentIncorrectType'	
		Then the service response status must be '500' and its response must contain the text 'The fragment type must be input|output'	
	
	Scenario: Update a existing fragment
		When I try to update a 'fragment' with 'fragmentExampleUpdate'	
		Then the service response status must be '201'.
		
	Scenario: Clean everything up
		Given I have finished feature