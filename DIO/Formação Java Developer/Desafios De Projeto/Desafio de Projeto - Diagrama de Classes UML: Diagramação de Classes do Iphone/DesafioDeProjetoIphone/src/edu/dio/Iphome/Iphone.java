package edu.dio.Iphome;

public class Iphone implements ReprodutorMusical, NavegadorDeInternet, AparelhoTelefonico {

	@Override
	public void tocar() {
		System.out.println("Tocando Música no Iphone!");
	}

	@Override
	public void pausar() {
		System.out.println("Pausando Música no Iphone!");		
	}

	@Override
	public void selecionarMusica() {
		System.out.println("Selecionando Música no Iphone!");
	}

	@Override
	public void ligar() {
		System.out.println("Ligando para alguém pelo Iphone!");
	}

	@Override
	public void atender() {
		System.out.println("Atendendo ligação pelo Iphone!");
	}

	@Override
	public void iniciarCorreioDeVoz() {
		System.out.println("Iniciando correio de voz Iphone!");
	}

	@Override
	public void exibirPagina() {
		System.out.println("Exibindo página Iphone!");
	}

	@Override
	public void adicionarNovaAba() {
		System.out.println("Adicionando uma nova aba no navegador do Iphone!");
	}

	@Override
	public void atualizarPagina() {
		System.out.println("Atualizando página no navegador do Iphone!");
	}

}
