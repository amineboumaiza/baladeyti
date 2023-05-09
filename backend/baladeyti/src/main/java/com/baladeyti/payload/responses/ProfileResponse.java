package com.baladeyti.payload.responses;


import lombok.Data;

@Data
public class ProfileResponse {

	private int id;
	private String nom;
	private String prenom;
	private String email;
	private String role;
	public ProfileResponse(int id, String nom, String prenom, String email, String role) {
		super();
		this.id = id;
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
		this.role = role;
	}
	
	
	
}
