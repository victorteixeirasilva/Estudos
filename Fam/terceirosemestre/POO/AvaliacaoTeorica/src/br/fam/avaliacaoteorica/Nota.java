package br.fam.avaliacaoteorica;

import java.util.Scanner;

public class Nota {
	private Scanner entrada = new Scanner(System.in);
	private double a2, a1, a3, media;
	private String status, nome, disciplina;
	private int resp;
	private double notaAux;
	
	public void EntrarNotas() {
		System.out.print("Digite a nota A1: ");
		this.a1 = entrada.nextDouble();
		ValidarNota(this.a1);
		
		System.out.print("Digite a nota A2: ");
		this.a2 = entrada.nextDouble();
		ValidarNota(this.a2);
		
	}
	
	public void EntrarNotaA3() {
		if((this.a1+this.a2)<6) {
			System.out.println("Aluno não alcançou a média, precisa fazer A3");
			System.out.print("Digite a nota A3: ");
			this.a3 = entrada.nextDouble();
			ValidarNota(this.a3);
			SubstituirNota(this.a1, this.a2, this.a3);
		} 
	}
	
	public int ValidarNota(double nota) {
		if((nota<=5.0)&&(nota>=0.0)) {
			this.resp = 1;
			return resp;
		}
		System.out.println("Nota Inválida!");
		this.resp = 0;
		Sair();
		return resp;
	}
	
	public double CalcMedia(double a1, double a2) {
		SubstituirNota(this.a1, this.a2, this.a3);
		this.media = this.a1 + this.a2;
		this.a2 = this.notaAux;
		return media;
	}
	
	public void Sair() {
		System.out.println("***SISTEMA ENCERRADO****");
		System.exit(0);
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
	
	public void ExibeBoletim() {
		CalcMedia(a1, a2);
		System.out.println("*****BOLETIM DO ALUNO*****");
		System.out.println("Aluno: "+this.nome);
		System.out.println("Disciplina: "+this.disciplina);
		System.out.println("Nota A1: "+this.a1);
		System.out.println("Nota A2: "+this.a2);
		System.out.println("Nota A3: "+this.a3);
		System.out.println("Nota Final: "+this.media);
		System.out.println("Situação: "+this.status);
		System.out.println("**************************");
	}
	
	public String EntrarDisciplina() {
		System.out.print("Digite o nome da Disciplina: ");
		this.disciplina = entrada.nextLine();
		return this.disciplina;
	}
	
	public double SubstituirNota(double a1, double a2, double a3) {
		if((this.a1>this.a2)&&(this.a3>this.a2)) {
			this.notaAux = this.a2;
			this.a2 = this.a3;
		} else if ((this.a2>this.a1)&&(this.a3>this.a1)) {
			this.notaAux = this.a1;
			this.a1 = this.a3;
		}
		return notaAux;
	}
	
	
	
}
