package com.texxsupply.texxdimona.service;

import com.texxsupply.texxdimona.model.wordpress.OrderWorpress;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Service
@FeignClient(name = "texxsupply", url = "https://www.texxsupply.com/wp-json/wc/v2/orders?consumer_key=ck_497317d42594afe4a8e61ae925cf8c939bc4c8b7&consumer_secret=cs_b6140b278401530c34bbc4e270d0d7b68abb8987")
public interface WordpressService {

    @GetMapping
    public List<OrderWorpress> getOrders();
}
