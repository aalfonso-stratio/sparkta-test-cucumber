@rest
Feature: Test all Get operations for policyContexts in Sparkta Swagger API

	Background: Setup Sparkta REST client
		Given I send requests to 'localhost':'9091'
		
	Scenario: Get all policyContexts when none available
		When I send a 'GET' request to 'policyContext'
		Then the service response status must be '200'.
	
	Scenario: Get all policyContexts when one available
		Given I send a 'POST' request to 'policyContext' based on 'schemas/policies/policy.conf' as 'json' with:
		| name | UPDATE | policy1 |
		| fragments | DELETE | N/A |
		| id | DELETE | N/A |
		Then the service response status must be '200' and its response must contain the text 'Creating new context with name policy1'
		When I send a 'GET' request to 'policyContext'
		Then the service response status must be '200' and its response length must be '1'