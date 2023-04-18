package com.baladeyti.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.baladeyti.models.ERole;
import com.baladeyti.models.Role;

public interface RoleRepository extends JpaRepository<Role, Integer> {

	Role findByRole(ERole role);
	
}
