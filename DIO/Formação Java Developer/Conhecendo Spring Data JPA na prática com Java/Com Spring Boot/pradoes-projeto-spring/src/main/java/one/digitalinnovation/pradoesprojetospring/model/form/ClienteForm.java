package one.digitalinnovation.pradoesprojetospring.model.form;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.br.CPF;
import org.springframework.stereotype.Component;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class ClienteForm {

    private String nome;

    @CPF(message = "'${validatedValue}' é invalido!")
    private String cpf;

    private EnderecoForm enderecoForm;

}
