package one.digitalinnovation.pradoesprojetospring.controller;

import one.digitalinnovation.pradoesprojetospring.model.Cliente;
import one.digitalinnovation.pradoesprojetospring.service.ClienteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

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

    private ClienteService clienteService = new ClienteService() {
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
    };

    @GetMapping
    public ResponseEntity<Iterable<Cliente>> buscarTodos(){
        return ResponseEntity.ok(clienteService.buscarTodos());
    }

    @GetMapping("/{id}")
    public ResponseEntity<Cliente> buscarPorId(@PathVariable Long id){
        return ResponseEntity.ok(clienteService.buscarPorId(id));
    }

    @PostMapping
    public ResponseEntity<Cliente> inserir(@RequestBody Cliente cliente){
        clienteService.inserir(cliente);
        return ResponseEntity.ok(cliente);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Cliente> atualizar(@PathVariable long id, @RequestBody Cliente cliente){
        clienteService.atualizar(id, cliente);
        return ResponseEntity.ok(cliente);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deletar(@PathVariable Long id){
        clienteService.deletar(id);
        return ResponseEntity.ok().build();
    }





















}
