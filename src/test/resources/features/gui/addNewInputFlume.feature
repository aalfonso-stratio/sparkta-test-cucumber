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
	
		# Try with empty name
		Given '1' element exists with 'css:button[data-qa="modal-ok-button"]'
		When I click on the element on index '0'
		# Error message should appear
		Then '1' element exists with 'css:span[data-ng-if="this[name][name].$error.required"]'
			
		# Make sure we are in pull in drop-down
		Given '1' element exists with 'id:dataSource_TYPE_Form'
		Then I select 'pull' on the element on index '0'
		Then I wait '1' second
				
		# Try with empty Host
		Given '1' element exists with 'id:dataSourceForm0-host'
		When I clear text in the element on index '0'
		Then '2' elements exist with 'css:span[data-ng-if="this[name][name].$error.required"]'
		
		# Try with empty Port
		Given '1' element exists with 'id:dataSourceForm0-port'
		When I clear text in the element on index '0'
		Then '3' elements exist with 'css:span[data-ng-if="this[name][name].$error.required"]'
				
		# Try to add new Host-Port pair
		Given '1' element exists with 'css:i[ng-click="addItem()"]'
		When I click on the element on index '0'
		Then '1' element exists with 'id:dataSourceForm1-host'
		And '1' element exists with 'id:dataSourceForm1-port'
		And '2' elements exist with 'css:i[ng-click="removeItem($index)"]'
		When I click on the element on index '1'
		Then '0' elements exist with 'id:dataSourceForm1-host'
		And '0' elements exist with 'id:dataSourceForm1-port'
		
		# Change value in drop-down menu to push
		Given '1' element exists with 'id:dataSource_TYPE_Form'
		Then I select 'push' on the element on index '0'
		Then I wait '1' second
		
		# Try with empty Host
		Given '1' element exists with 'id:dataSource_HOST_Form'
		Then I clear text in the element on index '0'
		
		# Try with port using letters
		Given '1' element exists with 'id:dataSource_PORT_Form'
		Then I type 'port11999' on the element on index '0'
		Given '1' element exists with 'css:button[data-ng-click="vm.ok()"]'
		When I click on the element on index '0'
		# Error message should appear
		Then '1' element exists with 'css:span[data-ng-if="this[name][name].$error.pattern"]'
		And '2' elements exist with 'css:span[data-ng-if="this[name][name].$error.required"]'
		
		# Try with empty Port
		Given '1' element exists with 'id:dataSource_PORT_Form'
		Then I clear text in the element on index '0'
		Given '1' element exists with 'css:button[data-qa="modal-ok-button"]'
		When I click on the element on index '0'
		# Error message should appear
		Then '3' elements exist with 'css:span[data-ng-if="this[name][name].$error.required"]'
		
		# Fill in name field
		Given '1' element exists with 'id:dataSourceNameForm'
		Then I type 'validFlumeInput' on the element on index '0'
		# Fill in host field
		Given '1' element exists with 'id:dataSource_HOST_Form'
		Then I type 'localhost' on the element on index '0'
		#Fill in port field
		Given '1' element exists with 'id:dataSource_PORT_Form'
		Then I type '11999' on the element on index '0'
		# Create
		Given '1' element exists with 'css:button[data-qa="modal-ok-button"]'
		When I click on the element on index '0'
		# Check that input fragment has been created
		# Retrieve input fragment id using api
		When I send a 'GET' request to 'fragment/input/name/validflumeinput'
		Then the service response status must be '200'.
		And I save element '$.id' in attribute 'previousFragmentID'
		# Check that an input element has been created
		Then '1' element exists with 'css:span[data-qa="input-context-menu-!{previousFragmentID}"]'
		
		# Add the same input
		Then '1' element exists with 'css:button[data-qa="inputs-new-button"]'
		When I click on the element on index '0'
		Then I wait '1' second
		And '1' element exists with 'css:aside[data-qa="fragment-details-modal"]'
		Given '1' element exists with 'id:dataSourceNameForm'
		Then I type 'validFlumeInput' on the element on index '0'
		Given '1' element exists with 'css:button[data-qa="modal-ok-button"]'
		When I click on the element on index '0'
		Then '1' element exists with 'css:span[translate="_INPUT_ERROR_100_"]'
				
		# Cancel operation
		Given '1' element exists with 'css:button[data-qa="modal-cancel-button"]'
		Then I click on the element on index '0'
		# Check pop up is closed
		And I wait '1' second
		Then '0' element exists with 'css:button[data-qa="modal-cancel-button"]'
		
		# Delete input fragment created
		Given '1' element exists with 'css:span[data-qa="input-context-menu-!{previousFragmentID}"]'
		Then I click on the element on index '0'
		And I wait '1' second
		Given '1' element exists with 'css:st-menu-element[data-qa="input-context-menu-!{previousFragmentID}-delete"]'
		When I click on the element on index '0'
		Then I wait '1' second
		And '1' element exists with 'css:aside[data-qa="delete-modal"]'
		Given '1' element exists with 'css:button[data-qa="modal-ok-button"]'
		Then I click on the element on index '0'
		And I wait '1' second
		And '0' element exists with 'css:span[data-qa="input-context-menu-!{previousFragmentID}"]'
		