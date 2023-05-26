package com.baladeyti.repositories;

import java.util.Collection;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.baladeyti.models.Eetat;
import com.baladeyti.models.Municipalite;
import com.baladeyti.models.Personne;
import com.baladeyti.models.Service;
import com.baladeyti.models.Ticket;

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

	@Query(value="SELECT * FROM Ticket t "
			+ "WHERE Date(t.date_reservation) = Date(NOW()) "
			+ "AND t.etat = 'en_attente' AND "
			+ "TIME(t.date_reservation) > "
			+ "(SELECT TIME(t2.date_reservation) FROM "
			+ "ticket t2 WHERE t2.id_ticket = :idticket) "
			+ "ORDER BY t.date_reservation"
			,nativeQuery = true)
	List<Ticket> findTicketsEnAttente(@Param("idticket") int idticket);
	
	
	@Query(value="SELECT Count(*) FROM Ticket t "
			+ "WHERE Date(t.date_reservation) = Date(NOW()) "
			+ "AND t.etat = 'en_attente' AND "
			+ "TIME(t.date_reservation) < "
			+ "(SELECT TIME(t2.date_reservation) FROM "
			+ "ticket t2 WHERE t2.id_ticket = :idTicket) "
			,nativeQuery = true)
	int findQueue(@Param("idTicket") int idticket);
	
	@Query(value="SELECT COUNT(*) FROM ticket WHERE id_service = :idService "
			+ "AND id_municipalite = :idMunicipalite "
			+ "AND id_citoyen = :idUser "
			+ "AND etat IN ('en_attente','en_cours') "
			+ "AND DATE(date_reservation) = Date(NOW())",nativeQuery=true)
	public int existsTicketEncours(@Param("idUser") int idUser,@Param("idService") int idService,@Param("idMunicipalite") int idMunicipalite);
	

}
