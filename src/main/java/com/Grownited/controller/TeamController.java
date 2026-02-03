package com.Grownited.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class TeamController {
	
	   @PostMapping("/save-submission")
	    public String handleSubmission(@RequestParam("teamName") String teamName,
	                                   @RequestParam("repoUrl") String repoUrl,
	                                   @RequestParam("projectFile") MultipartFile projectFile) {
	        
	        if (!projectFile.isEmpty()) {
	            // Logic to save the file to a directory or cloud storage
	            String fileName = projectFile.getOriginalFilename();
	            // fileService.save(projectFile);
	        }
	        
	        // Logic to save submission metadata to the database
	        return "redirect:/team/dashboard";
	    }
	   
	   @GetMapping("/submit")
	    public String showSubmissionPage() {
	        return "team/submit-project";
	    }

	    @PostMapping("/save-project")
	    public String handleProjectSubmission(@RequestParam("title") String title,
	                                          @RequestParam("repoUrl") String repoUrl,
	                                          @RequestParam(value="demoUrl", required=false) String demoUrl,
	                                          @RequestParam("description") String description) {
	        // Logic to save the submission details into the CodeVerse database
	        // submissionService.save(new Submission(title, repoUrl, demoUrl, description));
	        return "redirect:/team/dashboard";
	    }
	    
	    @GetMapping("/team")
	    public String showTeamPage() {
	        return "team/team-formation"; // Returns team-formation.jsp
	    }

	    @PostMapping("/create-team")
	    public String handleTeamCreation(@RequestParam("teamName") String teamName,
	                                     @RequestParam("memberEmails") String emails) {
	        // Logic to save the team and send invitations via email
	        // teamService.registerNewTeam(teamName, emails);
	        return "redirect:/team/dashboard";
	    }
}
