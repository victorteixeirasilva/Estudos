package one.digitalinovation.laboojava.console;

import one.digitalinovation.laboojava.basedados.Banco;
import one.digitalinovation.laboojava.entidade.*;
import one.digitalinovation.laboojava.negocio.ClienteNegocio;
import one.digitalinovation.laboojava.negocio.PedidoNegocio;
import one.digitalinovation.laboojava.negocio.ProdutoNegocio;
import one.digitalinovation.laboojava.utilidade.LeitoraDados;

import java.util.Optional;

/**
 * Classe responsável por controlar a execução da aplicação.
 * @author Victor Teixeira Silva
 */
public class Start {

    private static Optional<Cliente> clienteLogado = Optional.empty();

    private static Banco banco = new Banco();

    private static ClienteNegocio clienteNegocio = new ClienteNegocio(banco);
    private static PedidoNegocio pedidoNegocio = new PedidoNegocio(banco);
    private static ProdutoNegocio produtoNegocio = new ProdutoNegocio(banco);

    /**
     * Método utilitário para inicializar a aplicação.
     * @param args Parâmetros que podem ser passados para auxiliar na execução.
     */
    public static void main(String[] args) {

        System.out.println("Bem vindo ao e-Compras");

        String opcao = "";

        clienteLogado = login();

        while(true) {


            if (clienteLogado.isPresent()) {

                System.out.println("Selecione uma opção:");
                System.out.println("1 - Cadastrar Livro");
                System.out.println("2 - Excluir Livro");
                System.out.println("3 - Cadastrar Caderno");
                System.out.println("4 - Excluir Caderno");
                System.out.println("5 - Fazer pedido");
                System.out.println("6 - Excluir pedido");
                System.out.println("7 - Listar produtos");
                System.out.println("8 - Listar pedidos");
                System.out.println("9 - Deslogar");
                System.out.println("10 - Sair");
                System.out.println("11 - Consultar Pedido");
                System.out.println("12 - Consultar Caderno");
                System.out.println("13 - Consultar Livro");

                opcao = LeitoraDados.lerDado();

                switch (opcao) {
                    case "1":
                        Livro livro = LeitoraDados.lerLivro();
                        produtoNegocio.salvar(livro);
                        break;
                    case "2":
                        System.out.println("Digite o código do livro");
                        String codigoLivro = LeitoraDados.lerDado();
                        produtoNegocio.excluir(codigoLivro);
                        break;
                    case "3":
                        Caderno caderno = LeitoraDados.lerCaderno();
                        produtoNegocio.salvar(caderno);
                        break;
                    case "4":
                        System.out.println("Digite o código do Caderno");
                        String codigoCaderno = LeitoraDados.lerDado();
                        produtoNegocio.excluir(codigoCaderno);
                        break;
                    case "5":
                        Pedido pedido = LeitoraDados.lerPedido(banco);
                        Optional<Cupom> cupom = LeitoraDados.lerCupom(banco);

                        if (cupom.isPresent()) {
                            pedidoNegocio.salvar(pedido, cupom.get(), clienteLogado.get());
                        } else {
                            pedidoNegocio.salvar(pedido, null, clienteLogado.get());
                        }
                        break;
                    case "6":
                        System.out.println("Digite o código do pedido");
                        String codigoPedido = LeitoraDados.lerDado();
                        pedidoNegocio.excluir(codigoPedido);
                        break;
                    case "7":
                        produtoNegocio.listarTodos();
                        break;
                    case "8":
                        pedidoNegocio.listarPedidos();
                        break;
                    case "9":
                        System.out.println(String.format("Volte sempre %s!", clienteLogado.get().getNome()));
                        clienteLogado = Optional.empty();
                        break;
                    case "10":
                        System.out.println("Aplicação encerrada.");
                        System.exit(0);
                        break;
                    case "11":
                        System.out.println("Digite o código do pedido");
                        String codPedido = LeitoraDados.lerDado();
                        System.out.println(pedidoNegocio.consultar(codPedido).toString());
                        break;
                    case "12":
                        System.out.println("Digite a quantidade de matérias (M2, M5 e M10)");
                        String qtdMaterias = LeitoraDados.lerDado();
                        produtoNegocio.listarMateria(qtdMaterias);
                        break;
                    case "13":
                        System.out.println("Digite o nome do Livro:");
                        String nomeLivro = LeitoraDados.lerDado();
                        produtoNegocio.consultaLivro(nomeLivro);
                        break;
                    default:
                        System.out.println("Opção inválida.");
                        break;
                }
            }
        }
    }

    /**
     * Procura o usuário na base de dados.
     * @param cpf CPF do usuário que deseja logar na aplicação
     */
    private static Optional<Cliente> identificarUsuario(String cpf) {

        Optional<Cliente> resultado = clienteNegocio.consultar(cpf);

        if (resultado.isPresent()) {

            Cliente cliente = resultado.get();
            System.out.println(String.format("Olá %s! Você está logado.", cliente.getNome()));
            return resultado;

        } else {
            System.out.println("Usuário não cadastrado.");
            System.exit(0);
            return null;
        }
    }

    /**
     * Método responsável por identificar se é um cadastro existente,
     * ou se não existe um cadastro, e por fim retornar um objeto do tipo cliente.
     * @return Cliente.
     */
    private static Optional<Cliente> login(){

        while (true){

            System.out.println("Possui cadastro?");
            System.out.println("Selecione uma opção:");
            System.out.println("1 - SIM!");
            System.out.println("2 - NÃO!");
            System.out.println("3 - SAIR!");

            String opcao = LeitoraDados.lerDado();
            String cpf = "";

            switch (opcao){
                case "1":
                    System.out.println("Digite o cpf:");
                    cpf = LeitoraDados.lerDado();
                    return identificarUsuario(cpf);
                case "2":
                    Cliente cliente = LeitoraDados.lerCliente();
                    clienteNegocio.cadastrarCliente(cliente);
                    break;
                case "3":
                    System.out.println("Aplicação encerrada.");
                    System.exit(0);
                    break;
                default:
                    System.out.println("Opção inválida.");
                    break;
            }

        }
    }
}