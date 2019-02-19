package andrzej.appdemo.admin;

import javax.ws.rs.GET;

import andrzej.appdemo.user.User;
import andrzej.appdemo.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class AdminPageController {

	@Autowired
	private UserService userService;
	
	@GET
	@RequestMapping(value = "/admin")
	@Secured(value = {"ROLE_ADMIN"})
	public String openAdminMainPage() {
		return "admin/admin";
	}

	@GET
	@RequestMapping(value = "/admin/users")
	@Secured(value = {"ROLE_ADMIN"})
	public String openAdminAllUsersPage(Model model){
		List<User> userList = getAllUsers();
		model.addAttribute("userList", userList);
		return "admin/users";
	}

	private List<User> getAllUsers(){
		List<User> usersList = userService.findAll();
		for(User users: usersList){
			int numerRoli = users.getRoles().iterator().next().getId();
			if(numerRoli==1) {
				users.setNrRoli(numerRoli);
			}else if (numerRoli==2){
				users.setNrRoli(numerRoli);
			}
		}
		return usersList;
	}

}
