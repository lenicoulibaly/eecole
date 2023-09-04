package lenicorp.eecole.typemodule.model.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter @AllArgsConstructor
public enum TypeGroup
{
    TYPE_REGLEMENT("TYP_REG", "Type de règlement"),
    MOUVEMENT("TYP_MVT", "TYPE-MOUVEMENT"),
    TYPE_PRV("TYP_PRV", "TYPE-PRIVILEGE"),
    DOCUMENT("TYP_DOC", "TYPE-DOCUMENT"),
    MODE_REGLEMENT("TYP_MOD_REG", "MODE_REGLEMENT"),
    TYPE_CIVILITE("TYP_CIV", "Civilité"),
    TYPE_PIECE("TYP_PCE", "Type de pièce"),
    TYPE_FONCTION("TYP_FNC", "Type de fonction"),
    TYPE_USER("TYP_USER", "Type d'utilisateur");
    private String groupCode;
    private String groupName;
}
