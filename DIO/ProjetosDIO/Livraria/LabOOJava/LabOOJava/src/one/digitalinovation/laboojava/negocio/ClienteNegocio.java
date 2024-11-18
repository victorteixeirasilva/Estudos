package one.digitalinovation.laboojava.negocio;

import one.digitalinovation.laboojava.basedados.Banco;
import one.digitalinovation.laboojava.entidade.Cliente;
import one.digitalinovation.laboojava.utilidade.LeitoraDados;

import java.util.Optional;

/**
 * Classe para manipular a entidade {@link Cliente}.
 * @author Victor Teixeira Silva.
 */
public class ClienteNegocio {

    /**
     * {@inheritDoc}.
     */
    private Banco bancoDados;

    /**
     * Construtor.
     * @param banco Banco de dados para ter acesso aos clientes cadastrados
     */
    public ClienteNegocio(Banco banco) {
        this.bancoDados = banco;
    }

    /**
     * Consulta o cliente pelo seu CPF.
     * @param cpf CPF de um cliente
     * @return O cliente que possuir o CPF passado.
     */
    public Optional<Cliente> consultar(String cpf) {

        for (Cliente cliente : bancoDados.getClientes()) {
            if (cliente.getCpf().equals(cpf)){
                return Optional.of(cliente);
            }
        }
        return Optional.empty();
    }


    /**
     * Cadastra um novo cliente.
     * @param cliente Novo cliente que terá acesso a aplicação
     */
    public void cadastrarCliente(Cliente cliente) {
        bancoDados.adicionarCliente(cliente);
    }


    /**
     * Exclui um cliente específico.
     * @param cliente Objeto do tipo cliente
     */
    //TODO Fazer a exclusão de cliente
    public  void excluirCliente(Cliente cliente)  {
        bancoDados.removerCliente(cliente);
    }

}