package com.stratio.sparkta.tests_at.api.fragments;

import org.testng.annotations.Test;

import com.stratio.cucumber.testng.CucumberRunner;
import com.stratio.tests.utils.BaseTest;

import cucumber.api.CucumberOptions;

@CucumberOptions(features = { "src/test/resources/features/api/fragments/postFragments.feature" })
public class Post extends BaseTest {

    public Post() {
    }

    @Test(enabled = true, groups = {"api"})
    public void fragmentsTest() throws Exception {
        new CucumberRunner(this.getClass()).runCukes();
    }
}