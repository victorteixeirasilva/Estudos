package edu.dio.Iphome;

public class Main {

	public static void main(String[] args) {
		Iphone celular = new Iphone();
		
		celular.tocar();
		celular.pausar();
		celular.selecionarMusica();
		
		System.out.println("");
		
		celular.atender();
		celular.ligar();
		celular.iniciarCorreioDeVoz();
		
		System.out.println("");
		
		celular.adicionarNovaAba();
		celular.exibirPagina();
		celular.atualizarPagina();
	}

}
