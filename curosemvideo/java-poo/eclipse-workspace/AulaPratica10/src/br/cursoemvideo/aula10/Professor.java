package br.cursoemvideo.aula10;

public class Professor extends Pessoa {
	private String especialidade;
	private float salario;
	public void receberAum(float aum) {
		System.out.println("Salariro Antigo: "+this.getSalario());
		this.setSalario(getSalario()+aum);
		System.out.println("Teve um aumento de: "+aum);
		System.out.println("Salario Atual: "+this.getSalario());
		
	}
	@Override
	public void inf() {
		System.out.println("NOME= "+this.getNome());
		System.out.println("IDADE= "+this.getIdade());
		System.out.println("SEXO= "+this.getSexo());
		System.out.println("ESPECIALIDADE= "+this.getEspecialidade());
		System.out.println("SALARIO= "+this.getSalario());
	}
	public String getEspecialidade() {
		return especialidade;
	}
	public void setEspecialidade(String especialidade) {
		this.especialidade = especialidade;
	}
	public float getSalario() {
		return salario;
	}
	public void setSalario(float salario) {
		this.salario = salario;
	}
	

}
