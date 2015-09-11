package com.stratio.tests.gui.inputs;

import org.testng.annotations.Test;

import com.stratio.cucumber.testng.CucumberRunner;
import com.stratio.tests.utils.BaseTest;

import cucumber.api.CucumberOptions;

@CucumberOptions(features = { "src/test/resources/features/gui/filterInputs.feature" })
public class Filter extends BaseTest {

    public Filter() {
    }

    @Test(enabled = true)
    public void filterTest() throws Exception {
        new CucumberRunner(this.getClass()).runCukes();
    }
}