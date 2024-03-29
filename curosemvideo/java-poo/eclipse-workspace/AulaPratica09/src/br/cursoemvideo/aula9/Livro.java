package br.cursoemvideo.aula9;

public class Livro implements Publicacao {
	//Atributos
	private String titulo;
	private String autor;
	private int totalPaginas;
	private int pagAtual=1;
	private boolean aberto=false;
	private Pessoa leitor;
	
	//M�todos
	
	public String detalhes() {
		return "Livro{" + "Titulo="+this.getTitulo()+"\n, Autor="+this.getAutor()+"\n, totalPaginas"+this.getTotalPaginas()+"\n, pagAtual"+this.getPagAtual()+"\n, Aberto="+this.aberto+"\n, leitor="+this.leitor.getNome()+"\n, idade="+this.leitor.getIdade()+"\n, sexo="+this.leitor.getSexo()+'}';		
	}
	//M�todos Sobrescritos (@Override)
	@Override
	public void abrir() {
		this.setAberto(true);
	}
	@Override
	public void fechar() {
		this.setAberto(false);
	}
	@Override
	public void volhear() {
		System.out.println("Folheando...");
	}
	@Override
	public void avancarPag() {
		if(this.getPagAtual()<this.getTotalPaginas()) {
			this.setPagAtual(this.pagAtual+1);
			System.out.println("Avan�ando uma pagina");
		}else {
			System.out.println("N�o � possivel avan�ar a pagina pois j� est� no final do livro.");
		}
	}
	@Override
	public void voltarPag() {
		if(this.getPagAtual()>1) {
			this.setPagAtual(this.pagAtual-1);
			System.out.println("Voltando uma pagina");
		}else {
			System.out.println("N�o � possivel voltar pois est� na primeira pagina");
		}
	}
	//M�todos Especiais
	public Livro(String titulo, String autor, int totalPaginas, Pessoa leitor) {
		super();
		this.titulo = titulo;
		this.autor = autor;
		this.totalPaginas = totalPaginas;
		this.leitor = leitor;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getAutor() {
		return autor;
	}
	public void setAutor(String autor) {
		this.autor = autor;
	}
	public int getTotalPaginas() {
		return totalPaginas;
	}
	public void setTotalPaginas(int totalPaginas) {
		this.totalPaginas = totalPaginas;
	}
	public int getPagAtual() {
		return pagAtual;
	}
	public void setPagAtual(int pagAtual) {
		this.pagAtual = pagAtual;
	}
	public boolean isAberto() {
		return aberto;
	}
	public void setAberto(boolean aberto) {
		this.aberto = aberto;
	}
	public Pessoa getLeitor() {
		return leitor;
	}
	public void setLeitor(Pessoa leitor) {
		this.leitor = leitor;
	}
	

}
