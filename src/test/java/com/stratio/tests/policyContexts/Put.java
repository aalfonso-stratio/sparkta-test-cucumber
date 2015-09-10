package com.stratio.tests.policyContexts;

import org.testng.annotations.Test;

import com.stratio.cucumber.testng.CucumberRunner;
import com.stratio.tests.utils.BaseTest;

import cucumber.api.CucumberOptions;

@CucumberOptions(features = { "src/test/resources/features/putPolicyContexts.feature" })
public class Put extends BaseTest {

    public Put() {
    }

    @Test(enabled = true)
    public void fragmentsTest() throws Exception {
        new CucumberRunner(this.getClass()).runCukes();
    }
}