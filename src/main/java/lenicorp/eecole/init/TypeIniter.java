package lenicorp.eecole.init;

import lenicorp.eecole.sharedmodule.enums.PersStatus;
import lenicorp.eecole.typemodule.controller.repositories.TypeParamRepo;
import lenicorp.eecole.typemodule.controller.repositories.TypeRepo;
import lenicorp.eecole.typemodule.model.entities.Type;
import lenicorp.eecole.typemodule.model.entities.TypeParam;
import lenicorp.eecole.typemodule.model.enums.TypeGroup;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service @RequiredArgsConstructor
public class TypeIniter implements Initer
{
    private final TypeRepo typeRepo;
    private final TypeParamRepo typeParamRepo;
    @Override
    public void init()
    {
        Type t7 = typeRepo.save(new Type(null, TypeGroup.TYPE_PRV, "PRV-AFF", PersStatus.ACTIVE, null, "Privilège du module affaire"));
        Type t8 = typeRepo.save(new Type(null, TypeGroup.TYPE_PRV, "PRV-ADM", PersStatus.ACTIVE, null, "Privilège du module admin"));

        Type paiement = typeRepo.save(new Type(null, TypeGroup.TYPE_REGLEMENT, "paiements", PersStatus.ACTIVE, null, "Paiement reçu"));
        Type reversement = typeRepo.save(new Type(null, TypeGroup.TYPE_REGLEMENT, "reversements", PersStatus.ACTIVE, null, "Reversement"));
        Type virement = typeRepo.save(new Type(null, TypeGroup.MODE_REGLEMENT, "VRG", PersStatus.ACTIVE, null, "Virement bancaire"));
        Type Chèque = typeRepo.save(new Type(null, TypeGroup.MODE_REGLEMENT, "CHE", PersStatus.ACTIVE, null, "Chèque"));

        //Doc user
        Type userDoc = typeRepo.save(new Type(null, TypeGroup.DOCUMENT, "DOC_USR", PersStatus.ACTIVE, null, "Document d'utilisateur"));
        Type photo = typeRepo.save(new Type(null, TypeGroup.DOCUMENT, "PHT", PersStatus.ACTIVE, null, "Photo"));
        typeParamRepo.save(new TypeParam(null, userDoc, photo, PersStatus.ACTIVE));

        //Doc reglement
        Type docReglement = typeRepo.save(new Type(null, TypeGroup.DOCUMENT, "DOC_REG", PersStatus.ACTIVE, null, "Document de règlement"));
        Type recuReglement = typeRepo.save(new Type(null, TypeGroup.DOCUMENT, "RECU_REG", PersStatus.ACTIVE, null, "Recu de règlement"));
        Type chequeRegelemnt = typeRepo.save(new Type(null, TypeGroup.DOCUMENT, "CHEQ", PersStatus.ACTIVE, null, "Chèque de règlement"));
        Type bordereauVirement = typeRepo.save(new Type(null, TypeGroup.DOCUMENT, "BORD_VIR", PersStatus.ACTIVE, null, "Bordereau de virement"));
        Type ordreVirement = typeRepo.save(new Type(null, TypeGroup.DOCUMENT, "ORD_VIR", PersStatus.ACTIVE, null, "Ordre de virement"));
        typeParamRepo.save(new TypeParam(null, docReglement, recuReglement, PersStatus.ACTIVE));
        typeParamRepo.save(new TypeParam(null, docReglement, chequeRegelemnt, PersStatus.ACTIVE));
        typeParamRepo.save(new TypeParam(null, docReglement, bordereauVirement, PersStatus.ACTIVE));
        typeParamRepo.save(new TypeParam(null, docReglement, ordreVirement, PersStatus.ACTIVE));

        //Type de privilege
        Type prvStatType = typeRepo.save(new Type(null, TypeGroup.TYPE_PRV, "PRV-STAT", PersStatus.ACTIVE, null, "Statistique"));
        Type prvUserType = typeRepo.save(new Type(null, TypeGroup.TYPE_PRV, "PRV-USER", PersStatus.ACTIVE, null, "Utilisateur"));
        Type prvFoncType = typeRepo.save(new Type(null, TypeGroup.TYPE_PRV, "PRV-FONC", PersStatus.ACTIVE, null, "Fonction"));
        Type prvPrvType = typeRepo.save(new Type(null, TypeGroup.TYPE_PRV, "PRV-PRV", PersStatus.ACTIVE, null, "Privilège"));
        Type prvRolType = typeRepo.save(new Type(null, TypeGroup.TYPE_PRV, "PRV-ROL", PersStatus.ACTIVE, null, "Rôle"));
        Type prvFacType = typeRepo.save(new Type(null, TypeGroup.TYPE_PRV, "PRV-FAC", PersStatus.ACTIVE, null, "Affaire FAC"));
        Type prvTraiType = typeRepo.save(new Type(null, TypeGroup.TYPE_PRV, "PRV-TRAI", PersStatus.ACTIVE, null, "Traité"));
        Type prvParamType = typeRepo.save(new Type(null, TypeGroup.TYPE_PRV, "PRV-PARAM", PersStatus.ACTIVE, null, "Paramètre"));
        //Type prvPlaType = typeRepo.save(new Type(null, TypeGroup.TYPE_PRV, "PRV-PLA", "Placement", PersStatus.ACTIVE, null, null));
        Type prvComptaType = typeRepo.save(new Type(null, TypeGroup.TYPE_PRV, "PRV-COMPTA", PersStatus.ACTIVE, null, "Comptabilité"));
        Type prvDevType = typeRepo.save(new Type(null, TypeGroup.TYPE_PRV, "PRV-DEV", PersStatus.ACTIVE, null, "Développeur"));
        Type prvRepType = typeRepo.save(new Type(null, TypeGroup.TYPE_PRV, "PRV-REP", PersStatus.ACTIVE, null, "Repartition"));
        Type prvSinType = typeRepo.save(new Type(null, TypeGroup.TYPE_PRV, "PRV-SIN", PersStatus.ACTIVE, null, "Sinistre"));

        //Type fonction
        Type fonctionOperateurDeSaisieCedante = typeRepo.save(new Type(null, TypeGroup.TYPE_FUNCTION, "TYF_SAI_CED", PersStatus.ACTIVE, null, "Opérateur de saisie cédante"));
        Type fonctionSouscripteur = typeRepo.save(new Type(null, TypeGroup.TYPE_FUNCTION, "TYF_SOUS", PersStatus.ACTIVE, null, "Souscripteur"));

        Type fonctionValidateur = typeRepo.save(new Type(null, TypeGroup.TYPE_FUNCTION, "TYF_VAL", PersStatus.ACTIVE, null, "Validateur"));
        Type fonctionComptable = typeRepo.save(new Type(null, TypeGroup.TYPE_FUNCTION, "TYF_COMPTA", PersStatus.ACTIVE, null, "Comptable"));

        Type fonctionAdminFonc = typeRepo.save(new Type(null, TypeGroup.TYPE_FUNCTION, "TYF_ADM_FONC", PersStatus.ACTIVE, null, "Administrateur fonctionnel"));
        Type fonctionAdminTech = typeRepo.save(new Type(null, TypeGroup.TYPE_FUNCTION, "TYF_ADM_TECH", PersStatus.ACTIVE, null, "Administrateur technique"));

        Type fonctionDev = typeRepo.save(new Type(null, TypeGroup.TYPE_FUNCTION, "TYF_DEV", PersStatus.ACTIVE, null, "Développeur"));
    }
}
