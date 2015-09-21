@web @rest
Feature: Test adding a new policy in Sparkta GUI

	Background: Setup Sparkta GUI
		Given I set web base url to '${SPARKTA_HOST}:${SPARKTA_PORT}'
	
	Scenario: Check all expected elements are available for policies
		Given I browse to '/#/dashboard/policies'
		Then I wait '2' seconds
		
		# Press add message
		Given '1' element exists with 'css:div[data-qa="policy-first-message"]'
		When I click on the element on index '0'
		Then I wait '2' seconds
		And we are in page '/#/dashboard/policies/new'
		
		# Try with empty Name and Description
		Given '1' element exists with 'css:button[data-qa="policy-description-next-button"]'
		When I click on the element on index '0'
		Then '1' element exists with 'css:span[data-qa="policy-description-name-error-required"]'
		And '1' element exists with 'css:span[data-qa="policy-description-description-error-required"]'
		
		# Try with empty Spark streaming window
		Given '1' element exists with 'css:input[data-qa="policy-description-spark-streaming-window"]'
		Then I send 'HOME, SHIFT + END, DELETE' on the element on index '0'
		Given '1' element exists with 'css:button[data-qa="policy-description-next-button"]'
		When I click on the element on index '0'
		Then '1' element exists with 'css:span[data-qa="policy-description-spark-streaming-window-error-required"]'
		
		# Try with empty Checkpoint path
		Given '1' element exists with 'css:input[data-qa="policy-description-checkpoint-path"]'
		Then I send 'HOME, SHIFT + END, DELETE' on the element on index '0'
		Given '1' element exists with 'css:button[data-qa="policy-description-next-button"]'
		When I click on the element on index '0'
		Then '1' element exists with 'css:span[data-qa="policy-description-checkpoint-path-error-required"]'
		
		# Select Persist raw data and deselect
		Given '1' element exists with 'css:label[data-qa="policy-description-persist-raw-data"]'
		When I click on the element on index '0'
		Then '1' element exists with 'css:input[data-qa="policy-description-raw-data-path"]'
		And '1' element exists with 'css:span[data-qa="policy-description-raw-data-path-error-required"]'
		And '1' element exists with 'css:select[data-qa="policy-description-raw-data-partition-format"]'
		And I select 'year' on the element on index '0'
		And I select 'month' on the element on index '0'
		And I select 'day' on the element on index '0'
		And I select 'hour' on the element on index '0'
		And I select 'minute' on the element on index '0'		
		Given '1' element exists with 'css:label[data-qa="policy-description-persist-raw-data"]'
		Then I click on the element on index '0'
		
		# Select all values in drop down Storage level
		Given '1' element exists with 'css:select[data-qa="policy-description-storage-level-data"]'
		Then I select 'DISK_ONLY' on the element on index '0'
		Then I select 'DISK_ONLY_2' on the element on index '0'
		Then I select 'MEMORY_ONLY' on the element on index '0'
		Then I select 'MEMORY_ONLY_2' on the element on index '0'
		Then I select 'MEMORY_ONLY_SER' on the element on index '0'
		Then I select 'MEMORY_ONLY_SER_2' on the element on index '0'
		Then I select 'MEMORY_AND_DISK' on the element on index '0'
		Then I select 'MEMORY_AND_DISK_2' on the element on index '0'
		Then I select 'MEMORY_AND_DISK_SER' on the element on index '0'
		Then I select 'MEMORY_AND_DISK_SER_2' on the element on index '0'

				
		
		
		
		