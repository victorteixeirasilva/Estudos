package com.texxsupply.texxdimona.model.dimona;

import com.texxsupply.texxdimona.model.wordpress.LineItem;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;


@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class Item {

    private String name;
    private Integer qty;
    private String sku;

    public Item(LineItem lineItem){
        if (lineItem.getSku()!=""){
            this.name = lineItem.getName();
            this.qty = lineItem.getQuantity();
            this.sku = lineItem.getSku();
        }
    }



}