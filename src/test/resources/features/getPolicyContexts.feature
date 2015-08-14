@rest
Feature: Test all Get operations for policyContexts in Sparkta Swagger API

	Scenario: Get all policyContexts when none available
		When I try to get all available policyContexts	
		Then the service response status must be '404'.
	
	Scenario: Get policyContext using empty parameter
		When I try to get all available 'policyContext' with name 'null'	
		Then the service response status must be '404' and its response must contain the text 'The requested resource could not be found.'
		
	Scenario: Get policyContext when none available
		When I try to get all available 'policyContext' with name 'invalid'	
		Then the service response status must be '404'.
	
	Scenario: Get all policyContexts
		Given I create 'policyContext' with 'policyExample'
		When I try to get all available policyContexts	
		Then the service response status must be '200' and its response length must be '1'

	Scenario: Get invalid policyContext
		When I try to get all available 'policyContext' with name 'invalid'	
		Then the service response status must be '404'.	
	
	Scenario: Get policyContext
		When I try to get all available 'policyContext' with name 'policyExampleName'	
		Then the service response status must be '200' and its response length must be '1'	

	Scenario: Clean everything up
		Given I have finished feature