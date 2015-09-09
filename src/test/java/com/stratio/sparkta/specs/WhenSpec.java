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
import com.stratio.specs.CommonG;

import cucumber.api.java.en.When;

public class WhenSpec extends BaseSpec {

    public WhenSpec(CommonG spec) {
	this.commonspec = spec;
    }
    
    @When("^I delete policy in '(.+?)'$")
    public void deletePolicy(String endPoint) throws Exception {

	String restURL = commonspec.getURL();
	if (restURL == null) {
	    restURL = commonspec.getRestURL();
	    if (restURL == null) {
		throw new Exception("Application URL has not been set");
	    }
	}
	    
	commonspec.getLogger().info("Trying to delete policy with id: {}", Common.previousFragmentID);
	Future<Response> response = commonspec.getClient().prepareDelete(restURL + endPoint + Common.previousPolicyID).execute();

        commonspec.setResponse("policy", response.get());
    }
    
    @When("^I delete fragment in '(.+?)'$")
    public void deleteFragment(String endPoint) throws Exception {

	String restURL = commonspec.getURL();
	if (restURL == null) {
	    restURL = commonspec.getRestURL();
	    if (restURL == null) {
		throw new Exception("Application URL has not been set");
	    }
	}
	    
	commonspec.getLogger().info("Trying to delete fragment with id: {}", Common.previousFragmentID);
	Future<Response> response = commonspec.getClient().prepareDelete(restURL + endPoint + Common.previousFragmentID).execute();

        commonspec.setResponse("fragment", response.get());
    }

    
    
    @When("^I try to get all available policies$")
    public void getAllPolicies() throws IOException, InterruptedException, ExecutionException {
        Future<Response> response = commonspec.getClient().prepareGet(commonspec.getURL() + "policy/all").execute();

        commonspec.setResponse("policy", response.get());
    }
    @When("^I try to get policy with name '(.*?)'$")
    public void getPolicyWithName(String name) throws IOException, InterruptedException, ExecutionException {
	String readElement;
	
	if (name.equals("null")) {
	    readElement = "";
	} else {	
	    Properties defaultProps = new Properties();
	    defaultProps.load(new FileInputStream("policy.properties"));
	    readElement = defaultProps.getProperty(name);
	} 
        Future<Response> response = commonspec.getClient().prepareGet(commonspec.getURL() + "policy/find/" + readElement).execute();

        commonspec.setResponse("policy", response.get());
    }
    
    @When("^I try to get all policies with fragmentType '(.*?)' and name '(.*?)'$")	
    public void getPoliciesWithFragmentTypeAndName(String fragmentType, String fragmentName) throws IOException, InterruptedException, ExecutionException {
	String type;
	String name;
	
	Properties defaultProps = new Properties();
	defaultProps.load(new FileInputStream("policy.properties"));
	
	if (fragmentType.equals("null")) {
	    type = "";
	} else {	
	    type = defaultProps.getProperty(fragmentType);
	}
	
	if (fragmentName.equals("null")) {
	    name = "";
	} else {	
	    name = defaultProps.getProperty(fragmentName);
	}
	
	Future<Response> response = commonspec.getClient().prepareGet(commonspec.getURL() + "policy/fragment/" + type + "/" + name).execute();

        commonspec.setResponse("policy", response.get());
	
    }
    
    @When("^I try to run policy '(.*?)'$")
    public void runPolicy(String policy) throws IOException, InterruptedException, ExecutionException {
	String readElement;
	
	if (policy.equals("null")) {
	    readElement = "";
	} else {	
	    Properties defaultProps = new Properties();
	    defaultProps.load(new FileInputStream("policy.properties"));
	    readElement = defaultProps.getProperty(policy);
	} 
        Future<Response> response = commonspec.getClient().prepareGet(commonspec.getURL() + "policy/run/" + readElement).execute();

        commonspec.setResponse("policy", response.get());
    }
    
    
    @When("^I try to get all available policyContexts$")
    public void getAllPolicyContexts() throws IOException, InterruptedException, ExecutionException {
        Future<Response> response = commonspec.getClient().prepareGet(commonspec.getURL() + "policyContext").execute();

        commonspec.setResponse("policy", response.get());
    }
    
    @When("^I try to get all available '(.*?)' (?:of type|with name) '(.*?)'$")
    public void getAllElementsOfType(String element, String expectedType) throws IOException, InterruptedException, ExecutionException {
	String type = expectedType;
	
	if (expectedType.equals("null")) {
	    type = "";
	}
	
        Future<Response> response = commonspec.getClient().prepareGet(commonspec.getURL() + element + "/" + type).execute();

        commonspec.setResponse(element, response.get());
    }
    
    @When("^I try to get '(.*?)' of type '(.*?)' with name '(.*?)'$")
    public void getAllElementsOfTypeWithName(String element, String expectedType, String expectedName) throws IOException, InterruptedException, ExecutionException {
	String type = expectedType;
	String name = expectedName;
	
	if (expectedType.equals("null")) {
	    type = "";
	}
	
	if (expectedName.equals("null")) {
	    name = "";
	} else {
	    Properties defaultProps = new Properties();
	    defaultProps.load(new FileInputStream(element + ".properties"));
	    name = defaultProps.getProperty(expectedName);
	}
	
        Future<Response> response = commonspec.getClient().prepareGet(commonspec.getURL() + element + "/" + type + "/name/" + name).execute();

        commonspec.setResponse(element, response.get());
    }
    
    @When("^I try to update a '(.*?)' with '(.*?)'$")
    public void updateElementWith(String element, String name) throws IOException, InterruptedException, ExecutionException {
	String readElement = name;
	
	if (name.equals("null")) {
	    readElement = "";
	} else {
	    Properties defaultProps = new Properties();
	    defaultProps.load(new FileInputStream(element + ".properties"));
	    readElement = defaultProps.getProperty(readElement);
	}
	
	Request request = commonspec.getClient().preparePut(commonspec.getURL() + element).setHeader("Content-Type","application/json").setBody(readElement).build();
	ListenableFuture<Response> response = commonspec.getClient().executeRequest(request);
	commonspec.setResponse(element, response.get());
    }
    
    @When("^I try to delete a '(.*?)' with name '(.*?)'.$")
    public void deleteElementWithName(String element, String expectedName) throws IOException, InterruptedException, ExecutionException {
	String name = expectedName;
	
	if (expectedName.equals("null")) {
	    name = "";
	} else {
	    Properties defaultProps = new Properties();
	    defaultProps.load(new FileInputStream(element + ".properties"));
	    name = defaultProps.getProperty(expectedName);
	}
	
	Future<Response> response = commonspec.getClient().prepareDelete(commonspec.getURL() + element + "/" + name).execute();

        commonspec.setResponse(element, response.get());
    }
    
    @When("^I try to delete a '(.*?)' of type '(.*?)' with name '(.*?)'$")
    public void deleteElementOfTypeWithName(String element, String expectedType, String expectedName) throws IOException, InterruptedException, ExecutionException {
	String type = expectedType;
	String name = expectedName;
	String id;
	
	if (expectedType.equals("null")) {
	    type = "";
	}
	
	if (expectedName.equals("null")) {
	    id = "";
	} else if (expectedName.equals("invalid")) {
	    id = "invalid";
	} else {
	    Properties defaultProps = new Properties();
	    defaultProps.load(new FileInputStream(element + ".properties"));
	    name = defaultProps.getProperty(expectedName);
	    Future<Response> responseGET = commonspec.getClient().prepareGet(commonspec.getURL() + element + "/" + type + "/name/" + name).execute();
	    String responseBody = responseGET.get().getResponseBody();
	
	    JSONObject bodyJson = new JSONObject(responseBody);
	    id = bodyJson.getString("id");
	}
	Future<Response> response = commonspec.getClient().prepareDelete(commonspec.getURL() + element + "/" + type + "/" + id).execute();
	commonspec.setResponse(element, response.get());
    }
    
    @When("^I create '(.*?)' with '(.*?)'$")
    public void createElement(String element, String name) throws IOException, InterruptedException, ExecutionException {
	String readElement;
	
	if (name.equals("null")) {
	    readElement = "";
	} else {	
	    Properties defaultProps = new Properties();
	    defaultProps.load(new FileInputStream(element + ".properties"));
	    readElement = defaultProps.getProperty(name);
	}
	
	Request request = commonspec.getClient().preparePost(commonspec.getURL() + element).setHeader("Content-Type","application/json").setBody(readElement).build();
	ListenableFuture<Response> response = commonspec.getClient().executeRequest(request);
	commonspec.setResponse(element, response.get());
    }

}
