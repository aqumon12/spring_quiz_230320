package com.quiz.booking;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	// AJAX
	
	// 1) AJAX - delete
	@ResponseBody
	@DeleteMapping("/delete_booking")
	public String deleteBooking(
			@RequestParam("id") int id) {
		
		bookingBO.deleteBookingById(id);
		
		return "성공";
	}
	
	
	// 2) AJAX - insert
	@ResponseBody
	@PostMapping("add_booking")
	public String addBooking(
			@RequestParam("name") String name,
			@RequestParam("date") String date,
			@RequestParam("day") int day,
			@RequestParam("headcount") int headcount,
			@RequestParam("phoneNumber") String phoneNumber) {
		bookingBO.addBooking(name, date, day, headcount, phoneNumber);

		return "성공";
	}
	
	// 3) AJAX - select
	@ResponseBody
	@PostMapping("/search_booking")
	public Map<String, Object> searchBooking(Model model,
			@RequestParam("name") String name,
			@RequestParam("phoneNumber") String phoneNumber) {
		Map<String, Object> result = new HashMap<>();
		
		Booking booking = bookingBO.searchBookingByName(name, phoneNumber);
		if (booking != null) {
			result.put("code", 1);
			result.put("result", "성공");
			model.addAttribute("info", booking);
		} else {
			result.put("code", 500);
			result.put("result", "실패");
		}
		return result;
	}
	
	
}
