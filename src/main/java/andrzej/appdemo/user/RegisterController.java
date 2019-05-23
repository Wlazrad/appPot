package andrzej.appdemo.user;

import andrzej.appdemo.EmailSender.EmailSender;
import andrzej.appdemo.utilities.AppdemoUtils;
import andrzej.appdemo.validators.UserRegisterValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import java.util.Locale;

@Controller
public class RegisterController {

    @Autowired
    private UserService userService;

    @Autowired
    MessageSource messageSource;

    @Autowired
    private EmailSender emailSender;

    @GET
    @RequestMapping(value = "/register")
    public String registerForm(Model model) {
        User u = new User();
        model.addAttribute("user", u);
        return "register";
    }

    @POST
    @RequestMapping(value = "/adduser")
    public String registerAction(User user, BindingResult result, Model model, Locale locale) {

        String returnPage = null;


        User userExist = userService.findUserByEmail(user.getEmail());

        new UserRegisterValidator().validateEmailExist(userExist, result);

        new UserRegisterValidator().validate(user, result);

        if (result.hasErrors()) {
            returnPage = "register";
        } else {
            user.setActivationCode(AppdemoUtils.randomStringGenerator());
            String content = "Wymagane potwierdzenie rejstracji. Kliknij w poniższy link aby aktywować konto:\n" +
                    "http://localhost:8080/activatelink/" + user.getActivationCode();
            userService.saveUser(user);
            emailSender.sendEmail(user.getEmail(), "Potwierdzenie rejstracji", content);
            model.addAttribute("message", messageSource.getMessage("user.register.success", null, locale));
            model.addAttribute("user", new User());
            returnPage = "index";
        }

        return returnPage;
    }

    @POST
    @RequestMapping(value = "/activatelink/{activationCode}")
    public String activateAccount(@PathVariable("activationCode") String activationCode, Model model, Locale locale) {
        userService.updateUserActivation(1, activationCode);
        model.addAttribute("message", messageSource.getMessage("sukces", null, locale));


        return "index";
    }
}
