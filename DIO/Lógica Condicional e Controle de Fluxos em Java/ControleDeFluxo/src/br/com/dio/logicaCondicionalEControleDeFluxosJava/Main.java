package br.com.dio.logicaCondicionalEControleDeFluxosJava;
/*
 * By Victor Teixeira Silva 15/02/2023.
 * 
 * Curso da DIO, sobre lógica condicional e controle de fluxos em Java.
 * 
 * Exercício da aula de Controle de Fluxo e Boas praticas.
 * 
 */
public class Main {

	private static void ifFlecha() {
		int mes = 9;
		if (mes==1) {
			System.out.println("Janeiro");
		} else {
			if (mes==2) {
				System.out.println("Fevereiro");
			} else {
				if (mes==3) {
					System.out.println("Março");
				} else {
					if (mes==4) {
						System.out.println("Abril");
					} else {
						if (mes==5) {
							System.out.println("Maio");
						} else {
							if (mes==6) {
								System.out.println("Junho");
							} else {
								if (mes==7) {
									System.out.println("Julho");
								} else {
									if (mes==8) {
										System.out.println("Agosto");
									} else {
										if (mes==9) {
											System.out.println("Setembro");
										} else {
											if (mes==10) {
												System.out.println("Outubro");
											} else {
												if (mes==11) {
													System.out.println("Novembro");
												} else {
													if (mes==12) {
														System.out.println("Dezembro");
													} else {
														System.out.println("Mẽs indefinido");
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
		
		
	}
	
	private static void ifSemFlecha() {
		int mes = 9;
		if (mes==1) {
			System.out.println("Janeiro");
		} else if (mes==2){
			System.out.println("Fevereiro");
		} else if (mes==3) {
			System.out.println("Março");
		} else if (mes==4) {
			System.out.println("Abril");
		} else if (mes==5) {
			System.out.println("Maio");
		} else if (mes==6) {
			System.out.println("Junho");
		} else if (mes==7) {
			System.out.println("Julho");
		} else if (mes==8) {
			System.out.println("Agosto");
		} else if (mes==9) {
			System.out.println("Setembro");
		} else if (mes==10) {
			System.out.println("Outubro");
		} else if (mes==11) {
			System.out.println("Novembro");
		} else if (mes==12) {
			System.out.println("Dezembro");
		} else {
			System.out.println("Mẽs indefinido.");
		}
	}
	
	private static void ifFerias() {
		String mes = "julho";
		if (mes=="junho"||mes=="dezembro"||mes=="janeiro") {
			System.out.println("Férias");
		}
	}
	
	private static void ifMenor() {
		double salarioMensal = 11893.58d;
		double mediaSalario = 10500d;
		
		int quantidadeDependentes = 4;
		int mediaDependentes = 2;
		
		if ((salarioMensal<mediaSalario)&&(quantidadeDependentes>=mediaDependentes)) {
			System.out.println("Funcionário deve receber auxílio.");
		}
		
		boolean salarioBaixo = salarioMensal < mediaSalario;
		boolean muitosDependentes = quantidadeDependentes >= mediaDependentes;
		
		if ((salarioBaixo)&&(muitosDependentes)) {
			System.out.println("Funcionário deve receber auxílio.");
		}
		
		boolean receberAuxilio = (salarioBaixo) && (muitosDependentes);
		if(receberAuxilio) {
			System.out.println("Funcionário deve receber auxílio.");
		} else {
			System.out.println("Funcionário não deve receber auxílio.");
		}
	}
	
	private static void switchSemana() {
		String dia = "Terça";
		switch (dia) {
			case "Segunda":
				System.out.println(2);
				break;
			case "Terça":
				System.out.println(3);
				break;
			case "Quarta":
				System.out.println(4);
				break;
			case "Quinta":
				System.out.println(5);
				break;
			case "Sexta":
				System.out.println(6);
				break;
			case "Sábado":
				System.out.println(7);
				break;
			case "Domingo":
				System.out.println(8);
				break;
			default:
				System.out.println("Dia Invalido");
				break;
		}
	}
	
	private static void switchNumero() {
		int numero = 4;
		switch (numero) {
			case 1:
			case 2:
			case 3:
				System.out.println("Certo");
				break;
			case 4:
				System.out.println("Errado");
				break;
			case 5:
				System.out.println("Talvez");
				break;
			default:
				System.out.println("Valor Indefinido");
				break;
		}
	}
	
	private static void switchFerias() {
		String mes = "dezembro";
		switch (mes) {
			case "dezembro":
			case "julho":
			case "janeiro":
				System.out.println("Férias");
				break;
			default:
				System.out.println("Mês Indefinido");
				break;
		}
	}
	
	
	public static void main(String[] args) {
		ifFlecha();
		ifSemFlecha();
		ifFerias();
		ifMenor();
		
		switchSemana();
		switchNumero();
		switchFerias();
		
	}

}
