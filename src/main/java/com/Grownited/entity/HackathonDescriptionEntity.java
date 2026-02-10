package com.Grownited.entity;

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
	private String hackathon_details;
	public Integer getHackathon_description_id() {
		return hackathon_description_id;
	}
	public void setHackathon_description_id(Integer hackathon_description_id) {
		this.hackathon_description_id = hackathon_description_id;
	}
	public String getHackathon_details() {
		return hackathon_details;
	}
	public void setHackathon_details(String hackathon_details) {
		this.hackathon_details = hackathon_details;
	}
	
	
	

}
