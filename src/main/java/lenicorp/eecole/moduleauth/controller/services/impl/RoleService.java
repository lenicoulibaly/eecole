package lenicorp.eecole.moduleauth.controller.services.impl;

import lenicorp.eecole.moduleauth.controller.repositories.PrvToRoleAssRepo;
import lenicorp.eecole.moduleauth.controller.repositories.RoleRepo;
import lenicorp.eecole.moduleauth.controller.services.spec.IRoleService;
import lenicorp.eecole.moduleauth.model.constants.AuthActions;
import lenicorp.eecole.moduleauth.model.constants.AuthTables;
import lenicorp.eecole.moduleauth.model.dtos.approle.CreateRoleDTO;
import lenicorp.eecole.moduleauth.model.dtos.approle.ReadRoleDTO;
import lenicorp.eecole.moduleauth.model.dtos.approle.RoleMapper;
import lenicorp.eecole.moduleauth.model.dtos.asignation.PrvsToRoleDTO;
import lenicorp.eecole.moduleauth.model.entities.AppPrivilege;
import lenicorp.eecole.moduleauth.model.entities.AppRole;
import lenicorp.eecole.moduleauth.model.entities.PrvToRoleAss;
import lenicorp.eecole.modulelog.controller.service.ILogService;
import lenicorp.eecole.sharedmodule.exceptions.AppException;
import lenicorp.eecole.sharedmodule.utilities.ObjectCopier;
import lenicorp.eecole.sharedmodule.utilities.StringUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ResponseStatus;

import java.net.UnknownHostException;
import java.time.LocalDate;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor @Slf4j @ResponseStatus(HttpStatus.OK)
public class RoleService implements IRoleService
{
    private final RoleRepo roleRepo;
    private final RoleMapper roleMapper;
    private final ILogService logger;
    private final ObjectCopier<AppRole> roleCopier;

    private final PrvToRoleAssRepo prvToRoleAssRepo;
    private final ObjectCopier<PrvToRoleAss> ptrCopier;

    @Override @Transactional
    public ReadRoleDTO createRole(CreateRoleDTO dto) throws UnknownHostException
    {
        AppRole role = roleMapper.mapToRole(dto);
        role = roleRepo.save(role);
        logger.logg(AuthActions.CREATE_ROLE, null, role, AuthTables.ROLE_TABLE, null);
        this.setRolePrivileges(new PrvsToRoleDTO(role.getRoleName(), role.getRoleCode(),dto.getPrvCodes(), null, null, true));
        ReadRoleDTO readRoleDTO = roleMapper.mapToReadRoleDTO(role);
        readRoleDTO.setPrivileges(prvToRoleAssRepo.findActivePrivilegesForRoles(Collections.singleton(role.getRoleCode())));
        return readRoleDTO;
    }

    @Override
    public Page<ReadRoleDTO> searchRoles(String searchKey, Pageable pageable)
    {
        Page<AppRole> rolePage = roleRepo.searchRoles(StringUtils.stripAccentsToUpperCase(searchKey), pageable);
        List<ReadRoleDTO> readRoleDTOS = rolePage.stream().map(roleMapper::mapToReadRoleDTO).collect(Collectors.toList());
        return new PageImpl<>(readRoleDTOS, pageable, rolePage.getTotalElements());
    }

    @Override @Transactional
    public ReadRoleDTO updateRole(PrvsToRoleDTO dto) throws UnknownHostException {
        AppRole role = roleRepo.findById(dto.getRoleCode()).orElseThrow(()->new AppException("Role introuvable"));
        AppRole oldRole = roleCopier.copy(role);
        role.setRoleCode(dto.getRoleCode()); role.setRoleName(dto.getRoleName());
        role = roleRepo.save(role);
        logger.logg(AuthActions.UPDATE_ROL, oldRole, role, AuthTables.ROLE_TABLE, null);
        return this.setRolePrivileges(dto);
    }

    private ReadRoleDTO setRolePrivileges(PrvsToRoleDTO dto) {
        AppRole role = roleRepo.findById(dto.getRoleCode()).orElseThrow(()->new AppException("Role introuvable"));
        String roleCode = dto.getRoleCode(); Set<String> prvCodes = dto.getPrvCodes() == null ? new HashSet<>() : dto.getPrvCodes().size() == 0 ? new HashSet<>() : dto.getPrvCodes();
        LocalDate startsAt = dto.getStartsAt(); LocalDate endsAt =  dto.getEndsAt();
        Set<String> prvCodesToBeRemoved = prvToRoleAssRepo.findPrvCodesForRoleNotIn(roleCode, prvCodes); //
        Set<String> prvCodesToBeAdded = prvToRoleAssRepo.findPrvCodesNotBelongingToRoleIn(roleCode, prvCodes);
        //Set<String> prvCodesToNotBeChanged = prvToRoleAssRepo.findActivePrvCodesForRoleIn_sameDates(roleCode, prvCodes, startsAt.toLocalDate(), endsAt.toLocalDate());
        Set<String> prvCodesToChangeTheDates = prvToRoleAssRepo.findActivePrvCodesForRoleIn_otherDates(roleCode, prvCodes, startsAt, endsAt);
        Set<String> prvCodesToActivateAndChangeTheDates = prvToRoleAssRepo.findNoneActivePrvCodesForRoleIn(roleCode, prvCodes);

        prvCodesToBeRemoved.forEach(id->
        {
            PrvToRoleAss prvToRoleAss = prvToRoleAssRepo.findByRoleAndPrivilege(roleCode, id);
            PrvToRoleAss oldPrvToRoleAss = ptrCopier.copy(prvToRoleAss);
            prvToRoleAss.setAssStatus(2);
            prvToRoleAss = prvToRoleAssRepo.save(prvToRoleAss);
            try {
                logger.logg(AuthActions.REMOVE_PRV_TO_ROL, oldPrvToRoleAss, prvToRoleAss, AuthTables.ASS, null);
            } catch (UnknownHostException e) {
                e.printStackTrace();
            }
        });

        prvCodesToBeAdded.forEach(code->
        {
            PrvToRoleAss prvToRoleAss = prvToRoleAssRepo.findByRoleAndPrivilege(roleCode, code);
            if(prvToRoleAss == null)
            {
                prvToRoleAss = new PrvToRoleAss(null, 1, startsAt, endsAt, new AppPrivilege(code), new AppRole(roleCode));
                prvToRoleAss = prvToRoleAssRepo.save(prvToRoleAss);
                try {
                    logger.logg(AuthActions.ADD_PRV_TO_ROL,null, prvToRoleAss, AuthTables.ASS, null);
                } catch (UnknownHostException e) {
                    e.printStackTrace();
                }
            }
            else if(prvToRoleAss.getAssStatus() != 1)
            {
                PrvToRoleAss oldPrvToRoleAss = ptrCopier.copy(prvToRoleAss);

                prvToRoleAss.setAssStatus(1);
                try {
                    logger.logg(AuthActions.RESTORE_PRV_TO_ROL, oldPrvToRoleAss,prvToRoleAss, AuthTables.ASS, null);
                } catch (UnknownHostException e) {
                    e.printStackTrace();
                }
            }
        });

        prvCodesToChangeTheDates.forEach(id->
        {
            PrvToRoleAss prvToRoleAss = prvToRoleAssRepo.findByRoleAndPrivilege(roleCode, id);
            PrvToRoleAss oldPrvToRoleAss = ptrCopier.copy(prvToRoleAss);
            prvToRoleAss.setStartsAt( startsAt);
            prvToRoleAss.setEndsAt(endsAt);
            prvToRoleAss = prvToRoleAssRepo.save(prvToRoleAss);
            try {
                logger.logg(AuthActions.CHANGE_PRV_TO_ROL_VALIDITY_PERIOD, oldPrvToRoleAss,prvToRoleAss, AuthTables.ASS, null);
            } catch (UnknownHostException e) {
                e.printStackTrace();
            }
        });

        prvCodesToActivateAndChangeTheDates.forEach(id->
        {
            PrvToRoleAss prvToRoleAss = prvToRoleAssRepo.findByRoleAndPrivilege(roleCode, id);
            PrvToRoleAss oldPrvToRoleAss = ptrCopier.copy(prvToRoleAss);
            prvToRoleAss.setAssStatus(1);
            prvToRoleAss.setStartsAt(startsAt);
            prvToRoleAss.setEndsAt(endsAt);
            prvToRoleAss = prvToRoleAssRepo.save(prvToRoleAss);
            try {
                logger.logg(AuthActions.PRV_TO_ROL_ACTIVATED_AND_VALIDITY_PERIOD_CHANGED, oldPrvToRoleAss,prvToRoleAss, AuthTables.ASS, null);
            } catch (UnknownHostException e) {
                e.printStackTrace();
            }
        });
        ReadRoleDTO readRoleDTO = roleMapper.mapToReadRoleDTO(role);
        readRoleDTO.setPrivileges(prvToRoleAssRepo.findActivePrivilegesForRoles(Collections.singleton(role.getRoleCode())));
        return readRoleDTO;
    }
}