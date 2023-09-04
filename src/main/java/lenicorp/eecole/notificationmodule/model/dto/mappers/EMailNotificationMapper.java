package lenicorp.eecole.notificationmodule.model.dto.mappers;

import lenicorp.eecole.notificationmodule.model.dto.EmailNotificationDTO;
import lenicorp.eecole.notificationmodule.model.entities.EmailNotification;
import org.mapstruct.Mapper;


@Mapper(componentModel = "spring")
public interface EMailNotificationMapper
{
    EmailNotification mapToNotification(EmailNotificationDTO dto);
}
