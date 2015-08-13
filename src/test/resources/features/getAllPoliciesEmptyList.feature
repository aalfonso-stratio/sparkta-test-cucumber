@rest
Feature: Getting all available policies when none are defined
		
	Scenario: Get all available policies when none available
		When I try to get all available policies	
		Then the service response status must be '200' and its response must contain the text '[]'	