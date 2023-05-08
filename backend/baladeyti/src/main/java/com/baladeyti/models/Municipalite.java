package com.baladeyti.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Municipalite {

	@Id
	@GeneratedValue
	@Column(name="id_municipalite")
	private int id;
	@Column(name="nom_municipalite")
	private String nom;
	//@OneToOne(mappedBy="municipalite")
	//private Adresse adresse;
	
	@OneToOne
	@JoinColumn(name="id_adresse")
	private Adresse adresse;
	
	
}
