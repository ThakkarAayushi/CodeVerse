package com.Grownited.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminController {
	
	 @GetMapping("/dashboard")
	    public String showDashboard(Model model) {
	        // You can later replace these hardcoded values with Service calls
	        model.addAttribute("activeCount", 14);
	        model.addAttribute("pendingCount", 8);
	        model.addAttribute("userCount", 2405);
	        
	        return "/admin/admin-dashboard"; // Maps to /WEB-INF/views/admin-dashboard.jsp
	    }
	 
	 /**
	     * Form Processing: Handles approval or rejection of organizers/judges.
	     */
	    @PostMapping("/approvals")
	    public String processApproval(@RequestParam("userId") Long userId, 
	                                  @RequestParam("action") String action) {
	        if ("approve".equals(action)) {
	            // Logic to update user status to 'APPROVED' in database
	        } else {
	            // Logic for 'REJECT'
	        }
	        return "redirect:/admin/admin-approvals"; // Refresh the dashboard after action
	    }
	    
	 // Inside AdminController.java

	    @GetMapping("/create-hackathon")
	    public String showCreateHackathonPage() {
	        return "/admin/create-hackathons";
	    }

	    @PostMapping("/save-hackathon")
	    public String saveHackathon(@RequestParam String title, 
	                                @RequestParam String description,
	                                @RequestParam String startDate,
	                                @RequestParam String endDate,
	                                @RequestParam String problemTitle,
	                                @RequestParam String problemDescription) {
	        // 1. Create Hackathon entity/object
	        // 2. Save to database via HackathonRepository
	        // 3. Redirect back to the management list
	        return "redirect:/admin/manage-hackathons";
	    }
	    
	    @GetMapping("/reports")
	    public String showReports(Model model) {
	        model.addAttribute("totalSubmissions", 1240);
	        model.addAttribute("evalProgress", 88);
	        // In a real scenario, you'd pass a List of Log objects here
	        // model.addAttribute("activityLogs", reportService.getRecentLogs());
	        return "/admin/admin-reports";
	    }
	    

	    @GetMapping("/manage-hackathons")
	    public String manageHackathons(Model model) {
	        // In the future, fetch your list of hackathons from a service here
	        // List<Hackathon> hackathons = hackathonService.getAll();
	        // model.addAttribute("hackathonList", hackathons);
	        return "/admin/manage-hackathons";
	    }
	    
	   

}
