package andrzej.appdemo.mainController;

import andrzej.appdemo.comment.Comment;
import andrzej.appdemo.comment.CommentService;
import andrzej.appdemo.entityexp.Expert;
import andrzej.appdemo.entityexp.ExpertRepository;
import andrzej.appdemo.entityexp.ExpertService;
import andrzej.appdemo.user.User;
import andrzej.appdemo.user.UserService;
import andrzej.appdemo.utilities.UserUtilities;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import java.util.List;

@Controller
public class MainPageController {

    @Autowired
    private ExpertService expertService;
    @Autowired
    private UserService userService;
    @Autowired
    private CommentService commentService;




    @GET
    @RequestMapping(value = {"/", "/index"})
    public String showMainPage(Model model) {
        String username = UserUtilities.getLoggedUser();
        User user = userService.findUserByEmail(username);
        List<Expert> expertList = getAllExperts();
        List<Comment> commentList = getAllComment();

        if(user!=null){
            model.addAttribute("user_id", user.getId());
        }

        model.addAttribute("user", user);
        model.addAttribute("expertList", expertList);
        model.addAttribute("commentList", commentList);
        return "index";
    }

    @GET
    @RequestMapping(value = { "/myexperts/{user_id}"})
    public String showMyExperts(@PathVariable int user_id, Model model) {
        String username = UserUtilities.getLoggedUser();
        User user = userService.findUserByEmail(username);
        List<Expert> expertList = expertService.getExpertWhereUserId(user_id);
        List<Comment> commentList = getAllComment();
        model.addAttribute("user_id", user.getId());
        model.addAttribute("user", user);
        model.addAttribute("expertList", expertList);
        model.addAttribute("commentList", commentList);
        return "index2";
    }





    @DELETE
    @RequestMapping(value = { "/myexperts/delete/{expert_id}"})
    public String deleteMyExperts(@PathVariable int expert_id, Model model) {
        String username = UserUtilities.getLoggedUser();
        User user = userService.findUserByEmail(username);
        Expert expert = new Expert();
        expert = expertService.getExpertByIdEquals(expert_id);


        if(expert.getUser_id()==user.getId())
        expertService.deleteExpertById(expert_id);

        return "index";
    }



    private List<Expert> getAllExperts() {
        List<Expert> expertList = expertService.findAll();
        return expertList;
    }

    private List<Comment> getAllComment() {
        List<Comment> commentList = commentService.findAll();
        return commentList;
    }

}
