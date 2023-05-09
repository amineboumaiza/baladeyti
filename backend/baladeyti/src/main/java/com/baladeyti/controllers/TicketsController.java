package com.baladeyti.controllers;

import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.baladeyti.models.Eetat;
import com.baladeyti.models.Municipalite;
import com.baladeyti.models.Personne;
import com.baladeyti.models.Service;
import com.baladeyti.models.Ticket;
import com.baladeyti.payload.requests.TicketRequest;
import com.baladeyti.payload.responses.TicketResponse;
import com.baladeyti.repositories.PersonneRepository;
import com.baladeyti.services.MunicipaliteService;
import com.baladeyti.services.ServiceService;
import com.baladeyti.services.TicketService;
import com.baladeyti.services.UserDetailsImpl;


@CrossOrigin("*")
@RestController
@RequestMapping("/tickets")
public class TicketsController {

	@Autowired
	private ServiceService serviceService;
	@Autowired
	private MunicipaliteService municipaliteService;
	@Autowired
	private TicketService ticketService;
	
	@Autowired
	private PersonneRepository personneRepository;
	
	@PostMapping("/reserve")
	public ResponseEntity<?> reserveTicket(@RequestBody TicketRequest ticketRequest){
		
		UserDetailsImpl userDetails = (UserDetailsImpl) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		int idService = ticketRequest.getIdService();
		int idMunicipalite = ticketRequest.getIdMunicipalite();
		
		Municipalite municipalite = municipaliteService.findById(idMunicipalite);
		Service service = serviceService.findById(idService);
		
		Integer maxNumTicket = ticketService.getMaxNumber(municipalite.getId(), service.getId());
		if(maxNumTicket == null)
			maxNumTicket = 1;
		else
			maxNumTicket++;
		
		int idPersonne = userDetails.getId();
		Personne personne = personneRepository.findById(idPersonne).get();
		Date date = new Date();
		String numTicket = municipalite.getId() + "-" + service.getId() + "-" + maxNumTicket ;


		Ticket ticket = new Ticket(numTicket,date,Eetat.en_attente,service,municipalite,personne);
		Ticket savedTicket = ticketService.save(ticket);
		
		return ResponseEntity.ok().body(savedTicket);
	}
	
	
	@PutMapping("/update/annuler/{id}")
	public ResponseEntity<?> annulerTicket(@PathVariable int id){
		
		Ticket ticket = ticketService.findById(id);
		if(ticket == null)
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("ticket not found.");
		ticket.setEtat(Eetat.annulé);
		ticketService.save(ticket);
		return ResponseEntity.status(HttpStatus.OK).body(new TicketResponse(ticket.getNum(),ticket.getIdMunicipalite().getNom(),ticket.getIdService().getNom(),ticket.getIdPersonne().getNom(),ticket.getDate(),ticket.getEtat()));
		
	}
	
	@PutMapping("/update/enCours/{id}")
	public ResponseEntity<?> enCoursTicket(@PathVariable int id){
		
		Ticket ticket = ticketService.findById(id);
		if(ticket == null)
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("ticket not found.");
		ticket.setEtat(Eetat.en_cours);
		return ResponseEntity.status(HttpStatus.OK)
				.body(new TicketResponse(ticket.getNum()
				,ticket.getIdMunicipalite().getNom()
				,ticket.getIdService().getNom()
				,ticket.getIdPersonne().getNom()
				,ticket.getDate(),ticket.getEtat()));
		
	}
	
	
	
	@DeleteMapping("/delete/{id}")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<?> deleteTicket(@PathVariable int id){
		Ticket ticket = ticketService.findById(id);
		if(ticket == null)
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("ticket not found.");
		ticketService.delete(ticket);
		return ResponseEntity.status(HttpStatus.OK).body("ticket deleted successfully");
	
		
	}
	
	
	@GetMapping("/all")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<?> getAllTickets(){
		
		List<Ticket> tickets = ticketService.findAll();
		
		List<TicketResponse> ticketsResponse = tickets.stream()
				.map(ticket -> new TicketResponse(ticket.getNum(),
									ticket.getIdMunicipalite().getNom(),
									ticket.getIdService().getNom(),
									ticket.getIdPersonne().getNom(),
									ticket.getDate(),
									ticket.getEtat()
						)).collect(Collectors.toList());
		
		return ResponseEntity.ok().body(ticketsResponse);
		
	}
	
	@GetMapping("/{id}")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<?> getAllTicketsByUser(@PathVariable int id){
		
		Optional<Personne> optionPersonne = personneRepository.findById(id);
		if(optionPersonne.isEmpty())
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("user not found.");
		
		Personne personne = optionPersonne.get();
		
		List<Ticket> tickets = ticketService.findAllByUser(personne);
		
		List<TicketResponse> ticketsResponse = tickets.stream()
				.map(ticket -> new TicketResponse(ticket.getNum(),
									ticket.getIdMunicipalite().getNom(),
									ticket.getIdService().getNom(),
									ticket.getIdPersonne().getNom(),
									ticket.getDate(),
									ticket.getEtat()
						)).collect(Collectors.toList());
		
		return ResponseEntity.ok().body(ticketsResponse);
		
	}
	
	@GetMapping("/")
	public ResponseEntity<?> getAllTicketsByLoggedUser(){
		
		UserDetailsImpl userDetails = (UserDetailsImpl) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Personne personne  = personneRepository.findById(userDetails.getId()).get();
		List<Ticket> tickets = ticketService.findAllByUser(personne);
		
		List<TicketResponse> ticketsResponse = tickets.stream()
				.map(ticket -> new TicketResponse(ticket.getNum(),
									ticket.getIdMunicipalite().getNom(),
									ticket.getIdService().getNom(),
									ticket.getIdPersonne().getNom(),
									ticket.getDate(),
									ticket.getEtat()
						)).collect(Collectors.toList());
		
		return ResponseEntity.ok().body(ticketsResponse);
		
	}
	
	
	@GetMapping("/today")
	public ResponseEntity<?> getTodayTicketsByLoggedUser(){
		
		UserDetailsImpl userDetails = (UserDetailsImpl) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Personne personne  = personneRepository.findById(userDetails.getId()).get();
		List<Ticket> tickets = ticketService.findAllTodayByUser(personne);
		List<TicketResponse> ticketsResponse = tickets.stream()
				.map(ticket -> new TicketResponse(ticket.getNum(),
									ticket.getIdMunicipalite().getNom(),
									ticket.getIdService().getNom(),
									ticket.getIdPersonne().getNom(),
									ticket.getDate(),
									ticket.getEtat()
						)).collect(Collectors.toList());
		return ResponseEntity.ok().body(ticketsResponse);
		
	}
	
	
	
	@GetMapping("/all/today")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<?> getTodayTickets(){
		
		List<Ticket> tickets = ticketService.findAllToday();
		List<TicketResponse> ticketsResponse = tickets.stream()
				.map(ticket -> new TicketResponse(ticket.getNum(),
									ticket.getIdMunicipalite().getNom(),
									ticket.getIdService().getNom(),
									ticket.getIdPersonne().getNom(),
									ticket.getDate(),
									ticket.getEtat()
						)).collect(Collectors.toList());
		return ResponseEntity.ok().body(ticketsResponse);
		
	}
	
	
	
	@GetMapping("/enCours")
	public ResponseEntity<?> getEnCoursTickets(){
		
		UserDetailsImpl userDetails = (UserDetailsImpl) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Personne personne  = personneRepository.findById(userDetails.getId()).get();
		
		List<Ticket> tickets = ticketService.findAllEnCours(personne);
		
		return ResponseEntity.ok().body(tickets);
		
	}
	
	@GetMapping("/history")
	public ResponseEntity<?> getHistoryTickets(){
		
		UserDetailsImpl userDetails = (UserDetailsImpl) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Personne personne  = personneRepository.findById(userDetails.getId()).get();
		
		List<Ticket> tickets = ticketService.findHistoryTickets(personne);
		
		return ResponseEntity.ok().body(tickets);
		
	}
	
	
	
}
