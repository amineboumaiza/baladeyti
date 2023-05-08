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
@AllArgsConstructor
@NoArgsConstructor
public class Guichet {

	
	@Id
	@GeneratedValue
	@Column(name="id_guichet")
	private int id;
	@Column(name="num_guichet")
	private int num;
	
	private int idMunicipalite;
	
}
