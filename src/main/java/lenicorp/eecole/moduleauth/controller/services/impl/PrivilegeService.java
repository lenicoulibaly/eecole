package lenicorp.eecole.moduleauth.controller.services.impl;

import lenicorp.eecole.moduleauth.controller.repositories.PrvRepo;
import lenicorp.eecole.moduleauth.controller.repositories.PrvToRoleAssRepo;
import lenicorp.eecole.moduleauth.controller.services.spec.IPrivilegeService;
import lenicorp.eecole.moduleauth.model.constants.AuthActions;
import lenicorp.eecole.moduleauth.model.constants.AuthTables;
import lenicorp.eecole.moduleauth.model.dtos.appprivilege.*;
import lenicorp.eecole.moduleauth.model.entities.AppPrivilege;
import lenicorp.eecole.modulelog.controller.service.ILogService;
import lenicorp.eecole.sharedmodule.exceptions.AppException;
import lenicorp.eecole.sharedmodule.utilities.StringUtils;
import lenicorp.eecole.typemodule.controller.repositories.TypeRepo;
import lenicorp.eecole.typemodule.model.entities.Type;
import lenicorp.eecole.typemodule.model.enums.TypeGroup;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.net.UnknownHostException;
import java.util.*;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor @Slf4j
public class PrivilegeService implements IPrivilegeService
{
    private final PrvRepo prvRepo;
    private final PrvToRoleAssRepo prvToRoleAssRepo;
    private final PrivilegeMapper prvMapper;
    private final ILogService logger;
    private final TypeRepo typeRepo;

    @Override @Transactional
    public ReadPrvDTO createPrivilege(CreatePrivilegeDTO dto) throws UnknownHostException {
        AppPrivilege privilege = prvMapper.mapToPrivilege(dto);
        privilege = prvRepo.save(privilege);
        AppPrivilege oldPrv = new AppPrivilege();
        BeanUtils.copyProperties(privilege, oldPrv);
        logger.logg(AuthActions.CREATE_PRV, oldPrv, privilege, AuthTables.PRV_TABLE, null);
        return prvMapper.mapToReadPrivilegeDTO(privilege);
    }

    @Override
    public Page<ReadPrvDTO> searchPrivileges(String searchKey, Pageable pageable)
    {
        Page<AppPrivilege> privilegePage = prvRepo.searchPrivileges(StringUtils.stripAccentsToUpperCase(searchKey), pageable);
        List<ReadPrvDTO> readPrvDTOS = privilegePage.stream().map(prvMapper::mapToReadPrivilegeDTO).collect(Collectors.toList());
        return new PageImpl<>(readPrvDTOS, pageable, privilegePage.getTotalElements());
    }

    @Override
    public List<SelectedPrvDTO> getSelectedPrvs(Set<String> roleCodes)
    {
        Set<String> selectedPrvCodes = prvToRoleAssRepo.findActivePrvCodesForRoles(roleCodes);
        return prvRepo.findAll().stream().map(prv->
                new SelectedPrvDTO(prv.getPrivilegeCode(), prv.getPrivilegeName(),
                        selectedPrvCodes.contains(prv.getPrivilegeCode()),
                        selectedPrvCodes.contains(prv.getPrivilegeCode()))).collect(Collectors.toList());
    }

    @Override
    public List<SelectedPrvDTO> getSelectedPrvs(Long fncId, Set<String> oldRoleCodes, Set<String> roleCodes, Set<String> prvCodes)
    {
        Set<String> ownedPrvCodes = prvRepo.getFunctionPrvCodes(fncId);
        //List<AppPrivilege> allPrvs = prvRepo.findAll();
        Set<String> selectedPrvCodes = prvToRoleAssRepo.findActivePrvCodesForRoles(roleCodes);

        //Set<Long> addedRoleCodes = roleCodes.stream().filter(rId-> !oldRoleCodes.contains(rId)).collect(Collectors.toSet());
        Set<String> retiredRoleCodes = oldRoleCodes.stream().filter(rId-> !roleCodes.contains(rId)).collect(Collectors.toSet());
        Set<String> prvCodesToBeRetired = retiredRoleCodes == null ? new HashSet<>() : retiredRoleCodes.isEmpty() ? new HashSet<>() : prvToRoleAssRepo.findActivePrvCodesForRoles(retiredRoleCodes).stream().filter(prvId->!selectedPrvCodes.contains(prvId)).collect(Collectors.toSet());
        prvCodes = prvCodes.stream().filter(prvId->!prvCodesToBeRetired.contains(prvId)).collect(Collectors.toSet());
        selectedPrvCodes.addAll(prvCodes);
        return prvRepo.findAll().stream().map(prv->new SelectedPrvDTO( prv.getPrivilegeCode(), prv.getPrivilegeName(), selectedPrvCodes.contains(prv.getPrivilegeCode()), ownedPrvCodes.contains(prv.getPrivilegeCode()))).collect(Collectors.toList());
    }

    @Override //TODO : Si la méthode de repository arrive à charger la liste des privilèges du type automatiquement, alors nous allons supprimer le chargement dans cette méthode ci
    public PrvByTypeDTO getPrivlegesByTypeCode(String typeCode)
    {
        Type type = typeRepo.findById(typeCode).orElseThrow(()->new AppException("Type in trouvable"));
        PrvByTypeDTO prvByTypeDTO = new PrvByTypeDTO(type.getName(), type.getUniqueCode());
        prvByTypeDTO.setPrivileges(prvRepo.getTypePriveleges(typeCode));
        return prvByTypeDTO;
    }

    @Override
    public List<PrvByTypeDTO> getAllPrivlegesGroupesByType()
    {
        List<PrvByTypeDTO> PrvByTypeDTOs = typeRepo.findTypeCodesByTypeGroup(TypeGroup.TYPE_PRV).stream().map(id->this.getPrivlegesByTypeCode(id)).filter(Objects::nonNull)
                .sorted(Comparator.comparing(PrvByTypeDTO::getTypeName)).collect(Collectors.toList());
        return PrvByTypeDTOs;
    }
}
