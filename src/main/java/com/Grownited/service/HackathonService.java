package com.Grownited.service;

import com.Grownited.entity.HackathonEntity;
import com.Grownited.repository.HackathonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public class HackathonService {

    @Autowired
    private HackathonRepository hackathonRepository;

    public List<HackathonEntity> getAllHackathons() {
        List<HackathonEntity> hackathons = hackathonRepository.findAll();
        LocalDate today = LocalDate.now();
        for (HackathonEntity h : hackathons) {
            if (h.getRegistrationEndDate().isBefore(today) && !"EXPIRED".equals(h.getStatus())) {
                h.setStatus("EXPIRED");
                // Note: not saved to database – only affects this runtime copy
            }
        }
        return hackathons;
    }

    // You can keep other methods like findById, save, etc.
}