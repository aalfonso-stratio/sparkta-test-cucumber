@rest
Feature: Test all DELETE operations for policyContexts in Sparkta Swagger API

	Scenario: Delete a policyContext using empty parameter
		When I try to delete a 'policyContext' with name 'null'.
		Then the service response status must be '405' and its response must contain the text 'HTTP method not allowed, supported methods: GET'
	
	Scenario: Delete a policyContext when none available
		When I try to delete a 'policyContext' with name 'policyExampleName'.
		Then the service response status must be '404'.
	
	Scenario: Delete a non-existing policyContext
		Given I create 'policyContext' with 'policyExample'
		When I try to delete a 'policyContext' with name 'policyTwoOutputFragmentsName'.
		Then the service response status must be '404'.

	Scenario: Delete a policyContext
		When I try to delete a 'policyContext' with name 'policyExampleName'.
		Then the service response status must be '200'.
		When I try to get all available policyContexts	
		Then the service response status must be '200' and its response length must be '0'

	Scenario: Clean everything up
		Given I have finished feature