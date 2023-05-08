package com.baladeyti.models;

import java.io.Serializable;

import jakarta.persistence.Embeddable;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Embeddable
@Data
@AllArgsConstructor
@NoArgsConstructor
public class TicketId implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@ManyToOne
	@JoinColumn(name="id_service")
	private Service idService;
	@ManyToOne
	@JoinColumn(name="id_municipalite")
	private Municipalite idMunicipalite;
	@ManyToOne
	@JoinColumn(name="id_citoyen")
	private Personne idPersonne;
	
}
