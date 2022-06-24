package br.cursoemvideo.aula06;

public class ControleRemoto implements Controladorr {
		//Atributos
		private int volume;
		private boolean ligado;
		private boolean tocando;
		//Metodos Especiais
		public ControleRemoto() {
			this.volume = 50;
			this.ligado = false;
			this.tocando = false;
		}
		public int getVolume() {
			return volume;
		}
		public void setVolume(int volume) {
			this.volume = volume;
		}
		public boolean isLigado() {
			return ligado;
		}
		public void setLigado(boolean ligado) {
			this.ligado = ligado;
		}
		public boolean isTocando() {
			return tocando;
		}
		public void setTocando(boolean tocando) {
			this.tocando = tocando;
		}
		//Metodos
		@Override
		public void ligar() {
			this.setLigado(true);
			
		}
		@Override
		public void desligar() {
			this.setLigado(false);
		}
		@Override
		public void abrirMenu() {
			System.out.println("Está Ligado? "+this.isLigado());
			System.out.println("Está Tocando? "+this.isTocando());
			System.out.print("Volume: "+this.getVolume());
			for(int i=0; i<=this.getVolume();i++) {
				System.out.print("|");
			}
		}
		@Override
		public void fecharMenu() {
			System.out.println("Fechando Menu...");
			
		}
		@Override
		public void maisVolume() {
			if(this.isLigado()) {
				this.setVolume(this.getVolume()+1);
			}else {
			}
		}
		@Override
		public void menosVolume() {
			if(this.isLigado()) {
				this.setVolume(this.getVolume()-1);
			}else {
			}
		}
		@Override
		public void ligarMudo() {
			if(this.isLigado() && this.getVolume()>0) {
				this.setVolume(0);
			}else {
				
			}
		}
		@Override
		public void desligarMudo() {
			if(this.isLigado() && this.getVolume()==0) {
				this.setVolume(5);
			}else {
				
			}
		}
		@Override
		public void play() {
			if(this.isLigado() && this.isTocando()==false) {
				this.setTocando(true);
			}else {
				
			}
		}
		@Override
		public void pause() {
			if(this.isLigado() && this.isTocando()) {
				this.setTocando(false);
			}
		}
		
		
		

}
