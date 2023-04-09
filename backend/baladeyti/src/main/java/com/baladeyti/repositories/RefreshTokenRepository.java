package com.baladeyti.repositories;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;

import com.baladeyti.models.Personne;
import com.baladeyti.models.RefreshToken;


public interface RefreshTokenRepository extends JpaRepository<RefreshToken, Integer>{

	public Optional<RefreshToken> findByToken(String token);
	
	@Modifying
	public int deleteByPersonne(Personne personne);
	
	
}
