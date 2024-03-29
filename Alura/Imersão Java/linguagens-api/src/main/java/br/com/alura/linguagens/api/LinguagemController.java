package br.com.alura.linguagens.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class LinguagemController {
	
	@Autowired
	private LinguagemRepository repositorio;
	
	@GetMapping("/linguagens")
	public List<Linguagem> obterLinguagens() {
		List<Linguagem> linguagens = repositorio.findAll(); // Db
		return linguagens;
	}
	
	@PostMapping("/linguagens")
	public Linguagem cadastrarLinguagem(@RequestBody Linguagem linguagem) {
		Linguagem linguagemSalva = repositorio.save(linguagem);
		return linguagemSalva;
	}
	
	//@DeleteMapping("/linguagens")
	//public Linguagem deletarLinguagem(@RequestBody Linguagem linguagem) {
		//Linguagem linguagemDeletada = repositorio.delete(linguagem);
		//return linguagemDeletada;
	//}
	
	@DeleteMapping("/linguagens")
    public void deletarLinguagem(@PathVariable("id") Linguagem id) {
        this.repositorio.delete(id);
    }
	
}
