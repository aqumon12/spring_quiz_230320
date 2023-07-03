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
		<section class="contents">
			<div class="text-center">
				<h3 class="py-3">예약 목록 보기</h3>
				<table class="table">
					<thead>
						<tr>
							<th>이름</th>
							<th>예약날짜</th>
							<th>숙박일수</th>
							<th>숙박인원</th>
							<th>전화번호</th>
							<th>예약상태</th>
							<th> </th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${reservations}" var="reservation">
							<tr>
								<td>${reservation.name}</td>
								<td>
									<fmt:formatDate value="${reservation.date}" pattern="yyyy년 M월 d일" /> 
								</td>
								<td>${reservation.day}</td>
								<td>${reservation.headcount}</td>
								<td>${reservation.phoneNumber}</td>
								<c:choose>
									<c:when test="${reservation.state eq '대기중'}">
										<td class="text-info">${reservation.state}</td>
									</c:when>								
									<c:when test="${reservation.state eq '확정'}">
										<td class="text-success">${reservation.state}</td>
									</c:when>
									<c:otherwise>
										<td class="text-danger">${reservation.state}</td>
									</c:otherwise>								
								</c:choose>
								<td><button type="button" class="del-btn btn btn-danger" data-booking-id="${reservation.id}">삭제</button></td>
							</tr>
						</c:forEach>
					</tbody>			
				</table>
			</div>
		</section>
		<footer>
			<div class="footer-text">제주특별자치도 제주시 애월읍</div>
			<div class="footer-text">사업자등록번호:111-22-333333/농어촌민박사업지정/대표:김통목</div>
			<div class="footer-text">Copyright © marondal 2023</div>
		</footer>
	
	</div>
</body>
<script>
	$(document).ready(function() {
		$('.del-btn').on('click', function() {
			let id = $(this).data('booking-id');
			
			$.ajax({
				// request
				type:"delete"
				, url:"/booking/delete_booking"
				, data:{'id':id}
				// response
				, success:function(data) {
					// {"code":1, "result":"성공"}
					if (data.code == 1) {
						alert("삭제 되었습니다.");
						location.reload(true);
					} else {
						// {"code":500, "errorMessage":"삭제될 데이터가 없습니다."}
						alert(data.errorMessage);
					}
				}
				, error:function(request, status, error) {
					alert("삭제하는데 실패했습니다.");
				}
			
			})
		});
	});

</script>
</html>