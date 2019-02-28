package andrzej.appdemo.entityexp;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("expertRepository")
public interface ExpertRepository extends JpaRepository<Expert, Integer> {

    @Query(value = "SELECT *FROM Expert e WHERE e.job LIKE %:param% OR e.project LIKE %:param% OR e.location LIKE %:param%", nativeQuery=true)
    List<Expert> findAllSearch(@Param("param") String param);


}
