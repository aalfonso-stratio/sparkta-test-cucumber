package com.stratio.sparkta.specs;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;
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
    
    @When("^I try to get all available '(.*?)' of type '(.*?)'$")
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
}
