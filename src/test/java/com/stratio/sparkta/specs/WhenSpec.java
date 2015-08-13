package com.stratio.sparkta.specs;

import java.io.IOException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;

import com.ning.http.client.Response;

import cucumber.api.java.en.When;

public class WhenSpec extends BaseSpec {

    public WhenSpec(Common spec) {
        this.commonspec = spec;
    }

    @When("^I try to get all available policies$")
    public void getAllPoliciesEmptyList() throws IOException, InterruptedException, ExecutionException {
        Future<Response> response = commonspec.getClient().prepareGet(commonspec.getURL() + "policy/all").execute();

        commonspec.setResponse("policy", response.get());
    }
}
