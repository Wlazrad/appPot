package andrzej.appdemo.controller;

import andrzej.appdemo.entityexp.Expert;
import andrzej.appdemo.entityexp.ExpertService;
import andrzej.appdemo.user.User;
import andrzej.appdemo.user.UserService;
import andrzej.appdemo.validators.UserRegisterValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import java.util.Locale;

@Controller
public class ExpertController {

    @Autowired
    private ExpertService expertService;


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
}
