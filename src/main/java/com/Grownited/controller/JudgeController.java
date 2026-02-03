package com.Grownited.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class JudgeController {
	
	@GetMapping("/evaluate/{id}")
    public String showEvaluationForm(@PathVariable("id") Long submissionId, Model model) {
        // Fetch submission details (teamName, repoUrl, etc.) from database
        // model.addAttribute("teamName", "Team Alpha");
        // model.addAttribute("submissionId", submissionId);
        return "/admin/evaluate-project";
    }

    @PostMapping("/submit-evaluation")
    public String processScores(@RequestParam Long submissionId,
                                @RequestParam Integer techScore,
                                @RequestParam Integer innovationScore,
                                @RequestParam Integer uiScore,
                                @RequestParam String feedback) {
        // Logic to calculate total score and save to evaluation table
        // evaluationService.saveEvaluation(submissionId, techScore, innovationScore, uiScore, feedback);
        return "redirect:/judge/assigned-projects";
    }
    
    @GetMapping("/leaderboard")
    public String showLeaderboard(Model model) {
        // Logic to fetch teams sorted by their evaluation scores from the database
        // List<TeamScore> scores = scoringService.getTopRankings();
        // model.addAttribute("leaderboardEntries", scores);
        return "leaderboard";
    }

}
