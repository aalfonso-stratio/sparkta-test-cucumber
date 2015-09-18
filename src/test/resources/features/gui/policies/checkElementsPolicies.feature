@web
Feature: Test all expected elements are present in Sparkta GUI for policies

	Background: Setup Sparkta GUI
		Given I set web base url to '${SPARKTA_HOST}':'${SPARKTA_PORT}'

	Scenario: Check all expected elements are available for policies
		Given I browse to '#/dashboard/policies'
		Then I wait '2' seconds
		And '1' elements exists with 'css:a[data-qa="dashboard-menu-inputs"]'
		And '1' elements exists with 'css:a[data-qa="dashboard-menu-outputs"]'
		And '1' elements exists with 'css:a[data-qa="dashboard-menu-policies"]'
		And '1' elements exists with 'css:button[data-qa="policies-new-button"]'
				
		# Press add button and check we are in new page
		Given '1' elements exists with 'css:button[data-qa="policies-new-button"]'
		When I click on the element on index '0'
		Then I wait '2' seconds
		And we are in page '#/dashboard/policies/new'
