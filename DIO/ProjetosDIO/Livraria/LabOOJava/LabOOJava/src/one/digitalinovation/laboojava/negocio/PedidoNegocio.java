package one.digitalinovation.laboojava.negocio;

import one.digitalinovation.laboojava.basedados.Banco;
import one.digitalinovation.laboojava.entidade.Cliente;
import one.digitalinovation.laboojava.entidade.Cupom;
import one.digitalinovation.laboojava.entidade.Pedido;
import one.digitalinovation.laboojava.entidade.Produto;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

/**
 * Classe para manipular a entidade {@link Pedido}.
 * @author thiago leite
 */
public class PedidoNegocio {

    /**
     * {@inheritDoc}.
     */
    private Banco bancoDados;


    private ClienteNegocio clienteNegocio;

    /**
     * Construtor.
     * @param banco Banco de dados para ter armazenar e ter acesso os pedidos
     */
    public PedidoNegocio(Banco banco) {
        this.bancoDados = banco;
    }

    private double calcularTotal(List<Produto> produtos, Cupom cupom) {

        double total = 0.0;
        for (Produto produto: produtos) {
            total += produto.calcularFrete();
        }

        if (cupom != null) {
            return  total * (1 - cupom.getDesconto());
        } else {
            return  total;
        }

    }

    /**
     * Salva um novo pedido sem cupom de desconto.
     * @param novoPedido Pedido a ser armazenado
     */
    public void salvar(Pedido novoPedido, Cliente clienteLogado) {
        salvar(novoPedido, null, clienteLogado);
    }

    /**
     * Salva um novo pedido com cupom de desconto.
     * @param novoPedido Pedido a ser armazenado
     * @param cupom Cupom de desconto a ser utilizado
     */
    public void salvar(Pedido novoPedido, Cupom cupom, Cliente clienteLogado) {

        String codigo = "PE%4d%2d%04d";
        LocalDate hoje = LocalDate.now();
        codigo = String.format(codigo, hoje.getYear(), hoje.getMonthValue(), bancoDados.getPedidos().length);
        novoPedido.setCodigo(codigo);
        novoPedido.setCliente(clienteLogado);
        novoPedido.setTotal(calcularTotal(novoPedido.getProdutos(), cupom));
        bancoDados.adicionarPedido(novoPedido);
        System.out.println("Pedido salvo com sucesso.");

    }

    /**
     * Exclui um pedido a partir de seu código de rastreio.
     * @param codigo Código do pedido
     */
    public void excluir(String codigo) {

        int pedidoExclusao = -1;
        for (int i = 0; i < bancoDados.getPedidos().length; i++) {

            Pedido pedido = bancoDados.getPedidos()[i];
            if (pedido.getCodigo().equals(codigo)) {
                pedidoExclusao = i;
                break;
            }
        }

        if (pedidoExclusao != -1) {
            bancoDados.removerPedido(pedidoExclusao);
            System.out.println("Pedido excluído com sucesso.");
        } else {
            System.out.println("Pedido inexistente.");
        }
    }

    /**
     * Lista todos os pedidos realizados.
     */
    public void listarPedidos(){
        List<Pedido> pedidos = List.of(bancoDados.getPedidos());
        for (Pedido pedido : pedidos){
            System.out.println(pedido.toString());
        }
    }

    /**
     * Obtem um pedido a partir de seu código de cadastro.
     * @param codigo Código de cadastro do pedido
     * @return Optional indicando a existência ou não do Pedido
     */
    public Optional<Pedido> consultar(String codigo) {

        for (Pedido pedido: bancoDados.getPedidos()) {

            if (pedido.getCodigo().equalsIgnoreCase(codigo)) {
                return  Optional.of(pedido);
            }
        }

        return Optional.empty();
    }

}