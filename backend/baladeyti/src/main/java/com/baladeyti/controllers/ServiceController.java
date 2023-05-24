package com.baladeyti.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.baladeyti.models.Service;
import com.baladeyti.services.ServiceService;

@CrossOrigin("*")
@Controller
@RequestMapping("/service")
public class ServiceController {

	@Autowired
	private ServiceService serviceService;
	
	@GetMapping("/all")
	public ResponseEntity<?> getAllServices(){
		
		List<Service> services = serviceService.findAll();
		return ResponseEntity.ok().body(services);
		
	}
	
	
	@PostMapping("/create")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<?> createService(@RequestBody Service serviceRequest){
		String nom = serviceRequest.getNom();
		if(nom == null)
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("name field required");
		Service service = new Service();
		service.setNom(nom);
		service = serviceService.save(service);
		return ResponseEntity.status(HttpStatus.OK).body(service);
		
		
	}
	
	
	
	
	
	@GetMapping("/id/{id}")
	public ResponseEntity<?> getServiceById(@PathVariable int id){
		
		Service service = serviceService.findById(id);
		if(service == null)
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("service not found.");
		return ResponseEntity.ok().body(service);
	}
	
	
	@GetMapping("/name/{name}")
	public ResponseEntity<?> getServiceByName(@PathVariable String name){
		
		Service service = serviceService.findByName(name);
		if(service == null)
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("service not found.");
		return ResponseEntity.ok().body(service);
	}
	
	@PutMapping("/update/{id}")
	public ResponseEntity<?> updateService(@PathVariable int id,@RequestBody Service serviceRequest){
		String nom = serviceRequest.getNom();
		Service service = serviceService.findById(id);
		if(service == null)
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Service not found.");
		if(nom == null)
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Missing serviceName field");
		service.setNom(nom);
		try {			
			serviceService.save(service);
			return ResponseEntity.ok().body(service);
		}catch(Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Something is wrong");
		}
		
	}
	
	@DeleteMapping("/delete/{id}")
	public ResponseEntity<?> deleteService(@PathVariable int id){
		
		Service service = serviceService.findById(id);
		
		if(service == null)
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Service not found.");
		serviceService.delete(service);
		return ResponseEntity.ok().body("service supprimé avec succés");
	}
	
	
	
	
	
	
	
}
