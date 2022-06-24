package br.cursoemvideo.aula10;

public class Funcionario extends Pessoa {
	private String setor;
	private boolean trabalhando;
	public void mudarTrabalho(String novoTrabalho) {
		System.out.println("Trabalho Antigo: "+this.getSetor());
		this.setSetor(novoTrabalho);
		System.out.println("Novo Trabalho: "+this.getSetor());
	}
	@Override
	public void inf() {
		System.out.println("NOME= "+this.getNome());
		System.out.println("IDADE= "+this.getIdade());
		System.out.println("SEXO= "+this.getSexo());
		System.out.println("SETOR= "+this.getSetor());
	}
	public String getSetor() {
		return setor;
	}
	public void setSetor(String setor) {
		this.setor = setor;
	}
	public boolean isTrabalhando() {
		return trabalhando;
	}
	public void setTrabalhando(boolean trabalhando) {
		this.trabalhando = trabalhando;
	}

}
