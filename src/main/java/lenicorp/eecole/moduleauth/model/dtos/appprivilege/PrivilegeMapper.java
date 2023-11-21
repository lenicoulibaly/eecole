package lenicorp.eecole.moduleauth.model.dtos.appprivilege;

import jakarta.persistence.Column;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lenicorp.eecole.moduleauth.model.entities.AppPrivilege;
import lenicorp.eecole.typemodule.model.entities.Type;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface PrivilegeMapper
{
    @Mapping(target = "prvType.uniqueCode", source = "typeCode")
    AppPrivilege mapToPrivilege(CreatePrivilegeDTO dto);
    @Mapping(target = "prvTypeName", source = "prvType.name")
    @Mapping(target = "typeCode", source = "prvType.uniqueCode")
    ReadPrvDTO mapToReadPrivilegeDTO(AppPrivilege privilege);
}