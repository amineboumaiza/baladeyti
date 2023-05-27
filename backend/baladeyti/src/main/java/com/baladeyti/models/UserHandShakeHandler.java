package com.baladeyti.models;

import java.security.Principal;
import java.util.Map;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.DefaultHandshakeHandler;

public class UserHandShakeHandler extends DefaultHandshakeHandler {

	@Override
	public Principal determineUser(ServerHttpRequest request, WebSocketHandler wsHandler, Map<String, Object> attributes) {
		
		Principal principal = (Principal) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return principal;
		
		
	}
	
}
