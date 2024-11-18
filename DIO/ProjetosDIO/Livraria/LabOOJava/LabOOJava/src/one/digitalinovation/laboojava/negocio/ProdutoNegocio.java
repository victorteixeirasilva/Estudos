package one.digitalinovation.laboojava.negocio;

import one.digitalinovation.laboojava.basedados.Banco;
import one.digitalinovation.laboojava.entidade.Caderno;
import one.digitalinovation.laboojava.entidade.Livro;
import one.digitalinovation.laboojava.entidade.Produto;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**
 * Classe para manipular a entidade {@link Produto}.
 * @author Victor Teixeira Silva.
 */
public class ProdutoNegocio {

    /**
     * {@inheritDoc}.
     */
    private Banco bancoDados;

    /**
     * Construtor.
     * @param banco Banco de dados para ter armazenar e ter acesso os produtos
     */
    public ProdutoNegocio(Banco banco) {
        this.bancoDados = banco;
    }

    /**
     * Salva um novo produto(livro ou caderno) na loja.
     * @param novoProduto Livro ou caderno que pode ser vendido
     */
    public void salvar(Produto novoProduto) {

        String codigo = "PR%04d";
        codigo = String.format(codigo, bancoDados.getProdutos().length);
        novoProduto.setCodigo(codigo);

        boolean produtoRepetido = false;
        for (Produto produto: bancoDados.getProdutos()) {
            if (produto.getCodigo() == novoProduto.getCodigo()) {
                produtoRepetido = true;
                System.out.println("Produto já cadastrado.");
                break;
            }
        }

        if (!produtoRepetido) {
            this.bancoDados.adicionarProduto(novoProduto);
            System.out.println("Produto cadastrado com sucesso.");
        }
    }

    /**
     * Exclui um produto pelo código de cadastro.
     * @param codigo Código de cadastro do produto
     */
    public void excluir(String codigo) {
        //TODO Implementar a exclusão
        int produtoExclusao = -1;

        for (int i = 0; i < bancoDados.getProdutos().length; i++) {

            Produto produto = bancoDados.getProdutos()[i];
            if (produto.getCodigo().equals(codigo)){
                produtoExclusao = i;
                break;
            }
        }

        if (produtoExclusao != -1) {
            bancoDados.removerProduto(produtoExclusao);
            System.out.println("Produto excluído com sucesso.");
        } else {
            System.out.println("Produto inexistente.");
        }
    }




    /**
     * Obtem um produto a partir de seu código de cadastro.
     * @param codigo Código de cadastro do produto
     * @return Optional indicando a existência ou não do Produto
     */
    public Optional<Produto> consultar(String codigo) {

        for (Produto produto: bancoDados.getProdutos()) {

            if (produto.getCodigo().equalsIgnoreCase(codigo)) {
                return  Optional.of(produto);
            }
        }

        return Optional.empty();
    }

    /**
     * Lista todos os produtos cadastrados.
     */
    public void listarTodos() {

        if (bancoDados.getProdutos().length == 0) {
            System.out.println("Não existem produtos cadastrados");
        } else {

            for (Produto produto: bancoDados.getProdutos()) {
                System.out.println(produto.toString());
            }
        }
    }

    /**
     * Cosulta um livro pelo seu nome.
     * @param nomeLivro
     */
    public void consultaLivro(String  nomeLivro){

        if (bancoDados.getProdutos().length == 0) {
            System.out.println("Não existem produtos cadastrados");
        } else {
            List<Livro> livros = new ArrayList<>();

            for (Produto produto : bancoDados.getProdutos()){
                if (produto instanceof Livro) {
                    Livro livro = (Livro) produto;

                    if (nomeLivro.equalsIgnoreCase(livro.getNome())){
                        livros.add(livro);
                    } else {
                        System.out.println("Não existe nenhum livro com esse nome ("+nomeLivro+").");
                    }

                } else {
                    System.out.println("Não existem produtos do tipo (LIVRO), cadastrados!");
                }
            }

            for (Livro livro : livros){
                System.out.println(livro.toString());
            }
        }



    }

    /**
     * Lista todos os livros de uma quantidade de matérias especificas.
     * @param qtdMateria
     */
    public void listarMateria(String qtdMateria) {
        if (bancoDados.getProdutos().length == 0) {
            System.out.println("Não existem produtos cadastrados");
        } else {
            List<Caderno> listaMaterias = new ArrayList<>();

            for (Produto produto : bancoDados.getProdutos()){
                if (produto instanceof Caderno) {
                    Caderno caderno = (Caderno) produto;

                    if (qtdMateria.equalsIgnoreCase(caderno.getQtdMaterias().toString())){
                        listaMaterias.add(caderno);
                    } else {
                        System.out.println("Não existem cadernos cadastrados com essa quantidade de materias ("+qtdMateria+")");
                    }
                } else {
                    System.out.println("Não existem produtos do tipo (CADERNO), cadastrados!");
                }
            }

            for (Caderno caderno : listaMaterias){
                System.out.println(caderno.toString());
            }

        }

    }
}