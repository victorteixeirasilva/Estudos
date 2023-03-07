package operacoes;

import java.util.Scanner;

public class Operacoes {
	private int numero1, numero2;

	
	
	public Operacoes() {
	}

	public int getNumero1() {
		return numero1;
	}

	public void setNumero1(int numero1) {
		this.numero1 = numero1;
	}

	public int getNumero2() {
		return numero2;
	}

	public void setNumero2(int numero2) {
		this.numero2 = numero2;
	}
	
	
	public void soma() {
		int numero1 = 0, numero2 = 0;
		this.setNumero1(numero1);
		this.setNumero2(numero2);
		Scanner entrada = new Scanner(System.in);
		System.out.print("Digite o valor do Primeiro Número: ");
		numero1 = entrada.nextInt();
		System.out.print("\nDigite o valor do Segundo Número: ");
		numero2 = entrada.nextInt();
		System.out.println("\nSOMANDO...");
		System.out.println("Número 1:" + numero1 + " + Número 2:" + numero2 + " = " + (numero1 + numero2));
	}

	public void subtrair() {
		int numero1 = 0, numero2 = 0;
		this.setNumero1(numero1);
		this.setNumero2(numero2);
		Scanner entrada = new Scanner(System.in);
		System.out.print("Digite o valor do Primeiro Número: ");
		numero1 = entrada.nextInt();
		System.out.print("\nDigite o valor do Segundo Número: ");
		numero2 = entrada.nextInt();
		System.out.println("\nSUBTRAINDO...");
		System.out.println("Número 1:" + numero1 + " - Número 2:" + numero2 + " = " + (numero1 - numero2));
	}

	public void multiplicar() {
		int numero1 = 0, numero2 = 0;
		this.setNumero1(numero1);
		this.setNumero2(numero2);
		Scanner entrada = new Scanner(System.in);
		System.out.print("Digite o valor do Primeiro Número: ");
		numero1 = entrada.nextInt();
		System.out.print("\nDigite o valor do Segundo Número: ");
		numero2 = entrada.nextInt();
		System.out.println("\nMULTIPLICANDO...");
		System.out.println("N1:" + numero1 + " x N2:" + numero2 + " = " + (numero1 * numero2));
	}

	public void dividir() {
		int numero1 = 0, numero2 = 0;
		this.setNumero1(numero1);
		this.setNumero2(numero2);
		Scanner entrada = new Scanner(System.in);
		System.out.print("Digite o valor do Primeiro Número: ");
		numero1 = entrada.nextInt();
		System.out.print("\nDigite o valor do Segundo Número: ");
		numero2 = entrada.nextInt();
		System.out.println("\nDIVIDINDO...");
		System.out.println("N1:" + numero1 + " / N2:" + numero2 + " = " + (numero1 / numero2));
	}
	
}
