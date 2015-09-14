@web @rest
Feature: Test adding a new Flume input in Sparkta GUI
		
	Background: Setup Sparkta GUI
		Given I set web base url to '${SPARKTA_HOST}':'${SPARKTA_PORT}'
		Given I send requests to '${SPARKTA_HOST}':'${SPARKTA_API_PORT}'
	
	Scenario: Try to add a new input
		Given I browse to '#/dashboard/inputs'
		Then I wait '1' second
		Then '1' element exists with 'css:button[data-qa="inputs-new-button"]'
		When I click on the element on index '0'
		Then I wait '1' second
		And '1' element exists with 'css:aside[data-qa="fragment-details-modal"]'
		
		# Select kafka
		Given '1' element exists with 'css:i[tooltip="kafka"]'
		When I click on the element on index '0'
		Then I wait '1' second
		
		# Try with empty name
		Given '1' element exists with 'css:button[data-qa="modal-ok-button"]'
		When I click on the element on index '0'
		# Error message should appear (Name, Group ID and Topic)
		Then '3' element exists with 'css:span[data-ng-if="this[name][name].$error.required"]'
		
		# Try to add new Host-Port pair
		Given '1' element exists with 'css:i[ng-click="addItem()"]'
		When I click on the element on index '0'
		Then '1' element exists with 'id:dataSourceForm1-host'
		And '1' element exists with 'id:dataSourceForm1-port'
		And '2' elements exist with 'css:i[ng-click="removeItem($index)"]'
		Then I wait '2' seconds
		When I click on the element on index '1'
		Then '0' elements exist with 'id:dataSourceForm1-host'
		And '0' elements exist with 'id:dataSourceForm1-port'

		# Try with empty Host
		Given '1' element exists with 'id:dataSource_HOST_Form'
		Then I clear text in the element on index '0'
		# Try with empty Port
		Given '1' element exists with 'id:dataSource_PORT_Form'
		Then I clear text in the element on index '0'
		Given '1' element exists with 'css:button[data-qa="modal-ok-button"]'
		When I click on the element on index '0'
		# Error message should appear
		Then '3' elements exist with 'css:span[data-ng-if="this[name][name].$error.required"]'		
		