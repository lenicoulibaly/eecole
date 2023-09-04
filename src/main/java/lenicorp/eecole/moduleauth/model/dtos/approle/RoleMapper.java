package lenicorp.eecole.moduleauth.model.dtos.approle;

import lenicorp.eecole.moduleauth.model.entities.AppRole;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface RoleMapper
{
    AppRole mapToRole(CreateRoleDTO dto);
    ReadRoleDTO mapToReadRoleDTO(AppRole role);
}
