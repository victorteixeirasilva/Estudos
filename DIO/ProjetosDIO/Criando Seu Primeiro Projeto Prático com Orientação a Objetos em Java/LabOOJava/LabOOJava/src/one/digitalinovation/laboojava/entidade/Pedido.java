package one.digitalinovation.laboojava.entidade;

import java.util.ArrayList;
import java.util.List;

/**
 * Classe que representa a entidade pedido, qual é a compra dos produtos por um cliente.
 * @author Victor Teixeira
 */
public class Pedido {

    //codigo
    private String codigo;

    //cliente
    private Cliente cliente;

    //produtos
    private List<Produto> produtos;

    //total
    private double total;

    public Pedido(){
        this.produtos = new ArrayList<>();
    }

    public String getCodigo() {
        return codigo;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public List<Produto> getProdutos() {
        return produtos;
    }

    public double getTotal() {
        return total;
    }

    private String getProdutosComprados() {
        StringBuilder produtos = new StringBuilder();
        produtos.append("[");
        for (Produto produto: getProdutos()){
            produtos.append(produto.toString());
            produtos.append("Qtd:");
            produtos.append(produto.getQuantidade());
            produtos.append(" ");
        }
        produtos.append("]");

        return produtos.toString();
    }

    @Override
    public String toString() {
        return "Pedido{" +
                "codigo=" + codigo + '\'' +
                ", cliente=" + cliente +
                ", produtos=" + getProdutosComprados() +
                ", total=" + total + "}";
    }



}