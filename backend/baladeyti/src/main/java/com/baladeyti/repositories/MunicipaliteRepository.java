package com.baladeyti.repositories;

import java.util.Collection;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.baladeyti.models.Adresse;
import com.baladeyti.models.Municipalite;

public interface MunicipaliteRepository extends JpaRepository<Municipalite, Integer>{

	public Optional<Municipalite> findByNom(String nom);
	public List<Municipalite> findByAdresseIn(Collection<Adresse> adresses);
	
}
