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
public class Service {

	@Id
	@GeneratedValue
	@Column(name="id_service")
	private int id;
	@Column(name="nom_service")
	private String nom;
	
}

