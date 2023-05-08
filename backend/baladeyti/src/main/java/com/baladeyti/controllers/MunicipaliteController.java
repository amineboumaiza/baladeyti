package com.baladeyti.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.baladeyti.models.Adresse;
import com.baladeyti.models.Municipalite;
import com.baladeyti.repositories.AdresseRepository;
import com.baladeyti.repositories.MunicipaliteRepository;

@RestController
@RequestMapping("/municipalite")
public class MunicipaliteController {

	@Autowired
	private MunicipaliteRepository municipaliteRepository;
	
	@Autowired
	private AdresseRepository adresseRepository;
	
	@GetMapping("/{ville}")
	public ResponseEntity<?> getAllMunicipaliteByVille(@PathVariable String ville){
		
		List<Adresse> adresses = adresseRepository.findByVille(ville);
		System.out.println(adresses);
		List<Municipalite> municipalites = municipaliteRepository.findByAdresseIn(adresses);
		
		return ResponseEntity.ok().body(municipalites);
		
		
		
	}
	
	
}
