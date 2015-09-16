package com.stratio.tests.gui.inputs;

import org.testng.annotations.Factory;
import org.testng.annotations.Test;

import com.stratio.cucumber.testng.CucumberRunner;
import com.stratio.data.BrowsersDataProvider;
import com.stratio.tests.utils.BaseTest;

import cucumber.api.CucumberOptions;

@CucumberOptions(features = { "src/test/resources/features/gui/inputs/addNewInputKafkaDirect.feature" })
public class AddNewKafkaDirect extends BaseTest {
    
    @Factory(enabled = false, dataProviderClass = BrowsersDataProvider.class, dataProvider = "availableUniqueBrowsers")
    public AddNewKafkaDirect(String browser) {
	this.browser = browser;
    }

    @Test(enabled = true)
    public void addNewTest() throws Exception {
        new CucumberRunner(this.getClass()).runCukes();
    }
}