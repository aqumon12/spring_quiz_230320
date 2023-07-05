package com.quiz.lesson07;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson07.dao.RecruitRepository;
import com.quiz.lesson07.entity.RecruitEntity;

@RequestMapping("/lesson07/quiz02")
@RestController
public class Lesson07Quiz02RestController {
	
	@Autowired
	private RecruitRepository recruitRepository;
	
	@GetMapping("/1")
	public RecruitEntity getRecruitList1(){
		return recruitRepository.findById(8).orElse(null);
	}
	
	@GetMapping("/2")
	public RecruitEntity getRecruitList2(
			@RequestParam("id") int id) {
		return recruitRepository.findById(id).orElse(null);
	}
	
	@GetMapping("/3")
	public List<RecruitEntity> getRecruitList3() {
		return recruitRepository.findByPositionAndType("웹 back-end 개발자", "정규직");
	}
	
	@GetMapping("/4")
	public List<RecruitEntity> getRecruitList4() {
		return recruitRepository.findByTypeOrSalaryGreaterThanEqual("정규직", 9000);
	}
	
	@GetMapping("/5")
	public List<RecruitEntity> getRecruitList5() {
		return recruitRepository.findTop3ByTypeOrderBySalaryDesc("계약직");
	}
	
	@GetMapping("/6")
	public List<RecruitEntity> getRecruitList6() {
		return recruitRepository.findByRegionAndSalaryBetween("성남시 분당구", 7000, 8500);
	}
	@GetMapping("/7")
	public List<RecruitEntity> getRecruitList7() {
		LocalDate date = LocalDate.of(2026, 04, 10);
		return recruitRepository.findList(date, 8100, "정규직");
	}
	
}
