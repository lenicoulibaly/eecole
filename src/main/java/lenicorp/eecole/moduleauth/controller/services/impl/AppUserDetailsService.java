package lenicorp.eecole.moduleauth.controller.services.impl;

import lenicorp.eecole.moduleauth.controller.repositories.UserRepo;
import lenicorp.eecole.moduleauth.controller.services.spec.IAuthoritiesService;
import lenicorp.eecole.moduleauth.model.entities.AppUser;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AppUserDetailsService implements UserDetailsService
{
    private final UserRepo userRepo;
    private final IAuthoritiesService authoritiesService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException
    {
        AppUser user = userRepo.findByEmail(username).orElseThrow(()->new UsernameNotFoundException("Utilisateur inexistant"));
        return new AppUserDetails(user, authoritiesService);
    }
}
