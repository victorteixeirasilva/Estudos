package one.digitalinnovation.gof.Strategy;

public class Robo {

    private Comprotamento comprotamento;

    public void setComprotamento(Comprotamento comprotamento){
        this.comprotamento = comprotamento;
    }

    public void mover(){
        comprotamento.mover();
    }
}
