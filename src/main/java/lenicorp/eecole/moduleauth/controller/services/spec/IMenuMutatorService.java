package lenicorp.eecole.moduleauth.controller.services.spec;

import lenicorp.eecole.moduleauth.model.dtos.menu.CreateMenuDTO;
import lenicorp.eecole.moduleauth.model.dtos.menu.PrvToMenuDTO;
import lenicorp.eecole.moduleauth.model.entities.Menu;

import java.net.UnknownHostException;

public interface IMenuMutatorService
{

    Menu createMenu(CreateMenuDTO dto) throws UnknownHostException;
    void addPrvToMenu(PrvToMenuDTO dto) throws UnknownHostException;
    void removePrvToMenu(PrvToMenuDTO dto) throws UnknownHostException;
}
