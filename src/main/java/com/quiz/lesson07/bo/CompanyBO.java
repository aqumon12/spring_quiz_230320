package com.quiz.lesson07.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson07.dao.CompanyRepository;
import com.quiz.lesson07.entity.CompanyEntity;

@Service
public class CompanyBO {
	
	@Autowired
	private CompanyRepository companyRepository;
	
	public CompanyEntity addCompany(String name, String business, String scale, int headcount) {
		CompanyEntity company = companyRepository.save(
					CompanyEntity.builder()
					.name(name)
					.business(business)
					.scale(scale)
					.headcount(headcount)
					.build()
		);
		return company;
	}
}
