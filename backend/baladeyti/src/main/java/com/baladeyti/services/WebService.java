package com.baladeyti.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.baladeyti.models.Eetat;
import com.baladeyti.models.Personne;
import com.baladeyti.models.Ticket;
import com.baladeyti.payload.requests.Message;
import com.baladeyti.payload.responses.ResponseMessage;
import com.baladeyti.repositories.TicketRepository;

@Service
public class WebService {

	@Autowired
	private SimpMessagingTemplate messagingTemplate;
	
	@Autowired
	private TicketRepository ticketRepository;
	
	
	
	public void notifyFrontEnd(Message msg) {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		ResponseMessage response = new ResponseMessage(msg.getMessageContent());
		messagingTemplate.convertAndSend("/topic/messages",userDetails );
	}
	
}
