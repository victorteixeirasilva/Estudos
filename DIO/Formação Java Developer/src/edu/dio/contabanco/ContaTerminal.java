package edu.dio.contabanco;

import java.util.Scanner;

public class ContaTerminal {

	public static void main(String[] args) {
		Scanner entrada = new Scanner(System.in);
		Scanner entrada2 = new Scanner(System.in);
		Conta conta = new Conta();
		
		
		
		System.out.print("Por favor, digite o número da sua conta: ");
		conta.setNumero(entrada.nextInt());
		
		System.out.print("\nPor favor, digite o número da sua agência: ");
		conta.setAgencia(entrada.next());

		System.out.print("\nPor favor, digite o seu nome: ");
		conta.setNomeCliente(entrada2.nextLine());
		
		if((conta.getAgencia()!=null)&&(conta.getNomeCliente()!=null)&&(conta.getNumero()!=0)) {			
			System.out.print("\nPor favor, digite o seu saldo: ");
			conta.setSaldo(entrada.nextDouble());
			System.out.println("Olá "+conta.getNomeCliente()+", obrigado por criar uma conta em nosso banco, sua agência é: "+conta.getAgencia()+", conta: "+conta.getNumero()+" e saldo: R$"+conta.getSaldo());
			entrada2.close();
			entrada.close();
		} else {
			System.out.println("Você não fez o cadastro corretamente!");
		}
		
	}

}
