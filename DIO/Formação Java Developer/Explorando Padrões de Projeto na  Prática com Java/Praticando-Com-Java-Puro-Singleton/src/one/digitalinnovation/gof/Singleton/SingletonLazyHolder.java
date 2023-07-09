package one.digitalinnovation.gof.Singleton;

/**
 * Sigleton  "Lazy Holder".
 *
 * @author victorteixeirasilva
 *
 * */
public class SingletonLazyHolder {

    private static class InstanceHolder{
        public static SingletonLazyHolder instancia = new SingletonLazyHolder();
    }

    private SingletonLazyHolder(){}

    public static SingletonLazyHolder getInstance(){
        return InstanceHolder.instancia;
    }

}
