package com.baladeyti.services;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.CredentialsContainer;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.baladeyti.models.Personne;



public class UserDetailsImpl implements UserDetails,CredentialsContainer{

	

	private static final long serialVersionUID = 1L;
	


private int id;
	
	private String nom;
	
	private String prenom;
	
	
	private String email;
	
	private String password;
	
	
	private Collection<? extends GrantedAuthority> authorites;
	
	
	
	
	public UserDetailsImpl(int id, String nom, String prenom, String email, String password,
			Collection<? extends GrantedAuthority> authorites) {
		super();
		this.id = id;
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
		this.password = password;
		this.authorites = authorites;
	}

	public static UserDetailsImpl build(Personne user,PasswordEncoder encoder) {
		

		List<GrantedAuthority> authorities = new ArrayList<>(List.of(new SimpleGrantedAuthority(user.getRole().name())));
		
		return new UserDetailsImpl(user.getId(),user.getNom(),user.getPrenom()
				,user.getEmail(),user.getPassword(),authorities);
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return this.authorites;
	}

	@Override
	public String getPassword() {
		return this.password;
	}


	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}


	@Override
	public void eraseCredentials() {
		this.password = null;
		
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
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

	@Override
	public String getUsername() {
		return email;
	}

}
