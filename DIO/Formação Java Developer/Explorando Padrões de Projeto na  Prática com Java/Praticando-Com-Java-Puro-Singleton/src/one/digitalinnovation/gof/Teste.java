package one.digitalinnovation.gof;

import one.digitalinnovation.gof.Facede.Facade;
import one.digitalinnovation.gof.Singleton.SingletonEager;
import one.digitalinnovation.gof.Singleton.SingletonLazy;
import one.digitalinnovation.gof.Singleton.SingletonLazyHolder;
import one.digitalinnovation.gof.Strategy.*;

/**
 * @author victorteixeirasilva
 * */
public class Teste {

    public static void main(String[] args) {

//        Testes relacionados ao Design Pattern Singleton:

        SingletonLazy singletonLazy = SingletonLazy.getInstance();
        System.out.println(singletonLazy);
        singletonLazy = SingletonLazy.getInstance();
        System.out.println(singletonLazy);

        SingletonEager singletonEager = SingletonEager.getInstance();
        System.out.println(singletonEager);
        singletonEager = SingletonEager.getInstance();
        System.out.println(singletonEager);

        SingletonLazyHolder singletonLazyHolder = SingletonLazyHolder.getInstance();
        System.out.println(singletonLazyHolder);
        singletonLazyHolder = SingletonLazyHolder.getInstance();
        System.out.println(singletonLazyHolder);

//        Testes relacionados Strategy:

        Comprotamento defensivo = new ComportamentoDefensivo();
        Comprotamento normal = new ComportamentoNormal();
        Comprotamento agressivo = new ComportamentoAgressivo();

        Robo robo = new Robo();
        robo.setComprotamento(normal);
        robo.mover();
        robo.mover();
        robo.setComprotamento(defensivo);
        robo.mover();
        robo.setComprotamento(agressivo);
        robo.mover();
        robo.mover();
        robo.mover();

//        Testes relacionados Facade:
        Facade facade = new Facade();
        facade.migrarCliente("Victor", "04917140");































    }
}
