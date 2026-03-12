package com.Grownited.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "hackathon_result")
public class HackathonResultEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer hackathon_result_id;
	private Integer hackathon_id;
	private Integer judge_id;
	private Integer team_id;
	private String innovation;
	private String implementation;
	private String codingStandard;
	private String round;
	public Integer getHackathon_result_id() {
		return hackathon_result_id;
	}
	public void setHackathon_result_id(Integer hackathon_result_id) {
		this.hackathon_result_id = hackathon_result_id;
	}
	public Integer getHackathon_id() {
		return hackathon_id;
	}
	public void setHackathon_id(Integer hackathon_id) {
		this.hackathon_id = hackathon_id;
	}
	public Integer getJudge_id() {
		return judge_id;
	}
	public void setJudge_id(Integer judge_id) {
		this.judge_id = judge_id;
	}
	public Integer getTeam_id() {
		return team_id;
	}
	public void setTeam_id(Integer team_id) {
		this.team_id = team_id;
	}
	public String getInnovation() {
		return innovation;
	}
	public void setInnovation(String innovation) {
		this.innovation = innovation;
	}
	public String getImplementation() {
		return implementation;
	}
	public void setImplementation(String implementation) {
		this.implementation = implementation;
	}
	public String getCodingStandard() {
		return codingStandard;
	}
	public void setCodingStandard(String codingStandard) {
		this.codingStandard = codingStandard;
	}
	public String getRound() {
		return round;
	}
	public void setRound(String round) {
		this.round = round;
	}
	
	
	
	
}
