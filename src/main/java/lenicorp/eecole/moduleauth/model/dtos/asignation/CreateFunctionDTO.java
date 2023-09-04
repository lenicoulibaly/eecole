package lenicorp.eecole.moduleauth.model.dtos.asignation;

import lenicorp.eecole.moduleauth.model.dtos.appuser.ExistingUserId;
import lombok.*;

import java.time.LocalDate;
import java.util.Set;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
@CoherentDates
public class CreateFunctionDTO
{
    @ExistingUserId
    private Long userId;
    private Long[] visibilityIds;
    private String intitule;
    private LocalDate startsAt;
    private LocalDate endsAt;
    private Set<Long> roleIds;
}
