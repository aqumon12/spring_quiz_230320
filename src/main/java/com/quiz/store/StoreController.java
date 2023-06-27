package com.quiz.store;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StoreController {
	
	@GetMapping("/store_view")
	public String storeView(Model model) {
		
		return "store/store";
	}
}
