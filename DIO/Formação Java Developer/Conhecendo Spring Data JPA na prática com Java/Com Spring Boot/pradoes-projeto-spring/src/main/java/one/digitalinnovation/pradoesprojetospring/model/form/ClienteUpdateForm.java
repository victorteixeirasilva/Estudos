package one.digitalinnovation.pradoesprojetospring.model.form;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class ClienteUpdateForm {

    private String nome;

    private EnderecoForm enderecoForm;
}
