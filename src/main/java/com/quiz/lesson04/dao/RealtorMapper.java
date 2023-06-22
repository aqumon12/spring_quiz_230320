package com.quiz.lesson04.dao;

import org.springframework.stereotype.Repository;

import com.quiz.lesson04.domain.Realtor;

@Repository
public interface RealtorMapper {
	
	public void insertRealtor(Realtor realtor);
	
	public Realtor selectRealtorById(int id);
}
