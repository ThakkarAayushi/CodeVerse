package com.Grownited.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Grownited.repository.HackathonRepository;
import com.Grownited.entity.HackathonEntity;

@Service
public class HackathonService {

    @Autowired
    private HackathonRepository hackathonRepository;

    public List<HackathonEntity> getAllHackathons() {
        return hackathonRepository.findAll();
    }
    
    	public void updateHackathonStatus(HackathonEntity hackathon) {
    	    // If already COMPLETED, never change it automatically
    	    if ("COMPLETED".equalsIgnoreCase(hackathon.getStatus())) {
    	        return;
    	    }

    	    LocalDate today = LocalDate.now();
    	    if (hackathon.getRegistrationEndDate() != null && today.isAfter(hackathon.getRegistrationEndDate())) {
    	        hackathon.setStatus("EXPIRED");
    	    } else if (hackathon.getRegistrationStartDate() != null && today.isBefore(hackathon.getRegistrationStartDate())) {
    	        hackathon.setStatus("UPCOMING");
    	    } else if (hackathon.getRegistrationStartDate() != null && hackathon.getRegistrationEndDate() != null
    	            && !today.isBefore(hackathon.getRegistrationStartDate()) && !today.isAfter(hackathon.getRegistrationEndDate())) {
    	        hackathon.setStatus("LIVE");
    	    }
    	}

    // Optionally, a method to update all hackathons
    public void updateAllHackathonStatuses() {
        List<HackathonEntity> all = hackathonRepository.findAll();
        for (HackathonEntity h : all) {
            updateHackathonStatus(h);
        }
        hackathonRepository.saveAll(all);
    }
}