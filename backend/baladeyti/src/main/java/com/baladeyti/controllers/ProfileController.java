package com.baladeyti.controllers;

import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.baladeyti.security.services.UserDetailsImpl;

@RestController
@RequestMapping("/profile")
public class ProfileController {

	
	@GetMapping({"/",""})
	public ResponseEntity<String> profile() {
		
		UserDetailsImpl userDetails = (UserDetailsImpl) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		String email = userDetails.getEmail();
		String password = userDetails.getPassword();
		int matricule = userDetails.getMatricule();
		System.out.println("email: " + email + "\npassword: " + password + "\nmatricule: " + matricule);
		
		return ResponseEntity.ok().body("hello");
		
	}
}
