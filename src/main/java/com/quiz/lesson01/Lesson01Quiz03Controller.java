package com.quiz.lesson01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Lesson01Quiz03Controller {
	
	// http://localhost:8080/lesson01/quiz01/1
	@RequestMapping("/lesson01/quiz03/1")
	public String quiz03_1() {
		// @ResponseBody가 아닌 @Controller 상태로 String을 리턴하면 
		// ViewResolver 클래스에 의해 리턴된 String의 view(jsp) 경로를 찾아 수행한다.
		return "lesson01/quiz03";
	}
}
