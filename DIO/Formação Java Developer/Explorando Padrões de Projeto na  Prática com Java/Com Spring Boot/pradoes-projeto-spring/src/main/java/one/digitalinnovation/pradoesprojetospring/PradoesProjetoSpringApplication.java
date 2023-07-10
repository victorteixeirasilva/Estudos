package one.digitalinnovation.pradoesprojetospring;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@EnableFeignClients
public class PradoesProjetoSpringApplication {

	public static void main(String[] args) {
		SpringApplication.run(PradoesProjetoSpringApplication.class, args);
	}

}
