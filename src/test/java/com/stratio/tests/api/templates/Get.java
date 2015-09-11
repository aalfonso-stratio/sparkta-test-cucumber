package com.stratio.tests.api.templates;

import org.testng.annotations.Test;

import com.stratio.cucumber.testng.CucumberRunner;
import com.stratio.tests.utils.BaseTest;

import cucumber.api.CucumberOptions;

@CucumberOptions(features = { "src/test/resources/features/api/getTemplates.feature" })
public class Get extends BaseTest {

    public Get() {
    }

    @Test(enabled = true)
    public void templatesTest() throws Exception {
        new CucumberRunner(this.getClass()).runCukes();
    }
}