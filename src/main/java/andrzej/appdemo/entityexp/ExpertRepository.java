package andrzej.appdemo.entityexp;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("expertRepository")
public interface ExpertRepository extends JpaRepository<Expert, Integer> {
}
