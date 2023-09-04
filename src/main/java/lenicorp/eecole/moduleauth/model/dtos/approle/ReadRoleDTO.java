package lenicorp.eecole.moduleauth.model.dtos.approle;

import lenicorp.eecole.moduleauth.model.dtos.appprivilege.ReadPrvDTO;
import lombok.*;

import java.util.Set;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class ReadRoleDTO
{
    private Long roleId;
    private String roleCode;
    private String roleName;
    private Set<ReadPrvDTO> privileges;
}
