package lenicorp.eecole.metier.modulecours.model.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.envers.Audited;
import org.hibernate.envers.RelationTargetAuditMode;

@Entity
@NoArgsConstructor @AllArgsConstructor @Getter @Setter
@Audited(targetAuditMode = RelationTargetAuditMode.NOT_AUDITED)
public class Cours
{
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @SequenceGenerator(name = "ID_COURS_GEN", sequenceName = "ID_COURS_GEN", allocationSize = 10)
    private Long id;
}
