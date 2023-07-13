package one.digitalinnovation.pradoesprojetospring.repository;

import one.digitalinnovation.pradoesprojetospring.model.Cliente;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ClienteRepository extends JpaRepository<Cliente, Long> {
}
