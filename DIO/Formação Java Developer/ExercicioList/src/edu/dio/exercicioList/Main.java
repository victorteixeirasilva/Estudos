package edu.dio.exercicioList;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;

public class Main {
	public static void main(String[] args) {	
		
		/*EXERCICIO PROPOSTO 2*/
/*
Utilizando listas, faça um programa que faça 5 perguntas para uma pessoa sobre um crime. As perguntas são:
1. "Telefonou para a vítima?"
2. "Esteve no local do crime?"
3. "Mora perto da vítima?"
4. "Devia para a vítima?"
5. "Já trabalhou com a vítima?"
Se a pessoa responder positivamente a 2 questões ela deve ser classificada como "Suspeita", entre 3 e 4 como
"Cúmplice" e 5 como "Assassina". Caso contrário, ele será classificado como "Inocente". 
*/
	
		List<String> respostas = new ArrayList<>();
		Scanner entrada = new Scanner(System.in);
		
		System.out.println("Perguntas: ");
		System.out.print("\nTelefonou para vítima? ");
		String resposta = entrada.next();
		respostas.add(resposta.toLowerCase());
		
		System.out.print("Esteve no local do crime? ");
		resposta = entrada.next();
		respostas.add(resposta.toLowerCase());
		
		System.out.print("Mora perto da vítima? ");
		resposta = entrada.next();
		respostas.add(resposta.toLowerCase());
		
		System.out.print("Devia para vítima? ");
		resposta = entrada.next();
		respostas.add(resposta.toLowerCase());
		
		System.out.print("Já trabalhou com a vítima? ");
		resposta = entrada.next();
		respostas.add(resposta.toLowerCase());
		
		System.out.println(respostas);
		
		int count = 0;
		Iterator<String> contador = respostas.iterator();
		
		while(contador.hasNext()) {
			String resp = contador.next();
			if(resp.contains("s")) {
				count++;
			}
		}
		
		switch(count) {
			case 2:
				System.out.println(">> SUSPEITA <<");
				break;
			case 3:
			case 4:
				System.out.println(">> CÚMPLICE <<");
				break;
			case 5:
				System.out.println(">> ASSASINO <<");
				break;
			default:
				System.out.println(">> INOCENTE <<");
				break;
		}
		
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


