@web
Feature: Test all expected elements are present in Sparkta GUI for inputs

	Background: Setup Sparkta GUI
		Given I set web base url to '${SPARKTA_HOST}':'${SPARKTA_PORT}'

	Scenario: Check all expected elements are available for inputs
		Given I browse to '#/dashboard/inputs'
		Then I wait '2' seconds
		And '1' elements exists with 'css:a[data-qa="dashboard-menu-inputs"]'
		And '1' elements exists with 'css:a[data-qa="dashboard-menu-outputs"]'
		And '1' elements exists with 'css:a[data-qa="dashboard-menu-policies"]'
		And '1' elements exists with 'css:button[data-qa="inputs-new-button"]'
		And '1' elements exists with 'css:select[data-ng-model="inputs.filters.element.type"]'
		And '1' elements exists with 'css:input[data-ng-model="inputs.filters.name"]'
		
		# Press add button and cancel operation
		Given '1' elements exists with 'css:button[data-qa="inputs-new-button"]'
		When I click on the element on index '0'
		Then I wait '2' seconds
		And '1' element exists with 'css:aside[data-qa="fragment-details-modal"]'
		Given '1' element exists with 'css:button[data-qa="modal-cancel-button"]'
		Then I click on the element on index '0'
		And I wait '1' second
		And '0' elements exist with 'css:aside[data-qa="fragment-details-modal"]'
		
		# Press add button and close modal
		Given '1' elements exists with 'css:button[data-qa="inputs-new-button"]'
		When I click on the element on index '0'
		Then I wait '2' seconds
		And '1' element exists with 'css:aside[data-qa="fragment-details-modal"]'
		Given '1' element exists with 'css:i[data-qa="modal-cancel-icon"]'
		Then I click on the element on index '0'
		And I wait '1' second
		And '0' elements exist with 'css:aside[data-qa="fragment-details-modal"]'