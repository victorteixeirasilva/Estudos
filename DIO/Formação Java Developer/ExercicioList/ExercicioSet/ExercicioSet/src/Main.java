
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

public class Main {
    public static void main(String[] args) {
        //Crie um conjunto contendo as cores do arco-íris
    	Set<String> arcoiris = new HashSet<>();
        
        arcoiris.add("Vermelho");
        arcoiris.add("Laranja");
        arcoiris.add("Amarelo");
        arcoiris.add("Verde");
        arcoiris.add("Azul");
        arcoiris.add("Anil");
        arcoiris.add("Violeta");
        
        //Exiba todas as cores uma abaixo da outra
        Iterator<String> iterator = arcoiris.iterator();
        while(iterator.hasNext()) {
        	String cor = iterator.next();
        	System.out.println(cor);	
        }
        
        //A quantidade de cores que o arco-íris tem
        System.out.println("A quantidade de cores no arco-íris é "+arcoiris.size());
        
        //Exiba as cores em ordem alfabética
        Set<String> coresArcoIris = new TreeSet<>(arcoiris);
        System.out.println(coresArcoIris);
        
        //Exiba as cores na ordem inversa da que foi informada
        Set<String> coresArcoIris2 = new LinkedHashSet<>(
        		Arrays.asList(
        				"Vermelho",
        				"Laranja",
        				"Amarelo",
        				"Verde",
        				"Azul",
        				"Anil",
        				"Violeta"
        				));
        System.out.println(coresArcoIris2);
        List<String> coresArcoIrisList = new ArrayList<>(coresArcoIris2);
        Collections.reverse(coresArcoIrisList);
        System.out.println(coresArcoIrisList);
       
        //Exiba todas as cores que começam com a letra "v"
        for (String cor : arcoiris) {
			if(cor.startsWith("V")) {
				System.out.println(cor);
			}
		}
       
        //Remova todas as cores que não começam com a letra "v"
        Iterator<String> iterator2 = arcoiris.iterator();
        while(iterator2.hasNext()) {
        	if(!iterator2.next().startsWith("V")) {
        		iterator2.remove();
        	}
        }
        System.out.println(arcoiris);
        
        //Limpe o conjunto
        arcoiris.clear();
        
        //Confira se o conjunto está vazio
        System.out.println(arcoiris);
        
        
    }
}