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
	
	public void addBooking(String name, String date, int day, int headcount, String phoneNumber) {
		bookingMapper.insertBooking(name, date, day, headcount, phoneNumber);
	}
	
	public void deleteBookingById(int id) {
		bookingMapper.deleteBookingById(id);
	}
	
	public Booking searchBookingByName(String name, String phoneNumber) {
		return bookingMapper.selectBookingByName(name, phoneNumber);
	}
}
