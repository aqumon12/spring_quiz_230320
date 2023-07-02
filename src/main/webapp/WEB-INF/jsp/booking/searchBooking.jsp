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
		<section class="banner">
			<img id="bannerImage" src="/image/test06_banner1.jpg" alt="banner" width="1110" height="500">
		</section>
		<section class="reserve d-flex">
			<section class="real-time-reserved col-4 d-flex justify-content-center align-items-center">
				<div class="display-4 text-white">
					실시간<br>예약하기
				</div>
			</section>
			<section class="confirm col-4">
				<div class="m-3">
					<span class="reserve-confirm mr-3">예약 확인</span>
				</div>

				<!-- 예약 확인 -->
				<div id="memberInputBox" class="m-2">
					<div class="d-flex justify-content-end mr-3">
						<span class="text-white">이름:</span> 
						<input type="text" id="name" class="form-control input-form">
					</div>
					<div class="d-flex mt-2 justify-content-end mr-3">
						<span class="text-white">전화번호:</span> 
						<input type="text" id="phoneNumber" class="form-control input-form">
					</div>

					<!-- 버튼 -->
					<div class="text-right mt-3 mr-3">
						<button type="button" id="searchBtn" class="btn btn-success submit-btn" data-booking-date="${info.date}"
						data-booking-day="${info.day}" data-booking-headcount="${info.headcount}" data-booking-state="${info.state}">조회하기</button>
					</div>
				</div>
			</section>
			<section class="inquiry col-4 d-flex justify-content-center align-items-center">
				<div class="text-white">
					<h4 class="font-weight-bold">예약문의:</h4>
					<h1>010-<br>0000-1111</h1>
				</div>
			</section>
		</section>
		<footer>
			<div class="footer-text">제주특별자치도 제주시 애월읍</div>
			<div class="footer-text">사업자등록번호:111-22-333333/농어촌민박사업지정/대표:김통목</div>
			<div class="footer-text">Copyright © marondal 2023</div>
		</footer>
	</div>
	
<script>
	$(document).ready(function() {
        let bannerArr = ["/image/test06_banner1.jpg", "/image/test06_banner2.jpg", "/image/test06_banner3.jpg", "/image/test06_banner4.jpg"];
        let currentIndex = 0;
        setInterval(function() {
            currentIndex++; // 0 1 2 3     4
            if (bannerArr.length <= currentIndex) {
                currentIndex = 0;
            }
            $('#bannerImage').attr("src", bannerArr[currentIndex]);
        }, 3000);
        
        $('#searchBtn').on('click', function() {
        	let name = $('#name').val().trim();
        	let phoneNumber = $('#phoneNumber').val().trim();
        	let date = $(this).data('booking-date');
        	let day = $(this).data('booking-day');
        	let headcount = $(this).data('booking-headcount');
        	let state = $(this).data('booking-state');
        	
        	$.ajax({
        		// request
        		type:"post"
        		, url:"/booking/search_booking"
        		, data:{"name":name, "phoneNumber":phoneNumber,"date":date}
        	
        		// response
        		, success:function(data){
        			if (data.code == 1) {
        				alert("이름:" + name
        						+ "\n날짜:" + date
        						+ "\n일수:" + day
        						+ "\n인원:" + headcount
        						+ "\n상태:" + state)
        			} else {
        				alert("예약 내역이 없습니다");
        			}
        			
        			
        		}
        		
        		
        	});
        });
        
	});
</script>

</body>
</html>