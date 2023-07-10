package one.digitalinnovation.pradoesprojetospring.service;
import one.digitalinnovation.pradoesprojetospring.model.Cliente;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

/**
 * Interface que define o padrão <b>Strategy</b> no domínio do cliente. Com
 * isso, se necessário, podemos ter multíplas implementações dessa mesma
 * interface.
 *
 * @author victorteixeirasilva
 * */

@Component
public interface ClienteService {

    public Iterable<Cliente> buscarTodos();

    public Cliente buscarPorId(Long id);

    public void inserir(Cliente cliente);

    public void atualizar(Long id, Cliente cliente);

    public void deletar(Long id);


}