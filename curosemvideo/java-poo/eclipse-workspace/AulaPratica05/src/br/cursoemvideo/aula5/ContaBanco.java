package br.cursoemvideo.aula5;

public class ContaBanco {
	//ATRIBUTOS
	private int numConta;
	private String tipo;
	private String dono;
	private float saldo;
	private boolean status;
	//MÉTODOS ESPECIAIS
	public void ContaBanco(){
		this.saldo=0;
		this.status=false;
	}

	public void setNumConta(int numConta) {
		this.numConta=numConta;
	}
	public int getNumConta() {
		return numConta;
	}
	public void setTipo(String tipo) {
		this.tipo=tipo;
	}
	public String getTipo() {
		return tipo;
	}
	public void setDono(String dono) {
		this.dono=dono;
	}
	public String getDono() {
		return dono;
	}
	public void setSaldo(float saldo) {
		this.saldo=saldo;
	}
	public float getSaldo() {
		return saldo;
	}
	public void setStatus(boolean status) {
		this.status=status;
	}
	public boolean getStatus() {
		return status;
	}
	//MÉTODOS
	public void abrirConta(String abrirConta) {
		this.setTipo(abrirConta);
		this.setStatus(true);
		if(abrirConta=="cc") {
			saldo=50;
		}else if(abrirConta=="cp"){
			saldo=150;
		}else {
		}

	}
	public void fecharConta() {
		if(saldo>0) {
			System.out.println("Conta Com Dinheiro ");
		}else if(saldo<0) {
			System.out.println("Conta em Débito ");
		}else {
			this.setStatus(false);
		}
	}
	public void depocitar(float depositar){
		if(status=true) {
			saldo += depositar;
		}else {
			System.out.println("Impossível Depositar ");
		}
	}
	public void sacar(double d) {
		if(status=true && d<saldo) {
			saldo -= d;
		}else {
			System.out.println("Impossível Sacar ");
		}
	}
	public void pagarMensal(float pagarMensal) {
		if(tipo=="cc") {
			this.pagarMensal(pagarMensal);
		}else if(tipo=="cp") {
			this.pagarMensal(pagarMensal);
		}else if(status=true && saldo>pagarMensal) {
				saldo -= pagarMensal;
			}else {
				System.out.println("Saldo Insuficiente ");
			}
	}
	public void estadoAtual() {
		System.out.println("Numero da Conta: "+this.getNumConta());
		System.out.println("Tipo: "+this.getTipo());
		System.out.println("Dono: "+this.getDono());
		System.out.println("Saldo: "+this.getSaldo());
		System.out.println("Status: "+this.getStatus());
	}
}
