package com.quiz.lesson02.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson02.dao.StoreMapper;
import com.quiz.lesson02.domain.Store;

@Service // Spring Bean
public class StoreBO {
	
	// field
	@Autowired
	private StoreMapper storeMapper; // spring bean을 주입반는다. DI (의존성 주입)
	
	// method
	// input: X
	// output: storeList => 컨트롤러한테 돌려준다.
	public List<Store> getStoreList() {
		return storeMapper.selectStoreList();
	}
	
}
