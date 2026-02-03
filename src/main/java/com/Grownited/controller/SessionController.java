package com.Grownited.controller;
import com.Grownited.repository.UserRepository;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.Grownited.entity.UserDetailEntity;
import com.Grownited.entity.UserEntity;

@Controller
public class SessionController {

	@Autowired
    UserRepository userRepository;

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
    public String showRegisterPage() {
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

   //Processes registration data
    /*@PostMapping("/register")
    public String handleRegistration(@RequestParam String fullName, @RequestParam String role,Model model) {
        // Logic to save user to database
        return "redirect:/login";
    }*/
   
   
   
}
