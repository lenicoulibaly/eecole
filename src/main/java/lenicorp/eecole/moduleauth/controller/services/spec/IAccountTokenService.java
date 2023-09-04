package lenicorp.eecole.moduleauth.controller.services.spec;

import lenicorp.eecole.moduleauth.model.entities.AccountToken;
import lenicorp.eecole.moduleauth.model.entities.AppUser;

public interface IAccountTokenService
{
    AccountToken createAccountToken(AppUser appUser);
    AccountToken createAccountToken(Long agentId);
}
