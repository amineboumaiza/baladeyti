package com.baladeyti.repositories;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.baladeyti.models.Gouvernorat;

public interface GouvernoratRepository extends JpaRepository<Gouvernorat, Integer> {

	public Optional<Gouvernorat> findByName(String name);
	
	
	
}
