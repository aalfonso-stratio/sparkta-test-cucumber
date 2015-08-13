package com.stratio.sparkta.specs;

import java.io.IOException;
import java.util.List;

import com.ning.http.client.AsyncHttpClient;
import com.ning.http.client.Response;
import com.ning.http.client.cookie.Cookie;
import com.stratio.specs.CommonG;
import com.stratio.tests.utils.HttpResponse;

public class Common extends CommonG {

    private AsyncHttpClient client;
    private String URL;
    private HttpResponse response;

    public AsyncHttpClient getClient() {
        return client;
    }

    public void setClient(AsyncHttpClient client) {
        this.client = client;
    }

    public String getURL() {
        return URL;
    }

    public void setURL(String uRL) {
        URL = uRL;
    }

    public HttpResponse getResponse() {
        return response;
    }

    public void setResponse(String endpoint, Response response) throws IOException {

        Integer statusCode = response.getStatusCode();
        String httpResponse = response.getResponseBody();
        List<Cookie> cookies = response.getCookies();
        this.response = new HttpResponse(statusCode, httpResponse, cookies);
    }
}
