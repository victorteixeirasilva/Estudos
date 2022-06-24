package br.cursoemvideo.aula12;

public class Peixe extends Animal {
	private String corEscama;
	@Override
	public void locomover() {
		System.out.println("Nadando");
	}
	@Override
	public void emitirSom() {		
		System.out.println("Peixe n�o faz som");
	}
	@Override
	public void alimentar() {		
		System.out.println("Peixo n�o faz som");
	}
	public String getCorEscama() {
		return corEscama;
	}
	public void setCorEscama(String corEscama) {
		this.corEscama = corEscama;
	}
	public void soltarBolha() {
		System.out.println("Soltou uma bolha");
	}

}
