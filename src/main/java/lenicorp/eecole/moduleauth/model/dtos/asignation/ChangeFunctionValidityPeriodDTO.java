package lenicorp.eecole.moduleauth.model.dtos.asignation;

import lenicorp.eecole.moduleauth.model.dtos.appfunction.ExistingFncId;
import lombok.*;

import java.time.LocalDateTime;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class ChangeFunctionValidityPeriodDTO
{
    @ExistingFncId
    private Long fncId;
    private LocalDateTime startAt;
    private LocalDateTime endAt;
}
