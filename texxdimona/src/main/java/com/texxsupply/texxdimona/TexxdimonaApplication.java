package com.texxsupply.texxdimona;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableFeignClients
public class TexxdimonaApplication {

	public static void main(String[] args) {
		SpringApplication.run(TexxdimonaApplication.class, args);
	}

}
