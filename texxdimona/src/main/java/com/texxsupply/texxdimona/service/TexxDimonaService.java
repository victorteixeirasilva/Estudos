package com.texxsupply.texxdimona.service;

import com.texxsupply.texxdimona.model.dimona.OrderDimona;
import com.texxsupply.texxdimona.model.wordpress.LineItem;
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

        List<OrderWorpress> ordersToDimona = new ArrayList<>();

        for (OrderWorpress order: orders) {
            List<LineItem> lineItems = order.getLine_items();

            if (!lineItems.isEmpty()&&order.getStatus().equals("processing")){
                for (LineItem lineItem: lineItems) {
                    if (lineItem.getSku()==""||lineItem.getSku()==null){
                        lineItems.remove(lineItem);
                    }  else if (!lineItems.isEmpty()){
                        ordersToDimona.add(order);
                    }
                }
            }
        }


        if (!ordersToDimona.isEmpty()){
            for (int i = 0; i < ordersToDimona.size(); i++) {
                OrderWorpress orderWorpressAux = ordersToDimona.get(i);
                if (orderWorpressAux.getStatus().equals("processing")){
                   OrderDimona orderDimona = new OrderDimona(orderWorpressAux);
                   if(!orderDimona.getItems().isEmpty()){
                       dimonaService.insertOrder(orderDimona);
                   }
               }
            }
                try {
                    return ResponseEntity.ok(ordersToDimona);
                } catch (Exception e) {
                    return new ResponseEntity(HttpStatus.CONFLICT);
                }
        } else {
            return new ResponseEntity(HttpStatus.NOT_FOUND);
        }
    }

}
