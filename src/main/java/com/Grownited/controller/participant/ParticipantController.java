package com.Grownited.controller.participant;

import com.Grownited.entity.HackathonEntity;
import com.Grownited.entity.HackathonPrizeEntity;
import com.Grownited.entity.HackathonTeamEntity;
import com.Grownited.repository.HackathonPrizeRepository;
import com.Grownited.repository.HackathonRepository;
//import com.Grownited.repository.HackathonTeamMembersRepository;
import com.Grownited.repository.HackathonTeamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Controller
public class ParticipantController {

    @Autowired
    private HackathonRepository hackathonRepository;

    @Autowired
    private HackathonPrizeRepository hackathonPrizeRepository;

    @Autowired
    private HackathonTeamRepository hackathonTeamRepository;

  /*  @Autowired
    private HackathonTeamMembersRepository hackathonTeamMembersRepository;*/

    @GetMapping("/participant/participant-dashboard")
    public String participantDashboard(Model model) {
        List<HackathonEntity> hackathons = hackathonRepository.findAll();
        model.addAttribute("hackathons", hackathons);
        return "participant/ParticipantDashboard";
    }

    @GetMapping("/participant/home")
    public String showDetails(@RequestParam("hackathon_id") Integer hackathonId,
                              Model model,
                              HttpSession session) {
        Optional<HackathonEntity> hackathonOpt = hackathonRepository.findById(hackathonId);
        if (hackathonOpt.isEmpty()) {
            return "redirect:/participant/participant-dashboard";
        }

        HackathonEntity hackathon = hackathonOpt.get();
        model.addAttribute("hackathon", hackathon);

        // Fetch prizes
        List<HackathonPrizeEntity> prizes = hackathonPrizeRepository.findByHackathonId(hackathonId);
        model.addAttribute("prizes", prizes);

        // Today's date for deadline comparison
        model.addAttribute("today", LocalDate.now());

        // Check if current user is already registered (as leader or member)
        Integer userId = (Integer) session.getAttribute("userId");
       /* boolean isRegistered = false;
        if (userId != null) {
            // Check if user is team leader
        	Optional<HackathonTeamEntity> teamOpt = hackathonTeamRepository.findByHackathonIdAndTeamLeaderId(hackathonId, userId);     if (teamOpt.isPresent()) {
                isRegistered = true;
            } /*else {
                // Check if user is team member
                isRegistered = hackathonTeamMembersRepository.existsByHackathonIdAndMemberId(hackathonId, userId);
            }
        
       model.addAttribute("isRegistered", isRegistered);*/

        return "participant/ViewHackathons";
    }
}