package com.baladeyti.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
public class Municipalite {

	@Id
	@GeneratedValue
	@Column(name="id_municipalite")
	private int id;
	@Column(name="nom_municipalite")
	private String nom;
	
}
