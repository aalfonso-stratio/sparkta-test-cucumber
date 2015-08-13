package com.stratio.tests;

import org.testng.annotations.Test;

import com.stratio.cucumber.testng.CucumberRunner;
import com.stratio.tests.utils.BaseTest;

import cucumber.api.CucumberOptions;

@CucumberOptions(features = { "src/test/resources/features/getAllPoliciesEmptyList.feature" })
public class GetAllPoliciesEmptyList extends BaseTest {

    public GetAllPoliciesEmptyList() {
    }

    @Test(enabled = true)
    public void msTest() throws Exception {
        new CucumberRunner(this.getClass()).runCukes();
    }
}
