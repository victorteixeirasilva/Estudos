package view;

import javax.swing.JOptionPane;

import main.Calculos;

public class Jogo {
	static int pontos = 0;
	static Calculos calculos;
	
	public static void main(String[] args) {
		Jogo.play();
	}
	
	public static void play() {
		int nivel = Integer.parseInt(JOptionPane.showInputDialog("Informe o nível de dificuldade desejado [1, 2 ou 3]:"));
		Jogo.calculos = new Calculos(nivel);
		
		JOptionPane.showMessageDialog(null, "Informe o resultado para a seguinte operação: ");
		
		// soma
		if(calculos.getOperacoes() == 0) {
			int resposta = Integer.parseInt(JOptionPane.showInputDialog(calculos.getValor1() + " + " + calculos.getValor2()));
			
			if(calculos.somar(resposta)) {
				Jogo.pontos += 1;
				JOptionPane.showMessageDialog(null, "Você tem " + Jogo.pontos + " ponto(s).");
			}
		}
		
		// subtrair
		if(calculos.getOperacoes() == 1) {
			int resposta = Integer.parseInt(JOptionPane.showInputDialog(calculos.getValor1() + " - " + calculos.getValor2()));
			
			if(calculos.subtrair(resposta)) {
				Jogo.pontos += 1;
				JOptionPane.showMessageDialog(null, "Você tem " + Jogo.pontos + " ponto(s).");
			}
		}
		
		// multiplicar
		if(calculos.getOperacoes() == 2) {
			int resposta = Integer.parseInt(JOptionPane.showInputDialog(calculos.getValor1() + " x " + calculos.getValor2()));
			
			if(calculos.multiplicar(resposta)) {
				Jogo.pontos += 1;
				JOptionPane.showMessageDialog(null, "Você tem " + Jogo.pontos + " ponto(s).");
			}
		} else {
			JOptionPane.showMessageDialog(null, "A operação " + calculos.getOperacoes() + "não é reconhecida.");
		}
		
		int continuar = Integer.parseInt(JOptionPane.showInputDialog("Deseja continuar? [1 - Sim, 0 - Não"));
		
		if(continuar == 1) {
			Jogo.play();
		} else {
			JOptionPane.showMessageDialog(null, "Você fez " + Jogo.pontos + " ponto(s).");
			JOptionPane.showMessageDialog(null, "Obrigado por jogar comigo, Até a próxima!");
			System.exit(0);
		}
		
	}
}
