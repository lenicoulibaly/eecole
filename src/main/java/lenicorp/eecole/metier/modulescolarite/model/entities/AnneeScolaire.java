package lenicorp.eecole.metier.modulescolarite.model.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.envers.Audited;
import org.hibernate.envers.RelationTargetAuditMode;

import java.time.LocalDateTime;

@Entity
@NoArgsConstructor @AllArgsConstructor @Getter @Setter
@Audited(targetAuditMode = RelationTargetAuditMode.NOT_AUDITED)
public class AnneeScolaire
{
    @Id @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @SequenceGenerator(name = "ID_ANNEE_SCOLAIRE_GEN", sequenceName = "ID_ANNEE_SCOLAIRE_GEN", allocationSize = 10)
    private Long id;
    private long anneeDeDebut;
    private long anneeDeFin;
    private String libelleAnnee;

    @Column(name = "DeletedAt")
    private LocalDateTime deletedAt;
    @Column(name = "DeletedBy", length = 50)
    private String deletedBy;
    @Column(name = "isDeleted", length = 50)
    private Boolean isDeleted = false;
}
