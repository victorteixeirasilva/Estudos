package br.cursoemvideo.aula9;

public class Pessoa {
	//Atributos
	private String nome;
	private int idade;
	private String sexo;
	//M�todos
	public void fazerAniv() {
		this.setIdade(idade+1);
	}
	//M�todos Especiais
	    //Construtor
	public Pessoa(String nome, int idade, String sexo) {
		super();
		this.nome = nome;
		this.idade = idade;
		this.sexo = sexo;
	}
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
