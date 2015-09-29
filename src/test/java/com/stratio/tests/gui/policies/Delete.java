package com.stratio.tests.gui.policies;

import org.testng.annotations.Factory;
import org.testng.annotations.Test;

import com.stratio.cucumber.testng.CucumberRunner;
import com.stratio.data.BrowsersDataProvider;
import com.stratio.tests.utils.BaseTest;

import cucumber.api.CucumberOptions;

@CucumberOptions(features = { "src/test/resources/features/gui/policies/deletePolicy.feature" })
public class Delete extends BaseTest {
    
    @Factory(enabled = false, dataProviderClass = BrowsersDataProvider.class, dataProvider = "availableUniqueBrowsers")
    public Delete(String browser) {
	this.browser = browser;
    }

    @Test(enabled = true)
    public void checkElementsTest() throws Exception {
        new CucumberRunner(this.getClass()).runCukes();
    }
}