package lenicorp.eecole.modulelog.controller.repositories;

import lenicorp.eecole.modulelog.model.entities.LogDetails;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LogDetailsRepo extends JpaRepository<LogDetails, Long> {
}
