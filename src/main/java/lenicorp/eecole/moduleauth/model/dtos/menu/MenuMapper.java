package lenicorp.eecole.moduleauth.model.dtos.menu;

import lenicorp.eecole.moduleauth.model.entities.Menu;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface MenuMapper
{
    @Mapping(target = "status", expression = "java(lenicorp.eecole.sharedmodule.enums.PersStatus.ACTIVE)")
    Menu mapToMenu(CreateMenuDTO dto);
}