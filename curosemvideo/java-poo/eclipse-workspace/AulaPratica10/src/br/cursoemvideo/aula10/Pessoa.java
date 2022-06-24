package br.cursoemvideo.aula10;

public class Pessoa {
	//Atributos
	private String nome;
	private int idade;
	private String sexo;
	//Métodos
	public void fazerAniv() {
		this.setIdade(this.getIdade()+1);
	}
	public void inf() {
		System.out.println("NOME= "+this.getNome());
		System.out.println("IDADE= "+this.getIdade());
		System.out.println("SEXO= "+this.getSexo());
	}
	//Métodos Especiais
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public int getIdade() {
		return idade;
	}
	public void setIdade(int idade) {
		this.idade = idade;
	}
	public String getSexo() {
		return sexo;
	}
	public void setSexo(String sexo) {
		this.sexo = sexo;
	}
	
	

}
