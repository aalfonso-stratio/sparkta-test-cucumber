package com.stratio.sparkta.specs;

import cucumber.api.java.en.Given;

public class GivenSpec extends BaseSpec {
   
    public GivenSpec(Common spec) {
	this.commonspec = spec;
    }
    
    @Given("^I wait for '(.+?)' seconds$")
    public void saveElement(int waitTime) throws InterruptedException {
	Thread.sleep(waitTime*1000);
    }
    
}