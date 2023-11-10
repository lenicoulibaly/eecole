package lenicorp.eecole;

import lenicorp.eecole.init.AdminIniter;
import lenicorp.eecole.init.StatutIniter;
import lenicorp.eecole.init.TypeIniter;
import lenicorp.eecole.moduleauth.controller.services.spec.IJwtService;
import lenicorp.eecole.modulelog.controller.service.AuditorAwareImpl;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.data.domain.AuditorAware;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing(auditorAwareRef = "auditorProvider")
public class EEcoleApplication
{
    @Bean
    public AuditorAware<String> auditorProvider(IJwtService jwtService) {
        return new AuditorAwareImpl(jwtService);
    }
    public static void main(String[] args) {
        SpringApplication.run(EEcoleApplication.class, args);
    }

    //@Bean @Profile("dev")
    CommandLineRunner start(AdminIniter adminIniter, StatutIniter statutIniter, TypeIniter typeIniter)
    {
        return args->
        {
            //typeIniter.init();
            adminIniter.init();
            statutIniter.init();
        };
    }
}
