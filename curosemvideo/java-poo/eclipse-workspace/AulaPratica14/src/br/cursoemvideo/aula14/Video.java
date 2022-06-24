package br.cursoemvideo.aula14;

public class Video implements AcoesVideos {
	//Atributos
	private String titulo;
	private int avaliacao;
	private int views;
	private int curtidas;
	private boolean reproduzindo;
	//Metodos Sobrescritos
	@Override
	public void play() {
		if(this.isReproduzindo()==false) {
			this.setReproduzindo(true);
			System.out.println("Iniciando Reprodução...");
		} else {
			System.out.println("Não é possivel dar play o video já está sendo reproduzido");
		}
	}
	@Override
	public void pause() {
		if(this.isReproduzindo()) {
			this.setReproduzindo(false);
			System.out.println("Video Pausado...");
		}else {
			System.out.println("Impossivel pausar pois o video já está parado");
		}
	}
	@Override
	public void like() {
		this.setCurtidas(this.getCurtidas()+1);
		System.out.println("Esse video tem: "+this.getCurtidas());
	}
	//Metodos Especiais
	
	public String getTitulo() {
		return titulo;
	}
	public Video(String titulo) {
		super();
		this.titulo = titulo;
		this.avaliacao = 1;
		this.views = 0;
		this.curtidas = 0;
		this.reproduzindo = false;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public int getAvaliacao() {
		return avaliacao;
	}
	public void setAvaliacao(int avalicao) {
		this.avaliacao = avalicao;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public int getCurtidas() {
		return curtidas;
	}
	public void setCurtidas(int curtidas) {
		this.curtidas = curtidas;
	}
	public boolean isReproduzindo() {
		return reproduzindo;
	}
	public void setReproduzindo(boolean reproduzindo) {
		this.reproduzindo = reproduzindo;
	}
	@Override
	public String toString() {
		return super.toString();
	}
	
	

}
