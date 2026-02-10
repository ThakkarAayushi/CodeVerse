package com.Grownited.controller;
import com.Grownited.repository.UserDetailRepository;
import com.Grownited.repository.UserRepository;
import com.Grownited.repository.UserTypeRepository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import com.Grownited.entity.UserDetailEntity;
import com.Grownited.entity.UserEntity;
import com.Grownited.entity.UserTypeEntity;

@Controller
public class SessionController {


	@Autowired
    UserRepository userRepository;
	
	@Autowired
	UserDetailRepository userDetailRepository;
	
	@Autowired
	UserTypeRepository userTypeRepository;

	@GetMapping("/signup")
	public String openSignupPage() {
		
		return "Signup";   //jsp name
	}
	
	// Routes to the login page
    @GetMapping("/login")
    public String showLoginPage() {
        return "login"; // Refers to login.jsp
    }

    // Routes to the registration page
    @GetMapping("/register")
    public String showRegisterPage(Model model) {
    	
    	List<UserTypeEntity> allUserType = userTypeRepository.findAll(); 
		//userType -> send Signup->
		model.addAttribute("allUserType",allUserType);
    	
        return "register"; // Refers to register.jsp
    }
    @PostMapping("/stored")
    public String showRegisterPage(UserEntity userEntity,UserDetailEntity userDetailEntity) {
    		System.out.println(userEntity.getFirstName());
    		System.out.println(userEntity.getLastName());
    		System.out.println(userDetailEntity.getCity());
    		System.out.println(userDetailEntity.getState());
    		
    		userEntity.setRole("participant");
    		userEntity.setActive(true);
    		userEntity.setCreateAtDate(LocalDate.now());
    		
    		userRepository.save(userEntity);
    		userDetailEntity.setUserId(userEntity.getUserId());
    		userDetailRepository.save(userDetailEntity);
    		
        return "login"; // Refers to register.jsp
    }
    @GetMapping("/forgetpassword")
    public String showPage() {
        return "forgetPassword"; // Points to /WEB-INF/jsp/forgot-password.jsp
    }
    
    @GetMapping("/submit-project")
    public String showSubmissionPage() {
        return "participant-submission";
    }

  
   
   
}
