package lenicorp.eecole.moduleauth.model.dtos.asignation;

import lenicorp.eecole.moduleauth.model.dtos.approle.ExistingRoleCode;
import lenicorp.eecole.moduleauth.model.dtos.approle.UniqueRoleCode;
import lenicorp.eecole.moduleauth.model.dtos.approle.UniqueRoleName;
import lombok.*;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
@UniqueRoleCode @UniqueRoleName
public class PrvsToRoleDTO
{

    private String roleName;
    @ExistingRoleCode
    private String roleCode;
    private Set<String> prvCodes = new HashSet<>();
    private LocalDate startsAt;
    private LocalDate endsAt;
    private boolean permanent;
}
