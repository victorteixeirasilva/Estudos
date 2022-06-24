package br.cursoemvideo.aula14;

public abstract class Pessoa {
	//Atributos
	private String nome;
	private int idade;
	private String sexo;
	private float experiencia;
	//metodos
	public void ganharExp(float exp) {
		this.setExperiencia(getExperiencia()+exp);
	}
	//Metodos Especiais
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
	public float getExperiencia() {
		return experiencia;
	}
	public void setExperiencia(float experiencia) {
		this.experiencia = experiencia;
	}
	public Pessoa(String nome, int idade, String sexo) {
		super();
		this.nome = nome;
		this.idade = idade;
		this.sexo = sexo;
		this.experiencia = 0;
	}
	

}
