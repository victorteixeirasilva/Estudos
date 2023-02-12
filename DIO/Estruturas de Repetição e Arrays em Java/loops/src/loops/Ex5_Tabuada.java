package loops;

import java.util.Scanner;

/* By: Victor Teixeira Silva 11/02/2023
 * 
 * Desenvolva um gerador de tabuada,
 * capaz de gerar a tabuada de qualquer número inteiro entre 1 a 10.
 * O usuário deve informar de qual número ele deseja ver a tabuada.
 * A saida deve ser conforme o exemplo abaixo:
 * 
 * Tabuada do 5:
 * 5 x 1 = 5
 * 5 x 2 = 10
 * ...
 * 5 x 10 = 50
 * 
 */

public class Ex5_Tabuada {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		
		System.out.println("Tabuada do: ");
		System.out.print("Digite o Número: ");
		int tabuada = scan.nextInt();
		
		System.out.println("Tabuada do "+tabuada);
		
		for(int i = 1; i <= 10;i = i + 1) {
			System.out.println(tabuada+" X "+i+" = "+(tabuada * i) );
		}
		
	}

}
