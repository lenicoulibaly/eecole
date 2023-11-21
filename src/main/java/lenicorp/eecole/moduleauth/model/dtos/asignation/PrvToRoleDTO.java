package lenicorp.eecole.moduleauth.model.dtos.asignation;

import lenicorp.eecole.moduleauth.model.dtos.appprivilege.ExistingPrivilegeCode;
import lenicorp.eecole.moduleauth.model.dtos.approle.ExistingRoleCode;
import lombok.*;

import java.time.LocalDateTime;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class PrvToRoleDTO
{
    @ExistingRoleCode
    private Long roleId;
    @ExistingPrivilegeCode
    private Long privilegeId;
    private LocalDateTime startsAt;
    private LocalDateTime endsAt;
    private boolean permanent;
}
