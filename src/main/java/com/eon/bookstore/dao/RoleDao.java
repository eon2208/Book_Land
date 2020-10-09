package com.eon.bookstore.dao;

import com.eon.bookstore.entity.Role;

public interface RoleDao {

	Role findRoleByName(String theRoleName);
	
}
