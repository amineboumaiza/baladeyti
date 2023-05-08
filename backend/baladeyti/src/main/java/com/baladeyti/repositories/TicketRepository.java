package com.baladeyti.repositories;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.baladeyti.models.Personne;
import com.baladeyti.models.Ticket;
import com.baladeyti.models.TicketId;

public interface TicketRepository extends JpaRepository<Ticket, Integer>{

	@Query(value=" SELECT "
			+ " MAX(CAST( REGEXP_REPLACE(num_ticket, '[^0-9]', '') AS INTEGER)) AS num"
			+ " from Ticket WHERE  Ticket.num_ticket LIKE CONCAT(:nomMunicipalite,'-',:nomService,'-%')",nativeQuery=true)
	public Integer findMaxNum(@Param("nomMunicipalite") String nomMunicipalite,@Param("nomService") String nomService);
	
	public List<Ticket> findByidPersonne(Personne Personne);
	@Query(value="SELECT t FROM Ticket t WHERE t.idPersonne.id = :idPersonne AND Date(t.date) = Date(NOW())")
	public List<Ticket> findByAllByPersonneAndDate(@Param("idPersonne") String idPersonne);
	@Query(value="SELECT t FROM Ticket t WHERE Date(t.date) = Date(NOW())")
	public List<Ticket> findAllToday();
}
