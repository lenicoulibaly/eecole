package lenicorp.eecole.metier.modulescolarite.model.entities;

import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;
import lenicorp.eecole.moduleauth.model.entities.AppUser;
import lombok.*;

//@Entity @DiscriminatorValue("ELEVE")
@AllArgsConstructor @Getter @Setter
public class Eleve extends AppUser
{
}
