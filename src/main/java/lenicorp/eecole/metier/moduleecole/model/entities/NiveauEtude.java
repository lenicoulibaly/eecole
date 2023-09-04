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
public class NiveauEtude
{
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ID_NIVEAU_ETUDE_GEN")
    @SequenceGenerator(name = "ID_NIVEAU_ETUDE_GEN", sequenceName = "ID_NIVEAU_ETUDE_GEN")
    private Long id;
    private String nomNiveauEtude;
    private long rangNiveauEtude;
    @ManyToOne @JoinColumn(name = "ID_CYCLE_ETUDE")
    private CycleEtude cycleEtude;

    @Column(name = "DeletedAt")
    private LocalDateTime deletedAt;
    @Column(name = "DeletedBy", length = 50)
    private String deletedBy;
    @Column(name = "isDeleted", length = 50)
    private Boolean isDeleted = false;
}
