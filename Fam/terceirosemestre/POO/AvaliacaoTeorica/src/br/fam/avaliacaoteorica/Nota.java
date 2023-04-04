package br.fam.avaliacaoteorica;

import java.util.Scanner;

public class Nota {
	private Scanner entrada = new Scanner(System.in);
	private double a2, a1, a3, media;
	private String status, nome, disciplina;
	private int resp;
	
	public void EntrarNotas() {
		System.out.print("Digite a nota A1: ");
		this.a1 = entrada.nextDouble();
		
		System.out.print("Digite a nota A2: ");
		this.a2 = entrada.nextDouble();
		
	}
	
	public void EntrarNotaA3() {
		if((this.a1+this.a2)<6) {
			System.out.println("Aluno não alcançou a média, precisa fazer A3");
			System.out.print("Digite a nota A3: ");
			this.a3 = entrada.nextDouble();
		} 
	}
	
	public int ValidarNota(double a1, double a2, double a3) {
		
		return 0;
	}
	
	public double CalcMedia(double a1, double a2) {
		return 0;
	}
	
	public void Sair() {
		
	}
	
	public String CalcStatus1(double media) {
		return "aprovado";
	}
	
	public String CalcStatu2(double media) {
		return "aprovado2";
	}
	
	public String EntrarNomeAluno() {
		System.out.print("Informe o nome do Aluno: ");
		this.nome = entrada.nextLine();
		return this.nome;
	}
	
	public void ExibeBoletim(double a1, double a2, double a3, double media, String nome, String status, String disciplina) {
		
	}
	
	public String EntrarDisciplina() {
		System.out.print("Digite o nome da Disciplina: ");
		this.disciplina = entrada.nextLine();
		return this.disciplina;
	}
	
	public double SubstituirNota(double a1, double a2, double a3) {
		return 0;
	}
	
	
	
}
