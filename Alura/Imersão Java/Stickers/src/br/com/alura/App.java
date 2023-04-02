package br.com.alura;

import java.util.List;


public class App {

	public static void main(String[] args) throws Exception{
		//Criando objetos
		ClienteHTTP http = new ClienteHTTP(); // Objeto da Classe ClienteHTTP para conexao com a API
		GeradoraDeStickers gerador = new GeradoraDeStickers(); // Objeto da classe GeradoraDeStickers para gerar as imagens local
		ExtratorDeConteudoFilmes extrator = new ExtratorDeConteudoFilmes(); //Objeto da Classe ExtratorDeConteudosFilmas para estrair o titulo e link da imagem de dentro do arquivo JSON da API
		
		// Fazer uma conexão HTTP e buscar os top 250 filmes		
		String json = http.buscarDados("https://raw.githubusercontent.com/alura-cursos/imersao-java-2-api/main/TopMovies.json");
		
		// Exibir e manipular os dados
		System.out.println("!!!!!!!! CONSUMINDO UMA API !!!!!!!!!");
		System.out.println();
		List<Conteudo> conteudos = extrator.extraiConteudos(json);
		for (Conteudo conteudo : conteudos) {
			System.out.print("NOME: ");
			System.out.println(conteudo.getTitulo());
			gerador.cria(conteudo.getTitulo(), conteudo.getUrlImagem());
			System.out.println("IMAGEM GERADA!");
			System.out.println();
		}
	}

}


