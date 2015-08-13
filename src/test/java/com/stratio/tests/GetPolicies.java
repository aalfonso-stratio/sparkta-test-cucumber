package com.stratio.tests;

import org.testng.annotations.Test;

import com.stratio.cucumber.testng.CucumberRunner;
import com.stratio.tests.utils.BaseTest;

import cucumber.api.CucumberOptions;

@CucumberOptions(features = { "src/test/resources/features/getPolicies.feature" })
public class GetPolicies extends BaseTest {

    public GetPolicies() {
    }

    @Test(enabled = true)
    public void policiesTest() throws Exception {
        new CucumberRunner(this.getClass()).runCukes();
    }
}
