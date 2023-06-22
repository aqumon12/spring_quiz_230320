package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson04.bo.RealtorBO;
import com.quiz.lesson04.domain.Realtor;

@RequestMapping("/lesson04/quiz02")
@Controller
public class Lesson04quiz02Controller {
	
	@Autowired
	private RealtorBO realtorBO;
	
	@RequestMapping("/add_realtor_view")
	public String addRealtorView() {
		return "lesson04/addRealtor";
	}
	
	@RequestMapping("add_realtor")
	public String addRealtor(
			@ModelAttribute Realtor realtor,
			Model model) {
		// insert db
		realtorBO.addRealtor(realtor);
		
		// select db
		Realtor latestRealtor = realtorBO.getRealtorById(realtor.getId());;
		model.addAttribute("result", latestRealtor);
		return "lesson04/afterAddRealtor";
	}
}
