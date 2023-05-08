package com.baladeyti.repositories;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.baladeyti.models.Municipalite;

public interface MunicipaliteRepository extends JpaRepository<Municipalite, Integer>{

	public Optional<Municipalite> findByNom(String nom);
	
}
