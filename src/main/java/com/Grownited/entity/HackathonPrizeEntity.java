package com.Grownited.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "hackathon_prize")
public class HackathonPrizeEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer hackathon_prize_id;
	private Integer hackathon_id;
	private String prizeTitle;
	private String prizeDescription;
	public Integer getHackathon_prize_id() {
		return hackathon_prize_id;
	}
	public void setHackathon_prize_id(Integer hackathon_prize_id) {
		this.hackathon_prize_id = hackathon_prize_id;
	}
	public Integer getHackathon_id() {
		return hackathon_id;
	}
	public void setHackathon_id(Integer hackathon_id) {
		this.hackathon_id = hackathon_id;
	}
	public String getPrizeTitle() {
		return prizeTitle;
	}
	public void setPrizeTitle(String prizeTitle) {
		this.prizeTitle = prizeTitle;
	}
	public String getPrizeDescription() {
		return prizeDescription;
	}
	public void setPrizeDescription(String prizeDescription) {
		this.prizeDescription = prizeDescription;
	}
	

}
