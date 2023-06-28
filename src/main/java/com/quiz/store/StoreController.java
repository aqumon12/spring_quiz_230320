package com.quiz.store;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.quiz.lesson02.bo.StoreBO;
import com.quiz.lesson02.domain.Store;

@Controller
public class StoreController {
	
	@Autowired
	private StoreBO storeBO;
	
	@GetMapping("/store_view")
	public String storeView(Model model) {
		List<Store> list = storeBO.getStoreList();
		model.addAttribute("list", list);
		return "store/store";
	}
}
