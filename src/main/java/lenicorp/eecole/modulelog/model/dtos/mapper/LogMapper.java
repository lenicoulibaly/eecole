package lenicorp.eecole.modulelog.model.dtos.mapper;

import lenicorp.eecole.modulelog.model.dtos.response.ConnexionList;
import lenicorp.eecole.modulelog.model.entities.Log;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface LogMapper {
    ConnexionList mapConnexionListToLog(Log log);
}
