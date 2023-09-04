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
public class UniteDeClasee
{
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ID_UNITE_DE_CLASSE_GEN")
    @SequenceGenerator(name = "ID_UNITE_DE_CLASSE_GEN", sequenceName = "ID_UNITE_DE_CLASSE_GEN")
    private Long id;
    @ManyToOne @JoinColumn(name = "ID_CLASSE")
    private Classe classe;
    private String nomUniteDeClasse;

    @Column(name = "DeletedAt")
    private LocalDateTime deletedAt;
    @Column(name = "DeletedBy", length = 50)
    private String deletedBy;
    @Column(name = "isDeleted", length = 50)
    private Boolean isDeleted = false;
}
