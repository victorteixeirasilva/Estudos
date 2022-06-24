package br.cursoemvideo.aula5;

public class ClassePrincipal {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ContaBanco p1 = new ContaBanco();
		p1.setNumConta(1111);
		p1.setDono("Victor");
		p1.abrirConta("cp");
		
		ContaBanco p2 = new ContaBanco();
		p2.setNumConta(2222);
		p2.setDono("Leandro");
		p2.abrirConta("cc");
		
		p1.depocitar(100);
		p2.depocitar(500);
		p2.sacar(100.0);
		
		p1.sacar(150.0);
		p1.fecharConta();
		
		p1.estadoAtual();
		p2.estadoAtual();
		
		
	}

}
