package one.digitalinnovation.gof.Singleton;

/**
 * Singleton "Apressado".
 *
 * @author victorteixeirasilva
 */
public class SingletonEager {

    private static SingletonEager instancia = new SingletonEager();

    private SingletonEager() {
    }

    public static SingletonEager getInstance() {
        return instancia;
    }

}
