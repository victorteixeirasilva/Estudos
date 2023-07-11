package one.digitalinnovation.pradoesprojetospring.service.imp;

import one.digitalinnovation.pradoesprojetospring.model.Cliente;
import one.digitalinnovation.pradoesprojetospring.model.Endereco;
import one.digitalinnovation.pradoesprojetospring.repository.ClienteRepository;
import one.digitalinnovation.pradoesprojetospring.repository.EnderecoRepository;
import one.digitalinnovation.pradoesprojetospring.service.ClienteService;
import one.digitalinnovation.pradoesprojetospring.service.ViaCepService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.Optional;

/**
 * Implementação da <b>Strategy</b> {@link  ClienteService}, a qual pode ser
 * injetada pelo Spring (via {@link org.springframework.beans.factory.annotation.Autowired}).
 * Com isso, como essa classe é um {@link org.springframework.stereotype.Service}, ela será
 * tratada como um <b>Singleton</b>.
 *
 * @author victorteixeirasilva
 * */

@Service
public class ClienteServiceImp implements ClienteService {

//    TODO Singleton: Injetar os componentes do Spring com @Autowired.
    @Autowired
    private ClienteRepository clienteRepository;
    @Autowired
    private EnderecoRepository enderecoRepository;
    @Autowired
    private ViaCepService viaCepService;
//    TODO Strategy: Implementar métodos definidos na interface.
//    TODO Facade: Abstrair integrações com subisistemas, provendo uma interface simples.
    @Override
    public Iterable<Cliente> buscarTodos() {
        return clienteRepository.findAll();
    }

    @Override
    public Cliente buscarPorId(Long id) {
        Optional<Cliente> cliente = clienteRepository.findById(id);
        return cliente.get();
    }

    @Override
    public void inserir(Cliente cliente) {
        salvarClienteComCep(cliente);
    }

    @Override
    public void atualizar(Long id, Cliente cliente) {
        Optional<Cliente> clienteBd = clienteRepository.findById(id);
        if(clienteBd.isPresent()){
            salvarClienteComCep(cliente);
        }
    }

    @Override
    public void deletar(Long id) {
        clienteRepository.deleteById(id);
    }

    private void salvarClienteComCep(Cliente cliente) {
        String cep = cliente.getEndereco().getCep();
        Endereco endereco = enderecoRepository.findById(cep).orElseGet(() -> {
            Endereco novoEndereco = viaCepService.consultarCep(cep);
            enderecoRepository.save(novoEndereco);
            return novoEndereco;
        });
        cliente.setEndereco(endereco);
        clienteRepository.save(cliente);
    }
}
































