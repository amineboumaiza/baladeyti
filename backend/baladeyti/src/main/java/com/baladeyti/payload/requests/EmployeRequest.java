package com.baladeyti.payload.requests;

import com.baladeyti.models.Personne;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class EmployeRequest {

	@NotBlank
	private Personne personne;
	@NotBlank
	private int idService;
	@NotBlank
	private int idMunicipalite;
	
}
