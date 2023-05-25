package com.baladeyti.payload.requests;



import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TicketRequest {

	public int getIdMunicipalite() {
		return idMunicipalite;
	}
	public void setIdMunicipalite(int idMunicipalite) {
		this.idMunicipalite = idMunicipalite;
	}
	public int getIdService() {
		return idService;
	}
	public void setIdService(int idService) {
		this.idService = idService;
	}
	private int idMunicipalite;
	private int idService;
	
}
