@web
Feature: Test all expected elements are present in Sparkta GUI for outputs

	Background: Setup Sparkta GUI
		Given I set web base url to '${SPARKTA_HOST}':'${SPARKTA_PORT}'
		
	Scenario: Check all expected elements are available for outputs
		Given I browse to '#/dashboard/outputs'
		Then I wait '2' seconds
		Then '1' elements exists with 'css:a[data-qa="dashboard-menu-inputs"]'
		Then '1' elements exists with 'css:a[data-qa="dashboard-menu-outputs"]'
		Then '1' elements exists with 'css:a[data-qa="dashboard-menu-policies"]'