package br.cursoemvideo.aula13;

public class Mamifero extends Animal {
	private String corPelo;
	@Override
	public void emitirSom() {
		System.out.println("Som de Mamifero");
	}
	public String getCorPelo() {
		return corPelo;
	}
	public void setCorPelo(String corPelo) {
		this.corPelo = corPelo;
	}

}
