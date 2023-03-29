package br.fam.poo;

import java.util.Scanner;

public class Calculo {
	
	private double sal_atual, tx_aumento, sal_novo, tx_inss, vlr_inss, tx_ir, vlr_ir, sal_final, vlr_aumento;
	private String nome;
	private Scanner entrada = new Scanner(System.in);
	
	public double calcAumentoSalarial(double tx_aumento, double sal_atual) {
		this.vlr_aumento = sal_atual*(tx_aumento/100);
		this.sal_novo = this.vlr_aumento + this.sal_atual;
		return sal_novo;
	}
	
	public void exibirHolerite(double sal_novo, double vlr_inss, double vlr_ir, double sal_final, String nome) {
		System.out.println("**********************************");
		System.out.println("              HOLERITE            ");
		System.out.println("**********************************");
		System.out.print("Nome: "+nome+"\n");
		System.out.print("Salario com aumento: "+sal_novo+"\n");
		System.out.print("Valor do aumento: "+this.vlr_aumento+"\n");
		System.out.print("Valor do desconto INSS: "+vlr_inss+"\n");
		System.out.print("Valor do desconto IR: "+vlr_ir+"\n");
		System.out.print("Salario Liquido: "+sal_final+"\n");
		System.out.println("**********************************");
	}
	
	public void sair() {
		
	}
	
	public double calcDescontoInss(double sal_novo, double tx_inss) {
		this.vlr_inss = sal_novo*(tx_inss/100);
		return vlr_inss;
	}
	
	public double calcDescontoIR(double sal_novo) {
		if((sal_novo>=0)&&(sal_novo<=1900)) {
			this.vlr_ir = 0;
		} else if (sal_novo<=3000) {
			this.vlr_ir = this.sal_novo*0.15;
		} else if (sal_novo<=11000) {
			this.vlr_ir = this.sal_novo*0.275;			
		} else {
			this.vlr_ir = this.sal_novo*0.35;						
		}
		return vlr_ir;
	}
	
	public double calcSalFinal(double sal_novo, double vlr_inss, double vlr_ir) {
		this.sal_final = sal_novo-(vlr_inss+vlr_ir);
		return sal_final;
	}
	
	public double exibeMsg() {
		System.out.print("\nInforme o salario Atual do Funcionário: ");
		this.sal_atual = entrada.nextDouble();
		
		System.out.print("\nInforme a porcentagem do aumento do salarial do Funcionário: ");
		this.tx_aumento = entrada.nextDouble();
		
		System.out.print("\nInforme a taxa do desconto do INSS: ");
		this.tx_inss = entrada.nextDouble();
		
		calcAumentoSalarial(this.tx_aumento, this.sal_atual);
		
		calcDescontoInss(this.sal_novo, this.tx_inss);
		
		calcDescontoIR(this.sal_novo);
		
		calcSalFinal(this.sal_novo, this.vlr_inss, this.tx_ir);
		
		exibirHolerite(this.sal_novo, this.vlr_inss, this.vlr_ir, this.sal_final, this.nome);
		
		return sal_atual;
	}
	
	public String entrarNome () {
		System.out.print("Digite o nome do Funcionário: ");
		this.nome = entrada.nextLine();
		
		exibeMsg();
		
		return nome;
	}
	
}
