package com.baladeyti.payload.requests;

public class ProfileUserRequest {

	private String email;
	private String nom;
	private String prenom;
	
	public ProfileUserRequest() {
		
	}
	
	public ProfileUserRequest(String email, String nom, String prenom) {
		super();
		this.email = email;
		this.nom = nom;
		this.prenom = prenom;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	
	
	
	
	
}
