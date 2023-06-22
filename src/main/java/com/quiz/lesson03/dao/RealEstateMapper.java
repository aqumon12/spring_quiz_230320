package com.quiz.lesson03.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson03.domain.RealEstate;

@Repository
public interface RealEstateMapper {

	public RealEstate selectRealEstateById(int id);
	
	public List<RealEstate> selectRealEstateByRentPrice(int rentPrice);
	
	public List<RealEstate> selectRealEstateByAreaAndtPrice(
			@Param("area") int area,
			@Param("price") int price);
	
	public int updateRealEstateById(
			@Param("id") int id,
			@Param("type") String type,
			@Param("price") int price);
	
	public int deleteRealEstateById(int id);
}
