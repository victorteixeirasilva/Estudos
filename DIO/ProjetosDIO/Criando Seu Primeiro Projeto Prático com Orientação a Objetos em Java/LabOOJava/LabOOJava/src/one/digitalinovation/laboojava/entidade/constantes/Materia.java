package one.digitalinovation.laboojava.entidade.constantes;

public enum Materia {

    M2(2),
    M5(5),
    M10(10);

    private double fator;

    /**
     * Construtor.
     * @param fator valor por tipo que influencia no cálculo de frete.
     *
     */
    Materia(double fator){
        this.fator = fator / 100;
    }

    public double getFator() {
        return fator;
    }
}
