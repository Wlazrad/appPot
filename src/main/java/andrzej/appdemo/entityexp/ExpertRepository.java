package andrzej.appdemo.entityexp;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("expertRepository")
public interface ExpertRepository extends JpaRepository<Expert, Integer> {

    @Query(value = "SELECT *FROM Expert e WHERE e.job LIKE %:param% OR e.name LIKE %:param% OR e.location LIKE %:param%", nativeQuery = true)
    List<Expert> findAllSearch(@Param("param") String param);


    @Query(value = "SELECT *FROM Expert e WHERE e.expert_id =:id", nativeQuery = true)
    Expert getExpertByIdEquals(@Param("id") int expert_id);

    @Modifying
    @Query(value = "UPDATE Expert e SET e.image_url = :image_url WHERE e.expert_id =:id", nativeQuery = true)
    public void updatePhoto(@Param("id") int expert_id, @Param("image_url") String image_url);

    @Query(value = "SELECT *FROM Expert e WHERE e.user_id =:id", nativeQuery = true)
    List<Expert> getExpertWhereUserId(@Param("id") int user_id);

    @Modifying
    @Query(value = "DELETE FROM comments_experts WHERE expert_id =:expert_id",nativeQuery = true)
    void deleteExpertFromCommentsExperts(@Param("expert_id") int id);

    @Modifying
    @Query(value = "DELETE FROM expert WHERE expert_id =:expert_id",nativeQuery = true)
    void deleteExpert(@Param("expert_id") int id);


}
