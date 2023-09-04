package lenicorp.eecole.init;

import lenicorp.eecole.modulestatut.entities.Statut;
import lenicorp.eecole.modulestatut.repositories.StatutRepository;
import lenicorp.eecole.sharedmodule.enums.TypeStatut;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Arrays;

@Service @RequiredArgsConstructor
public class StatutIniter implements Initer
{
    private final StatutRepository staRepo;
    @Override
    public void init() {
        Statut s1 = staRepo.save(new Statut("SAI", "Saisie", "Saisie", TypeStatut.PARTAGE, LocalDateTime.now(), LocalDateTime.now()));
        Statut s2 = staRepo.save(new Statut("TRA", "Transmis(e)", "Transmis", TypeStatut.PARTAGE, LocalDateTime.now(), LocalDateTime.now()));
        Statut s3 = staRepo.save(new Statut("RET", "Retourné(e)", "Retourné(e)", TypeStatut.PARTAGE, LocalDateTime.now(), LocalDateTime.now()));
        Statut s4 = staRepo.save(new Statut("VAL", "Validé(e)", "Validé(e)", TypeStatut.PARTAGE, LocalDateTime.now(), LocalDateTime.now()));
        Statut s5 = staRepo.save(new Statut("ARC", "Archivé(e)", "Archivé(e)", TypeStatut.PARTAGE, LocalDateTime.now(), LocalDateTime.now()));
        Statut s6 = staRepo.save(new Statut("SUP", "Supprimé(e)", "supprimé(e)", TypeStatut.PARTAGE, LocalDateTime.now(), LocalDateTime.now()));

        Statut s7 = staRepo.save(new Statut("ACT", "Actif", "Actif", TypeStatut.PERSISTANCE, LocalDateTime.now(), LocalDateTime.now()));
        Statut s8 = staRepo.save(new Statut("SUPP", "Supprimée", "Supprimé", TypeStatut.PERSISTANCE, LocalDateTime.now(), LocalDateTime.now()));

        Statut s12 = staRepo.save(new Statut("AVAL", "En attente de validation", "En attente de validation", TypeStatut.PARTAGE, LocalDateTime.now(), LocalDateTime.now()));
        Statut S13 = staRepo.save(new Statut("VAL", "Validé(e)", "Validé(e)", TypeStatut.PARTAGE, LocalDateTime.now(), LocalDateTime.now()));
        Statut S14 = staRepo.save(new Statut("ACONF", "En attente de confirmation", "En attente de confirmation", TypeStatut.PLACEMENT, LocalDateTime.now(), LocalDateTime.now()));
        Statut s15 = staRepo.save(new Statut("REFUSE", "Refusé(e)", "Refusé(e)", TypeStatut.PARTAGE, LocalDateTime.now(), LocalDateTime.now()));
        Statut S16 = staRepo.save(new Statut("ANNULE", "Annulé(e)", "Annulé(e)", TypeStatut.PARTAGE, LocalDateTime.now(), LocalDateTime.now()));
        Statut S17 = staRepo.save(new Statut("MOD", "Modifié(e)", "Modifié(e)", TypeStatut.PARTAGE, LocalDateTime.now(), LocalDateTime.now()));

        //CPAI-CREV

        Statut s19 = staRepo.save(new Statut("SAI-CRT", "Saisie courtier", "Saisie(e) par le courtier", TypeStatut.PARTAGE, LocalDateTime.now(), LocalDateTime.now()));
        Statut s20 = staRepo.save(new Statut("APAI", "En attente de paiement", "En attente de paiement", TypeStatut.PARTAGE, LocalDateTime.now(), LocalDateTime.now()));
        Statut s21 = staRepo.save(new Statut("CPAI", "En cours de paiement", "En cours de paiement", TypeStatut.PARTAGE, LocalDateTime.now(), LocalDateTime.now()));

        Statut crev =staRepo.save(new Statut("CREV", "En cours de reversement", "En cours de reversement", TypeStatut.PARTAGE, LocalDateTime.now(), LocalDateTime.now()));
        Statut cpai_crev =staRepo.save(new Statut("CPAI-CREV", "En cours de paiement et de reversement", "En cours de paiement et de reversement", TypeStatut.PARTAGE, LocalDateTime.now(), LocalDateTime.now()));

        Statut s22 =staRepo.save(new Statut("SOLD", "Règlement soldé", "Règlement soldé", TypeStatut.PARTAGE, LocalDateTime.now(), LocalDateTime.now()));
        Statut usrBlq =staRepo.save(new Statut("USR-BLQ", "Utilisateur bloqué", "Utilisateur bloqué", TypeStatut.USER, LocalDateTime.now(), LocalDateTime.now()));
        Statut usrAct =staRepo.save(new Statut("USR-ACT", "Utilisateur actif", "Utilisateur actif", TypeStatut.USER, LocalDateTime.now(), LocalDateTime.now()));
        Statut usrAact =staRepo.save(new Statut("USR-AACT", "Utilisateur en attente d'activation", "Utilisateur en attente d'activation", TypeStatut.USER, LocalDateTime.now(), LocalDateTime.now()));
        Statut usrAla =staRepo.save(new Statut("USR-ALA", "Utilisateur en attente d'un lien d'activation", "Utilisateur en attente d'un lien d'activation", TypeStatut.USER, LocalDateTime.now(), LocalDateTime.now()));

    }
}
