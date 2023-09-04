package lenicorp.eecole.moduleauth.model.dtos.appuser;

import lenicorp.eecole.moduleauth.model.dtos.appfunction.ReadFncDTO;
import lenicorp.eecole.moduleauth.model.enums.UserStatus;
import lombok.*;

import java.time.LocalDate;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class ReadUserDTO
{
    private Long userId;
    private String firstName;
    private String lastName;
    private String email;
    private String tel;
    private String lieuNaissance;
    private LocalDate dateNaissance;
    private Long idEcole;
    private String nomEcole;
    private String sigleEcole;
    private String civilite;
    private String paysCode;
    private String nationalite;
    private String codeTypePiece;
    private String typePiece;
    private String numPiece;
    private String nomPere;
    private String nomMere;

    private String codeTypeUtilisateur;
    private String typeUtilisateur;
    private boolean active;
    private boolean notBlocked;
    private Long currentFunctionId;
    private String codeStatut;
    private String statut;

    private UserStatus status;
    private ReadFncDTO currentFnc;
}
