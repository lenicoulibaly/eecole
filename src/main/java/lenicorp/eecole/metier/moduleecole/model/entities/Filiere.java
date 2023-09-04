package lenicorp.eecole.metier.moduleecole.model.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.envers.Audited;
import org.hibernate.envers.RelationTargetAuditMode;

import java.time.LocalDateTime;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor
@Entity
@Audited(targetAuditMode = RelationTargetAuditMode.NOT_AUDITED)
public class Filiere
{
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ID_FILIERE_GEN")
    @SequenceGenerator(name = "ID_FILIERE_GEN", sequenceName = "ID_FILIERE_GEN")
    private Long id;
    private String nomFiliere;
    private String domaine;

    @Column(name = "DeletedAt")
    private LocalDateTime deletedAt;
    @Column(name = "DeletedBy", length = 50)
    private String deletedBy;
    @Column(name = "isDeleted", length = 50)
    private Boolean isDeleted = false;
}
