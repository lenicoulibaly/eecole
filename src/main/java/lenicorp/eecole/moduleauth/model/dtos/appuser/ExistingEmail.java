package lenicorp.eecole.moduleauth.model.dtos.appuser;

import jakarta.validation.Constraint;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import jakarta.validation.Payload;
import lenicorp.eecole.moduleauth.controller.repositories.UserRepo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.lang.annotation.*;

@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = {ExistingEmail.ExistingEmailValidator.class})
@Documented
public @interface ExistingEmail
{
    String message() default "Email non enregistré";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};

    @Component @RequiredArgsConstructor
    class ExistingEmailValidator implements ConstraintValidator<ExistingEmail, String>
    {
        private final UserRepo userRepo;
        @Override
        public boolean isValid(String email, ConstraintValidatorContext context) {
            return userRepo.existsByEmail(email);
        }
    }
}


