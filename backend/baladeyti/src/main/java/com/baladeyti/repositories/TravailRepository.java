package com.baladeyti.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.baladeyti.models.Travail;
import com.baladeyti.models.TravailId;

public interface TravailRepository extends JpaRepository<Travail, TravailId>{

	
	
}
