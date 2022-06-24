package br.cursoemvideo.aula07;

import java.util.Random;

public class Luta {
	//Atributos
	private Lutador desafiado;
	private Lutador desafiante;
	private int rounds;
	private boolean aprovada;
	//M�todos
	public void marcarLuta(Lutador l1, Lutador l2) {
		if (l1.getCategoria().equals(l2.getCategoria())&&l1!=l2){
			this.aprovada=true;
			this.desafiado=l1;
			this.desafiante=l2;
		}else {
			this.aprovada=false;
			this.desafiado=null;
			this.desafiante=null;
		}
	}
	public void lutar() {
		if(this.aprovada) {
			System.out.println("### QUE COME�E A LUTA ###");
			System.out.println("### DESAFIADO ###");
			this.desafiado.apresentar();
			System.out.println("### DESAFIANTE ###");
			this.desafiante.apresentar();

			Random aleatorio=new Random();
			int vencedor=aleatorio.nextInt(3);
			switch(vencedor) {
			case 0:
				System.out.println("EMPATOU");
				this.desafiado.empatarLuta();
				this.desafiante.empatarLuta();
			case 1:
				System.out.println(this.desafiado.getNome()+" Ganhou a luta");
				this.desafiado.ganharLuta();
				this.desafiante.perderLuta();
			case 2:
				System.out.println(this.desafiante.getNome()+" Ganhou a luta");
				this.desafiante.ganharLuta();
				this.desafiado.perderLuta();
				break;
			}

		}else {
			System.out.println("A luta n�o pode acontecer.");
		}

	}
	//M�todos Especiais
	public Lutador getDesafiado() {
		return desafiado;
	}
	public void setDesafiado(Lutador desafiado) {
		this.desafiado = desafiado;
	}
	public Lutador getDesafiante() {
		return desafiante;
	}
	public void setDesafiante(Lutador desafiante) {
		this.desafiante = desafiante;
	}
	public int getRounds() {
		return rounds;
	}
	public void setRounds(int rounds) {
		this.rounds = rounds;
	}
	public boolean isAprovada() {
		return aprovada;
	}
	public void setAprovada(boolean aprovada) {
		this.aprovada = aprovada;
	}



}
