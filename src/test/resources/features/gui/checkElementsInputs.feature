@web
Feature: Test all expected elements are present in Sparkta GUI for inputs

	Background: Setup Sparkta GUI
		Given I set web base url to '${SPARKTA_HOST}':'${SPARKTA_PORT}'

	Scenario: Check all expected elements are available for inputs
		Given I browse to '#/dashboard/inputs'
		Then I wait '2' seconds
		Then '1' elements exists with 'css:a[data-qa="dashboard-menu-inputs"]'
		Then '1' elements exists with 'css:a[data-qa="dashboard-menu-outputs"]'
		Then '1' elements exists with 'css:a[data-qa="dashboard-menu-policies"]'
		Then '1' elements exists with 'css:button[data-ng-click="inputs.createInput()"]'
		Then '1' elements exists with 'css:select[data-ng-model="inputs.filters.element.type"]'
		Then '1' elements exists with 'css:input[data-ng-model="inputs.filters.name"]'
		
		Given '1' elements exists with 'css:button[data-ng-click="inputs.createInput()"]'
		When I click on the element on index '0'
		Then I wait '2' seconds
		Then '1' elements exists with 'css:span[translate="_INPUT_WINDOW_NEW_TITLE_"]'
		Then '1' elements exists with 'css:span[translate="_INPUT_BUTTON_CANCEL_"]'
		When I click on the element on index '0'