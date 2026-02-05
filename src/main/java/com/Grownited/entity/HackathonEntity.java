package com.Grownited.entity;

import java.time.LocalDate;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table (name = "hackathon")
public class HackathonEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer	hackthon_id;
	private String title;
	private String status;
	private String event_type;
	private String payment;
	private Integer minTeamSize;
	private Integer maxTeamSize;
	private String location;
	private String userType;	
	private LocalDate registrationStartDate;
	private LocalDate registrationEndDate;
	public Integer getHackthon_id() {
		return hackthon_id;
	}
	public void setHackthon_id(Integer hackthon_id) {
		this.hackthon_id = hackthon_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getEvent_type() {
		return event_type;
	}
	public void setEvent_type(String event_type) {
		this.event_type = event_type;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public Integer getMinTeamSize() {
		return minTeamSize;
	}
	public void setMinTeamSize(Integer minTeamSize) {
		this.minTeamSize = minTeamSize;
	}
	public Integer getMaxTeamSize() {
		return maxTeamSize;
	}
	public void setMaxTeamSize(Integer maxTeamSize) {
		this.maxTeamSize = maxTeamSize;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public LocalDate getRegistrationStartDate() {
		return registrationStartDate;
	}
	public void setRegistrationStartDate(LocalDate registrationStartDate) {
		this.registrationStartDate = registrationStartDate;
	}
	public LocalDate getRegistrationEndDate() {
		return registrationEndDate;
	}
	public void setRegistrationEndDate(LocalDate registrationEndDate) {
		this.registrationEndDate = registrationEndDate;
	}
		

}
