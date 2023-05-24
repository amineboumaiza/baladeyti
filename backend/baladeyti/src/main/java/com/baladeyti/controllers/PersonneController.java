package com.baladeyti.controllers;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.baladeyti.models.ERole;
import com.baladeyti.models.Personne;
import com.baladeyti.repositories.PersonneRepository;

@CrossOrigin("*")
@RestController
@RequestMapping("/personne")
public class PersonneController {
	
	@Autowired
	private PersonneRepository personneRepository;
	

	@GetMapping("/client")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<?> getAllClients(){
		
		List<Personne> personnes = personneRepository.findByRole(ERole.ROLE_CLIENT);
		
		return ResponseEntity.ok().body(personnes);
		
	}
	
	
	@GetMapping("/employe")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<?> getAllEmployes(){
		
		List<Personne> personnes = personneRepository.findByRole(ERole.ROLE_EMPLOYE);
		
		return ResponseEntity.ok().body(personnes);
		
	}
	
	
	@PostMapping("/employe/create")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<?> createEmploye(@RequestBody Personne employe){
		try {
		employe.setRole(ERole.ROLE_EMPLOYE);
		personneRepository.save(employe);
		return ResponseEntity.ok().body(employe);
		}catch(Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("something wrong.");
		}
	}
	
	
	
	
	@PutMapping("/update/{id}")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<?> updatePersonne(@PathVariable int id,@RequestBody Personne personne){
		
		Optional<Personne> personneToUpdateOp = personneRepository.findById(id);
		if(personneToUpdateOp.isEmpty())
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Personne not found.");
		Personne personneToUpdate = personneToUpdateOp.get();
		personneToUpdate.update(personne);
		personneRepository.save(personneToUpdate);
		return ResponseEntity.ok().body(personneToUpdate);
	}
	
	
	
	
	
	@DeleteMapping("/delete/{id}")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<?> deletePersonne(@PathVariable int id){
		
		Optional<Personne> personneOptional = personneRepository.findById(id);
		if(personneOptional.isEmpty())
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Personne not found.");
		personneRepository.delete(personneOptional.get());
		return ResponseEntity.ok().body("Personne supprimé avec succés");
		
	}
	
	
	
	
	
	
	
	
	
}
