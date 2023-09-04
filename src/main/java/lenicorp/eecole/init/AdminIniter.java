package lenicorp.eecole.init;

import lenicorp.eecole.moduleauth.controller.repositories.FunctionRepo;
import lenicorp.eecole.moduleauth.controller.repositories.RoleRepo;
import lenicorp.eecole.moduleauth.controller.repositories.RoleToFunctionAssRepo;
import lenicorp.eecole.moduleauth.controller.repositories.UserRepo;
import lenicorp.eecole.moduleauth.model.entities.AppFunction;
import lenicorp.eecole.moduleauth.model.entities.AppRole;
import lenicorp.eecole.moduleauth.model.entities.AppUser;
import lenicorp.eecole.moduleauth.model.entities.RoleToFncAss;
import lenicorp.eecole.typemodule.model.entities.Type;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import java.time.LocalDate;

@RequiredArgsConstructor @Component
public class AdminIniter implements Initer
{
    private final UserRepo userRepo;
    private final PasswordEncoder pe;
    private final FunctionRepo fncRepo;
    private final RoleRepo roleRepo;
    private final RoleToFunctionAssRepo rtfRepo;

    public void init()
    {
        AppUser userDev = new AppUser(null, "Leni", "Codeur", pe.encode("1234"), "lenicode777@gmail.com", "0505471049", true, true, null, null);
        userDev = userRepo.save(userDev);

        AppFunction fncDev = fncRepo.save(new AppFunction(null, "Devellopeur", userDev, new Type("ELEVE"), null, "", 1, LocalDate.now(), LocalDate.now().plusYears(1)));
        userDev.setCurrentFunctionId(fncDev.getId());
        userRepo.save(userDev);
        AppRole roleDev = roleRepo.findByRoleCode("ROL-DEV");
        rtfRepo.save(new RoleToFncAss(null, 1, LocalDate.now(), LocalDate.now().plusYears(20), roleDev, fncDev));
    }


}
