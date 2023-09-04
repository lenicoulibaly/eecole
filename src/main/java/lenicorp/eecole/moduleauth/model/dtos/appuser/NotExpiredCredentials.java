package lenicorp.eecole.moduleauth.model.dtos.appuser;

import jakarta.validation.Constraint;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import jakarta.validation.Payload;
import lenicorp.eecole.moduleauth.controller.repositories.UserRepo;
import lenicorp.eecole.moduleauth.model.constants.SecurityConstants;
import lenicorp.eecole.moduleauth.model.entities.AppUser;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.lang.annotation.*;
import java.time.LocalDateTime;

@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = {NotExpiredCredentials.UserHasAnyFunctionValidatorOnlogin.class})
@Documented
public @interface NotExpiredCredentials
{
    String message() default "Votre mot de passe a expiré. Veuillez le réinitialiser afin de pouvoir vous connecter";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};

    @Component
    @RequiredArgsConstructor
    class UserHasAnyFunctionValidatorOnlogin implements ConstraintValidator<NotExpiredCredentials, LoginDTO>
    {
        private final UserRepo userRepo;
        @Override
        public boolean isValid(LoginDTO dto, ConstraintValidatorContext context)
        {
            if(dto == null || dto.getUsername() == null) return true;
            AppUser user = userRepo.findByEmail(dto.getUsername()).orElse(null);
            if(user == null || user.getChangePasswordDate() == null) return true;

            return user.getChangePasswordDate().plusDays(SecurityConstants.PASSWORD_DURATION).isAfter(LocalDateTime.now()) ;
        }
    }
}
