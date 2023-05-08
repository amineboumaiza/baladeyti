package com.baladeyti.payload.responses;

import java.util.Date;

import com.baladeyti.models.Eetat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TicketResponse {

	private String numTicket;
	private String nomMunicipalite;
	private String nomService;
	private String nomPersonne;
	private Date date;
	private Eetat etat;
	
}
