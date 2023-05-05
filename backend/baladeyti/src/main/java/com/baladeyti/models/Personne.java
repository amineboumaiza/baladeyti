package com.baladeyti.models;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.validation.constraints.Email;

@Entity
public class Personne {


	
	
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Id
	@Column(name = "id_personne")
	private int id;
	
	private String nom;
	
	private String prenom;
	
	private int matricule;
	
	@Column(name="email")
	@Email
	private String email;
	
	private String password;
	
	
	@ManyToMany
	@JoinTable(
			name = "user_roles",
			joinColumns = @JoinColumn(name="user_id"),
			inverseJoinColumns = @JoinColumn(name="role_id")
			)
	private Set<Role> roles;
	
	@ManyToOne
	@JoinColumn(name="adresse")
	private Adresse adresse;
	
	
	
	public Personne() {
		
	}



	public Personne(String nom, String prenom, int matricule, @Email String email, String password) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.matricule = matricule;
		this.email = email;
		this.password = password;
	}



	public Personne(int id, String nom, String prenom, int matricule, @Email String email, String password) {
		super();
		this.id = id;
		this.nom = nom;
		this.prenom = prenom;
		this.matricule = matricule;
		this.email = email;
		this.password = password;
	}



	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
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



	public int getMatricule() {
		return matricule;
	}



	public void setMatricule(int matricule) {
		this.matricule = matricule;
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



	public Set<Role> getRoles() {
		return roles;
	}



	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	
	
	
	
	
	
	
}
