package lenicorp.eecole.typemodule.controller.services;


import lenicorp.eecole.typemodule.model.dtos.CreateTypeDTO;
import lenicorp.eecole.typemodule.model.dtos.TypeParamDTO;
import lenicorp.eecole.typemodule.model.dtos.TypeParamsDTO;
import lenicorp.eecole.typemodule.model.dtos.UpdateTypeDTO;
import lenicorp.eecole.typemodule.model.entities.Type;
import lenicorp.eecole.typemodule.model.enums.TypeGroup;
import lenicorp.eecole.typemodule.model.dtos.CreateTypeDTO;
import org.springframework.data.domain.Page;

import java.net.UnknownHostException;
import java.util.List;

public interface ITypeService
{
    Type createType(CreateTypeDTO dto) throws UnknownHostException;
    Type updateType(UpdateTypeDTO dto) throws UnknownHostException;
    void deleteType(String typeCode) throws UnknownHostException;
    void addSousType(TypeParamDTO dto) throws UnknownHostException;
    void removeSousType(TypeParamDTO dto) throws UnknownHostException;
    void setSousTypes(TypeParamsDTO dto) throws UnknownHostException;
    boolean parentHasDirectSousType(String parentCode, String childCode);
    boolean parentHasDistantSousType(String parentCode, String childCode);

    List<Type> getPossibleSousTypes(String parentId);

    Type setSousTypesRecursively(String typeCode);
    List<Type> getSousTypesRecursively(String typeCode);
    List<TypeGroup> getTypeGroups();

    Page<Type> searchPageOfTypes(String key, String typeGroup, int pageNum, int pageSize);
    Page<Type> searchPageOfDeletedTypes(String key, String typeGroup, int pageNum, int pageSize);

    void restoreType(String typeCode) throws UnknownHostException;
}
