package com.baladeyti.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.baladeyti.models.Gouvernorat;
import com.baladeyti.services.GouvernoratService;

@CrossOrigin("*")
@RestController
@RequestMapping("/gouvernorat")
public class GouvernoratController {

	
	@Autowired
	private GouvernoratService gouvernoratService;
	
	@GetMapping("/all")
	public ResponseEntity<?> getAllGouv(){
		List<Gouvernorat> gouvs = gouvernoratService.findAll();
		return ResponseEntity.ok().body(gouvs);
		
	}
	
	
	
	
	
}
