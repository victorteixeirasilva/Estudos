package br.cursoemvideo.aula07;

public class ProgramaPrincipal {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Lutador l[]=new Lutador[10];
		l[0]=new Lutador("Pretty Boy","Fran�a",31,1.75f,68.9f,11,2,1);
		l[1]=new Lutador("Putsscript","Brasil",29,1.68f,57.8f,14,2,3);
		l[2]=new Lutador("Snapshadow","EUA",35,1.65f,80.9f,12,2,1);
		l[3]=new Lutador("Dead Code","Austr�lia",28,1.93f,81.6f,13,0,2);
		l[4]=new Lutador("UF0Cobol","Brasil",37,1.70f,119.3f,5,4,3);
		l[5]=new Lutador("Nerdaart","EUA",30,1.81f,105.7f,12,2,4);
	
		l[0].apresentar();
		l[0].status();
		
		l[1].apresentar();
		l[1].status();
		
		l[2].apresentar();
		l[2].status();
		
		l[3].apresentar();
		l[3].status();
		
		l[4].apresentar();
		l[4].status();
		
		l[5].apresentar();
		l[5].status();
		
		Luta luta1=new Luta();
		luta1.marcarLuta(l[0], l[1]);
		luta1.lutar();
		
	}

}
