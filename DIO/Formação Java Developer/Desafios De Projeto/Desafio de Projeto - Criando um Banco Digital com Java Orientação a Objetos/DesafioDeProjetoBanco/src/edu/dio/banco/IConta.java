package edu.dio.banco;

public interface IConta {
	void sacar(Double valor);
	
	void depositar(Double valor);
	
	void transferir(Double valor, IConta contaDestino);
	
	void imprimirExtrato();
}
