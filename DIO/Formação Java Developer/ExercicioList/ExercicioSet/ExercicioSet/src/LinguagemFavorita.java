
public class LinguagemFavorita implements Comparable<LinguagemFavorita> {
	
	private String nome;
	private Integer anoDeCriacao;
	private String ide;
	
	public LinguagemFavorita(String nome, Integer anoDeCriacao, String ide) {
		this.nome = nome;
		this.anoDeCriacao = anoDeCriacao;
		this.ide = ide;
	}
	
	@Override
	public String toString() {
		return "{"+"nome='"+'\''+", anoDeCriacao="+anoDeCriacao+", ide='"+ide+'\''+'}';
	}
	
	@Override
	public int compareTo(LinguagemFavorita o) {
		// TODO Auto-generated method stub
		return 0;
	}

}
