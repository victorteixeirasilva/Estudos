package br.com.dio.java.io.IOCharacter;

import java.io.Serializable;

public class Gato implements Serializable {

	private static final long serialVersionUID = 1L; // Atributo que serealiza a classe
	private String nome;
	private String cor;
	private int idade;
	private boolean cadastrado;
	private transient boolean ronrona; // Transiente aqui serve para deixar esse atributo "Invisível" para serealização
	
	public Gato() {}

	public Gato(String nome, String cor, int idade, boolean cadastrado, boolean ronrona) {
		super();
		this.nome = nome;
		this.cor = cor;
		this.idade = idade;
		this.cadastrado = cadastrado;
		this.ronrona = ronrona;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCor() {
		return cor;
	}

	public void setCor(String cor) {
		this.cor = cor;
	}

	public int getIdade() {
		return idade;
	}

	public void setIdade(int idade) {
		this.idade = idade;
	}

	public boolean isCadastrado() {
		return cadastrado;
	}

	public void setCadastrado(boolean cadastrado) {
		this.cadastrado = cadastrado;
	}

	public boolean isRonrona() {
		return ronrona;
	}

	public void setRonrona(boolean ronrona) {
		this.ronrona = ronrona;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
	
	
}
