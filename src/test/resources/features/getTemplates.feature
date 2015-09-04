@rest
Feature: Test all GET operations for templates in Sparkta Swagger API
	
	Background: Setup Sparkta REST client
		Given I send requests to 'localhost':'9091'
	
	Scenario: Get all available templates with empty type
		When I send a 'GET' request to 'template/'
		Then the service response status must be '404' and its response must contain the text 'The requested resource could not be found.'
		
	Scenario: Get all available templates of type invalid
		When I send a 'GET' request to 'template/invalid'
		Then the service response status must be '200' and its response length must be '0'
	
	Scenario: Get all available templates of type input
		When I send a 'GET' request to 'template/input'
		Then the service response status must be '200' and its response length must be '6'
			
	Scenario: Get all available templates of type output
		When I send a 'GET' request to 'template/output'
		Then the service response status must be '200' and its response length must be '7'
	
	Scenario: Get all available templates with empty type with name elasticsearch
		When I send a 'GET' request to 'template//elasticsearch'
		Then the service response status must be '404' and its response must contain the text 'The requested resource could not be found.'
	
	Scenario: Get all available templates of type output with empty name
		When I send a 'GET' request to 'template/output/'
		Then the service response status must be '404' and its response must contain the text 'The requested resource could not be found.'
	
	Scenario: Get all available templates with empty type with empty name
		When I send a 'GET' request to 'template//'
		Then the service response status must be '404' and its response must contain the text 'The requested resource could not be found.'
	
	Scenario: Get all available templates of type invalid with name mongodb
		When I send a 'GET' request to 'template/invalid/mongodb'
		Then the service response status must be '404'.
		
	Scenario: Get all available templates of type output with name invalid
		When I send a 'GET' request to 'template/output/invalid'
		Then the service response status must be '404'.
	
	Scenario: Get all available templates of type output with name mongodb
		When I send a 'GET' request to 'template/output/mongodb'
		Then the service response status must be '200'.
	