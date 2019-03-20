package andrzej.appdemo.entityexp;

import andrzej.appdemo.comment.Comment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("expertRepository")
public interface ExpertRepository extends JpaRepository<Expert, Integer> {

    @Query(value = "SELECT *FROM Expert e WHERE e.job LIKE %:param% OR e.name LIKE %:param% OR e.location LIKE %:param%", nativeQuery=true)
    List<Expert> findAllSearch(@Param("param") String param);


    @Query(value = "SELECT *FROM Expert e WHERE e.expert_id =:id",nativeQuery=true)
    Expert getExpertByIdEquals(@Param("id") int expert_id);



}
