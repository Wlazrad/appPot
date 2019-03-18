package andrzej.appdemo.comment;


import andrzej.appdemo.entityexp.Expert;
import andrzej.appdemo.entityexp.ExpertService;
import andrzej.appdemo.user.User;
import andrzej.appdemo.user.UserService;
import andrzej.appdemo.utilities.UserUtilities;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Locale;

@Controller
public class CommentController  {

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



    @POST
    @RequestMapping(value = "/viewexpert/{expert_id}/comment/{user_id}")
    public String openSearchUserPage(@PathVariable int user_id,
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
    public String registerAction(@RequestParam("content") String content,
                                 @RequestParam("expertId") int expertId,
                                 @RequestParam("userId") int userId,
                                 Comment comment,
                                 BindingResult result,
                                 Model model,
                                 Locale locale) {
        Expert expert = expertService.getExpert();

        String returnPage = null;

        if (result.hasErrors()) {
            returnPage = "comment";
        } else {
            commentService.saveComment(comment);

            model.addAttribute("coment", new Comment());
            returnPage = "comment";
        }

        return returnPage;
    }





}
