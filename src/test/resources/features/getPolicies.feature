@rest
Feature: Test all GET operations for policies in Sparkta Swagger API
		
	Scenario: Get all available policies when none available
		When I try to get all available policies	
		Then the service response status must be '200' and its response must contain the text '[]'	