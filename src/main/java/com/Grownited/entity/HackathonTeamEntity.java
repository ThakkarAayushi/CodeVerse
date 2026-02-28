package com.Grownited.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "hackathon_team")
public class HackathonTeamEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer hackathon_team_id;
	private Integer hackathon_id;
	private Integer team_leader_id;
	private Integer teamName;
	private Integer teamStatus;
	public Integer getHackathon_team_id() {
		return hackathon_team_id;
	}
	public void setHackathon_team_id(Integer hackathon_team_id) {
		this.hackathon_team_id = hackathon_team_id;
	}
	public Integer getHackathon_id() {
		return hackathon_id;
	}
	public void setHackathon_id(Integer hackathon_id) {
		this.hackathon_id = hackathon_id;
	}
	public Integer getTeam_leader_id() {
		return team_leader_id;
	}
	public void setTeam_leader_id(Integer team_leader_id) {
		this.team_leader_id = team_leader_id;
	}
	public Integer getTeamName() {
		return teamName;
	}
	public void setTeamName(Integer teamName) {
		this.teamName = teamName;
	}
	public Integer getTeamStatus() {
		return teamStatus;
	}
	public void setTeamStatus(Integer teamStatus) {
		this.teamStatus = teamStatus;
	}
	

}
