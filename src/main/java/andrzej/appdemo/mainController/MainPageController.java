package andrzej.appdemo.mainController;

import javax.ws.rs.GET;

import andrzej.appdemo.entityexp.Expert;
import andrzej.appdemo.entityexp.ExpertService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class MainPageController {

	@Autowired
	private ExpertService expertService;
	
	@GET
	@RequestMapping(value = {"/", "/index"})
	public String showMainPage(Model model) {
		List<Expert> expertList = getAllExperts();
		model.addAttribute("expertList",expertList);
		return "index";
	}



	private List<Expert> getAllExperts(){
		List<Expert> expertList = expertService.findAll();
		return expertList;
	}
	
}
