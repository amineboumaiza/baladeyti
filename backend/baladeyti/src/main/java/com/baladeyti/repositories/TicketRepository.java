package com.baladeyti.repositories;

import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.baladeyti.models.Eetat;
import com.baladeyti.models.Personne;
import com.baladeyti.models.Ticket;
import com.baladeyti.models.TicketId;

public interface TicketRepository extends JpaRepository<Ticket, Integer>{

	@Query(value=" SELECT "
			+ " MAX(CAST( SUBSTRING_INDEX(num_ticket, '-', -1) AS INTEGER)) AS num"
			+ " from Ticket WHERE  Ticket.num_ticket LIKE CONCAT(:idMunicipalite,'-',:idService,'-%')",nativeQuery=true)
	public Integer findMaxNum(@Param("idMunicipalite") int idMunicipalite,@Param("idService") int idService);
	
	public List<Ticket> findByidPersonne(Personne Personne);
	@Query(value="SELECT t FROM Ticket t WHERE t.idPersonne.id = :idPersonne AND Date(t.date) = Date(NOW())")
	public List<Ticket> findAllByPersonneAndDate(@Param("idPersonne") String idPersonne);
	@Query(value="SELECT t FROM Ticket t WHERE Date(t.date) = Date(NOW())")
	public List<Ticket> findAllToday();

	public List<Ticket> findByEtatAndIdPersonne(Eetat etat,Personne personne);
	
	  List<Ticket> findByEtatInAndIdPersonne(Collection<Eetat> etats,Personne personne);
}
