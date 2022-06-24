package br.cursoemvideo.aula14;

public class Gafanhoto extends Pessoa {
	public Gafanhoto(String nome, int idade, String sexo, String login) {
		super(nome, idade, sexo);
		this.setLogin(login);
		this.totAssistindo = 0;
	}
	//Atributos
	private String login;
	private int totAssistindo;
	//Metodos
	public void viuMaisUm() {
		System.out.println("Vendo mais um video ");
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public int getTotAssistindo() {
		return totAssistindo;
	}
	public void setTotAssistindo(int totAssistindo) {
		this.totAssistindo = totAssistindo;
	}
	

}
