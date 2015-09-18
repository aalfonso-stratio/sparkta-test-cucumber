@web
Feature: Test adding a new policy in Sparkta GUI

	Background: Setup Sparkta GUI
		Given I set web base url to '${SPARKTA_HOST}':'${SPARKTA_PORT}'
	
	Scenario: Check all expected elements are available for policies
		Given I browse to '#/dashboard/policies'
		Then I wait '2' seconds