package com.Grownited.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Grownited.entity.HackathonTeamEntity;
import com.Grownited.repository.HackathonTeamRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class HackathonTeamController {
	
	  @Autowired
	    private HackathonTeamRepository hackathonTeamRepository;

	    @GetMapping("/teamManage")
	    public String showTeamForm(Integer hackathonId, Model model) {
	        model.addAttribute("hackathon_id", hackathonId);
	        return "TeamManage";
	    }

	    @PostMapping("/saveteam")
	    public String saveTeam(@RequestParam("hackathon_id") Integer hackathonId,
	                           @RequestParam("teamName") String teamName,
	                           HttpSession session) {
	        Integer userId = (Integer) session.getAttribute("userId");
	        if (userId == null) {
	            return "redirect:/login";
	        }

	        HackathonTeamEntity team = new HackathonTeamEntity();
	        team.setHackathonId(hackathonId);
	        team.setTeamLeaderId(userId);
	        team.setTeamName(teamName);
	        team.setTeamStatus("PENDING"); // or "ACTIVE" depending on your workflow

	        hackathonTeamRepository.save(team);

	        return "redirect:/participant/home?hackathon_id=" + hackathonId;
	    }
}


