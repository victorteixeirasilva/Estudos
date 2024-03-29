package one.digitalinnovation.pradoesprojetospring.controller;

import one.digitalinnovation.pradoesprojetospring.model.Cliente;
import one.digitalinnovation.pradoesprojetospring.model.Endereco;
import one.digitalinnovation.pradoesprojetospring.model.form.ClienteForm;
import one.digitalinnovation.pradoesprojetospring.model.form.ClienteUpdateForm;
import one.digitalinnovation.pradoesprojetospring.service.ClienteService;
import one.digitalinnovation.pradoesprojetospring.service.imp.ClienteServiceImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

/**
 * Esse {@link org.springframework.web.bind.annotation.RestController} representa  nossa <b>Facate</b>, pois  abstrai toda
 * a complexidade de integração (Banco de Dados H2 e API do ViaCEP) em uma
 * interface simples e coesa (API REST).
 *
 * @author victorteixeirasilva
 *
 * */
@RestController
@RequestMapping("clientes")
public class ClienteRestController {

    @Autowired
    private ClienteService clienteService;

    @GetMapping
    public ResponseEntity<Iterable<Cliente>> buscarTodos(){
        return ResponseEntity.ok(clienteService.buscarTodos());
    }

    @GetMapping("/{id}")
    public ResponseEntity<Cliente> buscarPorId(@PathVariable Long id){
        return ResponseEntity.ok(clienteService.buscarPorId(id));
    }

    @PostMapping
    public ResponseEntity<Cliente> inserir(@Valid @RequestBody ClienteForm clienteForm){
        Cliente cliente = new Cliente();

        cliente.setNome(clienteForm.getNome());
        cliente.setCpf(clienteForm.getCpf());
        Endereco endereco = new Endereco();
        endereco.setCep(clienteForm.getEnderecoForm().getCep());
        cliente.setEndereco(endereco);

        clienteService.inserir(cliente);
        return ResponseEntity.ok(cliente);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Cliente> atualizar(@PathVariable Long id, @RequestBody ClienteUpdateForm clienteUpdateForm){
        Cliente cliente = new Cliente();
        cliente.setNome(clienteUpdateForm.getNome());
        Endereco endereco = new Endereco();
        endereco.setCep(clienteUpdateForm.getEnderecoForm().getCep());
        cliente.setEndereco(endereco);

        clienteService.atualizar(id, cliente);
        return ResponseEntity.ok(cliente);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deletar(@PathVariable Long id){
        clienteService.deletar(id);
        return ResponseEntity.ok().build();
    }

}