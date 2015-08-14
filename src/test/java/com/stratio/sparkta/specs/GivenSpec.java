package com.stratio.sparkta.specs;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;

import org.json.JSONArray;
import org.json.JSONObject;
import org.testng.Assert;

import com.ning.http.client.ListenableFuture;
import com.ning.http.client.Request;
import com.ning.http.client.Response;

import cucumber.api.java.en.Given;

public class GivenSpec extends BaseSpec {

    String inputFragment = "{\"fragmentType\": \"input\",\"name\": \"twitter\",\"description\": \"twitter input\",\"shortDescription\": \"twitter input\",\"icon\": \"icon.png\",\"element\": {\"name\": \"in-twitter\",\"type\": \"Twitter\",\"configuration\": {\"consumerKey\": \"*****\",\"consumerSecret\": \"*****\",\"accessToken\": \"*****\",\"accessTokenSecret\": \"*****\"}}}";
    String outputFragment = "{\"fragmentType\": \"output\",\"name\": \"output\",\"description\": \"output example\",\"shortDescription\": \"output example\",\"icon\": \"icon.png\",\"element\": null}";
    
    public GivenSpec(Common spec) {
        this.commonspec = spec;
    }
    
    @Given("^I create '(.*?)' with '(.*?)'$")
    public void createPolicyWith(String element, String name) throws IOException, InterruptedException, ExecutionException {
	Properties defaultProps = new Properties();
	defaultProps.load(new FileInputStream(element + ".properties"));
	String readElement = defaultProps.getProperty(name);
	
	Request request = commonspec.getClient().preparePost(commonspec.getURL() + element).setHeader("Content-Type","application/json").setBody(readElement).build();
	ListenableFuture<Response> response = commonspec.getClient().executeRequest(request);
	commonspec.setResponse(element, response.get());
    }
    
//    @Given("^I create fragment '(.*?)'$")
//    public void createFragmentOfType(String fragmentName) throws IOException, InterruptedException, ExecutionException {
//	Properties defaultProps = new Properties();
//	defaultProps.load(new FileInputStream("fragment.properties"));
//	String fragment = defaultProps.getProperty(fragmentName);
//
//	Request request = commonspec.getClient().preparePost(commonspec.getURL() + "fragment").setHeader("Content-Type","application/json").setBody(fragment).build();
//
//	ListenableFuture<Response> response = commonspec.getClient().executeRequest(request);
//	commonspec.setResponse("fragment", response.get());
//    }
    
    @Given("^I have finished feature$")
    public void cleanUp() throws IOException, InterruptedException, ExecutionException {
	// Check all available input fragments and delete them
	Future<Response> response = commonspec.getClient().prepareGet(commonspec.getURL() + "fragment/input").execute();
	
	String responseBody = response.get().getResponseBody();
	JSONArray bodyJson = new JSONArray(responseBody);

	String fragmentName = "";
	JSONObject fragment;
	if (bodyJson.length() > 0) {
	    for (int i = 0; i < bodyJson.length(); i++) {
		fragment = (JSONObject) bodyJson.get(i);
		fragmentName = fragment.getString("name");
		response = commonspec.getClient().prepareDelete(commonspec.getURL() + "fragment/input/" + fragmentName).execute();
		
		Assert.assertEquals(response.get().getStatusCode(), 200);
		Assert.assertEquals(response.get().getStatusText(), "OK");
	    }
	}

	// Check all available output fragments and delete them
	response = commonspec.getClient().prepareGet(commonspec.getURL() + "fragment/output").execute();
	responseBody = response.get().getResponseBody();
	bodyJson = new JSONArray(responseBody);

	if (bodyJson.length() > 0) {
	    for (int i = 0; i < bodyJson.length(); i++) {
		fragment = (JSONObject) bodyJson.get(i);
		fragmentName = fragment.getString("name");
		response = commonspec.getClient().prepareDelete(commonspec.getURL() + "fragment/output/" + fragmentName).execute();
		
		Assert.assertEquals(response.get().getStatusCode(), 200);
		Assert.assertEquals(response.get().getStatusText(), "OK");
	    }
	}

	// Check all available policies and delete them
	response = commonspec.getClient().prepareGet(commonspec.getURL() + "policy/all").execute();
	responseBody = response.get().getResponseBody();
	bodyJson = new JSONArray(responseBody);

	String policyName = "";
	JSONObject policy;
	if (bodyJson.length() > 0) {
	    for (int i = 0; i < bodyJson.length(); i++) {
		policy = (JSONObject) bodyJson.get(i);
		policyName = policy.getString("name");
		response = commonspec.getClient().prepareDelete(commonspec.getURL() + "policy/" + policyName).execute();
		
		Assert.assertEquals(response.get().getStatusCode(), 200);
		Assert.assertEquals(response.get().getStatusText(), "OK");
	    }
	}
    }
}