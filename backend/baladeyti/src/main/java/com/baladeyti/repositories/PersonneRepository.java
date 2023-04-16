package com.baladeyti.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.baladeyti.models.Personne;

//@Repository
public interface PersonneRepository extends JpaRepository<Personne, Integer>{

	Optional<Personne> findByEmail(String email);
	Boolean existsByEmail(String email);
	List<Personne> findAll();
	void deleteById(int id);
	
	
}
