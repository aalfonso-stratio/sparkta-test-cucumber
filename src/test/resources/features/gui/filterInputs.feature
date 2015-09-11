@web
Feature: Test filtering inputs in Sparkta GUI

	Background: Setup Sparkta GUI
		Given I set web base url to '${SPARKTA_HOST}':'${SPARKTA_PORT}'
		
	Scenario: Filter with drop down menu
		Given I browse to '#/dashboard/inputs'
		Then I wait '2' seconds