package principal;

import java.util.Scanner;

public class Operacoes {
	int n1, n2, res;
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
			somar();
			break;
		case 2:
			subtrair();
			break;
		case 3:
			multiplicar();
			break;
		case 4:
			dividir();
			break;
		default:
			System.out.println("Opção invalida!");
			break;
		}
	}
	
	public void entrarNumeros() {
		System.out.println("***************************");
		System.out.print("Digite o Primeiro Número: ");
		this.n1 = entrada.nextInt();
		System.out.print("Digite o Segundo Número: ");
		this.n2 = entrada.nextInt();
		System.out.println("Primeiro Número: "+n1);
		System.out.println("Segundo Número: "+n2);
		System.out.println("***************************");
	}
	
	public void somar() {
		entrarNumeros();
		this.res = n1 + n2;
		System.out.println(n1+" + "+n2+" = "+res);
		System.out.println("***************************");
		Menu();
	}
	
	public void subtrair() {
		entrarNumeros();
		this.res = n1 - n2;
		System.out.println(n1+" - "+n2+" = "+res);
		System.out.println("***************************");
		Menu();
	}
	
	public void multiplicar() {
		entrarNumeros();
		this.res = n1 * n2;
		System.out.println(n1+" x "+n2+" = "+res);
		System.out.println("***************************");
		Menu();
	}

	public void dividir() {
		entrarNumeros();
		if(this.n2 == 0) {
			System.out.println("Divisão invalida pois não existe divisão por 0");
		} else {			
			this.res = n1 / n2;
			System.out.println(n1+" / "+n2+" = "+res);
			System.out.println("***************************");
		}
		Menu();
	}

}
