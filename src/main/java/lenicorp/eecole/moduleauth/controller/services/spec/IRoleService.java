package lenicorp.eecole.moduleauth.controller.services.spec;

import lenicorp.eecole.moduleauth.model.dtos.approle.CreateRoleDTO;
import lenicorp.eecole.moduleauth.model.dtos.approle.ReadRoleDTO;
import lenicorp.eecole.moduleauth.model.dtos.asignation.PrvsToRoleDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;

import java.net.UnknownHostException;

public interface IRoleService
{
    ReadRoleDTO createRole(CreateRoleDTO dto) throws UnknownHostException;
    Page<ReadRoleDTO> searchRoles(String searchKey, Pageable pageable);

    @Transactional
    ReadRoleDTO updateRole(PrvsToRoleDTO dto) throws UnknownHostException;
}
