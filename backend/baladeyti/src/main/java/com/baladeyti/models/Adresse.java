package com.baladeyti.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
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
public class Adresse {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id_adress")
	private int id;
	private String rue;
	private String ville;
	@Column(name="code_postale")
	private String codePostale;

	
	
	
}
