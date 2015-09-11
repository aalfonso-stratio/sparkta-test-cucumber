@rest
Feature: Test all DELETE operations for fragments in Sparkta Swagger API

	Background: Setup Sparkta REST client
		Given I send requests to 'localhost':'9091'
		
	#Scenario: Add a fragment with empty parameter
	#	When I send a 'POST' request to 'fragment' as 'json'
	#	Then the service response status must be '400' and its response must contain the text 'Request entity expected but not supplied'

	Scenario: Add policy referencing fragment
		Given I send a 'POST' request to 'fragment' based on 'schemas/fragments/fragment.conf' as 'json' with:
		| id | DELETE | N/A |
		| name | UPDATE | inputfragment1 |
		| fragmentType | UPDATE | input |
		# Save fragment id
		Then the service response status must be '200'.
		And I save element '$.id' in attribute 'previousFragmentID'
		When I send a 'POST' request to 'policy' based on 'schemas/policies/policy.conf' as 'json' with:
		| fragments[0].id | UPDATE | !{previousFragmentID} |
		| fragments[0].name | UPDATE | inputfragment1 |
		| fragments[0].fragmentType | UPDATE | input |
		| fragments[1] | DELETE | N/A |
		| id | DELETE | N/A |
		| input | DELETE | N/A |
		Then the service response status must be '200'.
		And I save element '$.id' in attribute 'previousPolicyID'
		When I send a 'DELETE' request to 'policy/!{previousPolicyID}'
		Then the service response status must be '200'.
		When I send a 'DELETE' request to 'fragment/input/!{previousFragmentID}'
		Then the service response status must be '200'.

	#Scenario: Delete a fragment with type output and name outputfragment1
	#	Given I send a 'POST' request to 'fragment' based on 'schemas/fragments/fragment.conf' as 'json' with:
	#	| id | DELETE | N/A |
	#	| name | UPDATE | inputfragment1 |
	#	| fragmentType | UPDATE | input |
	#	# Save fragment id
	#	Then the service response status must be '200'.
	#	And I save element '$.id' in attribute 'previousFragmentID'
	#	When I send a 'POST' request to 'policy' based on 'schemas/policies/policy.conf' as 'json' with:
	#	| fragments[0].id | UPDATE | !{previousFragmentID} |
	#	| fragments[0].name | UPDATE | inputfragment1 |
	#	| fragments[0].fragmentType | UPDATE | input |
	#	| fragments[1] | DELETE | N/A |
	#	| id | DELETE | N/A |
	#	| input | DELETE | N/A |
	#	Then the service response status must be '200'.
		
	#Scenario: Delete a fragment with type empty and name invalid with empty list
	#	When I send a 'DELETE' request to 'fragment//invalid'
	#	Then the service response status must be '405' and its response must contain the text 'HTTP method not allowed, supported methods: GET'
	
	
	#Scenario: Clean everything up
	#	When I send a 'GET' request to 'fragment/input/name/twitter'
	#	Given I save element '$.id' in attribute 'previousFragmentID'
	#	When I delete fragment in 'fragment/input/'

	#Background: Setup REST client
	#	#Given I send requests to '10.200.0.11':'80'
	#	Given My app is running in '10.200.0.11':'80'
	
	#Background: Setup Sparkta REST client
	#	Given I send requests to 'localhost':'9091'
	
	#Scenario: create fragment
	#	When I send a 'POST' request to 'fragment' based on 'schemas/fragments/fragment.conf' as 'json' with:
	#	| id | DELETE | N/A |
	#	| name | UPDATE | MYNEWNAME |
	#	| kk | ADD | qq |
	#	Then the service response status must be '200'.
	#	When I send a 'GET' request to 'fragment/input'
	#	Then the service response status must be '200' and its response length must be '1'
	
	
	#Scenario: test api
	#	When I attempt a login to 'login' based on 'schemas/fragments/login2.conf' as 'string' with:
	#	| N/A | ADD | &kk=qq |
	#	| kk=qq | UPDATE | qq=kk |
	#	| &qq=kk | DELETE | N/A |
	#	Then the service response status must be '302'.
	#	When I send a 'GET' request to 'api/user'
	#	Then the service response status must be '200' and its response must contain the text 'Granted access to all actions'
	#	When I attempt a logout to 'logout'
	#	Then the service response status must be '302'.