package com.baladeyti.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.baladeyti.models.Travail;
import com.baladeyti.models.TravailId;

public interface TravailRepository extends JpaRepository<Travail, TravailId>{

	@Query("SELECT t FROM Travail t WHERE t.id.idPersonne.id = :idEmploye")
	public Travail findByEmploye(@Param("idEmploye") int idEmploye);
	
}
