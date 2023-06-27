<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨정보</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>
	
<link rel="stylesheet" type="text/css" href="/css/weather/style.css">
</head>
<body>
	<div id="wrap">
		<div class="contents d-flex">
			<%-- 메뉴 영역 --%>
			<nav class="col-2">
				<div class="d-flex justify-content-center my-3">
					<img src="/image/logo.jpg" alt="logo" width="100">
				</div>
				<%-- flex-column: 세로 메뉴 --%>
				<ul class="nav flex-column">
					<li class="nav-item"><a href="/weather_history_view" class="nav-link">날씨</a></li>
					<li class="nav-item"><a href="/add_weather_view" class="nav-link">날씨입력</a></li>
					<li class="nav-item"><a href="#" class="nav-link">테마날씨</a></li>
					<li class="nav-item"><a href="#" class="nav-link">관측 기후</a></li>
				</ul>
			
			</nav>
			<%-- 날씨 히스토리 --%>
			<section class="col-10 mt-3 ml-5">
				<h2>과거 날씨</h2>
				<table class="table text-center">
					<thead>
						<tr>
							<th>날짜</th>
							<th>날씨</th>
							<th>기온</th>
							<th>강수량</th>
							<th>미세먼지</th>
							<th>풍속</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${weatherHistories}" var="weatherHistory">
							<tr>
								<td>
									<fmt:parseDate value="${weatherHistory.date}" pattern="yyyy-MM-dd" var="date"></fmt:parseDate>
									<fmt:formatDate value="${date}" pattern="yyyy년 M월 d일" /> 
								</td>
								<td>
									<c:choose>
										<c:when test="${weatherHistory.weather eq '비'}">
											<img src="image/rainy.jpg" alt="rainy">									
										</c:when>
										<c:when test="${weatherHistory.weather eq '흐림'}">
											<img src="image/cloudy.jpg" alt="cloudy">									
										</c:when>
										<c:when test="${weatherHistory.weather eq '구름조금'}">
											<img src="image/partlyCloudy.jpg" alt="partlyCloudy">									
										</c:when>
										<c:otherwise>
											<img src="image/sunny.jpg" alt="sunny">
										</c:otherwise>
									</c:choose>
								</td>
								<td>${weatherHistory.temperatures}°C</td>
								<td>${weatherHistory.precipitation}mm</td>
								<td>${weatherHistory.microDust}</td>
								<td>${weatherHistory.windSpeed}km/h</td>
							</tr>
							
						</c:forEach>
					</tbody>
				</table>
			
			
			
			</section>
		</div>
		<footer class="d-flex align-items-center">
			<div class="footer-logo ml-4">
				<img class="foot-logo-image"
					src="https://www.weather.go.kr/w/resources/image/foot_logo.png"
					width="120">
			</div>
			<div class="copyright ml-4">
				<small class="text-secondary"> (07062) 서울시 동작구 여의대방로16길 61 <br>
					Copyright@2023 KMA. All Rights RESERVED.
				</small>
			</div>
		</footer>
	</div>
</body>
</html>