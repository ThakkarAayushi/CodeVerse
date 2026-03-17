package com.Grownited.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Grownited.entity.HackathonTeamEntity;

@Repository
public interface HackathonTeamRepository extends JpaRepository<HackathonTeamEntity, Integer> {
	List<HackathonTeamEntity> findByTeamLeaderId(Integer teamLeaderId);
	Optional<HackathonTeamEntity> findByHackathonIdAndTeamLeaderId(Integer hackathonId, Integer teamLeaderId);
	
}
