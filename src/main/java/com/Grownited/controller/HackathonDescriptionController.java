package com.Grownited.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.Grownited.entity.HackathonDescriptionEntity;
import com.Grownited.repository.HackathonDescriptionRepository;

@Controller
public class HackathonDescriptionController {
	
	@Autowired
	HackathonDescriptionRepository hackathonDescriptionRepository;
	
	@GetMapping("hackathonDescription")
	public String hackthoneDescription() {
		
		return "HackathonDescription";
	}
	
	@PostMapping("saveHackathonDescription")
	public String saveHackathonDescription(HackathonDescriptionEntity hackathonDescriptionEntity) {
		
		hackathonDescriptionRepository.save(hackathonDescriptionEntity);
		return "admin-dashboard";
	}

}
