package br.cursoemvideo.aula07;

public class Lutador {
	private String nome;
	private String nacionalidade;
	private int idade;
	private float altura;
	private float peso;
	private String categoria;
	private int vitorias;
	private int derrotas;
	private int empates;
	//M�todos Especiais
	public Lutador(String nome, String nacionalidade, int idade, float altura, float peso,int vitorias,int derrotas, int empates) {
		this.setNome(nome);
		this.setNacionalidade(nacionalidade);
		this.setIdade(idade);
		this.setAltura(altura);
		this.setPeso(peso);
		this.setVitorias(vitorias);
		this.setDerrotas(derrotas);
		this.setEmpates(empates);
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getNacionalidade() {
		return nacionalidade;
	}
	public void setNacionalidade(String nacionalidade) {
		this.nacionalidade = nacionalidade;
	}
	public int getIdade() {
		return idade;
	}
	public void setIdade(int idade) {
		this.idade = idade;
	}
	public float getAltura() {
		return altura;
	}
	public void setAltura(float altura) {
		this.altura = altura;
	}
	public float getPeso() {
		return peso;
	}
	public void setPeso(float peso) {
		this.peso = peso;
		this.setCategoria();
	}
	public String getCategoria() {
		return categoria;
	}
	private void setCategoria() {
		if(this.peso<50.2) {
			this.categoria="Inv�lido";
		}else if(peso<=70.3) {
			this.categoria="Leve";
		}else if(peso<=83.9) {
			this.categoria="M�dio";
		}else if(peso<=120.2) {
			this.categoria="Pesado";
		}else {
			this.categoria="Invalido";
		}
	}
	public void setVitorias(int vitorias) {
		this.vitorias=vitorias;
	}
	public int getVitorias() {
		return vitorias;
	}
	public void setDerrotas(int derrotas) {
		this.derrotas=derrotas;
	}
	public int getDerrotas() {
		return derrotas;
	}
	public void setEmpates(int empates) {
		this.empates=empates;
	}
	public int getEmpates() {
		return empates;
	}
	//M�todos
	public void apresentar() {
		System.out.println("----------------------------------------");
		System.out.println("APRESENTA��O");
		System.out.println("Lutador: "+this.getNome());
		System.out.println("Nacionalidade: "+this.getNacionalidade());
		System.out.println("Idade: "+this.getIdade()+"Anos");
		System.out.println("Altura: "+this.getAltura()+"M de Altura");
		System.out.println("Pesando: "+this.getPeso()+"Kg");
		System.out.println("Ganhou: "+this.getVitorias());
		System.out.println("Perdeu: "+this.getDerrotas());
		System.out.println("Empatou: "+this.getEmpates());
		System.out.println("----------------------------------------");
	}
	public void status() {
		System.out.println("----------------------------------------");
		System.out.println("STATUS");
		System.out.println(this.getNome());
		System.out.println("� um peso: "+this.getCategoria());
		System.out.println(this.getVitorias()+" Vit�rias");
		System.out.println(this.getDerrotas()+" Derrotas");
		System.out.println(this.getEmpates()+" Empates");
		System.out.println("----------------------------------------");
	}
	public void empatarLuta() {
		this.setEmpates(this.getEmpates()+1);
	}
	public void ganharLuta() {
		this.setVitorias(getVitorias()+1);
	}
    public void perderLuta() {
    	this.setDerrotas(getDerrotas()+1);
    }
}
