package com.baladeyti.models;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.validation.constraints.Email;
import lombok.Data;

@Entity
@Data
public class Personne {


	
	
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Id
	@Column(name = "id_personne")
	private int id;
	
	private String nom;
	
	private String prenom;
	
	
	@Column(name="email")
	@Email
	private String email;
	
	private String password;
	
	/*
	@ManyToMany
	@JoinTable(
			name = "user_roles",
			joinColumns = @JoinColumn(name="user_id"),
			inverseJoinColumns = @JoinColumn(name="role_id")
			)
	private Set<Role> roles;
	*/
	@Enumerated(EnumType.STRING)
	private ERole role;
	
	
	@ManyToOne
	@JoinColumn(name="adresse")
	private Adresse adresse;
	
	
	
	public Personne() {
		
	}



	public Personne(String nom, String prenom, @Email String email, String password) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
		this.password = password;
	}



	public Personne(int id, String nom, String prenom, @Email String email, String password) {
		super();
		this.id = id;
		this.nom = nom;
		this.prenom = prenom;

		this.email = email;
		this.password = password;
	}

	
	
	
	
	
	
	
}
