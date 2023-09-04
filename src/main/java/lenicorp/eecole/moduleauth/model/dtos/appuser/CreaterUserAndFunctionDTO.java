package lenicorp.eecole.moduleauth.model.dtos.appuser;

import jakarta.validation.Valid;
import lenicorp.eecole.moduleauth.model.dtos.appfunction.CreateInitialFncDTO;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor
public class CreaterUserAndFunctionDTO
{
    @Valid
    private CreateUserDTO createUserDTO;
    @Valid
    private List<CreateInitialFncDTO> createInitialFncDTO;
}
