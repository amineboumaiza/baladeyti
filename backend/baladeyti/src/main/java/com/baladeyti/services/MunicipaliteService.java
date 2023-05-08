package com.baladeyti.services;


import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baladeyti.models.Municipalite;
import com.baladeyti.repositories.MunicipaliteRepository;

@Service
public class MunicipaliteService {

	
	@Autowired
	private MunicipaliteRepository municipaliteRepository;
	
	public Municipalite findByName(String name) {
		Optional<Municipalite> municipalite = municipaliteRepository.findByNom(name);
		if(municipalite.isEmpty())
			return null;
		return municipalite.get();
	}
	
	
}
