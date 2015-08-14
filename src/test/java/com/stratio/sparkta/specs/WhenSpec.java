package com.stratio.sparkta.specs;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;

import com.ning.http.client.ListenableFuture;
import com.ning.http.client.Request;
import com.ning.http.client.Response;

import cucumber.api.java.en.When;

public class WhenSpec extends BaseSpec {
    
    public WhenSpec(Common spec) {
        this.commonspec = spec;
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
	
        Future<Response> response = commonspec.getClient().prepareGet(commonspec.getURL() + element + "/" + type + "/" + name).execute();

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
	
	Future<Response> response = commonspec.getClient().prepareDelete(commonspec.getURL() + element + "/" + type + "/" + name).execute();

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
