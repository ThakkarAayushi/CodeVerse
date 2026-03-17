package com.Grownited.repository;


import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.Grownited.entity.HackathonEntity;
import com.Grownited.entity.HackathonPrizeEntity;

import java.util.List;



@Repository
public interface HackathonRepository extends JpaRepository<HackathonEntity, Integer> {
     
	   //Optional<HackathonEntity> 
	    long countByStatus(String status);
	    @Query("SELECT DISTINCT h FROM HackathonEntity h " +
	            "LEFT JOIN HackathonTeamEntity t ON h.hackthon_id = t.hackathonId " +
	            "LEFT JOIN HackathonTeamMembersEntity m ON t.hackathonTeamId = m.teamId " +
	            "WHERE t.teamLeaderId = :userId OR m.memberId = :userId")
	     List<HackathonEntity> findRegistrationsByUserId(@Param("userId") Integer userId);
	    

	    
}
