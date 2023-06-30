package com.quiz.booking.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.quiz.booking.domain.Booking;

@Repository
public interface BookingMapper {
	
	public List<Booking> selectBooking();
}
