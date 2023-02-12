package loops;

/*
 * By: Victor Teixeira Silva 12/02/2023
 * 
 * Faça um programa que calcule o fatorial de um número inteiro fornecido pelo usúario.
 * Ex: 5 != 120 (5 X 4 X 3 X 2 X 1)
 * 
 */

import java.util.Scanner;

public class Ex6_Fatorial {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		
		System.out.print("Fatorial: ");
		int fatorial = scan.nextInt(), multiplicacao = 1;
		
		System.out.print(fatorial+"! = ");
		for(int i = fatorial; i >= 1; i--) {			
			multiplicacao = multiplicacao*i;
			
		}
		System.out.println(multiplicacao);
	}

}
