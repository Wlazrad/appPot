package andrzej.appdemo.comment;


import andrzej.appdemo.entityexp.Expert;
import andrzej.appdemo.entityexp.ExpertService;
import andrzej.appdemo.user.User;
import andrzej.appdemo.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import java.time.LocalDateTime;

@Controller
public class CommentController {

    @Autowired
    CommentService commentService;

    @Autowired
    UserService userService;

    @Autowired
    ExpertService expertService;


    @GET
    @RequestMapping(value = "/addcomment/{expert_id}")
    public String addComment(Model model) {
        Comment c = new Comment();
        c.setCreatedAt(LocalDateTime.now());


        model.addAttribute("time", LocalDateTime.now());
        model.addAttribute("comment", c);

        return "comment";
    }

    @GET
    @RequestMapping(value = "/viewexpert/comment/{expert_id}")
    public String openCommentPage(@PathVariable int expert_id, Model model) {
        Comment comment = new Comment();
        Expert expert = new Expert();
        String username;
        expert = expertService.getExpertByIdEquals(expert_id);

        comment.setExpert_id(expert_id);
        model.addAttribute(comment);
        model.addAttribute(expert);


        return "comment";
    }


    @POST
    @RequestMapping(value = "/viewexpert/{expert_id}/comment/{user_id}")
    public String postComment(@PathVariable int user_id,
                              @PathVariable int expert_id, Model model) {
        Comment comment = new Comment();
        User user = userService.getUserByIdEquals(user_id);

        comment.setUser(user);
        comment.setContent("lala");
        comment.setUser_id(user_id);
        comment.setExpert_id(expert_id);
        commentService.saveComment(comment);

        return "viewexpert";
    }

    @POST
    @RequestMapping(value = "/addcomment1")
    public String registerAction(Comment comment,
                                 Model model) {
        Expert expert = expertService.getExpertByIdEquals(8);

        User user = userService.getUserByIdEquals(13);


//        comment.setExpert(expert);
//        comment.setUser(user);
//        comment.setUser_id(1);
//        comment.setExpert_id(1);
        comment.setCreatedAt(LocalDateTime.now());

        commentService.saveComment(comment);
        model.addAttribute("comment", new Comment());


        return "comment";
    }


}
