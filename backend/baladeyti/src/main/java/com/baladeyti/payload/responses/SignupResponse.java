package com.baladeyti.payload.responses;

import java.util.Set;

import com.baladeyti.models.Role;

public class SignupResponse {
	
	private int id;
	private int matricule;
	private String nom;
	private String prenom;
	private String Email;
	private Set<Role> roles;
	public SignupResponse(int id, int matricule, String nom, String prenom, String email, Set<Role> roles) {
		super();
		this.id = id;
		this.matricule = matricule;
		this.nom = nom;
		this.prenom = prenom;
		Email = email;
		this.roles = roles;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMatricule() {
		return matricule;
	}
	public void setMatricule(int matricule) {
		this.matricule = matricule;
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
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public Set<Role> getRoles() {
		return roles;
	}
	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}
	
	

}
