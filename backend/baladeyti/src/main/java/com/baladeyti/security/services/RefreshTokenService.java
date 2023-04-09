package com.baladeyti.security.services;

import java.time.Instant;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baladeyti.exceptions.TokenRefreshException;
import com.baladeyti.models.Personne;
import com.baladeyti.models.RefreshToken;
import com.baladeyti.repositories.PersonneRepository;
import com.baladeyti.repositories.RefreshTokenRepository;

@Service
public class RefreshTokenService {

	@Autowired
	private RefreshTokenRepository refreshTokenRepository;
	
	@Autowired
	private PersonneRepository personneRepository;
	
	private int expirationMS = 10 * 24 * 60 * 60 * 1000;
	
	public Optional<RefreshToken> findByToken(String token){
		return refreshTokenRepository.findByToken(token);
	}
	
	public int deletePersonneById(int personneId) {
		Personne personne;
		personne  = personneRepository.findById(personneId).get();
		return refreshTokenRepository.deleteByPersonne(personne);
	}
	
	public RefreshToken createRefreshToken(int personneId) {
		RefreshToken refreshToken = new RefreshToken();
		refreshToken.setPersonne(personneRepository.findById(personneId).get());
		refreshToken.setToken(UUID.randomUUID().toString());
		refreshToken.setExpiration(Instant.now().plusMillis(expirationMS));
		refreshToken = refreshTokenRepository.save(refreshToken);
		return refreshToken;
	}
	
	
	public RefreshToken verifyExpiration(RefreshToken refreshToken) {
		if(refreshToken.getExpiration().compareTo(Instant.now())<0) {
			throw new TokenRefreshException(refreshToken.getToken(),"Refresh token expired!");
		}
		return refreshToken;
	}
	
	
	
}
