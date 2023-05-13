package com.baladeyti.controllers;




import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseCookie;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.baladeyti.exceptions.TokenRefreshException;
import com.baladeyti.models.ERole;
import com.baladeyti.models.Personne;
import com.baladeyti.models.RefreshToken;
import com.baladeyti.payload.requests.LoginRequest;
import com.baladeyti.payload.requests.SignupRequest;
import com.baladeyti.payload.responses.LoginResponse;
import com.baladeyti.payload.responses.SignupResponse;
import com.baladeyti.repositories.PersonneRepository;
import com.baladeyti.services.RefreshTokenService;
import com.baladeyti.services.UserDetailsImpl;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import com.baladeyti.security.JwtUtils;


@CrossOrigin("*")
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
	
	

	@PostMapping("/signup/client")
	public ResponseEntity<?> signupClient(@Valid @RequestBody SignupRequest request){
		String nom = request.getNom();
		String prenom = request.getPrenom();
		String password = request.getPassword();
		String email = request.getEmail();
		
		if(personneRepository.findByEmail(email).isPresent())
			return ResponseEntity.badRequest().body("error: Email already exists");
		
			Personne personne = new Personne(nom,prenom,email,encoder.encode(password));
	
			
			personne.setRole(ERole.ROLE_CLIENT);
		
		try {
			personneRepository.save(personne);			
		}catch(Exception e) {
			e.printStackTrace();
			return ResponseEntity.internalServerError().body("error : We could not sign you up. Please try again!");
		}
		
		
		return ResponseEntity.ok().body(new SignupResponse(personne.getId()
															,personne.getNom()
															,personne.getPrenom()
															,personne.getEmail()
															,personne.getRole()));
	}
	
	
	@PostMapping("/signup/employe")
	public ResponseEntity<?> signupEmploye(@Valid @RequestBody SignupRequest request){
		String nom = request.getNom();
		String prenom = request.getPrenom();
		String password = request.getPassword();
		String email = request.getEmail();
		
		if(personneRepository.findByEmail(email).isPresent())
			return ResponseEntity.badRequest().body("error: Email already exists");
		
			Personne personne = new Personne(nom,prenom,email,encoder.encode(password));
	
			personne.setRole(ERole.ROLE_EMPLOYE);
		
		try {
			personneRepository.save(personne);			
		}catch(Exception e) {
			e.printStackTrace();
			return ResponseEntity.internalServerError().body("error : We could not sign you up. Please try again!");
		}
		
		
		return ResponseEntity.ok().body(new SignupResponse(personne.getId()
														
															,personne.getNom()
															,personne.getPrenom()
															,personne.getEmail()
															,personne.getRole()));
	}
	
	
	
	
	
	
	
	
	
	@PostMapping("/signup")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<?> signup(@Valid @RequestBody SignupRequest request){
		String nom = request.getNom();
		String prenom = request.getPrenom();
		String password = request.getPassword();
		String email = request.getEmail();
		String roleReq = request.getRole();
		ERole role = ERole.ROLE_CLIENT;
		
		if(personneRepository.findByEmail(email).isPresent())
			return ResponseEntity.badRequest().body("error: Email already exists");
		
		
		
		Personne personne = new Personne(nom,prenom,email,encoder.encode(password));
		
		
		
		
		
		if(roleReq != null) {
					
					switch(roleReq) {
						case "admin": 
							role = ERole.ROLE_ADMIN;
						break;
						case "employe":
							role = ERole.ROLE_EMPLOYE;
						break;
						default:
							role = ERole.ROLE_CLIENT;
						}
					}

		personne.setRole(role);
		
		try {
			personneRepository.save(personne);			
		}catch(Exception e) {
			e.printStackTrace();
			return ResponseEntity.internalServerError().body("error : We could not sign you up. Please try again!");
		}
		
		
		return ResponseEntity.ok().body(new SignupResponse(personne.getId()
												
															,personne.getNom()
															,personne.getPrenom()
															,personne.getEmail()
															,personne.getRole()));
	}
	
	
	
	
	
	
	
	
	
	@PostMapping("/login")
	public ResponseEntity<?> loginCookie(@Valid @RequestBody LoginRequest request){
	
		String password = request.getPassword();
		String email = request.getEmail();
		Authentication authentication = null;
		try {
					authentication = authenticationManager.authenticate(
					new UsernamePasswordAuthenticationToken(email, password));
		}catch(AuthenticationException exception) {
			return ResponseEntity.badRequest().body("error: The given email and password fields do not match!");
		}
	
		SecurityContextHolder.getContext().setAuthentication(authentication);
		
		
		String jwt = jwtUtils.generateJwtToken(authentication);
		UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
		
		
		/*RefreshToken refreshToken = refreshTokenService.createRefreshToken(userDetails.getId());
		ResponseCookie refreshCookie = jwtUtils.generateRefreshTokenCookie(refreshToken.getToken());
		*/
		List<String> roles = userDetails.getAuthorities().stream()
		        .map(item -> item.getAuthority())
		        .collect(Collectors.toList());
		String role = roles.get(0);

		return ResponseEntity.ok().body(new LoginResponse(userDetails.getId(), userDetails.getNom(), userDetails.getPrenom(), userDetails.getEmail(), jwt,null,role));
	}
	
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/logout")
	public ResponseEntity<String> logoutCookie(){
		
		try {
			ResponseCookie cookie = jwtUtils.cleanJwtCookie();
			ResponseCookie RefreshTokencookie = jwtUtils.cleanRefreshCookie();
			return ResponseEntity.ok()
					.header(HttpHeaders.SET_COOKIE, cookie.toString())
					.header(HttpHeaders.SET_COOKIE, RefreshTokencookie.toString())
					.body("logged out successfully!");
		}catch(Exception exception) {
			return ResponseEntity.badRequest().body("error: Could not log you out something wrong happened!");
		}
	}
	
	@GetMapping("/refreshtoken")
	public ResponseEntity<String> refreshToken(HttpServletRequest http){
		String refreshToken = jwtUtils.getRefreshTokenFromCookie(http);
		if( (refreshToken !=null) && (refreshToken.length()>0) ) {
			
			RefreshToken refreshTokenObject = refreshTokenService.findByToken(refreshToken).get();
			try {
				refreshTokenObject = refreshTokenService.verifyExpiration(refreshTokenObject);
				Personne personne  = refreshTokenObject.getPersonne();
				ResponseCookie cookie = jwtUtils.generateJwtCookie(personne);
				
				return ResponseEntity.ok().header(HttpHeaders.SET_COOKIE, cookie.toString()).build();
			
			}catch(TokenRefreshException exception) {
				return ResponseEntity.badRequest().body("error: The refresh token you provided isn't correct!");
			}
			
		}
		return ResponseEntity.badRequest().body("error: the refresh token is either null or empty");
		
	}
	
	
}
