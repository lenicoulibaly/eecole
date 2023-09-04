package lenicorp.eecole.modulelog.controller.repositories;

import lenicorp.eecole.modulelog.model.dtos.response.ConnexionList;
import lenicorp.eecole.modulelog.model.entities.Log;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.util.List;

public interface LogRepo extends JpaRepository<Log, Long>
{
    @Query("""
        select new lenicorp.eecole.modulelog.model.dtos.response.ConnexionList(l.id,
        l.userId, l.userEmail, u.firstName, u.lastName, l.action, l.actionDateTime, 
        l.ipAddress, l.hostName, l.connectionId, f.id, f.name, l.errorMessage, l.stackTrace)
        from Log l left join l.function f left join f.user u left join u.ecole e  where 
        (locate(upper(coalesce(:key, '')), upper(cast(function('strip_accents',  coalesce(l.userEmail, '') ) as string))) >0 
        or locate(upper(coalesce(:key, '') ), upper(cast(function('strip_accents',  coalesce(u.firstName, '') ) as string))) >0
        or locate(upper(coalesce(:key, '') ), upper(cast(function('strip_accents',  coalesce(u.lastName, '') ) as string))) >0
        or locate(upper(coalesce(:key, '') ), upper(cast(function('strip_accents',  coalesce(l.action, '') ) as string))) >0
        or locate(upper(coalesce(:key, '') ), upper(cast(function('strip_accents',  coalesce(f.name, '') ) as string))) >0
        or locate(upper(coalesce(:key, '') ), upper(cast(function('strip_accents',  coalesce(l.ipAddress, '') ) as string))) >0
        or locate(upper(coalesce(:key, '') ), upper(cast(function('strip_accents',  coalesce(l.hostName, '') ) as string))) >0
      
        )
        and l.action in :actions and (:connId is null or :connId = l.connectionId)
        and (:userId is null or :userId = l.userId) 
        and l.actionDateTime between coalesce(:debut, current_date) and coalesce(:fin, current_date)
        and (locate(concat(:codeEcole, '/'), e.codeEcole) = 1 or :codeEcole = e.codeEcole)
        order by l.actionDateTime desc
""")
    Page<ConnexionList> getConnnexionLogs(@Param("actions") List<String> actions,
                                          @Param("key") String key,
                                          @Param("userId") Long userId,
                                          @Param("debut") LocalDate debut,
                                          @Param("fin") LocalDate fin,
                                          @Param("connId") String connectionId,
                                          @Param("codeEcole") String codeEcole,
                                          Pageable pageable);
    @Query("select distinct l.action from Log l")
    List<String> getAllActionTypes();
}
