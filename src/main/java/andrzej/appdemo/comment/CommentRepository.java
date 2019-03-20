package andrzej.appdemo.comment;

import andrzej.appdemo.entityexp.Expert;
import andrzej.appdemo.user.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("commentRepository")
public interface CommentRepository extends JpaRepository<Comment, Integer> {

    @Query(value = "SELECT * FROM comment c WHERE c.expert_id=:expert_id",nativeQuery=true)
    List<Comment> getAllExpertComments(@Param("expert_id") int expert_id);



}
