package br.cursoemvideo.aula10;

public class Aluno extends Pessoa{
	//Atributos
	private int matr;
	private String curso;
	//M�todos
	public void cancelarMatr() {
		if(this.getMatr()!=0) {
			this.setMatr(0);
			System.out.println("Matricula Sendo Cancelada");
		}else {
			System.out.println("N�o � possivel Cancelar a matrica pois ela n�o existe");
		}
	}
	@Override
	public void inf() {
		System.out.println("NOME= "+this.getNome());
		System.out.println("IDADE= "+this.getIdade());
		System.out.println("SEXO= "+this.getSexo());
		System.out.println("MATRICULA= "+this.getMatr());
		System.out.println("CURSO= "+this.getCurso());
	}
	//M�todos Especiais
	public int getMatr() {
		return matr;
	}
	public void setMatr(int matr) {
		this.matr = matr;
	}
	public String getCurso() {
		return curso;
	}
	public void setCurso(String curso) {
		this.curso = curso;
	}
	

}
