package principal;

import java.util.Scanner;

public class Operacoes {
	private int n1, n2, res, escolha;
	private Scanner entrada = new Scanner(System.in);
	
	public void Menu() {
		do {
			System.out.println("******************MENU******************");
			System.out.println("*           Opção 1 - SOMAR            *");
			System.out.println("*           Opção 2 - SUBTRAIR         *");
			System.out.println("*           Opção 3 - MULTIPLICAR      *");
			System.out.println("*           Opção 4 - DIVIDIR          *");
			System.out.println("*           Opção 5 - SAIR             *");
			System.out.println("****************************************");
		
			escolherOpcao();
		}while(escolha != 5);
	}
	
	public void escolherOpcao() {
		System.out.print("Opção: ");
		escolha = entrada.nextInt();
		
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
		case 5:
			sair();
			break;
		default:
			System.out.println("Opção invalida!");
			Menu();
			break;
		}
	}
	
	public void sair() {
		System.out.println("*********************************************");
		System.out.println("**** OBRIGADO POR USAR NOSSA CALCULADORA ****");
		System.out.println("*********************************************");
		System.out.println("************* SISTEMA ENCERRADO *************");
		System.out.println("*********************************************");
		System.exit(0);
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
		System.out.println("Operação escolhida: Somar");
		
		entrarNumeros();
		this.res = n1 + n2;
		
		System.out.println(n1+" + "+n2+" = "+res);
		System.out.println("***************************");
	}
	
	public void subtrair() {
		System.out.println("Operação escolhida: Subtrair");
		
		entrarNumeros();
		this.res = n1 - n2;
		
		System.out.println(n1+" - "+n2+" = "+res);
		System.out.println("***************************");
	}
	
	public void multiplicar() {
		System.out.println("Operação escolhida: Multiplicar");
		
		entrarNumeros();
		this.res = n1 * n2;
		
		System.out.println(n1+" x "+n2+" = "+res);
		System.out.println("***************************");
	}

	public void dividir() {
		System.out.println("Operação escolhida: Dividir");
		
		entrarNumeros();
		if(this.n2 == 0) {
			System.out.println("Divisão invalida pois não existe divisão por 0");
		} else {			
			this.res = n1 / n2;
			System.out.println(n1+" / "+n2+" = "+res);
			System.out.println("***************************");
		}
	}

}
