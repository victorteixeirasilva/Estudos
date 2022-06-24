package br.cursoemvideo.aula12;

public class Mamifero extends Animal{
	private String corPelo;
	//metodos
	@Override
	public void locomover() {
		System.out.println("Correndo");
	}
	@Override
	public void emitirSom() {
		System.out.println("Som de Mamifero");
	}
	@Override
	public void alimentar() {
		System.out.println("MAMANDO");
	}
	public String getCorPelo() {
		return corPelo;
	}
	public void setCorPelo(String corPelo) {
		this.corPelo = corPelo;
	}
	

}
