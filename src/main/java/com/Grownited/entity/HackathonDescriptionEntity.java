package com.Grownited.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table (name = "hackathon_description")
public class HackathonDescriptionEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer hackathon_description_id;
	
	@Column(columnDefinition = "TEXT")
	private String hackathonDetails;
	private Integer hackathonId;
	public Integer getHackathon_description_id() {
		return hackathon_description_id;
	}
	public void setHackathon_description_id(Integer hackathon_description_id) {
		this.hackathon_description_id = hackathon_description_id;
	}
	
	public String getHackathonDetails() {
		return hackathonDetails;
	}
	public void setHackathonDetails(String hackathonDetails) {
		this.hackathonDetails = hackathonDetails;
	}
	public Integer getHackathonId() {
		return hackathonId;
	}
	public void setHackathonId(Integer hackathonId) {
		this.hackathonId = hackathonId;
	}
	
}
