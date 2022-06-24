package br.cursoemvideo.aula12;

public class Reptil extends Animal{
	private String corEscama;
	@Override
	public void locomover() {
		System.out.println("Rastejando");
	}
	@Override
	public void emitirSom() {
		System.out.println("Som de R�ptil");
	}
	@Override
	public void alimentar() {
		System.out.println("Comendo Vejetais");
	}
	public String getCorEscama() {
		return corEscama;
	}
	public void setCorEscama(String corEscama) {
		this.corEscama = corEscama;
	}

}
