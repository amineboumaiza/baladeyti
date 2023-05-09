package com.baladeyti.models;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Ticket {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id_ticket")
	private int id;
	@Column(name="num_ticket")
	private String num;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="date_reservation")
	private Date date;
	@Enumerated(EnumType.STRING)
	private Eetat etat;
	
	@ManyToOne
	@JoinColumn(name="id_service")
	private Service idService;
	@ManyToOne
	@JoinColumn(name="id_municipalite")
	private Municipalite idMunicipalite;
	@ManyToOne
	@JoinColumn(name="id_citoyen")
	private Personne idPersonne;
	public Ticket(String num, Date date, Eetat etat, Service idService, Municipalite idMunicipalite,
			Personne idPersonne) {
		super();
		this.num = num;
		this.date = date;
		this.etat = etat;
		this.idService = idService;
		this.idMunicipalite = idMunicipalite;
		this.idPersonne = idPersonne;
	}
	
	
	
}
