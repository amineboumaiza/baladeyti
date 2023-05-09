package com.baladeyti.services;


import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baladeyti.models.Gouvernorat;
import com.baladeyti.repositories.GouvernoratRepository;

@Service
public class GouvernoratService {

	@Autowired
	private GouvernoratRepository gouvernoratRepository;
	
	
	public Gouvernorat findById(int id) {
		
		Optional<Gouvernorat> gouvernorat = gouvernoratRepository.findById(id);
		if(gouvernorat.isEmpty())
			return null;
		return gouvernorat.get();
		
	}
	
	
}
