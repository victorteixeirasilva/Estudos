package com.texxsupply.texxdimona.service;

import com.texxsupply.texxdimona.model.dimona.OrderDimona;
import com.texxsupply.texxdimona.model.wordpress.OrderWorpress;
import feign.Headers;
import feign.RequestLine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.ArrayList;
import java.util.List;

@Service
public class TexxDimonaService {
    @Autowired
    private WordpressService wordpressService;

    @Autowired
    private DimonaService dimonaService;

    private String API_KEY = "9217f3e9236be7e518dc80f18d8d7298";
    private String ACCEPT = "application/json";
    private String CONTENT_TYPE = "application/json";


    public ResponseEntity insertOrder(){
        List<OrderWorpress> orders = wordpressService.getOrders();
        if (!orders.isEmpty()){
            List<OrderDimona> ordersDimona = new ArrayList<>();
            for (int i = 0; i < orders.size(); i++) {
                OrderWorpress orderWorpressAux = orders.get(i);
                if (orderWorpressAux.getStatus().equals("processing")){
                   OrderDimona orderDimona1 = new OrderDimona(orderWorpressAux);
                   if(!orderDimona1.getItems().isEmpty()){
                       ordersDimona.add(orderDimona1);
                       dimonaService.insertOrder(orderDimona1);
                   }
               }
            }
                try {
                    return ResponseEntity.ok(ordersDimona);
                } catch (Exception e) {
                    return new ResponseEntity(HttpStatus.CONFLICT);
                }
        } else {
            return new ResponseEntity(HttpStatus.NOT_FOUND);
        }
    }

}
