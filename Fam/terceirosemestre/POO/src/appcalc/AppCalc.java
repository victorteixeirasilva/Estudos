// Victor teixeira
//Pacote geralmente é escrito tudo em minusculo
//Projetos seguindo boas praticas é nomeado com a primeira letra de cada palavra em maiusculo
package appcalc;

import java.util.Scanner;
import operacoes.Operacoes;
import relatorio.Relatorio;
//Classe é nomeado como projeto seguindo as boas praticas de programação
public class AppCalc {

	public static void main(String[] args) {
		// A grande maioria dos comandos segue a grafia de primeira letra maiuscula e o
		// resto do comando em minusculo.
		System.out.println("\n=================\n");
		System.out.println("    BOA NOITE!");
		System.out.println("   DICIPINA POO!");
		System.out.println("\n=================\n");
		menu();
		System.exit(0);

	}
	public static void ex4() {
		//Exercício 4 - Aprovado e Reprovado.
		Scanner entrada = new Scanner(System.in);
		System.out.println("\n=================================");
		System.out.print("Digite a primeira nota: ");
		float nota1 = entrada.nextFloat();
		System.out.print("\nDigite a primeira nota: ");
		float nota2 = entrada.nextFloat();
		float media = (nota1+nota2)/2;
		if(media>=6) {
			System.out.println("\nAluno Aprovado com a média "+media);
		}
		System.out.println("=================================\n");
		entrada.close();
	}
	public static void ex2() {
		Relatorio relatorios = new Relatorio();
		relatorios.relatorio();
	}
	public static void ex3() {
		//Exercício 3
		int base, altura, area;
		
		Scanner entrada = new Scanner(System.in);
		
		System.out.print("Digite a base: ");
		altura = entrada.nextInt();
		
		System.out.print("\nDigite a base: ");
		base = entrada.nextInt();
		area = base*altura;
		if(base==altura) {
			System.out.println("============================================");
			System.out.println("É um QUADRADO...");
			System.out.println("A area do quadrilatero é (base X altura = área) = "+base+" X "+altura+" = "+area);
			System.out.println("============================================");				
		} else {
			System.out.println("============================================");
			System.out.println("É um RETANGULO...");
			System.out.println("A area do quadrilatero é (base X altura = área) = "+base+" X "+altura+" = "+area);
			System.out.println("============================================");
		}
		entrada.close();
	}
	public static void ex1() {
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
		ex1();
		entrada.close();
	}	
	public static void menu() {
		Scanner entrada = new Scanner(System.in);
		
		System.out.println("******************MENU******************");
		System.out.println("*           Opção 1 - EXERCÍCIO 1      *");
		System.out.println("*           (APPCALC)           *");
		System.out.println("*           Opção 2 - EXERCÍCIO 2      *");
		System.out.println("*           (COMISSÃO)          *");
		System.out.println("*           Opção 3 - EXERCÍCIO 3      *");
		System.out.println("*           (QUADRADO||RETANGULO)      *");
		System.out.println("*           Opção 4 - EXERCÍCIO 4      *");
		System.out.println("*           (APROVADO||REPROVADO)      *");
		System.out.println("****************************************");
		int exerc = entrada.nextInt();
		switch(exerc) {
		case 1:
			ex1();
			break;
		case 2:
			ex2();
			break;
		case 3:
			ex3();
			break;
		case 4:
			ex4();
			break;
		default:
			System.out.println("Opção Invalida!");
			break;
		}
		entrada.close();
	}

	/*
	 * Anotações
	 * 
	 * Codigo com qualidade: -> O ideal para um código com uma melhor performance, é
	 * com o menor número de variaveis. Pois cada uma delas representa um espaço em
	 * memoria.
	 */
}