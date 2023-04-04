package br.fam.avaliacaoteorica;

public class Main {

	public static void main(String[] args) {
		Nota boletim = new Nota();
		
		boletim.EntrarNomeAluno();
		boletim.EntrarDisciplina();
		boletim.EntrarNotas();
		boletim.EntrarNotaA3();
		boletim.ValidarNota(boletim.a1, boletim, boletim.a3);
	}
}
