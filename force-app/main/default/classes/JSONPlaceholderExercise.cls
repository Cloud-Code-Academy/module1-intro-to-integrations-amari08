public class JSONPlaceholderExercise {
    private static final String BASE_URL = 'https://jsonplaceholder.typicode.com';
    
    /**
     * Exercise 1: Implement a GET request to fetch a post by ID
     * Endpoint: /posts/{postId}
     * @param postId - The ID of the post to fetch
     * @return String - The JSON response from the API
     */
    public static String getPostById(Integer postId) {
        // TODO: Student Implementation
        // 1. Create a new HTTP request
        HttpRequest request = new HttpRequest();
        // 2. Set the endpoint URL using BASE_URL + '/posts/' + postId
        request.setEndpoint(BASE_URL + '/posts/' + postId);
        // 3. Set the HTTP method to 'GET'
        request.setMethod('GET');
        // 4. Send the request and get the response
        Http http = new Http();
        HttpResponse response = http.send(request);
        // 5. Return the response body as string
        if (response.getStatusCode() == 200) {
            return response.getBody();
        } else {
            throw new CalloutException('HTTP Request failed with status: ' + response.getStatusCode() + ' - ' + response.getStatus());
        }
    }
    
    /**
     * Exercise 2: Implement a POST request to create a new post
     * Endpoint: /posts
     * @param title - The title of the post
     * @param body - The body content of the post
     * @param userId - The user ID creating the post
     * @return String - The JSON response from the API
     */
    public static String createPost(String title, String body, Integer userId) {
        // TODO: Student Implementation
        // 1. Create a new HTTP request
        HttpRequest request = new HttpRequest(); 
        // 2. Set the endpoint URL using BASE_URL + '/posts'
        request.setEndpoint(BASE_URL + '/posts');
        // 3. Set the HTTP method to 'POST'
        request.setMethod('POST');
        // 4. Create a JSON string with the post data
        Map<String, Object> postData = new Map<String, Object>();
        postData.put('title', title);
        postData.put('body', body);
        postData.put('userId', userId);
        String jsonPayload = JSON.serialize(postData);
        // 5. Set the request body
        request.setBody(jsonPayload);
        request.setHeader('Content-Type', 'application/json');
        // 6. Send the request and get the response
        Http http = new Http();
        HttpResponse response = http.send(request);
        // 7. Return the response body as string
        if (response.getStatusCode() == 201 || response.getStatusCode() == 200) {
            return response.getBody();
}       else {
            throw new CalloutException('POST request failed with status: ' + response.getStatusCode());
}
    }
    
    /**
     * Exercise 3: Implement a PUT request to update a post
     * Endpoint: /posts/{postId}
     * @param postId - The ID of the post to update
     * @param title - The new title
     * @param body - The new body content
     * @param userId - The user ID
     * @return String - The JSON response from the API
     */
    public static String updatePost(Integer postId, String title, String body, Integer userId) {
        // TODO: Student Implementation
        // 1. Create a new HTTP request
        HttpRequest request = new HttpRequest();
        // 2. Set the endpoint URL using BASE_URL + '/posts/' + postId
        request.setEndpoint(BASE_URL + '/posts/' + postId);
        // 3. Set the HTTP method to 'PUT'
        request.setMethod('PUT');
        // 4. Create a JSON string with the updated post data
        Map<String, Object> postData = new Map<String, Object>();
        postData.put('id', postId);
        postData.put('title', title);
        postData.put('body', body);
        postData.put('userId', userId);
        String jsonPayload = JSON.serialize(postData);
        // 5. Set the request body
        request.setBody(jsonPayload);
        request.setHeader('Content-Type', 'application/json');
        // 6. Send the request and get the response
        Http http = new Http();
        HttpResponse response = http.send(request);
        // 7. Return the response body as string
        if (response.getStatusCode() == 200) {
            return response.getBody();
}       else {
            throw new CalloutException('PUT request failed with status: ' + response.getStatusCode());
}
    }
    
    /**
     * Exercise 4: Implement a PATCH request to partially update a post
     * Endpoint: /posts/{postId}
     * @param postId - The ID of the post to patch
     * @param title - The new title (can be null)
     * @return String - The JSON response from the API
     */
    public static String patchPostTitle(Integer postId, String title) {
        // TODO: Student Implementation
        // 1. Create a new HTTP request
        HttpRequest request = new HttpRequest();
        // 2. Set the endpoint URL using BASE_URL + '/posts/' + postId
        request.setEndpoint(BASE_URL + '/posts/' + postId);
        // 3. Set the HTTP method to 'PATCH'
        request.setMethod('PATCH');
        // 4. Create a JSON string with only the title
        Map<String, Object> patchData = new Map<String, Object>();
        patchData.put('title', title);
        String jsonPayload = JSON.serialize(patchData);
        // 5. Set the request body
        request.setBody(jsonPayload);
        request.setHeader('Content-Type', 'application/json');
        // 6. Send the request and get the response
        Http http = new Http();
        HttpResponse response = http.send(request);
        // 7. Return the response body as string
        if (response.getStatusCode() == 200) {
            return response.getBody();
}       else {
            throw new CalloutException('PATCH request failed with status: ' + response.getStatusCode());
}
    }
    
    /**
     * Exercise 5: Implement a DELETE request to remove a post
     * Endpoint: /posts/{postId}
     * @param postId - The ID of the post to delete
     * @return Integer - The HTTP status code from the response
     */
    public static Integer deletePost(Integer postId) {
        // TODO: Student Implementation
        // 1. Create a new HTTP request
        HttpRequest request = new HttpRequest();
        // 2. Set the endpoint URL using BASE_URL + '/posts/' + postId
        request.setEndpoint(BASE_URL + '/posts/' + postId);
        // 3. Set the HTTP method to 'DELETE'
        request.setMethod('DELETE');
        // 4. Send the request and get the response
        Http http = new Http();
        HttpResponse response = http.send(request);
        // 5. Return the response status code
        Integer statusCode = response.getStatusCode();
        if (statusCode == 200 || statusCode == 202 || statusCode == 204) {
            return statusCode;
}       else {
            throw new CalloutException('DELETE request failed with status: ' + statusCode + ' - ' + response.getStatus());
}
    }
} 