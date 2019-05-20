package service;

import java.util.Collections;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.web.client.RestTemplate;


public class CallApiService {
	
	private final String urlRecommendServer = "http://127.0.0.1:5002/";
	private final String passcode = "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJMb2dpbiIsImRhdGEiOnsiaWQiOjEyLCJ1c2VybmFtZSI6ImNhb2RhbzEyMzQzNCJ9LCJpYXQiOjE1NDQxODk5MjMsImV4cCI6MTU0NTA1MzkyM30.P4_BTd-ZuOtvQd0QlazlKigmDl9sVnvoKgjWjXmspdA";
	private static final CallApiService instance = new CallApiService();
	
	private CallApiService() {
		
	}
	
	public static CallApiService getInstance() {
		return instance;
	}
	
	public void callPostFromRecommendServer(LinkedMultiValueMap<String, Object> params, String endPoint) {
        new Thread(new Runnable() {
            @Override
            public void run() {
                final String uri = urlRecommendServer + endPoint;
                RestTemplate restTemplate = new RestTemplate();
                HttpHeaders headers = new HttpHeaders();
                headers.setAccept(Collections.singletonList(org.springframework.http.MediaType.APPLICATION_JSON));
                headers.add("passcode", passcode);
                HttpEntity<LinkedMultiValueMap<String, Object>> requestEntity =
                        new HttpEntity<>(params, headers);
                ResponseEntity<PostApiResponse> responseEntity = restTemplate.exchange(uri, HttpMethod.POST, requestEntity, PostApiResponse.class);
                System.out.println(requestEntity.getBody().toString());
            }
        }).start();
    }
	
	
	public ResponseEntity<ResponseRecommend> callGetRecommendServer(LinkedMultiValueMap<String, Object> params, String endPoint) {
		final String uri = urlRecommendServer + endPoint;
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.setAccept(Collections.singletonList(org.springframework.http.MediaType.APPLICATION_JSON));
        headers.add("passcode", passcode);
        HttpEntity<LinkedMultiValueMap<String, Object>> requestEntity =
                new HttpEntity<>(params, headers);
        ResponseEntity<ResponseRecommend> responseEntity = restTemplate.exchange(uri, HttpMethod.GET, requestEntity, ResponseRecommend.class);
        return responseEntity;
    }
}
