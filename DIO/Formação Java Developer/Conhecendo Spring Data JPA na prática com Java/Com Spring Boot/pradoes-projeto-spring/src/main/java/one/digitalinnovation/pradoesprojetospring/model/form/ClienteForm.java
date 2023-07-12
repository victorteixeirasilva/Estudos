package one.digitalinnovation.pradoesprojetospring.model.form;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class ClienteForm {

    private String nome;
    private String cpf;
    private EnderecoForm enderecoForm;

}
