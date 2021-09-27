package com.nagarro.javafreshertraining.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.nagarro.javafreshertraining.dao.EmployeeManagementDao;
import com.nagarro.javafreshertraining.model.User;

@Component
public class EmployeeManagementService {
	@Autowired
	EmployeeManagementDao repo;

	public User findById(User user) {
		return repo.findById(user.getUserID()).orElse(null);
	}

	public List<User> findByUserIDAndPassword(User user) {
		return repo.findByUserIDAndPassword(user.getUserID(), user.getPassword());
	}
}
