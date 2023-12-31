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

    public ReadUserDTO(Long userId, String firstName, String lastName, String email, String tel, String lieuNaissance, LocalDate dateNaissance, Long idEcole, String nomEcole, String sigleEcole, String civilite, String paysCode, String nationalite, String codeTypePiece, String typePiece, String numPiece, String nomPere, String nomMere, String codeTypeUtilisateur, String typeUtilisateur, boolean active, boolean notBlocked, Long currentFunctionId, String codeStatut, String statut) {
        this.userId = userId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.tel = tel;
        this.lieuNaissance = lieuNaissance;
        this.dateNaissance = dateNaissance;
        this.idEcole = idEcole;
        this.nomEcole = nomEcole;
        this.sigleEcole = sigleEcole;
        this.civilite = civilite;
        this.paysCode = paysCode;
        this.nationalite = nationalite;
        this.codeTypePiece = codeTypePiece;
        this.typePiece = typePiece;
        this.numPiece = numPiece;
        this.nomPere = nomPere;
        this.nomMere = nomMere;
        this.codeTypeUtilisateur = codeTypeUtilisateur;
        this.typeUtilisateur = typeUtilisateur;
        this.active = active;
        this.notBlocked = notBlocked;
        this.currentFunctionId = currentFunctionId;
        this.codeStatut = codeStatut;
        this.statut = statut;
    }
}
