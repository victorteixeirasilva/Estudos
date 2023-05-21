package edu.dio.exercicioList;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;

public class Main {
	public static void main(String[] args) {	
		
		/*EXERCICIO PROPOSTO 2*/
		
		
		/*EXERCICIO PROPOSTO 1
		//Recebe a média dos 6 primeiros meses do ano e armazene-os em uma lista.
		
		int mesCount = 1;
		Scanner entrada = new Scanner(System.in);
		
		List<Mes> meses = new ArrayList<>();
		
		for(int i = 1; i<=6; i++) {
			System.out.println("Informe a temperatura média do mês " + mesCount);
			Double tempMedia = entrada.nextDouble();
			mesCount++;
			if (mesCount == 1) {
				Mes mes = new Mes("JANEIRO", tempMedia);
				meses.add(mes);
			} else if (mesCount == 2) {
				Mes mes = new Mes("FEVEREIRO", tempMedia);
				meses.add(mes);
			} else if (mesCount == 3) {
				Mes mes = new Mes("MARÇO", tempMedia);
				meses.add(mes);
			} else if (mesCount == 4) {
				Mes mes = new Mes("ABRIL", tempMedia);
				meses.add(mes);
			} else if (mesCount == 5) {
				Mes mes = new Mes("MAIO", tempMedia);
				meses.add(mes);
			} else {
				Mes mes = new Mes("JUNHO", tempMedia);
				meses.add(mes);
			} 
		}
		
		//Calcula a média semestral das temperaturas
		Iterator<Mes> iterator = meses.iterator();
		
		Double soma = 0.0;
		Double mediaSemestre = 0.0;
		
		while(iterator.hasNext()) {
			Mes next = iterator.next();
			soma += next.getTemperaturaMedia();
		}
		mediaSemestre = (soma/6);
		
		System.out.println("A temperatura média desse semestre foi "+mediaSemestre);
		
		
		//Mostrar todas as temperaturas acima desta média, e em que mês elas ocorreram
		Iterator<Mes> iterator2 = meses.iterator();
		
		while(iterator2.hasNext()) {
			Mes next = iterator2.next();
			if(next.getTemperaturaMedia() >= mediaSemestre) {
				System.out.println("Mês: "+next.getNomeMes()+", Temperatura: "+next.getTemperaturaMedia());
			}
		}
		 */
	}
}


