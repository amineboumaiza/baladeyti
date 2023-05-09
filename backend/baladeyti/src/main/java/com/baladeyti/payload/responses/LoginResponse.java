package com.baladeyti.payload.responses;


import lombok.Data;

@Data
public class LoginResponse {

	private int id;
	private String nom;
	private String prenom;
	private String email;
	private String jwt;
	private String refreshToken;
	private String role;
	public LoginResponse(int id, String nom, String prenom, String email, String jwt, String refreshToken,
			String role) {
		super();
		this.id = id;
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
		this.jwt = jwt;
		this.refreshToken = refreshToken;
		this.role = role;
	}
	
	
	
}
