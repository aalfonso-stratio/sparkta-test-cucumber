@web
Feature: Test all expected elements are present in Sparkta GUI for policies

	Scenario: Check all expected elements are available for policies
		Given I browse to '${SPARKTA_HOST}:${SPARKTA_PORT}'
		Then I wait '2' seconds
		Then '1' elements exists with 'css:st-menu-element[sref="dashboard.policies"]'
		When I click on the element on index '0'
		Then I wait '2' seconds
		Then '1' elements exists with 'css:st-menu-element[sref="dashboard.inputs"]'
		Then '1' elements exists with 'css:st-menu-element[sref="dashboard.outputs"]'
		Then '1' elements exists with 'css:st-menu-element[sref="dashboard.policies"]'