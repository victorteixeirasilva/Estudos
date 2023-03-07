// Victor teixeira
//Pacote geralmente é escrito tudo em minusculo
//Projetos seguindo boas praticas é nomeado com a primeira letra de cada palavra em maiusculo
package appcalc;

import java.util.Scanner;

import operacoes.Operacoes;
//Classe é nomeado como projeto seguindo as boas praticas de programação
public class AppCalc {

	public static void main(String[] args) {
		// A grande maioria dos comandos segue a grafia de primeira letra maiuscula e o
		// resto do comando em minusculo.
		System.out.println("BOA NOITE!");
		System.out.println("DICIPINA POO!");

		menu();
		
		
		
		
		/*
		System.out.println("******************MENU******************");
		System.out.println("*           Opção 1 - SOMAR            *");
		System.out.println("*           Opção 2 - SUBTRAIR         *");
		System.out.println("****************************************");
		
		soma();
		subtrair();
		multiplicar();
		dividir();
		*/
		
		System.exit(0);

		/*
		 * Anotações
		 * 
		 * Codigo com qualidade: -> O ideal para um código com uma melhor performance, é
		 * com o menor número de variaveis. Pois cada uma delas representa um espaço em
		 * memoria.
		 */
	}
	public static void menu() {
		Operacoes operacoes = new Operacoes();
		Scanner entrada = new Scanner(System.in);
		
		System.out.println("******************MENU******************");
		System.out.println("*           Opção 1 - SOMAR            *");
		System.out.println("*           Opção 2 - SUBTRAIR         *");
		System.out.println("*           Opção 3 - MULTIPLICAR      *");
		System.out.println("*           Opção 4 - DIVIDIR          *");
		System.out.println("****************************************");
		System.out.print("Opção: ");
		int escolha = entrada.nextInt();
		switch(escolha) {
		case 1:
			operacoes.soma();
			break;
		case 2:
			operacoes.subtrair();
			break;
		case 3:
			operacoes.multiplicar();
			break;
		case 4:
			operacoes.dividir();
			break;
		default:
			System.out.println("Opção invalida!");
			break;
		}
		System.out.println("");
		menu();
	}

	/*
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
	*/

}