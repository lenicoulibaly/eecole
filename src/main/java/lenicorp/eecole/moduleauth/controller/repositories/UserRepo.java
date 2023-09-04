package lenicorp.eecole.moduleauth.controller.repositories;

import lenicorp.eecole.moduleauth.model.dtos.appuser.ListUserDTO;
import lenicorp.eecole.moduleauth.model.dtos.appuser.ReadUserDTO;
import lenicorp.eecole.moduleauth.model.entities.AppUser;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface UserRepo extends JpaRepository<AppUser, Long>
{
    @Query("select (count(a) > 0) from AppUser a where upper(a.email) = upper(?1)")
    boolean alreadyExistsByEmail(String email);

    @Query("select (count(a) > 0) from AppUser a where a.email = ?1 and a.userId <> ?2")
    boolean alreadyExistsByEmail(String email, Long userId);

    @Query("select (count(a) > 0) from AppUser a where upper(a.tel) = upper(?1)")
    boolean alreadyExistsByTel(String tel);

    @Query("select (count(a) > 0) from AppUser a where upper(a.tel) = upper(?1) and a.userId <> ?2")
    boolean alreadyExistsByTel(String tel, Long userId);

    Optional<AppUser> findByEmail(String email);

    Optional<AppUser> findByTel(String tel);

    @Query("select u.userId from AppUser u where u.email = ?1")
    Long getUserIdByEmail(String userEmail);

    @Query("select (count(u.userId)>0) from AppUser u where u.userId = ?1 and u.email = ?2")
    boolean existsByUserIdAndEmail(Long userId, String email);

    @Query("select (count(u.userId)>0) from AppUser u where u.email = ?1")
    boolean existsByEmail(String email);

    @Query("select f.user from AppFunction f where f.user.userId = ?1")
    AppUser findByFunctionId(Long fncId);

    @Query("""
        select new lenicorp.eecole.moduleauth.model.dtos.appuser.ReadUserDTO(
        u.userId, u.firstName, u.lastName, u.email, u.tel, u.lieuNaissance, u.dateNaissance, e.id, e.nomEcole, 
        e.sigleEcole, u.civilite.uniqueCode, u.nationalite.codePays, u.nationalite.nationalite, u.typePiece.uniqueCode, 
        u.typePiece.name, u.numPiece, u.nomPere, u.nomMere, u.typeUtilisateur.uniqueCode, u.typeUtilisateur.name, u.active, 
        u.notBlocked, u.currentFunctionId, u.statut.staCode, u.statut.staLibelle, null, null) 
        from AppUser u left join u.ecole e
        where (locate(concat(:codeEcole, '/'), e.codeEcole) = 1 or :codeEcole = e.codeEcole) 
        and (locate(upper(coalesce(:key, '')), upper(cast(function('strip_accents',  coalesce(u.firstName, '') ) as string))) >0 
        or locate(upper(coalesce(:key, '') ), upper(cast(function('strip_accents',  coalesce(u.lastName, '') ) as string))) >0
        or locate(upper(coalesce(:key, '') ), upper(cast(function('strip_accents',  coalesce(u.email, '') ) as string))) >0
        or locate(upper(coalesce(:key, '') ), upper(cast(function('strip_accents',  coalesce(u.tel, '') ) as string))) >0
        or locate(upper(coalesce(:key, '') ), upper(cast(function('strip_accents',  coalesce(u.lieuNaissance, '') ) as string) )) >0
        )       
       
        and (u.statut.staCode is null or u.statut.staCode in :staCodes)
""")
    Page<ListUserDTO> searchUsers(@Param("key") String key,
                                  @Param("codeEcole") String codeEcole,
                                  @Param("staCodes") List<String> staCode,
                                  Pageable pageable);

    @Query("""
        select new lenicorp.eecole.moduleauth.model.dtos.appuser.ReadUserDTO(
        u.userId, u.firstName, u.lastName, u.email, u.tel, u.lieuNaissance, u.dateNaissance, e.id, e.nomEcole, 
        e.sigleEcole, u.civilite.uniqueCode, u.nationalite.codePays, u.nationalite.nationalite, u.typePiece.uniqueCode, 
        u.typePiece.name, u.numPiece, u.nomPere, u.nomMere, u.typeUtilisateur.uniqueCode, u.typeUtilisateur.name, u.active, 
        u.notBlocked, u.currentFunctionId, u.statut.staCode, u.statut.staLibelle, null, null) 
        from AppUser u left join u.ecole e where u.userId = ?1
    """)
    ReadUserDTO findReadUserDto(Long userId);

}
