package com.baladeyti.models;

import java.util.Date;

import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
public class Ticket {

	@EmbeddedId
	private Ticketid id;
	private int num;
	@Temporal(TemporalType.DATE)
	private Date date;
	
	
	
	
}
