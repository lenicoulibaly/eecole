package lenicorp.eecole.moduleauth.model.dtos.appprivilege;

import jakarta.validation.Constraint;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import jakarta.validation.Payload;
import lenicorp.eecole.moduleauth.controller.repositories.PrvRepo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.lang.annotation.*;

@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = {ExistingPrivilegeId.ExistingPrivilegeIdValidator.class})
@Documented
public @interface ExistingPrivilegeId
{
    String message() default "Invalid privilegeId";
    Class<?> [] groups() default {};
    Class<? extends Payload> [] payload() default {};

    @Component @RequiredArgsConstructor
    class ExistingPrivilegeIdValidator implements ConstraintValidator<ExistingPrivilegeId, Long>
    {
        private final PrvRepo prvRepo;

        @Override
        public boolean isValid(Long value, ConstraintValidatorContext context) {
            return prvRepo.existsById(value);
        }
    }
}
