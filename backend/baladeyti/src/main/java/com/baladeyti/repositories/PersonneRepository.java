package com.baladeyti.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.baladeyti.models.ERole;
import com.baladeyti.models.Personne;

//@Repository
public interface PersonneRepository extends JpaRepository<Personne, Integer>{

	Optional<Personne> findByEmail(String email);
	List<Personne> findByRole(ERole role);
	Boolean existsByEmail(String email);
	List<Personne> findAll();
	void deleteById(int id);
	
	
}
