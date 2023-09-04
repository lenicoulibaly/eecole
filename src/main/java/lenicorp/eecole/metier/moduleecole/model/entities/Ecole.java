package lenicorp.eecole.metier.moduleecole.model.entities;

import jakarta.persistence.*;
import lenicorp.eecole.typemodule.model.entities.Type;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.envers.Audited;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.LocalDateTime;
import java.util.List;

@Getter @Setter  @NoArgsConstructor @AllArgsConstructor
@Entity
@Audited @EntityListeners(AuditingEntityListener.class)
public class Ecole
{
    @Id @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ID_ECOLE_GEN")
    @SequenceGenerator(name = "ID_ECOLE_GEN", sequenceName = "ID_ECOLE_GEN")
    private Long id;
    private String nomEcole;
    private String sigleEcole;
    private String situationGeo;
    private String tel;
    private String fax;
    private String adresse;
    private String email;
    private String codeEcole;
    private String codeMenet;
    @ManyToOne @JoinColumn(name = "CODE_TYPE_ECOLE")
    private Type typeEcole;
    @ManyToOne @JoinColumn(name = "ID_TUTELLE")
    private Ecole tutelle;
    @Transient
    private List<Ecole> representations;

    @CreatedDate
    @Column(name = "CreatedAt")
    private LocalDateTime createdAt;
    @CreatedBy
    @Column(name = "CreatedBy", length = 50)
    private String createdBy;
    @LastModifiedDate
    @Column(name = "UpdatedAt")
    private LocalDateTime updatedAt;
    @LastModifiedBy
    @Column(name = "UpdatedBy", length = 50)
    private String updatedBy;
    @Column(name = "DeletedAt")
    private LocalDateTime deletedAt;
    @Column(name = "DeletedBy", length = 50)
    private String deletedBy;
    @Column(name = "isDeleted", length = 50)
    private Boolean isDeleted = false;
    private String action;
    private String connectionId;
}
