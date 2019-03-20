package andrzej.appdemo.controller;

import andrzej.appdemo.comment.Comment;
import andrzej.appdemo.comment.CommentService;
import andrzej.appdemo.entityexp.Expert;
import andrzej.appdemo.entityexp.ExpertService;
import andrzej.appdemo.user.User;
import andrzej.appdemo.user.UserRepository;
import andrzej.appdemo.user.UserService;
import andrzej.appdemo.utilities.UserUtilities;
import andrzej.appdemo.validators.UserRegisterValidator;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Locale;

@Controller
public class ExpertController {

    @Autowired
    private ExpertService expertService;

    @Autowired
    private UserService userService;

    @Autowired
    private CommentService commentService;




    @GET
    @RequestMapping(value = "/addexpert")
    public String registerForm(Model model) {
        Expert e = new Expert();
        model.addAttribute("expert", e);
        return "addexpert";
    }

    @POST
    @RequestMapping(value = "/addexpert1")
    public String registerAction(Expert expert, BindingResult result, Model model, Locale locale) {

        String returnPage = null;

        if (result.hasErrors()) {
            returnPage = "addexpert";
        } else {
            expertService.saveExpert(expert);
            model.addAttribute("expert", new Expert());
            returnPage = "addexpert";
        }

        return returnPage;
    }

    @POST
    @RequestMapping(value = "/viewexpert/comment/addexpertcomment/{expert_id}")
    public String addComent(@PathVariable int expert_id, Comment comment, BindingResult result, Model model, Locale locale) {

        String returnPage = null;

        if (result.hasErrors()) {
            returnPage = "commment";
        } else {
            String username = UserUtilities.getLoggedUser();
            User user = userService.findUserByEmail(username);

            Expert expert = expertService.getExpertByIdEquals(expert_id);
            comment.setExpert(expert);

            comment.setExpert_id(expert_id);
            comment.setUser(user);
            comment.setUser_id(user.getId());
            comment.setCreatedAt(LocalDateTime.now());
            commentService.saveComment(comment);

            model.addAttribute("comment", new Comment());
            returnPage = "commment";
        }

        return "index";
    }


    @GET
    @RequestMapping(value ="/lalka")
    public String openExpertList(Model model){
        List<Expert> expertList = getAllExperts();
        model.addAttribute("expertList",expertList);
        return "indexsearch";
    }

    private List<Expert> getAllExperts(){
        List<Expert> expertList = expertService.findAll();
        return expertList;
    }

    @GET
    @RequestMapping(value = "/search/{searchWord}")
    public String openSearchUserPage(@PathVariable("searchWord") String searchWord, Model model) {
        List<Expert> expertList = expertService.findAllSearch(searchWord);
    model.addAttribute("expertList", expertList);
    return "indexsearch";
    }




//    @GET
//    @RequestMapping(value = "/viewexpert")
//    public String viewExpert(@RequestParam("id") Integer id, Model model){
//        Expert expert = expertService.getExpertByIdEquals(id);
//        model.addAttribute(expert);
//        return "viewexpert";
//    }

    @GET
    @RequestMapping(value = "/viewexpert/{expert_id}")
    public String openSearchUserPage(@PathVariable int expert_id,
                                     Model model) {
        Expert expert = expertService.getExpertByIdEquals(expert_id);
//        User user = userService.getUserByIdEquals(user_id);
//        model.addAttribute(user);
        List<Comment> comments = commentService.getAllExpertComments(expert_id);
        System.out.println(comments.size());
        model.addAttribute("comments",comments);
        model.addAttribute(expert);
        return "viewexpert";
    }






}


