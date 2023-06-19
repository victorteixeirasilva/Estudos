package br.com.dio.java.io.IOCharacter;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.util.Scanner;

public class ExemploIOData {
	
	public static void incluirProduto() throws IOException {
		
		File f = new File("/home/vitin.teixx/Documentos/peca-de-roupa.bin");
		
		PrintStream ps = new PrintStream(System.out);
		ps.flush();
		
		DataOutputStream dos = new DataOutputStream(new FileOutputStream(f.getPath()));
		
		Scanner scan = new Scanner(System.in);
		
		ps.print("Nome da peça: ");
		String nome =  scan.nextLine();
		dos.writeUTF(nome);
		
		ps.print("Tamanho da peça (P/M/G/U)");
		char tamanho = (char) System.in.read();
		dos.writeChar(tamanho);
		
		ps.print("Quantidade:");
		int quant = scan.nextInt();
		dos.writeInt(quant);
		
		ps.print("Proço unitário:");
		double preco = scan.nextDouble();
		dos.writeDouble(preco);
		
		ps.print("O arquivo "+f.getName()+" foi criado com "+f.length()+" bytes no diretório '"+f.getAbsolutePath()+"'.\n");
		
		lerProduto(f.getPath());
		
		dos.close();
		scan.close();
		ps.close();
		
	}
	
	public static void lerProduto(String caminhoArquivo) throws IOException {
		
		File f = new File(caminhoArquivo);
		
		DataInputStream dis = new DataInputStream(new FileInputStream(f.getPath()));
		
		String nome = dis.readUTF();
		char tamanho = dis.readChar();
		int quantidade = dis.readInt();
		double preco = dis.readDouble();
		
		System.out.println("\nNome...................:"+nome);
		System.out.println("\nQuantidade...................:"+quantidade);
		System.out.println("\nTamanho...................:"+tamanho);
		System.out.println("\nPreço...................:"+preco);
		System.out.println("\nTotal das peças...................:"+(quantidade*preco));
		
		dis.close();
		
	}
	
	public static void main(String[] args) throws IOException {
		incluirProduto();
	}
}
