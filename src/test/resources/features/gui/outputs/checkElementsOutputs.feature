@web
Feature: Test all expected elements are present in Sparkta GUI for outputs

	Background: Setup Sparkta GUI
		Given I set web base url to '${SPARKTA_HOST}':'${SPARKTA_PORT}'
		
	Scenario: Check all expected elements are available for outputs
		Given I browse to '#/dashboard/outputs'
		Then I wait '2' seconds
		And '1' elements exists with 'css:a[data-qa="dashboard-menu-inputs"]'
		And '1' elements exists with 'css:a[data-qa="dashboard-menu-outputs"]'
		And '1' elements exists with 'css:a[data-qa="dashboard-menu-policies"]'
		And '1' elements exists with 'css:button[data-qa="outputs-new-button"]'
		And '1' elements exists with 'css:select[data-ng-model="outputs.filters.element.type"]'
		And '1' elements exists with 'css:input[data-ng-model="outputs.filters.name"]'
		
		Given '1' elements exists with 'css:button[data-qa="outputs-new-button"]'
		When I click on the element on index '0'
		Then I wait '2' seconds
		And '1' element exists with 'css:aside[data-qa="fragment-details-modal"]'
		Given '1' element exists with 'css:button[data-qa="modal-cancel-button"]'
		Then I click on the element on index '0'
		And I wait '1' second
		And '0' elements exist with 'css:aside[data-qa="fragment-details-modal"]'