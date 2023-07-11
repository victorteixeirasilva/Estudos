package one.digitalinnovation.pradoesprojetospring.repository;

import one.digitalinnovation.pradoesprojetospring.model.Endereco;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EnderecoRepository extends CrudRepository<Endereco, String> {
}
