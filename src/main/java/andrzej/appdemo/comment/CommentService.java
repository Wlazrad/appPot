package andrzej.appdemo.comment;

import andrzej.appdemo.entityexp.Expert;
import andrzej.appdemo.user.User;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CommentService {
    public Comment findCommentByUserId(User user);
    public void saveComment(Comment comment);
    public void deleteComment(Comment comment);
    public List<Comment> findAll();
    List<Comment> getAllExpertComments(int expert_id);


}
