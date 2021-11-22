package spring.mvc.sicontroller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SIController {

	@RequestMapping(value = "/si", method = RequestMethod.GET)
	public String si(Model model) {
		return "si";
	}
	
	@RequestMapping(path="/psi", method = RequestMethod.POST)
	public String processSi(@RequestParam("principal") int p, 
							@RequestParam("time") int t, 
							@RequestParam("rate") int r, Model model) {
		
		int SI=(p*t*r)/100;
		
		System.out.println("Simple Interest = "+ (p*t*r)/100);
		model.addAttribute("SI", SI);
		return "result";
	}

}