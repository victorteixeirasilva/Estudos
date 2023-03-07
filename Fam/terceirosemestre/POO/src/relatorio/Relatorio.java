package relatorio;

import java.util.Scanner;

public class Relatorio {
	private Double salario;
	private Double comissao;
	public Double getSalario() {
		return salario;
	}
	public void setSalario(Double salario) {
		this.salario = salario;
	}
	public Double getComissao() {
		return comissao;
	}
	public void setComissao(Double comissao) {
		this.comissao = comissao;
	}
	public Relatorio() {
		relatorio();
	}
	
	public void relatorio() {
		Double salario = null;
		Double comissao = null;
		this.setSalario(salario);
		this.setComissao(comissao);
		Scanner entrada = new Scanner(System.in);
		System.out.print("Informe seu Sálario Base: ");
		salario = entrada.nextDouble();
		System.out.print("\nInforme a porcentagem da sua Comissão: ");
		comissao = entrada.nextDouble();
		System.out.println("************ RELATÓRIO DE SALÁRIO E COMISSÃO ************");
		System.out.println("Salário Base: " + salario);
		System.out.println("Valor da Comissão: " + comissao +"%");
		System.out.println("Valor recebido da Comissão: " + (salario*comissao/100));
		System.out.println("Valor do salario mais a comissão: "+((salario*comissao/100)+salario));
		System.out.println("******************** FIM DO RELATÓRIO ********************");
	}
	
}
