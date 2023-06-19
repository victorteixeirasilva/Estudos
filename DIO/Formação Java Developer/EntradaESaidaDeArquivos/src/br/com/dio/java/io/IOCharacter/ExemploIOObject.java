package br.com.dio.java.io.IOCharacter;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;

public class ExemploIOObject {

	public static void serealizarObjeto() {
		File f = new File("gato"); //representação do documento
		//Objeto que será serealizado
		Gato gato = new Gato("Jon", "Tigrado", 19, true, true);
		
		ObjectOutputStream oos = null; // Inicializando o ObjectOutputStream
		
		try { //Tente 
			OutputStream os = new FileOutputStream(f.getAbsolutePath()); //Criando arquivo
			oos = new ObjectOutputStream(os); // Inicia o fluxo da serealização
			oos.writeObject(gato);//Metódo que escreve o objeto no arquivo
		} catch (FileNotFoundException e) { //Captura exigida pelo FileOutputStream
			//Caso apresente uma excepion FileNotFoundException, imprima a frase abaixo no console:
			System.out.println("Arquivo "+f.getName()+" não encontrado! Verifique o diretório "+e.getMessage());
			
		} catch (IOException e) { //Captura exigida pelo método writeObject(object);
			//Caso apresente uma exception IOException, imprima a frase abaixo no console:
			System.out.println("Não foi possível criar o arquivo "+f.getName());
			e.printStackTrace();
		} finally { //Esse bloco será executado, independente se teve exception ou não.
			try { //Tente
				oos.close();//Fechar o arquivo
			} catch (IOException e) { //Captura exigida pelo método close();
				System.out.println("Erro ao fechar o arquivo"+f.getName());
			}
		}
		
	}

	public static void desserializarObjeto(String arquivo) {
		
		File f = new File(arquivo);//Representação do documento
		
		ObjectInputStream ois = null;//Inicializando o ObjectOutputStream
		try { //Tente
			InputStream is = new FileInputStream(f.getName()); // Abrir o arquivo
			ois = new ObjectInputStream(is); //Iniciar o fluxo de leitura do objeto serealizado
			Gato gato = (Gato) ois.readObject();//Método que lê o objeto serealizado
			
			//Imprima no console:
			System.out.println("\nNome..................."+gato.getNome());
			System.out.println("\nIdade..................."+gato.getIdade());
			System.out.println("\nCor..................."+gato.getCor());
			System.out.println("\nCastrado..................."+gato.isCadastrado());
			System.out.println("\nRonrona..................."+gato.isRonrona());
			
		} catch (FileNotFoundException e) { //Captura exigida pelo FileInputStream
			System.out.println("Aquivo "+f.getName()+" não encontrado! Verifique o diretório "+e.getMessage());
		} catch (ClassNotFoundException e) { //Captura exigida pelo método readObject();
			System.out.println("Não foi possível ler o objeto do arquivo "+f.getName()+".");
		} catch (IOException e) { //Captura exigida pelo ObjectInputStream
			System.out.println("Erro ao abrir o arquivo "+f.getName());
		} finally { // Esse bloco sempre será executado, independente se teve exception ou não.
			try { //Tente
				ois.close();//Fechar o arquivo
			} catch (IOException e2) { //Captura exigida pelo método close()
				System.out.println("Erro ao fechar o arquivo "+f.getName());
			}
			
		}
	}
	
	public static void main(String[] args) {
		serealizarObjeto();
		desserializarObjeto("/home/vitin.teixx/Documentos/Estudos/DIO/Formação Java Developer/gato");
	}
	
	
	
	
	
}
