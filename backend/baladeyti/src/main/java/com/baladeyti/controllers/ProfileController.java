package com.baladeyti.controllers;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;
import java.util.stream.Collectors;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.baladeyti.models.ERole;
import com.baladeyti.models.Personne;
import com.baladeyti.payload.requests.ProfileUserRequest;
import com.baladeyti.payload.responses.ProfileResponse;
import com.baladeyti.repositories.PersonneRepository;
import com.baladeyti.services.UserDetailsImpl;


@CrossOrigin("*")
@RestController
@RequestMapping("/profile")
public class ProfileController {

	
	
	
	@Autowired
	private PersonneRepository personneRepository;
	
	@Autowired
	PasswordEncoder encoder;
	
	
	
	@GetMapping({"/",""})
	public ResponseEntity<?> profile() {
		
		UserDetailsImpl userDetails = (UserDetailsImpl) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String email = userDetails.getEmail();
		int id = userDetails.getId();
		String nom = userDetails.getNom();
		String prenom = userDetails.getPrenom();
		Personne personne = personneRepository.findById(id).get();
		String role = personne.getRole().name();
		
		
		
		ProfileResponse profile = new ProfileResponse(id,nom,prenom,email,role);
		
		return ResponseEntity.ok().body(profile);
		
	}
	
	
	

	@GetMapping("/all")
	@PreAuthorize("hasAuthority('ROLE_ADMIN')")
	//@PreAuthorize("hasRole('ADMIN')")
	
	public ResponseEntity<List<ProfileResponse>> adminPage(){
		
		
		
		List<ProfileResponse> personnes = personneRepository.findAll()
				.stream().map(
						personne -> {
							return new ProfileResponse(personne.getId(),personne.getNom(),personne.getPrenom(),
									personne.getEmail(),personne.getRole().name());
						}
						).collect(Collectors.toList());
		
		return ResponseEntity.ok().body(personnes);
	}
	
	
	@PutMapping("/update")
	public ResponseEntity<?> updateProfile(@RequestBody ProfileUserRequest request){
		
		UserDetailsImpl userDetails = (UserDetailsImpl) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Personne personne = personneRepository.findById(userDetails.getId()).get();
		if(personne==null)
			return ResponseEntity.badRequest().body("invalid user");
		
		String email = request.getEmail();
		String nom = request.getNom();
		String prenom = request.getPrenom();
		
		if(email !=null) {
			personne.setEmail(email);
		}
		if(nom!=null) {			
			personne.setNom(nom);
		}
		if(prenom !=null) {
			personne.setPrenom(prenom);
		}
		
		
		personneRepository.save(personne);
		
		
		
		return ResponseEntity.ok().body(new ProfileResponse(personne.getId(), personne.getNom(), personne.getPrenom(), personne.getEmail(), personne.getRole().name()));
		
	}
	
	
	
	@DeleteMapping("/delete/{id}")
	@PreAuthorize("hasAuthority('ROLE_ADMIN')")
	public ResponseEntity<?> deletePersonne(@PathVariable int id){
		try {			
			Personne personne = personneRepository.findById(id).get();
			personneRepository.delete(personne);
			return ResponseEntity.ok().body("user Deleted successfully.");
		}catch(NoSuchElementException e) {
			return ResponseEntity.badRequest().body("user not found");
			
		}catch(Exception e) {
			e.printStackTrace();
			return ResponseEntity.badRequest().body("An error occured while trying to delete the user.");
		}
	}
	
	
	
}
