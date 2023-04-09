package com.baladeyti.exceptions;

import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.http.HttpStatus;

@ResponseStatus(HttpStatus.FORBIDDEN)
public class TokenRefreshException extends RuntimeException {


	private static final long serialVersionUID = 1L;

	public TokenRefreshException(String token, String msg) {
		super(String.format("failed for [%s]: %s",token,msg));
	}
	

}
