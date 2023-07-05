package dio.springscopessingletonprototype;

import dio.springscopessingletonprototype.app.SistemaMensagem;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class SpringScopesSingletonPrototypeApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringScopesSingletonPrototypeApplication.class, args);
	}

	@Bean
	public CommandLineRunner run(SistemaMensagem sistema) throws Exception{
		return args -> {
			sistema.enviarConfirmacaoCadastro();
			sistema.enviarMensagemBoasVindas();
			sistema.enviarConfirmacaoCadastro();
		};
	}

}
