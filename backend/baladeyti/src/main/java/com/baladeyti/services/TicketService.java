package com.baladeyti.services;



import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

import com.baladeyti.models.Eetat;
import com.baladeyti.models.Personne;
import com.baladeyti.models.Ticket;
import com.baladeyti.repositories.TicketRepository;

@Service
public class TicketService {

	@Autowired
	private TicketRepository ticketRepository;
	
	@Autowired
	private SimpMessagingTemplate messageTemplate;


		public Integer getMaxNumber(int idMunicipalite,int idService) {
			
			Integer maxNum = ticketRepository.findMaxNum(idMunicipalite, idService);
			
			return maxNum;
			
		}
		
	public Integer getQueue(int idTicket) {
			
			int queue = ticketRepository.findQueue(idTicket) + 1;
			
			return queue;
			
		}
		
		
		public Ticket findById(int id) {
			Optional<Ticket> ticket = ticketRepository.findById(id);
			if(ticket.isEmpty())
				return null;
			else return ticket.get();
		}
		
		public void delete(Ticket ticket) {
			ticketRepository.delete(ticket);
		}
		
		public Ticket save(Ticket ticket) {
			return ticketRepository.save(ticket);
		}
	
		public List<Ticket> findAll(){
			return ticketRepository.findAll();
		}


		public List<Ticket> findAllByUser(Personne personne) {
			
			return ticketRepository.findByidPersonne(personne);
		}


		public List<Ticket> findAllTodayByUser(Personne personne) {
			
			return ticketRepository.findAllByPersonneAndDate(Integer.toString(personne.getId()));

		}


		public List<Ticket> findAllToday() {
			return ticketRepository.findAllToday();
		}


		public List<Ticket> findAllEnCours(Personne personne) {
			return ticketRepository.findByEtatAndIdPersonne(Eetat.en_attente,personne);
		}


		public List<Ticket> findHistoryTickets(Personne personne) {
			return ticketRepository.findByEtatInAndIdPersonne(new ArrayList<Eetat>(List.of(Eetat.annulé,Eetat.traité)),personne);
		}
		
		public void updateTicket(int idTicket) {
			
			List<Ticket> tickets = ticketRepository.findTicketsEnAttente(idTicket);
			tickets.get(0).setEtat(Eetat.en_cours);
			ticketRepository.save(tickets.get(0));
			for(int i=0;i < tickets.size();i++) {
				Ticket t = tickets.get(i);
				Personne user = t.getIdPersonne();
				String msg = String.valueOf(i);
				messageTemplate.convertAndSend("/topic/queue", msg);
				
				
				System.out.println("ticket id: " + t.getId() + "for user :" + user.getId());
				
			}
		
		}

		public boolean existsTicketEncours(int id, int idService, int idMunicipalite) {
			int nb = ticketRepository.existsTicketEncours(id, idService, idMunicipalite);
			if(nb==0)
				return false;
			return true;
		}
	
}
