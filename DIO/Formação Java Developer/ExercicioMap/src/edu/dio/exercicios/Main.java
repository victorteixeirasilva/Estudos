package edu.dio.exercicios;

import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.TreeMap;

public class Main {

	public static void main(String[] args) {
		/*
		Dada a população estimada de alguns estados do nordeste brasileiro, faça:
		 Estado = PE - população = 9.616.621
		 Estado = AL - população = 3.351.543
		 Estado = CE - população  = 9.187.103
		 Estado = RN - população = 3.534.265
		 */
		
		System.out.println("Crie um dicionário que relacione os estados e suas respectivas populações: ");
		Map<String, Integer> populacaoEstadosNE = new HashMap<>();
		populacaoEstadosNE.put("PE", 9616621);
		populacaoEstadosNE.put("AL", 3351543);
		populacaoEstadosNE.put("CE", 9187103);
		populacaoEstadosNE.put("RN", 3534265);
		
		System.out.println(populacaoEstadosNE);
		
		System.out.println("Substitua a população do estado RN por : 3.534.165");
        populacaoEstadosNE.put("RN", 3534165);
        System.out.println(populacaoEstadosNE);
		
        System.out.println("Confira se o estado da Paraíba (PB) tucson está no dicionário, caso não, adicione " + "PB - 4.039.277: ");
        populacaoEstadosNE.put("PB", 4039277);
        System.out.println(populacaoEstadosNE);
        
        System.out.println("Exiba a população do estado PE: " + populacaoEstadosNE.get("PE"));
        
        System.out.println("Exiba todos os estados e suas populaçãos na ordem em que foram informados: ");
        Map<String, Integer> populacaoEstadosNE2 = new LinkedHashMap<>();
        populacaoEstadosNE2.put("PE", 9616621);
        populacaoEstadosNE2.put("AL", 3351543);
        populacaoEstadosNE2.put("CE", 9187103);
        populacaoEstadosNE2.put("RN", 3534265);
        populacaoEstadosNE2.put("PB", 4039277);
        System.out.println(populacaoEstadosNE2);
        
        System.out.println("Exiba todos os estados e suas populações na ordem alfabética: ");
        Map<String, Integer> populacaoEstadosNE3 = new TreeMap<>(populacaoEstadosNE);
        System.out.println(populacaoEstadosNE3);
        
        Collection<Integer> populacao = populacaoEstadosNE.values();
        String estadoMaiorPopulacao = "";
        String estadoMenorPopulacao = "";
        for(Map.Entry<String, Integer> entry : populacaoEstadosNE.entrySet()) {
        	if(entry.getValue().equals(Collections.max(populacao))) estadoMaiorPopulacao = entry.getKey();
        	if(entry.getValue().equals(Collections.min(populacao))) estadoMenorPopulacao = entry.getKey();
        }
        System.out.println("Exiba o estado com o menor população ("+estadoMenorPopulacao+") e seu respectivo valor ("+Collections.min(populacao));
        System.out.println("Exiba o estado com o maior população ("+estadoMaiorPopulacao+") e seu respectivo valor ("+Collections.max(populacao));
        
        int soma = 0;
        Iterator<Integer> iterator = populacaoEstadosNE.values().iterator();
        while(iterator.hasNext()) {
        	soma += iterator.next();
        }
        System.out.println("Exiba a soma da população desses estados: "+soma);
        
        System.out.println("Exiba a média da população deste dicionário de estados: "+(soma/populacaoEstadosNE.size()));
        System.out.println("Remova os estados com a população menor que 4.000.000: ");
        Iterator<Integer> iterator1 = populacaoEstadosNE.values().iterator();
        while(iterator1.hasNext()) {
        	if(iterator1.next() <= 4000000) iterator1.remove();
        }
        System.out.println(populacaoEstadosNE);
        
        System.out.println("Apague o dicionario de estados com suas respectivas populações estimadas: ");
        populacaoEstadosNE.clear();
        System.out.println(populacaoEstadosNE);
        
        System.out.println("Confira se a lista está vazia: "+populacaoEstadosNE);
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
		
	}

}
