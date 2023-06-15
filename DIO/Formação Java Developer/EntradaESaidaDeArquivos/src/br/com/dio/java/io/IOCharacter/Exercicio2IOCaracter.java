package br.com.dio.java.io.IOCharacter;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Scanner;

public class Exercicio2IOCaracter {

	public static void lerTecladoEscreverDocumento() throws IOException {
		
		PrintWriter pw = new PrintWriter(System.out);
		pw.println("Digite 3 recomendações de filmes: ");
		pw.flush();
		
		Scanner scan = new Scanner(System.in);
		String line = scan.nextLine();
		
		File f = new File("recomendacoes.txt");
		
		BufferedWriter bw = new BufferedWriter(new FileWriter(f.getName()));
		
		do {
			bw.write(line);
			bw.newLine();
			bw.flush();
			line = scan.nextLine();
		} while (!(line.equalsIgnoreCase("fim")));
		
		pw.println("Arquivo "+f.getName()+" foi criado com sucesso!");
		pw.flush();
		
		pw.close();
		scan.close();
		bw.close();
	}
	
	public static void main(String[] args) throws IOException {
		lerTecladoEscreverDocumento();
	}
	
}
