@rest
Feature: Test all GET operations for fragments in Sparkta Swagger API
		
	Scenario: Get all available fragments of type null
		When I try to get all available 'fragment' of type 'null'	
		Then the service response status must be '404' and its response must contain the text 'The requested resource could not be found.'
	
	Scenario: Get all available fragments of type invalid
		When I try to get all available 'fragment' of type 'invalid'	
		Then the service response status must be '404' and its response must contain the text 'The fragment type must be input|output'
	
	Scenario: Get all available fragments of type input with no fragments
		When I try to get all available 'fragment' of type 'input'	
		Then the service response status must be '200' and its response must contain the text '[]'
		
	Scenario: Get all available fragments of type output with no fragments
		When I try to get all available 'fragment' of type 'output'	
		Then the service response status must be '200' and its response must contain the text '[]'
	
	Scenario: Get all available fragments of type null with name null
		When I try to get 'fragment' of type 'null' with name 'name'
		Then the service response status must be '404' and its response must contain the text 'The requested resource could not be found.'
	
	Scenario: Get all available fragments of type input with name null
		When I try to get 'fragment' of type 'input' with name 'null'
		Then the service response status must be '404' and its response must contain the text 'The requested resource could not be found.'
	
	Scenario: Get all available fragments of type null with name null
		When I try to get 'fragment' of type 'null' with name 'null'
		Then the service response status must be '404' and its response must contain the text 'The requested resource could not be found.'
	
	Scenario: Get all available fragments of type invalid with name name
		When I try to get 'fragment' of type 'invalid' with name 'name'
		Then the service response status must be '404' and its response must contain the text 'The fragment type must be input|output'
	
	Scenario: Get all available fragments of type input with name name
		When I try to get 'fragment' of type 'input' with name 'name'
		Then the service response status must be '404'.
		
	Scenario: Get all available fragments of type output with name name
		When I try to get 'fragment' of type 'output' with name 'name'
		Then the service response status must be '404'.
		
	Scenario: Get all available fragments of type input
		Given I create a fragment of type 'input'
		When I try to get all available 'fragment' of type 'input'
		Then the service response status must be '200' and its response length must be '1'
	
	Scenario: Get all available fragments of type output
		Given I create a fragment of type 'output'
		When I try to get all available 'fragment' of type 'output'
		Then the service response status must be '200' and its response length must be '1'
		
	Scenario: Get all available fragments of type input with name twitter
		When I try to get 'fragment' of type 'input' with name 'twitter'
		Then the service response status must be '200'.
		
	Scenario: Get all available fragments of type output with name output
		When I try to get 'fragment' of type 'output' with name 'output'
		Then the service response status must be '200'.
	
	Scenario: Clean everything up
		Given I have finished feature