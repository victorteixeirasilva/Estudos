package one.digitalinnovation.pradoesprojetospring.service.imp;

import one.digitalinnovation.pradoesprojetospring.model.Cliente;
import one.digitalinnovation.pradoesprojetospring.service.ClienteService;
import org.springframework.stereotype.Component;

@Component
public class ClienteServiceImp implements ClienteService {
    @Override
    public Iterable<Cliente> buscarTodos() {
        return null;
    }

    @Override
    public Cliente buscarPorId(Long id) {
        return null;
    }

    @Override
    public void inserir(Cliente cliente) {

    }

    @Override
    public void atualizar(Long id, Cliente cliente) {

    }

    @Override
    public void deletar(Long id) {

    }
}