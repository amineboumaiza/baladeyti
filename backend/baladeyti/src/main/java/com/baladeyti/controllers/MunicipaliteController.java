package com.baladeyti.controllers;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


import com.baladeyti.models.Gouvernorat;
import com.baladeyti.models.Municipalite;
import com.baladeyti.services.GouvernoratService;
import com.baladeyti.services.MunicipaliteService;

@CrossOrigin("*")
@RestController
@RequestMapping("/municipalite")
public class MunicipaliteController {

	@Autowired
	private MunicipaliteService municipaliteService;
	
	@Autowired
	private GouvernoratService gouvernoratService;
	
	@GetMapping("/gouvernorat/id/{idGouvernorat}")
	public ResponseEntity<?> getAllMunicipaliteByIdGouv(@PathVariable int idGouvernorat){
		
		Gouvernorat gouvernorat = gouvernoratService.findById(idGouvernorat);
		if(gouvernorat == null)
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("gouvernorat not found.");
		List<Municipalite> municipalites = municipaliteService.findByGouvernorat(gouvernorat);
		return ResponseEntity.ok().body(municipalites);
		
	}
	
	@GetMapping("/gouvernorat/name/{gouvName}")
	public ResponseEntity<?> getAllMunicipaliteByNameGouv(@PathVariable String gouvName){
		
		Gouvernorat gouvernorat = gouvernoratService.findByName(gouvName);
		if(gouvernorat == null)
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("gouvernorat name not found!");
		List<Municipalite> municipalites = municipaliteService.findByGouvernorat(gouvernorat);
		return ResponseEntity.ok().body(municipalites);
	}
	
	
	// find municipalite by id
	
	@GetMapping("/{id}")
	public ResponseEntity<?> getMunicipalite(@PathVariable int id){
		
		Municipalite municipalite = municipaliteService.findById(id);
		
		if(municipalite == null)
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Municipalite not found");
		return ResponseEntity.status(HttpStatus.OK).body(municipalite);
		
	}
	
}
