package br.com.alura;

//import java.awt.Color;
//import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.InputStream;
import java.net.URL;

import javax.imageio.ImageIO;

public class GeradoraDeStickers {
	
	public void cria(String nomeArquivo, String url) throws Exception {
		
		//Leitura da imagem
		InputStream inputStream = new URL(url).openStream();
		BufferedImage imagemOriginal = ImageIO.read(inputStream);
		
		//Cria nova imagem em memória com transparência e com tamanho novo
		int largura = imagemOriginal.getWidth();
		int altura = imagemOriginal.getHeight();
		//int novaAltura = altura + 200;
		BufferedImage imagemNova = new BufferedImage(largura, altura, BufferedImage.TRANSLUCENT);
		
		//Copiar a imagem original para novo imagem (em memória)]
		Graphics2D graphics = (Graphics2D) imagemNova.getGraphics();
		graphics.drawImage(imagemOriginal, 0, 0, null);
		
		//Configurar Fonte
		//Font font = new Font(Font.SANS_SERIF, Font.BOLD, 64);
		//graphics.setColor(Color.yellow);
		//graphics.setFont(font);
		
		//Escrever uma frase na nova imagem
		//graphics.drawString("FILMINHO", 5, novaAltura - 100);
		
		//Escrever a nova imagem em um arquivo
		ImageIO.write(imagemNova, "png", new File("src/br/com/alura/saida/"+nomeArquivo));
		
		
	}
}
