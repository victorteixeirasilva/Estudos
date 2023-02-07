package br.dio.exercicio;

import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		
		int escolha = 0;
		
		Obj obj = new Obj();
		Scanner opcao = new Scanner(System.in);
		
		System.out.println("=========== Cuso DIO: Entendendo Métodos Java ===========");
		System.out.println("Descrição: Bem vindo a minha aplicação java do exercício pratico da aula de criação!");
		System.out.println("=========================================================");
		System.out.println("Escolha a opção que deseja acessar: ");
		System.out.println("Escolha 1 para Calculadora");
		System.out.println("Escolha 2 para Mensagem");
		System.out.println("Escolha 3 para Emprestimo");
		escolha = opcao.nextInt();
		
		if (escolha == 1) {
			System.out.println("=========== EXERCÍCIO 1 ===========");
			System.out.println("Descrição: Calcule as 4 operações básicas: soma, subtração, multiplicação e divisão. Sempre 2 valores dever ser passados no método.");
			System.out.println("===================================");
				obj.somar(1, 1);
			System.out.println("---------------------------------");
			
				obj.subtrair(5, 3);
			System.out.println("---------------------------------");
			
				obj.multiplicar(2, 5);
			System.out.println("---------------------------------");
			
				obj.dividir(10, 2);
			System.out.println("---------------------------------");
		} else if (escolha == 2) {
			System.out.println("=========== EXERCÍCIO 2 ===========");
			System.out.println("Descrição: A partir da hora do dia, informe a mensagem adequada: Bom dia, Boa tarde, Boa noite");
			System.out.println("===================================");
				obj.horaDoDia(5);
			System.out.println("---------------------------------");
				obj.horaDoDia(13);
			System.out.println("---------------------------------");
				obj.horaDoDia(20);
			System.out.println("---------------------------------");
		} else if (escolha == 3) {
			System.out.println("=========== EXERCÍCIO 3 ===========");
			System.out.println("Descrição: Calcule o valor final de um empréstimo, a partir do valor solicitado. Taxas e parcelas influenciam. Defina arbitrariamente as faixar que influenciam nos valores.");
			System.out.println("===================================");
				obj.calculoEmprestimo(1000, 2);
			System.out.println("---------------------------------");
				obj.calculoEmprestimo(1000, 3);
			System.out.println("---------------------------------");
				obj.calculoEmprestimo(1000, 5);
			System.out.println("---------------------------------");
		} else {
			System.out.println("=======================================================");
			System.out.println("Erro.Você é burro e escolheu uma opção que não existe.");
			System.out.println("=======================================================");
		}
	}

}
