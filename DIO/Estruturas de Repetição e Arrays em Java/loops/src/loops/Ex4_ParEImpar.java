package loops;

import java.util.Scanner;

public class Ex4_ParEImpar {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		
		int quantNumeros, numero, count=1, quantPares=0, quantImpares=0;
		
		System.out.print("Digite a quandidade de números que deseja: ");
		quantNumeros=scan.nextInt();
		
		do {
			System.out.print("Número "+count+": ");
			numero=scan.nextInt();
			
			if (numero % 2 ==0) {
				quantPares++;
			} else {
				quantImpares++;
			}
			count++;
		}while (count<=quantNumeros);
		
		System.out.println("Quantidade Pares: "+quantPares);
		System.out.println("Quantidade Impares: "+quantImpares);
	}

}
