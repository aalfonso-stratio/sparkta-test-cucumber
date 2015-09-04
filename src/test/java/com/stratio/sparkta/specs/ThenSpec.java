package com.stratio.sparkta.specs;

import static com.stratio.assertions.Assertions.assertThat;
import cucumber.api.java.en.Then;

public class ThenSpec extends BaseSpec {

    public ThenSpec(Common spec) {
        this.commonspec = spec;
    }

//    @Then("^the service response status must be '(.*?)'.$")
//    public void assertResponseStatus(Integer expectedStatus) {
//        commonspec.getLogger().info("Verifying response message");
//        assertThat(commonspec.getResponse()).hasStatusCode(expectedStatus);
//    }
//    
//    @Then("^the service response must contain the text '(.*?)'$")
//    public void assertResponseMessage(String expectedText) {
//        commonspec.getLogger().info("Verifying response message");
//        assertThat(commonspec.getResponse()).hasMessage(expectedText);
//    }
//
//    @Then("^the service response must NOT contain the text '(.*?)'$")
//    public void assertNegativeResponseMessage(String expectedText) {
//        commonspec.getLogger().info("Verifying response message");
//        assertThat(commonspec.getResponse()).doesNotHaveMessage(expectedText);
//    }
//
//    @Then("^the service response status must be '(.*?)' and its response must contain the text '(.*?)'$")
//    public void assertResponseStatusMessage(Integer expectedStatus, String expectedText) {
//        commonspec.getLogger().info("Verifying response status code and message");
//        assertThat(commonspec.getResponse()).hasStatusCodeAndMessage(expectedStatus, expectedText);
//    }
//
//    @Then("^the service response status must NOT be '(.*?)' and its response must NOT contain the text '(.*?)'$")
//    public void assertNegativeResponseStatusMessage(Integer unexpectedStatus, String unexpectedText) {
//        commonspec.getLogger().info("Verifying response status code and message");
//        assertThat(commonspec.getResponse()).doesNotHaveStatusCodeNorMessage(unexpectedStatus, unexpectedText);
//    }
//        
//    @Then("^the service response status must be '(.*?)' and its response length must be '(.*?)'$")
//    public void assertResponseStatusLength(Integer expectedStatus, Integer expectedLength) {
//        commonspec.getLogger().info("Verifying response status code and response length");
//        assertThat(commonspec.getResponse()).hasStatusCodeAndLength(expectedStatus, expectedLength);
//    }
       
}