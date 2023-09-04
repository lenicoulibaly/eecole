package lenicorp.eecole.moduleauth.model.dtos.appfunction;

import com.fasterxml.jackson.annotation.JsonFormat;
import lenicorp.eecole.moduleauth.model.dtos.appuser.ExistingUserId;
import lenicorp.eecole.moduleauth.model.dtos.asignation.CoherentDates;
import lombok.*;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
@CoherentDates
public class UpdateFncDTO
{
    @ExistingFncId
    private Long fncId;
    @ExistingUserId
    private Long userId;
    private Long visibilityId;
    private String name;
    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDate startsAt;
    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDate endsAt;
    private Set<String> roleCodes = new HashSet<>();
}