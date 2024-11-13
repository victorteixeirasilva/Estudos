package one.digitalinovation.laboojava.entidade;

import one.digitalinovation.laboojava.entidade.constantes.Materia;

/**
 *
 * Classe que representa um caderno, qual é uma especialização de um produto da loja.
 * @author Victor Teixeira Silva
 *
 */
public class Caderno extends Produto {

    @Override
    public double calcularFrete() {
        return (getPreco() * getQuantidade()) * (1 + qtdMaterias.getFator());
    }

    /**
     * Quantidade de Materias
     */
    private Materia qtdMaterias;

    public Materia getQtdMaterias() {
        return qtdMaterias;
    }

    public void setQtdMaterias(Materia qtdMaterias) {
        this.qtdMaterias = qtdMaterias;
    }

    @Override
    public String toString() {
        return "Caderno{" +
                "qtdMaterias=" + qtdMaterias + '\'' +
                ", codigo='" + getCodigo() + '\'' +
                ", preço='" + getPreco() + '\'' +
                '}';
    }
}
