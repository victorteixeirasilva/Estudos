package br.com.dio.java.io.IOCharacter;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

public class Exercicio3IOCaracter {
	public static void copiarArquivo() throws IOException {
		
		File f = new File("/home/vitin.teixx/Documentos/Estudos/DIO/Formação Java Developer/EntradaESaidaDeArquivos/recomendacoes.txt");
		String nameArquivo = f.getName();
		
		BufferedReader br = new BufferedReader(new FileReader(nameArquivo));
		String line = br.readLine();
		
		String nameArquivoCopy = nameArquivo.substring(0, nameArquivo.indexOf(".")).concat("-copy.txt");
		File fcopy = new File(nameArquivoCopy);
		
		BufferedWriter bw = new BufferedWriter(new FileWriter(fcopy.getName()));
		
		do {
			bw.write(line);
			bw.newLine();
			bw.flush();
			line = br.readLine();
		} while (!(line == null));
		
		System.out.println("Aquivo "+f.getName()+" copiado com sucesso! Com o tamanho "+f.length()+" bytes.");
		System.out.println("Aquivo "+fcopy.getName()+" criado com sucesso! Com o tamanho "+fcopy.length()+" bytes.");
		
		PrintWriter pw = new PrintWriter(System.out);
		pw.println("Recomende 3 livros: ");
		pw.flush();
		
		adicionarInfoNoArquivo(fcopy.getName());
		
		pw.println("Ok! Tudo certo. Tamanho do arquivo "+fcopy.length()+" bytes.");
		
		br.close();
		bw.close();
		pw.close();
		
	}
	
	public static void adicionarInfoNoArquivo(String arquivo) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		String line = br.readLine();
		
		BufferedWriter bw = new BufferedWriter(new FileWriter(arquivo, true));
		
		do {
			bw.write(line);
			bw.newLine();
			line = br.readLine();
		} while (!(line.equalsIgnoreCase("fim")));
		
		br.close();
		bw.close();
		
	}
	
	public static void main(String[] args) throws IOException {
		copiarArquivo();
	}
	
	
}
