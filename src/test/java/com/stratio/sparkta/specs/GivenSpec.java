package com.stratio.sparkta.specs;

import java.io.IOException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;

import org.json.JSONArray;
import org.json.JSONObject;
import org.testng.Assert;

import com.ning.http.client.Response;

import cucumber.api.java.en.Given;

public class GivenSpec extends BaseSpec {
   
    public GivenSpec(Common spec) {
	this.commonspec = spec;
    }
    
    @Given("^I have finished feature in '([^:]+?)':'([^:]+?)'$")
    public void cleanUp(String host, String port) throws IOException, InterruptedException, ExecutionException {
	// Check all available input fragments and delete them
	
	String uRL = "http://" + host + ":" + port + "/";
	
	Future<Response> response = commonspec.getClient().prepareGet(uRL + "fragment/input").execute();
	
	String responseBody = response.get().getResponseBody();
	JSONArray bodyJson = new JSONArray(responseBody);

	String fragmentName = "";
	String fragmentId = "";
	JSONObject fragment;
	if (bodyJson.length() > 0) {
	    for (int i = 0; i < bodyJson.length(); i++) {
		fragment = (JSONObject) bodyJson.get(i);
		fragmentName = fragment.getString("name");
		fragmentId = fragment.getString("id");
		response = commonspec.getClient().prepareDelete(uRL + "fragment/input/" + fragmentId).execute();
		
		Assert.assertEquals(response.get().getStatusCode(), 200);
		Assert.assertEquals(response.get().getStatusText(), "OK");
	    }
	}

	// Check all available output fragments and delete them
	response = commonspec.getClient().prepareGet(uRL + "fragment/output").execute();
	responseBody = response.get().getResponseBody();
	bodyJson = new JSONArray(responseBody);

	if (bodyJson.length() > 0) {
	    for (int i = 0; i < bodyJson.length(); i++) {
		fragment = (JSONObject) bodyJson.get(i);
		fragmentName = fragment.getString("name");
		fragmentId = fragment.getString("id");
		response = commonspec.getClient().prepareDelete(uRL + "fragment/output/" + fragmentId).execute();
		
		Assert.assertEquals(response.get().getStatusCode(), 200);
		Assert.assertEquals(response.get().getStatusText(), "OK");
	    }
	}

	// Check all available policies and delete them
	response = commonspec.getClient().prepareGet(uRL + "policy/all").execute();
	responseBody = response.get().getResponseBody();
	bodyJson = new JSONArray(responseBody);

	String policyName = "";
	String policyId = "";
	JSONObject policy;
	if (bodyJson.length() > 0) {
	    for (int i = 0; i < bodyJson.length(); i++) {
		policy = (JSONObject) bodyJson.get(i);
		policyName = policy.getString("name");
		policyId = policy.getString("id");
		response = commonspec.getClient().prepareDelete(uRL + "policy/" + policyId).execute();
		
		Assert.assertEquals(response.get().getStatusCode(), 200);
		Assert.assertEquals(response.get().getStatusText(), "OK");
	    }
	}
    }
    
}