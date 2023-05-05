package com.baladeyti.security;

import java.util.Date;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseCookie;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;
import org.springframework.web.util.WebUtils;

import com.baladeyti.models.Personne;
import com.baladeyti.services.UserDetailsImpl;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;


@Component
public class JwtUtils {

	@Value("${jwtSecret}")
	private String JwtSecret;
	
	private String cookieName = "jwt";
	private String refreshTokenName = "refreshToken";
	
	
	private int jwtExpirationMs =  60 * 60 * 1000;//1 hour
	

	
	
	public String generateJwtToken(Authentication authentication) {
		UserDetailsImpl userPrincipals = (UserDetailsImpl) authentication.getPrincipal();
		byte[] secretKey = JwtSecret.getBytes();
		return Jwts.builder()
				.setSubject(userPrincipals.getEmail())
				.setIssuedAt(new Date())
				.setExpiration(new Date((new Date()).getTime() + jwtExpirationMs))
				.signWith(Keys.hmacShaKeyFor(secretKey)).compact();
	}
	
	public String getEmailFromJwtToken(String token) {
		byte[] secretKey = JwtSecret.getBytes();
		return Jwts.parserBuilder()
				.setSigningKey(Keys.hmacShaKeyFor(secretKey))
				.build()
				.parseClaimsJws(token)
				.getBody()
				.getSubject();
	}
	
	public boolean validateJwtToken(String token) {
		try {
			byte[] secretKey = JwtSecret.getBytes();
			 Jwts.parserBuilder().setSigningKey(Keys.hmacShaKeyFor(secretKey)).build().parseClaimsJws(token);
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
	//generate token from cookie
	public String getJwtFromCookie(HttpServletRequest http) {
		Cookie cookie = WebUtils.getCookie(http, cookieName);
		if(cookie !=null)
			return cookie.getValue();
		return null;
	}
	
	public String getRefreshTokenFromCookie(HttpServletRequest http) {
		Cookie cookie = WebUtils.getCookie(http, refreshTokenName);
		if(cookie !=null)
		return cookie.getValue();
		return null;
	}
	
	
	
	public ResponseCookie generateJwtCookie(Authentication authentication) {
		UserDetailsImpl userPrincipals = (UserDetailsImpl) authentication.getPrincipal();
		byte[] secretKey = JwtSecret.getBytes();
		String token = Jwts.builder()
				.setSubject(userPrincipals.getUsername())
				.setIssuedAt(new Date())
				.setExpiration(new Date((new Date()).getTime() + jwtExpirationMs))
				.signWith(Keys.hmacShaKeyFor(secretKey)).compact();
				ResponseCookie resp = ResponseCookie.from(cookieName,token).path("/").httpOnly(true).build();
				return resp;
	}
	
	public ResponseCookie generateJwtCookie(Personne personne) {
		byte[] secretKey = JwtSecret.getBytes();
		String token = Jwts.builder()
				.setSubject(personne.getEmail())
				.setIssuedAt(new Date())
				.setExpiration(new Date((new Date()).getTime() + jwtExpirationMs))
				.signWith(Keys.hmacShaKeyFor(secretKey)).compact();
				ResponseCookie resp = ResponseCookie.from(cookieName,token).path("/").httpOnly(true).build();
				return resp;
	}
	
	
	
	
	
	
	
	public ResponseCookie generateRefreshTokenCookie(String token){
		ResponseCookie cookie = ResponseCookie.from(refreshTokenName,token).path("/").maxAge(10 * 24 * 60 * 60 * 1000).httpOnly(true).build();
		return cookie;
	}
	
	
	
	public ResponseCookie cleanJwtCookie() {
		return ResponseCookie.from(cookieName,null).path("/").httpOnly(true).build();
	}
	
	public ResponseCookie cleanRefreshCookie() {
		return ResponseCookie.from(cookieName,null).path("/").build();
	}
	
	
	
}
