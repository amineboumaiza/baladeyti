package com.baladeyti.controllers;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseCookie;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.baladeyti.models.Personne;
import com.baladeyti.models.RefreshToken;
import com.baladeyti.payload.LoginRequest;
import com.baladeyti.payload.SignupRequest;
import com.baladeyti.repositories.PersonneRepository;
import com.baladeyti.security.jwt.JwtUtils;
import com.baladeyti.security.services.RefreshTokenService;
import com.baladeyti.security.services.UserDetailsImpl;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;



@RestController
@RequestMapping("/api/auth")
public class AuthController {

	@Autowired
	private AuthenticationManager authenticationManager;
	
	@Autowired
	private PersonneRepository personneRepository;
	
	@Autowired
	private PasswordEncoder encoder;
	
	@Autowired
	private JwtUtils jwtUtils;
	
	@Autowired
	private RefreshTokenService refreshTokenService;
	
	
	
	@PostMapping("/hello")
	public ResponseEntity<String> hello(@Valid @RequestBody String request){
		
		System.out.println(request);
		return ResponseEntity.ok().body("Hello World!");
	}
	
	@PostMapping("/signup")
	public ResponseEntity<?> signup(@Valid @RequestBody SignupRequest request){
		String nom = request.getNom();
		String prenom = request.getPrenom();
		String password = request.getPassword();
		int matricule = request.getMatricule();
		String email = request.getEmail();
		Personne personne = new Personne(nom,prenom,matricule,email,encoder.encode(password));
		personneRepository.save(personne);
		
		return ResponseEntity.ok().body("done!");
	}
	
	@PostMapping("/login")
	public ResponseEntity<String> login(@Valid @RequestBody LoginRequest request){
	
		String password = request.getPassword();
		String email = request.getEmail();
		Authentication authentication = authenticationManager.authenticate(
				new UsernamePasswordAuthenticationToken(email, password));
		SecurityContextHolder.getContext().setAuthentication(authentication);
		
		String jwt = jwtUtils.generateJwtToken(authentication);
		
		return ResponseEntity.ok().body(jwt);
		
	}
	
	
	@PostMapping("/cookie/login")
	public ResponseEntity<String> loginCookie(@Valid @RequestBody LoginRequest request){
	
		String password = request.getPassword();
		String email = request.getEmail();
		Authentication authentication = authenticationManager.authenticate(
				new UsernamePasswordAuthenticationToken(email, password));
		SecurityContextHolder.getContext().setAuthentication(authentication);
		ResponseCookie jwt = jwtUtils.generateJwtCookie(authentication);
		UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
		RefreshToken refreshToken = refreshTokenService.createRefreshToken(userDetails.getId());
		ResponseCookie refreshCookie = jwtUtils.generateRefreshTokenCookie(refreshToken.getToken());
		
		
		return ResponseEntity.ok().header(HttpHeaders.SET_COOKIE,jwt.toString()).header(HttpHeaders.SET_COOKIE, refreshCookie.toString()).body(jwt.toString());
	}
	
	@GetMapping("/cookie/logout")
	public ResponseEntity<String> logoutCookie(){
		ResponseCookie cookie = jwtUtils.cleanJwtCookie();
		ResponseCookie RefreshTokencookie = jwtUtils.cleanRefreshCookie();
		return ResponseEntity.ok()
				.header(HttpHeaders.SET_COOKIE, cookie.toString())
				.header(HttpHeaders.SET_COOKIE, RefreshTokencookie.toString())
				.body("logged out successfully!");
	}
	
	@GetMapping("/refreshtoken")
	public ResponseEntity<String> refreshToken(HttpServletRequest http){
		String refreshToken = jwtUtils.getRefreshTokenFromCookie(http);
		if( (refreshToken !=null) && (refreshToken.length()>0) ) {
			
			RefreshToken refreshTokenObject = refreshTokenService.findByToken(refreshToken).get();
			
			refreshTokenObject = refreshTokenService.verifyExpiration(refreshTokenObject);
			Personne personne  = refreshTokenObject.getPersonne();
			ResponseCookie cookie = jwtUtils.generateJwtCookie(personne);
			
			
			System.out.println(refreshTokenObject);
			
			return ResponseEntity.ok().header(HttpHeaders.SET_COOKIE, cookie.toString()).build();
		
		
		}
		return ResponseEntity.badRequest().body("error");
		
	}
	
	
}
