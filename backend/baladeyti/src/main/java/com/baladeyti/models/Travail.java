package com.baladeyti.models;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
public class Travail {

	@EmbeddedId
	private TravailId id;
	@Temporal(TemporalType.DATE)
	@Column(name="date")
	private Date date;
	
	
}
