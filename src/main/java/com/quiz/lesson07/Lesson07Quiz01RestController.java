package com.quiz.lesson07;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson07.bo.CompanyBO;
import com.quiz.lesson07.entity.CompanyEntity;

@RequestMapping("/lesson07/quiz01")
@RestController
public class Lesson07Quiz01RestController {
	
	@Autowired
	private CompanyBO companyBO;
	
	@GetMapping("/save01")
	public CompanyEntity create01() {
		String name = "넥슨";
		String business ="컨텐츠 게임";
		String scale = "대기업";
		int headcount = 3585;
		
		CompanyEntity company = companyBO.addCompany(name, business, scale, headcount);
		return company;
	}
	
	@GetMapping("/save02")
	public CompanyEntity create02() {
		
		return companyBO.addCompany("버블팡", "여신 금융업", "대기업", 6834);
	}
}
