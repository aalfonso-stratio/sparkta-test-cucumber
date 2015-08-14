@rest
Feature: Test all GET operations for policies in Sparkta Swagger API
		
	Scenario: Get all available policies when none available
		When I try to get all available policies	
		Then the service response status must be '200' and its response must contain the text '[]'
	
	Scenario: Get a policy when none available
		When I try to get policy with name 'nonExistingPolicy'	
		Then the service response status must be '404'.
	
	Scenario: Get all policies with a particular fragment when no policies available
		When I try to get all policies with fragmentType 'fragmentType' and name 'fragmentName'	
		Then the service response status must be '200' and its response must contain the text '[]'

	Scenario: Run a policy when no policies available
		When I try to run policy 'nonExistingPolicy'	
		Then the service response status must be '404'.

	Scenario: Get a non-existing policy
		Given I create 'policy' with 'policyExample'
		When I try to get policy with name 'nonExistingPolicy'	
		Then the service response status must be '404'.
	
	Scenario: Get a existing policy
		When I try to get policy with name 'existingPolicy'	
		Then the service response status must be '200'.
		# Should check that value returned is the expected policy
	
	
#	Scenario: Get a policy with empty parameter
#		When I try to get policy with name 'null'	
#		Then the service response status must be '404' and its response must contain the text 'The requested resource could not be found.'
		
	Scenario: Clean everything up
		Given I have finished feature