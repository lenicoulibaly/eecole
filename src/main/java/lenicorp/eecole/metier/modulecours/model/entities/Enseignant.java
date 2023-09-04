package lenicorp.eecole.metier.modulecours.model.entities;

import jakarta.persistence.*;
import lenicorp.eecole.moduleauth.model.entities.AppUser;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//@Entity @DiscriminatorValue("ENSEIGNANT")
@NoArgsConstructor @AllArgsConstructor @Getter @Setter
public class Enseignant extends AppUser
{
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @SequenceGenerator(name = "ID_ENSEIGNANT_GEN", sequenceName = "ID_ENSEIGNANT_GEN", allocationSize = 10)
    private Long id;
}
