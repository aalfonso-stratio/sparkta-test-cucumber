@rest
Feature: Test all GET operations for templates in Sparkta Swagger API
		
	Scenario: Get all available templates of type null
		When I try to get all available 'template' of type 'null'	
		Then the service response status must be '404' and its response must contain the text 'The requested resource could not be found.'
		
	Scenario: Get all available templates of type invalid
		When I try to get all available 'template' of type 'invalid'	
		Then the service response status must be '404'.
	
	Scenario: Get all available templates of type input
		When I try to get all available 'template' of type 'input'	
		Then the service response status must be '200' and its response length must be '5'
			
	Scenario: Get all available templates of type output
		When I try to get all available 'template' of type 'output'	
		Then the service response status must be '200' and its response length must be '6'
	
	Scenario: Get all available templates of type null with name elasticsearch
		When I try to get 'template' of type 'null' with name 'elasticsearch'
		Then the service response status must be '404' and its response must contain the text 'The requested resource could not be found.'
	
	Scenario: Get all available templates of type output with name null
		When I try to get 'template' of type 'output' with name 'null'
		Then the service response status must be '404' and its response must contain the text 'The requested resource could not be found.'
	
	Scenario: Get all available templates of type null with name null
		When I try to get 'template' of type 'null' with name 'null'
		Then the service response status must be '404' and its response must contain the text 'The requested resource could not be found.'
	
	Scenario: Get all available templates of type invalid with name elasticsearch
		When I try to get 'template' of type 'invalid' with name 'elasticsearch'
		Then the service response status must be '404'.
		
	Scenario: Get all available templates of type output with name invalid
		When I try to get 'template' of type 'output' with name 'invalid'
		Then the service response status must be '404'.
	
	Scenario: Get all available templates of type output with name elasticsearch
		When I try to get 'template' of type 'output' with name 'existing_template'
		Then the service response status must be '200'.
	