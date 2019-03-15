package andrzej.appdemo.controller;

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
import java.util.List;
import java.util.Locale;

@Controller
public class ExpertController {

    @Autowired
    private ExpertService expertService;

    @Autowired
    private UserService userService;




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

    public static String getLoggedUser() {
        String username = null;
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if(!(auth instanceof AnonymousAuthenticationToken)) {
            username = auth.getName();
        }
        return username;
    }






}


