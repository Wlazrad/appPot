package andrzej.appdemo.comment;

import andrzej.appdemo.entityexp.Expert;
import andrzej.appdemo.user.Role;
import andrzej.appdemo.user.User;
import andrzej.appdemo.user.UserRepository;
import andrzej.appdemo.user.UserService;
import andrzej.appdemo.utilities.UserUtilities;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service("commentService")
@Transactional
public class CommentServiceImpl implements CommentService {

    @Qualifier("commentRepository")
    @Autowired
    private CommentRepository commentRepository;

    @Autowired
    private UserService userService;

    @Qualifier("userRepository")
    @Autowired
    private UserRepository userRepository;


    @Override
    public Comment findCommentByUserId(User user) {
        return null;
    }

    @Override
    public void saveComment(Comment comment) {
        String username = UserUtilities.getLoggedUser();
        User user = userService.findUserByEmail(username);

        commentRepository.save(comment);
    }

    @Override
    public void deleteComment(Comment comment) {

    }

    @Override
    public List<Comment> findAll() {
        return null;
    }


    @Override
    public List<Comment> getAllExpertComments(int expert_id) {
        List<Comment> comments = commentRepository.getAllExpertComments(expert_id);
        return comments;
    }

}
