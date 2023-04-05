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
		ValidarNota(this.a1);
		
		System.out.print("Digite a nota A2: ");
		this.a2 = entrada.nextDouble();
		ValidarNota(this.a2);
		CalcMedia(a1, a2);
		CalcStatus1(media);
		
	}
	
	public void EntrarNotaA3() {
	//	if((this.a1+this.a2)<6) {
			System.out.println("Aluno não alcançou a média, precisa fazer A3");
			System.out.print("Digite a nota A3: ");
			this.a3 = entrada.nextDouble();
			ValidarNota(this.a3);
	//	} 
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
		this.media = a1 + a2;
		return media;
	}
	
	public void Sair() {
		System.out.println("***SISTEMA ENCERRADO****");
		System.exit(0);
	}
	
	public String CalcStatus1(double media) {
		if(media<6) {
			EntrarNotaA3();
			SubstituirNota(this.a1, this.a2, this.a3);
		}
		
		return "Não precisa de A3";
	}
	
	public String CalcStatu2(double media) {
		if(media>=6) {
			this.status = "Aluno aprovado";
		} else {
			this.status = "Aluno reprovado";
		}
		return status;
	}
	
	public String EntrarNomeAluno() {
		System.out.print("Informe o nome do Aluno: ");
		this.nome = entrada.nextLine();
		return this.nome;
	}
	
	public void ExibeBoletim() {
		CalcStatu2(media);
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
		if((a1>a2)&&(a3>a2)) {
			//this.notaAux = this.a2;
			//this.a2 = this.a3;
			CalcMedia(this.a1, this.a3);
		} else if ((a2>a1)&&(a3>a1)) {
			//this.notaAux = this.a1;
			//this.a1 = this.a3;
			CalcMedia(this.a3, this.a2);
		}
		return media;
	}
	
	
	
}
