package lenicorp.eecole.sharedmodule.dtos;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor @AllArgsConstructor @Getter @Setter
public class SelectOption
{
    String id;
    String label;
    String typeName;

    public SelectOption(String id, String label) {
        this.id = id;
        this.label = label;
    }
}