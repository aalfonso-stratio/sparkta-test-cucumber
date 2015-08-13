package com.stratio.sparkta.specs;

import java.io.IOException;

import org.apache.http.client.ClientProtocolException;

import com.ning.http.client.AsyncHttpClient;
import com.ning.http.client.AsyncHttpClientConfig;

import cucumber.api.java.After;
import cucumber.api.java.Before;

public class HookSpec extends BaseSpec {

    public HookSpec(Common spec) {
        this.commonspec = spec;
    }

    @Before(order = 10, value = "@rest")
    public void restClientSetup() throws Exception {
        commonspec.getLogger().info("Starting a REST client");

        String host = System.getProperty("SPARKTA_HOST", "localhost");
        String port = System.getProperty("SPARKTA_PORT", "9090");
        commonspec.setURL("http://" + host + ":" + port + "/");

        commonspec.setClient(new AsyncHttpClient(new AsyncHttpClientConfig.Builder().setAllowPoolingConnection(false)
                .build()));        
    }
 
    @After(order = 10, value = "@rest")
    public void restClientTeardown() throws IOException {
        commonspec.getLogger().info("Shutting down REST client");
        commonspec.getClient().close();
    }
}
