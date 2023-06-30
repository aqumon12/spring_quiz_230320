<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력페이지</title>
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
</head>
<body>
	<div class="container">
		<h1>즐겨찾기 추가하기</h1>
		<div class="form-group">
			<div>제목</div>
			<input type="text" class="form-control" id="name">
		</div>
		<div class="form-group">
			<div>주소</div>
			<div class="form-inline">
				<input type="text" class="form-control col-10" id="url">
				<button type="button" id="duplicationBtn" class="btn btn-primary ml-3">중복확인</button>
			</div>
			<small id="duplicationText" class="text-danger d-none">중복된 url 입니다.</small>
			<small id="availableText" class="text-success d-none">저장 가능한 url 입니다.</small>
		</div>
		<input type="button" id="addBookmarkBtn" class="btn btn-success btn-block" value="추가">
	</div>
	
<script>
	// 문제 2-1)
	$(document).ready(function() {
		$('#duplicationBtn').on('click', function() {
			let url = $('#url').val().trim();
			if (!url) {
				alert("검사할 url을 입력해주세요.");
				return;
			}
			
			// AJAX 통신 => DB URL 존재 여부
			
			$.ajax({
				// request
				type:"POST"
				, url:"/lesson06/quiz01/is_Duplication_url"
				, data:{"url":url}
			
				// response
				, success:function(data) {
					// 예) {"code":1, "isDuplcation":true}
					if (data.isDuplication) { // 중복
						$('#duplicationText').removeClass('d-none');
						$('#availableText').addClass('d-none');
					} else { // 중복아님 (사용가능url)
						$('#duplicationText').addClass('d-none');
						$('#availableText').removeClass('d-none');
					}
				}	
				, error:function(request, status, error) {
					alert("");
				}
				
			})
		})
		
		$('#addBookmarkBtn').on('click', function() {
			// validation
			let name = $("#name").val().trim();
			if (name == '') {
				alert("이름을 입력하세요");
				return;
			}
			let url = $('#url').val().trim();
			if (url == '') {
				alert ("url을 입력하세요");
				return;
			}
			// 주소 형식이 잘못되었을 때 참이 되어야 함
			// http도 아니고(and), https도 아닐 때
			if (url.startsWith("http://") == false && url.startsWith("https://") == false) {
				alert("주소 형식이 잘못 되었습니다");
				return;
			}
			
			// 문제2) 중복확인 체크
			if ($('#availableText').hasClass('d-none')) { // validation: 잘못된 경우 => availableText가 d-none인 경우
				alert('중복된 url입니다. 다시 확인해주세요');
				return;
			}
			
			// AJAX 통신 => 서버 요청
			$.ajax({
				// request
				type:"post"
				, url:"/lesson06/quiz01/add_bookmark"
				, data: {"name":name, "url":url}
				
				// response
				, success:function(data) { // data type: String, JSON => 자바스크립트의 객체로 변환
					if(data.result == "성공") {
						location.href = "/lesson06/quiz01/bookmark_view"; // GET method
					} else {
						alert("즐겨찾기 추가하는데 실패했습니다");
					}
				}
				, error:function(request, status, error) {
					alert(request);
					alert(status);
					alert(error);
				}
			})
			
			
		})
		
	})
</script>	
</body>

</html>