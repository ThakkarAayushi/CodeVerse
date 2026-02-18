package com.Grownited.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.Grownited.entity.HackathonEntity;
import com.Grownited.entity.UserEntity;
import com.Grownited.entity.UserTypeEntity;
import com.Grownited.repository.HackathonRepository;
import com.Grownited.repository.UserTypeRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class HackathonController {
	
	  @Autowired
		HackathonRepository hackathonRepository;
	    
	   @Autowired
	    UserTypeRepository userTypeRepository;
	
	@GetMapping("/create-hackathon")
	    public String createHackathon(Model model) {

	    	List<UserTypeEntity> allUserType = userTypeRepository.findAll(); 
			//userType -> send Signup->
			model.addAttribute("allUserType",allUserType);
	        return "create-hackathons";
	    }

	    @PostMapping("/save-hackathon")
	    public String saveHackathon(HackathonEntity hackathonEntity,HttpSession session) {
		    
		    System.out.println(hackathonEntity.getTitle());
		    UserEntity currentLogInUser = (UserEntity) session.getAttribute("user");
			hackathonEntity.setUserId(currentLogInUser.getUserId());
		    hackathonRepository.save(hackathonEntity);
	        return "redirect:/listHackathon";
	    }
	    
	    @GetMapping("listHackathon")
	    public String listHackathon(Model model)
	    {
	    	 
	    	List<HackathonEntity> allHackathons = hackathonRepository.findAll();
	    	model.addAttribute("allHackathons" , allHackathons);
	    	return "ListHackathon";
	    	
	    }
	    
	    @GetMapping("deleteHackathon")
		public String deleteHackathon(Integer hackthon_id) {
			hackathonRepository.deleteById(hackthon_id);
			
			return "redirect:/listHackathon";//do not open jsp , open another url -> listHackathon
		}
	    
	  

}
