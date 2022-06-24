package br.cursoemvideo.aula13;

public class Cachorro extends Lobo {
	@Override
	public void emitirSom() {
		System.out.println("Au!Au!Au!");
	}
	public void reagir(String frase) {
		if (frase=="Ol�" || frase=="Comida") {
			System.out.println("Cachorro Abanando o Rabo e larindo de felicidade...");
		} else {
			System.out.println("Cachorro Rosnando...");
		}
	}
	public void reagir(int hora) {
		if (hora<12) {
			System.out.println("Cachorro Abanando o Rabo");
		} else if (hora>11 && hora<18) {
			System.out.println("Cachorro Abanando o Rabo e Latindo");
		} else {
			System.out.println("Cachorro te ignorando ");
		}
	}
	public void reagir(boolean dono) {
		if (dono) {
			System.out.println("(� DONO) Cachorro abanando o rabo");
		} else {
			System.out.println("(N�O �) Cachorro rosnando e letindo ");
		}
	}
}
