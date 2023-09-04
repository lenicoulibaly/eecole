package lenicorp.eecole.modulestatut.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Id;
import lenicorp.eecole.sharedmodule.enums.TypeStatut;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.envers.Audited;
import org.hibernate.envers.RelationTargetAuditMode;

import java.time.LocalDateTime;

@AllArgsConstructor @NoArgsConstructor @Getter @Setter
@Entity
@Audited(targetAuditMode = RelationTargetAuditMode.NOT_AUDITED)
public class Statut {
  @Id
  private String staCode;
  private String staLibelle;
  private String staLibelleLong;
  @Enumerated
  private TypeStatut staType;
  @CreationTimestamp
  private LocalDateTime createdAt;
  @UpdateTimestamp
  private LocalDateTime updatedAt;

    public Statut(String staCode) {
      this.staCode = staCode;
    }
}
