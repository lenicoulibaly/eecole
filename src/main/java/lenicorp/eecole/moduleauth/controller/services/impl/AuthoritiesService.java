package lenicorp.eecole.moduleauth.controller.services.impl;

import lenicorp.eecole.moduleauth.controller.repositories.PrvRepo;
import lenicorp.eecole.moduleauth.controller.repositories.RoleRepo;
import lenicorp.eecole.moduleauth.controller.services.spec.IAuthoritiesService;
import lenicorp.eecole.moduleauth.controller.services.spec.IFunctionService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Set;

@Service
@RequiredArgsConstructor
public class AuthoritiesService implements IAuthoritiesService
{
    private final IFunctionService functionService;
    private final RoleRepo roleRepo;
    private final PrvRepo prvRepo;
    @Override
    public Set<String> getAuthorities(Long userId)
    {
        Long currentFctId = functionService.getActiveCurrentFunctionId(userId);
        return currentFctId == null ? new HashSet<>() :  prvRepo.getFunctionPrvCodes(currentFctId);
    }
}
