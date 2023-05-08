package com.baladeyti.payload.requests;

import java.util.Set;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public class SignupRequest{


	@NotBlank
	@Email
	private String email;
	@NotBlank
	private String password;
	@NotBlank
	private String nom;
	@NotBlank
	private String prenom;
	
	private int id;
	
	private Set<String> roles;
	
	

	public SignupRequest() {
		
	}
	
	public SignupRequest(@NotBlank @Email String email, @NotBlank String password, @NotBlank String nom,
			@NotBlank String prenom, int id, Set<String> roles) {
		super();
		this.email = email;
		this.password = password;
		this.nom = nom;
		this.prenom = prenom;
		this.id = id;
		this.roles = roles;
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
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Set<String> getRoles() {
		return roles;
	}
	
	
	
	
}
