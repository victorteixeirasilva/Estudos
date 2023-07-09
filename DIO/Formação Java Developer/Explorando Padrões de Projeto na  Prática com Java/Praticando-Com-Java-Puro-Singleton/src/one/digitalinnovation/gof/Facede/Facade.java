package one.digitalinnovation.gof.Facede;

import subsistema1Crm.CrmService;
import subsistema2CEP.CepAPI;

public class Facade {
    public void migrarCliente(String nome, String cep){
        String cidade = CepAPI.getInstance().recuperarCidade(cep);
        String estado = CepAPI.getInstance().recuperarEstado(cep);

        CrmService.gravarCliente(nome,cep,cidade,estado);
    }
}
