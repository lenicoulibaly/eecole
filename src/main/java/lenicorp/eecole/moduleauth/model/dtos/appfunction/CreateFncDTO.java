package lenicorp.eecole.moduleauth.model.dtos.appfunction;

import lenicorp.eecole.moduleauth.model.dtos.appuser.ExistingUserId;
import lenicorp.eecole.typemodule.model.dtos.ExistingTypeCode;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.util.Set;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor
public class CreateFncDTO
{
    private Long visibilityId;// Id de la cédante. Dans un autre projet ça peut désigner l'ID d'une autre entité
    private Long cesId; // Id du cessionnaire //Seulement valable dans le cadre du projet SynchronRE
    private String name;
    @ExistingUserId
    private Long userId;
    @ExistingTypeCode
    private String typeCode;
    protected int fncStatus;// 1 == actif, 2 == inactif, 3 == revoke
    protected LocalDate startsAt;
    protected LocalDate endsAt;
    private Set<String> roleCodes;
}
