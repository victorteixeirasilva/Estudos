package com.texxsupply.texxdimona.controller;

import com.sun.net.httpserver.HttpServer;
import com.texxsupply.texxdimona.model.dimona.OrderDimona;
import com.texxsupply.texxdimona.service.TexxDimonaService;
import com.texxsupply.texxdimona.service.WordpressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TexxDimonaController {
    @Autowired
    private TexxDimonaService texxDimonaService;

    @PostMapping
    public ResponseEntity getProductWordpress(){
        try {
            return texxDimonaService.insertOrder();
        } catch (Exception e){
            return new ResponseEntity(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
