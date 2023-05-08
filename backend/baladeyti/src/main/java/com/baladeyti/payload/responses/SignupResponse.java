package com.baladeyti.payload.responses;



import com.baladeyti.models.ERole;

import lombok.Data;

@Data
public class SignupResponse {
	
	private int id;
	private String nom;
	private String prenom;
	private String Email;
	private ERole role;
	public SignupResponse(int id, String nom, String prenom, String email, ERole role) {
		super();
		this.id = id;
		this.nom = nom;
		this.prenom = prenom;
		Email = email;
		this.role = role;
	}
	

}
