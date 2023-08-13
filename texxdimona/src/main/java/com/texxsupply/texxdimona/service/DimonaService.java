package com.texxsupply.texxdimona.service;

import com.texxsupply.texxdimona.model.dimona.OrderDimona;
import feign.Headers;
import feign.RequestLine;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;

@Service
@FeignClient(name = "Dimona", url = "https://camisadimona.com.br/api/v2/order")
public interface DimonaService {

    @Headers({
            "Accept: application/json",
            "Content-Type: application/json",
            "api-key: 9217f3e9236be7e518dc80f18d8d7298"
    })
    @PostMapping
    public ResponseEntity insertOrder(@RequestBody OrderDimona orderDimona);
}
