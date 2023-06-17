package br.com.dio.java.io.IOCharacter;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class ExemploIOBytes {
	
	public static void copiarArquivo() throws IOException {
		File f = new File("/home/vitin.teixx/Documentos/Estudos/DIO/Formação Java Developer/EntradaESaidaDeArquivos/recomendacoes-copy.txt");
		String nomeArquivo = f.getName();
		
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(f.getName()));
		
		String nomeArquivoCopy = nomeArquivo.substring(0, nomeArquivo.indexOf("-")).concat("-copy2.txt");
		File fcopy = new File(nomeArquivoCopy);
		
		BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(nomeArquivoCopy));
		
		int line = 0;
		while((line = bis.read()) != -1) {
			bos.write((char) line);
			bos.flush();
		}
		
		bis.close();
		bos.close();
		
	}
	
	public static void main(String[] args) throws IOException {
		copiarArquivo();
	}

}
