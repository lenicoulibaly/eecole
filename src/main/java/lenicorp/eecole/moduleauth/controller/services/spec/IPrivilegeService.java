package lenicorp.eecole.moduleauth.controller.services.spec;

import lenicorp.eecole.moduleauth.model.dtos.appprivilege.*;
import lenicorp.eecole.sharedmodule.dtos.SelectOption;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.net.UnknownHostException;
import java.util.List;
import java.util.Set;

public interface IPrivilegeService
{
    ReadPrvDTO createPrivilege(CreatePrivilegeDTO dto) throws UnknownHostException;
    Page<ReadPrvDTO> searchPrivileges(String searchKey, List<String> typePrvUniqueCodes, Pageable pageable);
    List<SelectedPrvDTO> getSelectedPrvs(Set<String> roleCodes);
    List<SelectedPrvDTO> getSelectedPrvs(Long prAssId, Set<String> oldRoleCodes, Set<String> roleCodes, Set<String> prvCodes);
    PrvByTypeDTO getPrivlegesByTypeCode(String typeCode);

    List<PrvByTypeDTO> getAllPrivlegesGroupesByType();

    List<SelectOption> getPrivilegeTypes();

    boolean existsByName(String name, String privilegeCode);

    boolean privilegeTypeIsValid(String typeCode);

    ReadPrvDTO updatePrivilege(UpdatePrivilegeDTO dto) throws UnknownHostException;

    List<SelectOption> getPrivilegesByTypes(List<String> typeCodes);
}
