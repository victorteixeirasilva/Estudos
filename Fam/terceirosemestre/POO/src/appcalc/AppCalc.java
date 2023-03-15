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
	
	public static void ex8() {
		Scanner entrada = new Scanner(System.in);
		int tabuada;
		
		System.out.print("Digite o número que deseja a tabuada: ");
		tabuada = entrada.nextInt();
		for (int i = 1;i <= 10; i++) {
			System.out.println(tabuada+" X "+i+" = "+(tabuada*i));
		}
		entrada.close();
		System.out.println("==============================");
		menu();
	}
	public static void ex7() {
		String msg;
		int count;
		
		Scanner entrada = new Scanner(System.in);
		
		System.out.print("Digite a Mensagem a ser Exibida: ");
		msg = entrada.nextLine();
		System.out.print("Digite a quantidade de vezes que a mensagem será exibida: ");
		count = entrada.nextInt();
		
		for(int i = 1;i <= count; i++) {
			System.out.println(" | "+msg+" | A mensagem foi exibida pela "+i+" vez");
		}
		entrada.close();
		System.out.println("==============================");
		menu();
	}
	public static void ex6() {
		Scanner entrada = new Scanner(System.in);
		int ladoA, ladoB, ladoC;
		
		System.out.println("\n=========================================");
		System.out.print("Informe o Lado A do Triangulo: ");
		ladoA = entrada.nextInt();
		System.out.print("Informe o Lado B do Triangulo: ");
		ladoB = entrada.nextInt();
		System.out.print("Informe o Lado C do Triangulo: ");
		ladoC = entrada.nextInt();
		System.out.println("=========================================\n");
		System.out.println("\n=========================================");
		if ((ladoA == ladoB)&&(ladoB == ladoC)) {
			System.out.println("O triâgulo tem os 3 lados iguais por isso é Equilatero.");
		} else if ((ladoA == ladoB)||(ladoB == ladoC)||(ladoC == ladoA)) {
			System.out.println("O triângulo tem dois lados iguais por isso é Isósceles.");
		} else {
			System.out.println("O triângulo tem todos os lados diferentes por isso é Escaleno.");
		}
		System.out.println("=========================================\n");
		entrada.close();
		ex6();
	}
	public static void ex5() {
		//Exercício 5 - receba dois valores e compare se são iguais ou não,
		//se não exiba qual o maior e qual o menor
		Scanner entrada = new Scanner(System.in);
		double numero1, numero2;
		System.out.println("\n=================================");
		System.out.print("Digite o primeiro Número: ");
		numero1 = entrada.nextDouble();
		System.out.println("\nDigite o segundo Número: ");
		numero2 = entrada.nextDouble();
		
		if(numero1==numero2) {
			System.out.println("Os Números são iguais. "+numero1+", "+numero2);
		} else {
			System.out.println("Os Números são diferentes. "+numero1+", "+numero2);
			if(numero1>numero2) {
				System.out.println("O Número "+numero1+" é maior que o Número "+numero2);
			} else {
				System.out.println("O Número "+numero2+" é maior que o Número "+numero1);				
			}
		}
		System.out.println("=================================\n");
		entrada.close();
		ex5();
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
		ex4();
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
		ex3();
	}
	public static void ex2() {
		Relatorio relatorios = new Relatorio();
		relatorios.relatorio();
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
		System.out.println("*           (APPCALC)                  *");
		System.out.println("*           Opção 2 - EXERCÍCIO 2      *");
		System.out.println("*           (COMISSÃO)                 *");
		System.out.println("*           Opção 3 - EXERCÍCIO 3      *");
		System.out.println("*           (QUADRADO||RETANGULO)      *");
		System.out.println("*           Opção 4 - EXERCÍCIO 4      *");
		System.out.println("*           (APROVADO||REPROVADO)      *");
		System.out.println("*           Opção 5 - EXERCÍCIO 5      *");
		System.out.println("*           (==||!)                    *");
		System.out.println("*           Opção 6 - EXERCÍCIO 6      *");
		System.out.println("*           (TRIANGULO)                *");
		System.out.println("*           Opção 7 - EXERCÍCIO 7      *");
		System.out.println("*           (MENSAGEM)                 *");
		System.out.println("*           Opção 8 - EXERCÍCIO 8      *");
		System.out.println("*           (TABUADA)                  *");
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
		case 5:
			ex5();
			break;
		case 6:
			ex6();
			break;
		case 7:
			ex7();
			break;
		case 8:
			ex8();
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