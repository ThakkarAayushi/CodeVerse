package com.Grownited.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "hackathon_team_members")
public class HackathonTeamMembersEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer hackathon_team_member_id;
	private Integer team_id;
	private Integer hackathon_id;
	private Integer member_id;
	private String roleTitle;
	public Integer getHackathon_team_member_id() {
		return hackathon_team_member_id;
	}
	public void setHackathon_team_member_id(Integer hackathon_team_member_id) {
		this.hackathon_team_member_id = hackathon_team_member_id;
	}
	public Integer getTeam_id() {
		return team_id;
	}
	public void setTeam_id(Integer team_id) {
		this.team_id = team_id;
	}
	public Integer getHackathon_id() {
		return hackathon_id;
	}
	public void setHackathon_id(Integer hackathon_id) {
		this.hackathon_id = hackathon_id;
	}
	public Integer getMember_id() {
		return member_id;
	}
	public void setMember_id(Integer member_id) {
		this.member_id = member_id;
	}
	public String getRoleTitle() {
		return roleTitle;
	}
	public void setRoleTitle(String roleTitle) {
		this.roleTitle = roleTitle;
	}
	

}
