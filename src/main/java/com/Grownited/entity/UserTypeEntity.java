package com.Grownited.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "user_types" )
public class UserTypeEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer user_type_id;
	private String user_type;
	public Integer getUser_type_id() {
		return user_type_id;
	}
	public void setUser_type_id(Integer user_type_id) {
		this.user_type_id = user_type_id;
	}
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	
	
}
