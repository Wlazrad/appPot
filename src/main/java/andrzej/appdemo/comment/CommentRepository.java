package andrzej.appdemo.comment;

import andrzej.appdemo.entityexp.Expert;
import andrzej.appdemo.user.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository("commentRepository")
public interface CommentRepository extends JpaRepository<Comment, Integer> {



}
