package br.cursoemvideo.aula10;

public class ProgramaPrincipal {
	public static void main(String[] args) {
	Pessoa p1 = new Pessoa();
	Aluno p2 = new Aluno();
	Professor p3 = new Professor();
	Funcionario p4 = new Funcionario();
	
	p1.setNome("Pedro");
	p2.setNome("Maria");
	p3.setNome("Cl�udio");
	p4.setNome("F");
	
	p2.setCurso("ADS");
	p3.setSalario(5000.00f);
	p4.setSetor("SEGURAN�ADAINFORMA��O");
	
	p1.inf();
	p2.inf();
	p3.inf();
	p4.inf();
	
	p3.receberAum(550.20f);
	p2.cancelarMatr();
	p4.mudarTrabalho("SOFTWAREENGINER");
	
	p1.inf();
	p2.inf();
	p3.inf();
	p4.inf();
	}
}
