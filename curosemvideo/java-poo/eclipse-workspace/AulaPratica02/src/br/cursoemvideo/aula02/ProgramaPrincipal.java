package br.cursoemvideo.aula02;

import java.util.Scanner;

public class ProgramaPrincipal {
	public static void main(String[] args) {
		/*
		 * AULA PRATICA CURSO EM VIDEO
		 * AULA 2 - CRIANDO CLASSES EM JAVA
		 * RESUMO: Nessa aula de POO, vamos aprender como
		 *  criar uma Classe, com seus atributos e métodos,
		 *  e a instanciar novos objetos a partir dessa
		 *  classe inicial.
		 */
		//CRIANDO CANEtA(OBJETO)
		Caneta c1 = new Caneta();
		//CRIANDO UM SCANNER(ENTRADA DE DADOS)
		Scanner sc = new Scanner(System.in);
		//REPETIÇÃO
		int i = 1;
		while(i>0) {
				//ENTRADA DE DADOS USANDO O SCANNER PARA ATRIBUTOS DO OBJETO
			    System.out.print("DIGITE (1) SE QUISER CRIAR UMA NOVA CANETA: ");
			    int cria = sc.nextInt();
			    if(cria==1) {
				System.out.print("DIGITE O MODELO DA SUA CANETA: "); 
				c1.setModelo(sc.next());
				System.out.print("DIGITE A COR DA SUA CANETA: ");
				c1.setCor(sc.next());
				System.out.print("DIGITE A CARGA DA SUA CANETA: ");
				c1.setCarga(sc.nextInt());
				System.out.print("DIGITE O MODELO DE PONTA DA SUA CANETA: ");
				c1.setPonta(sc.nextFloat());
				System.out.print("DIGITE (1) SE SUA CANETA ESTÁ TAMPADA E (2) SE ESTIVER ABERTA");
				//CONDIÇÃO PARA SABER SE ESTÁ TAMPADA OU NÃO
				int deci = sc.nextInt();
				if(deci == 1) {
					c1.setTampada(true);
				} else {
					c1.setTampada(false);
				}
				//SAIDA
				c1.status();
				//CONDIÇÃO PARA AS FUNÇÕES DO OBJETO
				System.out.print("SE FOR USAR CANETA DIGITE (1) SE FOR CRIAR OUTRA DIGITE (2) ");
				int deci2 = sc.nextInt();
				if(deci2==1) {
					System.out.print("SE DESEJA TAMPAR DIGITE (1) SE DESEJA DESTAMPAR DIGITE (2) SE DESEJA RABISCAR DIGITE (3)");
					int deci3 = sc.nextInt();
					if(deci3==1) {
						c1.tampar();
						System.out.println("CANETA TAMPADA ");
					}else if(deci3==2) {
						c1.destampar();
						System.out.println("CANETA DESTANPADA ");
					}else{
						c1.rabiscar();
					}
				}else {
			    }
			}
		}
	}
}



