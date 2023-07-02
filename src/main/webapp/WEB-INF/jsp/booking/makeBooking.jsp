<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<%-- AJAX를 사용하려면 jquery 원본 필요 --%>
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>
	
	<!-- datepicker -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>    
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
<link rel="stylesheet" type="text/css" href="/css/booking/style.css">
</head>
<body>
	<div id="wrap" class="container">
		<header class="bg-warning d-flex justify-content-center align-items-center">
			<h1>통나무 팬션</h1>
		</header>
		<nav>
			<ul class="nav nav-fill">
				<li class="nav-item"><a href="/booking/search_booking_view" class="nav-link">팬션소개</a></li>
				<li class="nav-item"><a href="#" class="nav-link">객실보기</a></li>
				<li class="nav-item"><a href="/booking/make_booking_view" class="nav-link">예약하기</a></li>
				<li class="nav-item"><a href="/booking/booking_list_view" class="nav-link">예약목록</a></li>
			</ul>
		</nav>
		<section class="contents">
				<h3 class="text-center py-3">예약 하기</h3>
			<div class="d-flex justify-content-center">
				<div class="reservation-box">
					<label>이름</label>
					<input type="text" id="name" class="form-control">
					 
					<label>예약날짜</label>
					<input type="text" id="date" class="form-control">
					
					<label>숙박일수</label>
					<input type="text" id="day" class="form-control">
					
					<label>숙박인원</label>
					<input type="text" id="headcount" class="form-control">
					
					<label>전화번호</label>
					<input type="text" id="phoneNumber" class="form-control">
					
					<button type="button" id="reservationBtn" class="btn btn-warning mt-3 w-100">예약하기</button>
				</div>
			</div>
		</section>
		<footer>
			<div class="footer-text">제주특별자치도 제주시 애월읍</div>
			<div class="footer-text">사업자등록번호:111-22-333333/농어촌민박사업지정/대표:김통목</div>
			<div class="footer-text">Copyright © marondal 2023</div>
		</footer>
	</div>
	
<script>
	$(document).ready(function() {
		$('#date').datepicker({
			dateFormat:"yy-mm-dd" // 날짜 포맷
			, changeYear: true
			, changeMonth: true
		})
		
		$('#reservationBtn').on('click', function() {
			let name = $('#name').val().trim();
			let date = $('#date').val().trim();
			let day = $('#day').val().trim();
			let headcount = $('#headcount').val().trim();
			let phoneNumber = $('#phoneNumber').val().trim();
			
			// validation
			if (name == '') {
				alert('이름을 입력해주세요');
				return;
			}
			if (date == '') {
				alert('예약날짜를 입력해주세요');
				return;
			}
			if (day == '') {
				alert('숙박일수를 입력해주세요');
				return;
			}
			if (headcount == '') {
				alert('숙박인원을 입력해주세요');
				return;
			}
			if (phoneNumber == '') {
				alert('전화번호를 입력해주세요');
				return;
			}
			
			// AJAX
			$.ajax({
				// request
				type:"POST"
				, url:"/booking/add_booking"
				, data:{"name":name, "date":date, "day":day, "headcount":headcount, "phoneNumber":phoneNumber}
				
				// response
				, success:function(data) {
					if (data == "성공") {
						location.href = "/booking/booking_list_view"
					}
				}
				, error:function(request, status, error) {
					alert("시스템 오류");
				}
				
				
			})
		});
	});
</script>	
</body>
</html>