package com.baladeyti.payload.requests;

import java.util.Set;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;


@Data
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
	
	private String role;
	
	

	public SignupRequest() {
		
	}
	
	public SignupRequest(@NotBlank @Email String email, @NotBlank String password, @NotBlank String nom,
			@NotBlank String prenom, int id, String role) {
		super();
		this.email = email;
		this.password = password;
		this.nom = nom;
		this.prenom = prenom;
		this.id = id;
		this.role = role;
	}
	
	
	
}
