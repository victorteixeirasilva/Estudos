package one.digitalinnovation.pradoesprojetospring.service;

import one.digitalinnovation.pradoesprojetospring.model.Endereco;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Cliente HTTP, criado via <b>OpenFeign</b>, para o consumo da API do <b>ViaCEP</b>.
 *
 * @see <a href="https://spring.io/projects/spring-cloud-openfeign">Spring Cloud OpenFeign</a>
 * @see <a href="https://viacep.com.br">ViaCEP</a>
 *
 * @author victorteixeirasilva
 *
 * */

@Service
@FeignClient(name = "viacep", url = "https://viacep.com.br/ws")
public interface ViaCepService {

    @GetMapping("/{cep}/json/")
    public Endereco consultarCep(@PathVariable("cep") String cep);
}