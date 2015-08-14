package com.stratio.tests.fragments;

import org.testng.annotations.Test;

import com.stratio.cucumber.testng.CucumberRunner;
import com.stratio.tests.utils.BaseTest;

import cucumber.api.CucumberOptions;

@CucumberOptions(features = { "src/test/resources/features/deleteFragments.feature" })
public class Delete extends BaseTest {

    public Delete() {
    }

    @Test(enabled = true)
    public void fragmentsTest() throws Exception {
        new CucumberRunner(this.getClass()).runCukes();
    }
}