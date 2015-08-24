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
		
	Scenario: Run a non-existing policy
		When I try to run policy 'nonExistingPolicy'
		Then the service response status must be '404'.
		
	Scenario: Run a existing policy
		When I try to run policy 'existingPolicy'
		Then the service response status must be '200' and its response must contain the text '{"message":"Creating new context'
		#When I try to get all available policyContexts	
		#Then the service response status must be '200' and its response length must be '1'
	
	Scenario: Get all policies with fragment with incorrect fragment type
		When I try to get all policies with fragmentType 'fragmentTypeIncorrect' and name 'fragmentName'	
		Then the service response status must be '200' and its response must contain the text '[]'
		
	Scenario: Get all policies with non-existing fragment
		When I try to get all policies with fragmentType 'input' and name 'nonExistingFragment'	
		Then the service response status must be '200' and its response must contain the text '[]'
		
	Scenario: Get all policies with existing fragment
		Given I create 'fragment' with 'fragmentExample'
		And I create 'policy' with 'policyExampleOneFragment'
		When I try to get all policies with fragmentType 'fragmentType' and name 'fragmentName'
		Then the service response status must be '200' and its response length must be '1'
		
	Scenario: Get all policies with policies available
		When I try to get all available policies	
		Then the service response status must be '200' and its response length must be '2'
		
	Scenario: Run a policy with 2 existing output fragments
		Given I create 'fragment' with 'fragmentOutputExample'
		And I create 'fragment' with 'fragmentOutputExample2'
		And I create 'policy' with 'policyExampleTwoOutputFragments'
		When I try to run policy 'policyTwoOutputFragmentsName'
		Then the service response status must be '200' and its response must contain the text '{"message":"Creating new context'
	
	Scenario: Get a policy with empty parameter
		When I try to get policy with name 'null'	
		Then the service response status must be '404' and its response must contain the text 'The requested resource could not be found.'

	Scenario: Get all policies that contains a fragment with empty type
		When I try to get all policies with fragmentType 'null' and name 'fragmentName'
		Then the service response status must be '404' and its response must contain the text 'The requested resource could not be found.'

	Scenario: Get all policies that contains a fragment with empty name
		When I try to get all policies with fragmentType 'input' and name 'null'
		Then the service response status must be '404' and its response must contain the text 'The requested resource could not be found.'

	Scenario: Get all policies that contains a fragment with empty type and name
		When I try to get all policies with fragmentType 'null' and name 'null'
		Then the service response status must be '404' and its response must contain the text 'The requested resource could not be found.'
	
	Scenario: Run an empty policy
		When I try to run policy 'null'
		Then the service response status must be '404' and its response must contain the text 'The requested resource could not be found.'
		
		
	Scenario: Clean everything up
		Given I have finished feature