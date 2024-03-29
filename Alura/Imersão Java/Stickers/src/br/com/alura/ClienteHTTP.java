package br.com.alura;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpResponse.BodyHandlers;

public class ClienteHTTP {
	
	public String buscarDados(String url) {
		// Fazer uma conexão HTTP e buscar os top 250 filmes
		try {
			URI endereco = URI.create(url);
			HttpClient cliente = HttpClient.newHttpClient();
			HttpRequest request = HttpRequest.newBuilder(endereco).GET().build();
			HttpResponse<String> response = cliente.send(request, BodyHandlers.ofString());
			String body = response.body();
			return body;
			
		} catch (IOException | InterruptedException ex) {
			throw new RuntimeException(ex);
		}
		
	
	
	}

}
