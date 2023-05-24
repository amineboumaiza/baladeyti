package com.baladeyti.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;


import com.baladeyti.models.Service;
import com.baladeyti.repositories.ServiceRepository;


@org.springframework.stereotype.Service
public class ServiceService {

	
	@Autowired
	private ServiceRepository serviceRepository;
	
	public Service findByName(String name) {
		Optional<Service> service = serviceRepository.findByNom(name);
		if(service.isEmpty())
			return null;
		return service.get();
	}

	public Service findById(int idService) {
		Optional<Service> service = serviceRepository.findById(idService);
		if(service.isEmpty())
			return null;
		return service.get();
	}
	public List<Service> findAll(){
		return serviceRepository.findAll();
	}
	
	public Service save(Service service) {
		
		return serviceRepository.save(service);
	}
	
	public void delete(Service service) {
		serviceRepository.delete(service);
	}
	
}
