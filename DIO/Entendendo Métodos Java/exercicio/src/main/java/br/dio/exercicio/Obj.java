package br.dio.exercicio;

public class Obj {
	private int num1 = 0;
	private int num2 = 0;
	
	public Obj() {
		this.num1 = 0;
		this.num2 = 0;
	}

	public int getNum1() {
		return num1;
	}

	public void setNum1(int num1) {
		this.num1 = num1;
	}

	public int getNum2() {
		return num2;
	}

	public void setNum2(int num2) {
		this.num2 = num2;
	}
	
	public void somar(int num1, int num2) {
		this.num1 = num1;
		this.num2 = num2;
			int resultado = num1+num2;
			System.out.println("O resultado da soma é: "+resultado);
	}
	public void subtrair(int num1, int num2) {
		this.num1 = num1;
		this.num2 = num2;
			int resultado = num1-num2;
			System.out.println("O resultado da subtração é: "+resultado);
	}
	public void multiplicar(int num1, int num2) {
		this.num1 = num1;
		this.num2 = num2;
			int resultado = num1*num2;
			System.out.println("O resultado da multiplicação é: "+resultado);
	}
	public void dividir(int num1, int num2) {
		this.num1 = num1;
		this.num2 = num2;
			if(num1>num2 && num1 != 0 && num2 != 0) {
				int resultado = num1/num2;		
				System.out.println("O resultado da divição é: "+resultado);
			} else {
				System.out.println("Não é possivel fazer essa divisão");
			}
	}
	
	public void horaDoDia(int num1) {
		this.num1 = num1;
		if (num1>=1 && num1<12) {
			System.out.println("Bom dia flor do dia!");
		} else if (num1<18) {
			System.out.println("Boa tardeeeeeeeeeee!");
		} else if (num1<24) {
			System.out.println("Boa noiteeeeeeeeeee!");
		}
	}
	
	public static int getDuasParcelas() {
		return 2;
	}
	public static int getTresParcelas() {
		return 3;
	}
	public static double getTaxaDuasParcelas() {
		return 0.3;
	}
	public static double getTaxaTresParcelas() {
		return 0.3;
	}
	
	public void calculoEmprestimo(double valor, int parcelas) {
		if (parcelas == 2) {
			double valorFinal = valor + (valor*getTaxaDuasParcelas());
			System.out.println("Valor final do empréstimo para 2 parcelas: R$ "+valorFinal);
		} else if (parcelas == 3) {
			double valorFinal = valor + (valor*getTaxaTresParcelas());
			System.out.println("Valor final do empréstimo para 3 parcelas: R$ "+valorFinal);
		} else {
			System.out.println("Quantidade de parcelas não aceita.");
		}
	}
	
}
