package com.quiz.booking.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.booking.domain.Booking;

@Repository
public interface BookingMapper {
	
	public List<Booking> selectBooking();
	
	public void insertBooking(
			@Param("name") String name,
			@Param("date") String date,
			@Param("day") int day,
			@Param("headcount") int headcount,
			@Param("phoneNumber") String phoneNumber);
	
	public void deleteBookingById(int id);
	
	public Booking selectBookingByName(
			@Param("name") String name,
			@Param("phoneNumber") String phoneNumber);
}

