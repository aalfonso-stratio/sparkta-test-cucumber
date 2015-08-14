package com.stratio.tests.policies;

import org.testng.annotations.Test;

import com.stratio.cucumber.testng.CucumberRunner;
import com.stratio.tests.utils.BaseTest;

import cucumber.api.CucumberOptions;

@CucumberOptions(features = { "src/test/resources/features/postPolicies.feature" })
public class Post extends BaseTest {

    public Post() {
    }

    @Test(enabled = true)
    public void policiesTest() throws Exception {
        new CucumberRunner(this.getClass()).runCukes();
    }
}