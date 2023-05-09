package com.baladeyti.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Gouvernorat {

	@Id
	@GeneratedValue
	@Column(name="id_gouvernorat")
	private int idGouvernorat;
	@Column(name="nom_gouvernorat")
	private String name;
	
	
}
