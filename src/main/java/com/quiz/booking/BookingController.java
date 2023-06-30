package com.quiz.booking;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.booking.bo.BookingBO;
import com.quiz.booking.domain.Booking;

@RequestMapping("/booking")
@Controller
public class BookingController {
	
	@Autowired
	private BookingBO bookingBO;
	
	// 1) 예약 목록 보기
	@GetMapping("/booking_list_view")
	public String bookingListView(Model model) {
		List<Booking> reservations = new ArrayList<>();
		reservations = bookingBO.getBooking();
		model.addAttribute("reservations", reservations);
		
		return "booking/bookingList";
	}
	// 2) 예약하기 화면
	@GetMapping("/make_booking_view")
	public String makeBookingView() {
		return "booking/makeBooking";
	}
	// 3) 예약조회 화면
	@GetMapping("/search_booking_view")
	public String searchBookingView() {
		return "booking/searchBooking";
	}
}
