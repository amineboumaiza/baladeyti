package com.baladeyti.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	
	
	
}
