@web @rest
Feature: Test adding a new policy in Sparkta GUI

	Background: Setup Sparkta GUI
		Given I set web base url to '${SPARKTA_HOST}:${SPARKTA_PORT}'
	
	Scenario: Check all expected elements are available for policies
		Given I browse to '/#/dashboard/policies'
		Then I wait '2' seconds
		
		# Press add message
		Given '1' element exists with 'css:div[data-qa="policy-first-message"]'
		When I click on the element on index '0'
		Then I wait '2' seconds
		And we are in page '/#/dashboard/policies/new'
		
		
		
		
		
		
		
		