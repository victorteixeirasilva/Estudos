package com.texxsupply.texxdimona.service;

import feign.RequestInterceptor;
import feign.RequestTemplate;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class FeignConfig {

    private final String apiKey = "9217f3e9236be7e518dc80f18d8d7298";

    @Bean
    public RequestInterceptor apiKeyInterceptor() {
        return new RequestInterceptor() {
            @Override
            public void apply(RequestTemplate template) {
                template.header("API-Key", apiKey);
            }
        };
    }
}
