package andrzej.appdemo.mainController;

import javax.ws.rs.GET;

import andrzej.appdemo.entityexp.Expert;
import andrzej.appdemo.entityexp.ExpertService;
import andrzej.appdemo.user.User;
import andrzej.appdemo.user.UserService;
import andrzej.appdemo.utilities.UserUtilities;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class MainPageController {

	@Autowired
	private ExpertService expertService;
	@Autowired
	private UserService userService;

	
	@GET
	@RequestMapping(value = {"/", "/index"})
	public String showMainPage(Model model) {
		String username = UserUtilities.getLoggedUser();
		User user = userService.findUserByEmail(username);
		List<Expert> expertList = getAllExperts();
		model.addAttribute("user",user);
		model.addAttribute("expertList",expertList);
		return "index";
	}



	private List<Expert> getAllExperts(){
		List<Expert> expertList = expertService.findAll();
		return expertList;
	}
	
}
