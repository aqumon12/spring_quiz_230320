package com.quiz.booking.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.booking.dao.BookingMapper;
import com.quiz.booking.domain.Booking;

@Service
public class BookingBO {
	
	@Autowired
	private BookingMapper bookingMapper;
	
	public List<Booking> getBooking() {
		return bookingMapper.selectBooking();
	};
}
