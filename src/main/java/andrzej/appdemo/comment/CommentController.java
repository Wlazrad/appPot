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
import org.springframework.web.bind.annotation.RequestMapping;

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


    @GET
    @RequestMapping(value = "/addcomment")
    public String addComment(Model model) {
        Comment c = new Comment();
        c.setCreatedAt(LocalDateTime.now());


        model.addAttribute("time", LocalDateTime.now());
        model.addAttribute("comment", c);

        return "comment";
    }

    @POST
    @RequestMapping(value = "/addcomment1")
    public String registerAction(Comment comment, BindingResult result, Model model, Locale locale) {

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
