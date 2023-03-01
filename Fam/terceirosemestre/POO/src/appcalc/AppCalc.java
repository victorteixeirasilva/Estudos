//Pacote geralmente é escrito tudo em minusculo
//Projetos seguindo boas praticas é nomeado com a primeira letra de cada palavra em maiusculo
package appcalc;

import java.util.Scanner;

//Classe é nomeado como projeto seguindo as boas praticas de programação
public class AppCalc {

	public static void main(String[] args) {
		// A grande maioria dos comandos segue a grafia de primeira letra maiuscula e o
		// resto do comando em minusculo.
		System.out.println("BOA NOITE!");
		System.out.println("DICIPINA POO!");

		
		System.out.println("******************MENU******************");
		System.out.println("*           Opção 1 - SOMAR            *");
		System.out.println("*           Opção 2 - SUBTRAIR         *");
		System.out.println("****************************************");
		
		
		soma();
		subtrair();
		multiplicar();
		dividir();
		System.exit(0);

		/*
		 * Anotações:
		 * 
		 * Codigo com qualidade: -> O ideal para um código com uma melhor performance, é
		 * com o menor número de variaveis. Pois cada uma delas representa um espaço em
		 * memoria.
		 */
	}

	public static void soma() {
		int n1, n2;
		Scanner entrada = new Scanner(System.in);
		System.out.print("Digite o valor do Primeiro Número: ");
		n1 = entrada.nextInt();
		System.out.print("\nDigite o valor do Segundo Número: ");
		n2 = entrada.nextInt();
		System.out.println("\nSOMANDO...");
		System.out.println("N1:" + n1 + " + N2:" + n2 + " = " + (n1 + n2));
	}

	public static void subtrair() {
		int n1, n2;
		Scanner entrada = new Scanner(System.in);
		System.out.print("Digite o valor do Primeiro Número: ");
		n1 = entrada.nextInt();
		System.out.print("\nDigite o valor do Segundo Número: ");
		n2 = entrada.nextInt();
		System.out.println("\nSUBTRAINDO...");
		System.out.println("N1:" + n1 + " - N2:" + n2 + " = " + (n1 - n2));
	}

	public static void multiplicar() {
		int n1, n2;
		Scanner entrada = new Scanner(System.in);
		System.out.print("Digite o valor do Primeiro Número: ");
		n1 = entrada.nextInt();
		System.out.print("\nDigite o valor do Segundo Número: ");
		n2 = entrada.nextInt();
		System.out.println("\nMULTIPLICANDO...");
		System.out.println("N1:" + n1 + " x N2:" + n2 + " = " + (n1 * n2));
	}

	public static void dividir() {
		int n1, n2;
		Scanner entrada = new Scanner(System.in);
		System.out.print("Digite o valor do Primeiro Número: ");
		n1 = entrada.nextInt();
		System.out.print("\nDigite o valor do Segundo Número: ");
		n2 = entrada.nextInt();
		System.out.println("\nDIVIDINDO...");
		System.out.println("N1:" + n1 + " / N2:" + n2 + " = " + (n1 / n2));
	}

	/*
	 * public static void soma(int n1, int n2) { System.out.println("\nSOMANDO...");
	 * int res = n1+n2; System.out.println("N1:" + n1 + " + N2:" + n2 + " = " +
	 * res); }
	 * 
	 * public static void subtrair(int n1, int n2) {
	 * System.out.println("\nSUBTRAINDO..."); int res = n1-n2;
	 * System.out.println("N1:" + n1 + " - N2:" + n2 + " = " + res); }
	 * 
	 * public static void multiplicar(int n1, int n2) {
	 * System.out.println("\nMULTIPLICANDO..."); int res = n1*n2;
	 * System.out.println("N1:" + n1 + " x N2:" + n2 + " = " + res); }
	 * 
	 * public static void dividir(int n1, int n2) {
	 * System.out.println("\nDIVIDINDO..."); int res = n1/n2;
	 * System.out.println("N1:" + n1 + " / N2:" + n2 + " = " + res); }
	 */

}