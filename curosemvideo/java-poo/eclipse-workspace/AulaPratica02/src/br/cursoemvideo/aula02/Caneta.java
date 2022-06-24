package br.cursoemvideo.aula02;

public class Caneta {
	//atributos
	private String modelo;
	private String cor;
	private float ponta;
	private int carga;
	private boolean tampada;
	//métodos
	public void status() {
		System.out.println("========== DADOS DA SUA CANETA ==========");
		System.out.println("MODELO DA CANETA: " + this.modelo);
		System.out.println("COR DA CANETA: " + this.cor);
		System.out.println("PONTA DO TIPO: "+this.ponta);
		System.out.println("PORCENTAGEM DA CARGA: "+this.carga+"%");
		if(tampada) {
			System.out.println("A CANETA ESTÁ TAMPADA");
		}else {
			System.out.println("A CANETA ESTÁ ABERTA");
		}
		System.out.println("=========================================");
	}
    public void rabiscar() {
    	if (tampada) {
    		System.out.println("ERRO");
    	}else { 
    		System.out.println("RABISCANDO");
    	}
    }
    public void tampar() {
    	tampada=true;
    }
    public void destampar() {
    	tampada=false;
    }
    //métodos especiais
	public void setModelo(String modelo) {
		this.modelo = modelo;
	}
	public String getModelo() {
		return modelo;
	}
	public void setCor(String cor) {
		this.cor=cor;
	}
	public String getCor() {
		return cor;
	}
	public void setPonta(float ponta) {
		this.ponta=ponta;
	}
	public float getPonta() {
		return ponta;
	}
	public void setCarga(int carga) {
		this.carga=carga;
	}
	public int getCarga() {
		return carga;
	}
	public void setTampada(boolean tampada) {
		this.tampada=tampada;
	}
	public boolean getTampada() {
		return tampada;
	}
    
}
