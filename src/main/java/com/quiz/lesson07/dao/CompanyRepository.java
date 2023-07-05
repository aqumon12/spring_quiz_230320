package com.quiz.lesson07.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.quiz.lesson07.entity.CompanyEntity;

@Repository
public interface CompanyRepository extends JpaRepository<CompanyEntity, Integer> {
	// Spring data JPA
	
	// save(객체)
	
	// findById(id)
	
	// delete(객체)
}
