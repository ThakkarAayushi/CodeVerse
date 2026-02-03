package com.Grownited.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class OrganizerController {
	
	 @PostMapping("/save-hackathon-org")
	    public String launchHackathon(@RequestParam("title") String title,
	                                  @RequestParam("startDate") String startDate,
	                                  @RequestParam("endDate") String endDate,
	                                  @RequestParam("rules") String rules,
	                                  @RequestParam("problemStatementFile") MultipartFile file) {
	        // 1. Process and save the uploaded file
	        // 2. Save hackathon details to the database
	        return "redirect:/organizer/create-hackathon-org";
	    }
	 
	 @GetMapping("/assign-judges")
	    public String showAssignJudgesPage(Model model) {
	        // Logic to fetch problems and available judges from your DB
	        // model.addAttribute("problemList", problemService.getAllProblems());
	        // model.addAttribute("availableJudges", userService.findUsersByRole("JUDGE"));
	        return "organizer/assign-judges";
	    }
	    @PostMapping("/update-assignment")
	    public String updateJudgeAssignment(@RequestParam("problemId") Long problemId, 
	                                        @RequestParam("judgeId") Long judgeId) {
	        // Logic to update the judge_id in the problem_statement table
	        // problemService.assignJudgeToProblem(problemId, judgeId);
	        return "organizer/assign-judge";
	    }
	    
	    @GetMapping("/assign-judge")
	    public String showAllocationPage(Model model) {
	        // In your CodeVerse project, you'll fetch these from your services
	        // model.addAttribute("problems", problemService.getProblemsForOrganizer());
	        // model.addAttribute("judges", userService.findUsersByRole("JUDGE"));
	        return "organizer/assign-judge";
	    }

	    @PostMapping("/update-allocation")
	    public String updateJudgeAllocation(@RequestParam Long problemId, @RequestParam Long judgeId) {
	        // Logic to update the database record
	        // problemService.assignJudge(problemId, judgeId);
	        return "redirect:/organizer/assign-judge";
	    }
	    
	    @GetMapping("/open-dashboard")
	    public String OpenDashboard(Model model) {
	        // Fetch real-time statistics for the dashboard
	        model.addAttribute("participantCount", 450);
	        model.addAttribute("submissionCount", 89);
	        model.addAttribute("evalProgress", 65);
	        
	        // Fetch the list of active hackathons from your database
	        // model.addAttribute("activeHackathons", eventService.getEventsByOrganizer());
	        
	        return "organizer/organizer-dashboard";
	    }
	    
	    @PostMapping("/upload-statement")
	    public String handleStatementUpload(@RequestParam("title") String title,
	                                        @RequestParam("difficulty") String difficulty,
	                                        @RequestParam("descriptionFile") MultipartFile file) {
	        if (!file.isEmpty()) {
	            // Logic to save the file and problem metadata to the CodeVerse database
	        }
	        return "organizer/problem-statements";
	    }
		

}
