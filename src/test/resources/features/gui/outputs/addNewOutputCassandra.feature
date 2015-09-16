@web @rest
Feature: Test adding a new Cassandra output in Sparkta GUI
		
	Background: Setup Sparkta GUI
		Given I set web base url to '${SPARKTA_HOST}':'${SPARKTA_PORT}'
		Given I send requests to '${SPARKTA_HOST}':'${SPARKTA_API_PORT}'
		
	Scenario: Try to add a new input
		Given I browse to '#/dashboard/outputs'
		Then I wait '1' second
		Then '1' element exists with 'css:button[data-qa="outputs-new-button"]'
		When I click on the element on index '0'
		Then I wait '1' second
		And '1' element exists with 'css:aside[data-qa="fragment-details-modal"]'
		
		# Try with empty name
		Given '1' element exists with 'css:button[data-qa="modal-ok-button"]'
		When I click on the element on index '0'
		# Error message should appear
		Then '1' element exists with 'css:div[data-qa="fragment-detail-name-error"]'
