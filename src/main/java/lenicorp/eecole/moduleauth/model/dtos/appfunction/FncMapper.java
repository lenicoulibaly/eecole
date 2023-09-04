package lenicorp.eecole.moduleauth.model.dtos.appfunction;

import lenicorp.eecole.moduleauth.controller.repositories.PrvRepo;
import lenicorp.eecole.moduleauth.controller.repositories.RoleToFunctionAssRepo;
import lenicorp.eecole.moduleauth.controller.repositories.UserRepo;
import lenicorp.eecole.moduleauth.controller.services.spec.IMenuReaderService;
import lenicorp.eecole.moduleauth.model.dtos.appprivilege.PrivilegeMapper;
import lenicorp.eecole.moduleauth.model.dtos.approle.RoleMapper;
import lenicorp.eecole.moduleauth.model.entities.AppFunction;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.springframework.beans.factory.annotation.Autowired;

@Mapper(componentModel = "spring")
public abstract class FncMapper
{
    @Autowired protected RoleToFunctionAssRepo rtfRepo;
    @Autowired protected PrivilegeMapper prvMapper;
    @Autowired protected RoleMapper roleMapper;
    @Autowired protected IMenuReaderService menuService;
    @Autowired protected UserRepo userRepo;
    @Autowired protected PrvRepo prvRepo;

    @Mapping(target = "user", expression = "java(new lenicorp.eecole.moduleauth.model.entities.AppUser(dto.getUserId()))")
    @Mapping(target = "fncStatus", expression = "java(2)")
    public abstract AppFunction mapToFunction(CreateFncDTO dto);

    @Mapping(target = "userId", source = "user.userId")
    @Mapping(target = "email", source = "user.email")
    @Mapping(target = "privileges", expression = "java(prvRepo.getFunctionPrvs(fnc.getId()))")
    @Mapping(target = "roles", expression = "java(rtfRepo.getFncRoles(fnc.getId()).stream().map(roleMapper::mapToReadRoleDTO).collect(java.util.stream.Collectors.toList()))")
    @Mapping(target = "menus", expression = "java(menuService.getMenusByFncId(fnc.getId()))")
    public abstract ReadFncDTO mapToReadFncDto(AppFunction fnc);
}
