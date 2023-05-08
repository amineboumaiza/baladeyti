package com.baladeyti.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.baladeyti.models.Adresse;

public interface AdresseRepository extends JpaRepository<Adresse, Integer>{

	public List<Adresse> findByVille(String ville);
	
	
}
