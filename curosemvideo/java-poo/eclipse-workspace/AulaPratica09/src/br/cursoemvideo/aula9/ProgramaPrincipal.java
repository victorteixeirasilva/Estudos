package br.cursoemvideo.aula9;

public class ProgramaPrincipal {

	public static void main(String[] args) {
		Pessoa[] p=new Pessoa[3];
		Livro[] l=new Livro[4];
		
		p[0]=new Pessoa("Pedro",25,"M");
		p[1]=new Pessoa("Maria",25,"F");
		l[0]=new Livro("Aprendendo Java","José da Silva",300,p[0]);
		l[1]=new Livro("POO para Iniciantes","Pedro Paulo",500,p[1]);
		l[2]=new Livro("Java Avançado","Maria Candidato",800,p[0]);
		System.out.println(l[0].detalhes());
		System.out.println(l[1].detalhes());
		System.out.println(l[2].detalhes());

	}

}
