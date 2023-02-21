package main;

import java.util.Random;
import javax.swing.JOptionPane;

public class Calculos {
	private int nivel;
	private int valor1;
	private int valor2;
	private int operacoes;
	private int result;
	
	public Calculos(int nivel) {
		Random random = new Random();
		this.operacoes = random.nextInt(4); //0-somar, 1-diminuir, 2-multiplicar, 3-dividir
		this.nivel = nivel;
		
		if(nivel==1) {
			this.valor1 = random.nextInt(10);
			this.valor2 = random.nextInt(10);
		} else if (nivel==2) {
			this.valor1 = random.nextInt(100);
			this.valor2 = random.nextInt(100);
		} else if(nivel==3) {
			this.valor1 = random.nextInt(1000);
			this.valor2 = random.nextInt(1000);
		}
	}

	public int getNivel() {
		return nivel;
	}

	public void setNivel(int nivel) {
		this.nivel = nivel;
	}

	public int getValor1() {
		return valor1;
	}

	public void setValor1(int valor1) {
		this.valor1 = valor1;
	}

	public int getValor2() {
		return valor2;
	}

	public void setValor2(int valor2) {
		this.valor2 = valor2;
	}

	public int getOperacoes() {
		return operacoes;
	}

	public void setOperacoes(int operacoes) {
		this.operacoes = operacoes;
	}

	public int getResult() {
		return result;
	}

	public void setResult(int result) {
		this.result = result;
	}
	
	public String toString() {
		String opcao;
		if(this.getOperacoes()==0) {
			opcao = "Somar";
		} else if (this.getOperacoes()==1) {
			opcao = "Subtrair";
		} else if (this.getOperacoes()==2) {
			opcao = "Multiplicar";
		} else {
			opcao = "Opção inválida";
		}
		return 	"Valor 1: "+this.getValor1()+
				"\nValor 2: "+this.getValor2()+
				"\nOperação: "+opcao+
				"\nDificuldade: "+this.getNivel();
	}
	
	public boolean somar(int valor) {
		this.result = this.getValor1() + this.getValor2();
		boolean acerto = false;
		
		if(valor == this.getResult()) {
			JOptionPane.showMessageDialog(null, "Resposta correta!");
			acerto = true;
		} else {
			JOptionPane.showMessageDialog(null, "Estude mais!");
		}
		JOptionPane.showMessageDialog(null, this.getValor1() + " + " + this.getValor2() + " = " + this.getResult());
		return acerto;
	}
	
	public boolean subtrair(int valor) {
		this.result = this.getValor1() - this.getValor2();
		boolean acerto = false;
		
		if(valor == this.getResult()) {
			JOptionPane.showMessageDialog(null, "Resposta correta!");
			acerto = true;
		} else {
			JOptionPane.showMessageDialog(null, "Estude mais!");
		}
		JOptionPane.showMessageDialog(null, this.getValor1() + " - " + this.getValor2() + " = " + this.getResult());
		return acerto;
	}
	
	public boolean multiplicar(int valor) {
		this.result = this.getValor1() * this.getValor2();
		boolean acerto = false;
		
		if(valor == this.getResult()) {
			JOptionPane.showMessageDialog(null, "Resposta correta!");
			acerto = true;
		} else {
			JOptionPane.showMessageDialog(null, "Estude mais!");
		}
		JOptionPane.showMessageDialog(null, this.getValor1() + " x " + this.getValor2() + " = " + this.getResult());
		return acerto;
	}
	
	
}
