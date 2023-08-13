package com.texxsupply.texxdimona.model.wordpress;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class MetaDatum {

    private Integer id;
    private String key;
    private String value;

}