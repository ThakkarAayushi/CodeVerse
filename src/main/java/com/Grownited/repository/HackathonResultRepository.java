package com.Grownited.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.Grownited.entity.HackathonResultEntity;

@Repository
public interface HackathonResultRepository extends JpaRepository<HackathonResultEntity, Integer> {

	Optional<HackathonResultEntity> findByHackathonIdAndJudgeIdAndTeamId(Integer hackathonId, Integer judgeId, Integer teamId);

	List<HackathonResultEntity> findByHackathonId(Integer hackathonId);

	  @Query("SELECT h.hackathonId, AVG(h.innovation + h.implementation + h.codingStandard) as avgScore " +
	           "FROM HackathonResultEntity h " +
	           "WHERE h.hackathonId IN :hackathonIds " +
	           "GROUP BY h.hackathonId " +
	           "ORDER BY avgScore DESC")
	    List<Object[]> getAverageScoresByHackathon(@Param("hackathonIds") List<Integer> hackathonIds);
	
}
