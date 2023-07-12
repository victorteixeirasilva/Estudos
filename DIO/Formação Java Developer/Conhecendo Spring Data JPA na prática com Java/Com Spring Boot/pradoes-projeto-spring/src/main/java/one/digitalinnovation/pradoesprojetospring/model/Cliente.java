package one.digitalinnovation.pradoesprojetospring.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
@Entity
public class Cliente {
    @Id
    private Long id;
    private String nome;
    @Column(unique = true)
    private String cpf;
    @ManyToOne
    private Endereco endereco;

}
