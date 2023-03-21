package principal;

import java.util.Scanner;

public class Operacoes {
	int n1, n2;
	Scanner entrada = new Scanner(System.in);
	
	public void Menu() {		
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
			
			break;
		case 2:

			break;
		case 3:

			break;
		case 4:

			break;
		default:
			System.out.println("Opção invalida!");
			break;
		}
	}
	
	public void entrarNumeros() {
		
	}

}
