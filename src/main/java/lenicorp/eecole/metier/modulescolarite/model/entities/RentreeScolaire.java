package lenicorp.eecole.metier.modulescolarite.model.entities;

import jakarta.persistence.*;
import lenicorp.eecole.metier.moduleecole.model.entities.Ecole;
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
public class RentreeScolaire
{
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @SequenceGenerator(name = "ID_RENTREE_SCOLAIRE_GEN", sequenceName = "ID_RENTREE_SCOLAIRE_GEN", allocationSize = 10)
    private Long id;
    @ManyToOne @JoinColumn(name = "ID_ANNEE_SCOLAIRE")
    private AnneeScolaire anneeScolaire;
    @ManyToOne @JoinColumn(name = "ID_ECOLE")
    private Ecole ecole;

    @Column(name = "DeletedAt")
    private LocalDateTime deletedAt;
    @Column(name = "DeletedBy", length = 50)
    private String deletedBy;
    @Column(name = "isDeleted", length = 50)
    private Boolean isDeleted = false;
}
