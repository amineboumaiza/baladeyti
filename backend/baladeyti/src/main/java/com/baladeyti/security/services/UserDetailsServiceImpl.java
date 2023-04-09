package com.baladeyti.security.services;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.baladeyti.models.Personne;
import com.baladeyti.repositories.PersonneRepository;


@Service
public class UserDetailsServiceImpl implements UserDetailsService {

	@Autowired
	PersonneRepository userRepository;
	@Autowired
	@Lazy
	PasswordEncoder encoder;
	
	
	@Override
	@Transactional
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		Personne personne = userRepository.findByEmail(email)
				.orElseThrow(()-> new UsernameNotFoundException("Username not found!"));
		
		UserDetailsImpl user = UserDetailsImpl.build(personne,encoder);
		return user;
		}
}
