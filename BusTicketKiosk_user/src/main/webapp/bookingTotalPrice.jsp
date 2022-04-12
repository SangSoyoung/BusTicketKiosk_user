<%@page import="java.util.ArrayList"%>
<%@page import="dto.TimetableDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/btn.css">
</head>
<body>
<jsp:include page="header.jsp" />
<div id = "go_container">
	<h3>${dpt_date }&nbsp;${go_dtime } 출발<br> ${arrv_st }행 버스</h3>
	<table border="1">
		<tr>
			<th>출발시간</th>
			<th>도착시간</th>
			<th>등급</th>
			<th>회사</th>
			<th>좌석번호</th>
		</tr>
		<tr>
			<td>${go_dtime }</td>
			<td>${go_atime }</td>
			<td>${go_grade }</td>
			<td>${go_company }</td>
			<td>
				<c:forEach var="bseat_dpt" items="${seatArr_dpt }">
					${bseat_dpt }
				</c:forEach>
			</td>
		</tr>
	</table>
</div>
<br>

<input type="hidden" name="arrv_date" value="${arrv_date }">
<input type="hidden" name="arrv_time" value="${back_dtime }">

<div id = "back_container">
	<h3>${arrv_date }&nbsp;${back_dtime } 출발<br> ${dpt_st }행 버스</h3>
	<table border="1">
		<tr>
			<th>출발시간</th>
			<th>도착시간</th>
			<th>등급</th>
			<th>회사</th>
			<th>좌석번호</th>
		</tr>
		<tr>
			<td>${back_dtime }</td>
			<td>${back_atime }</td>
			<td>${back_grade }</td>
			<td>${back_company }</td>
			<td>
				<c:forEach var="bseat_arrv" items="${seatArr_arrv }">
					${bseat_arrv }
				</c:forEach>
			</td>
		</tr>
	</table>
</div>
<h3>탑승 인원</h3>
<table border="1">
	<tr>
		<th>성인</th>
		<th>중고생</th>
		<th>아동</th>
	</tr>
	<tr>
		<td>${adult }</td>
		<td>${student }</td>
		<td>${kid }</td>
	</tr>
</table>
<h3>결재 금액</h3>
<div>
	가는길 : ${go_price }원
</div>
<div id='back_price'>
	오는길 : ${back_price }원
</div>
<div>
	총액 : ${total }원
</div>
<br>
<button class="btnbtn" onclick="booking();">
예약하기
</button>
<button class="btnbtn" onclick="location.href='bookingMain.jsp'">
	옵션 다시 선택
</button>
<button class="btnbtn" onclick="location.href='index.jsp'">선택 초기화</button>

<script>
	
	let back_container = document.querySelector("#back_container");
	
	let arrv_date = document.querySelector("input[name='arrv_date']");
	let arrv_time = document.querySelector("input[name='arrv_time']");
	
	let back_price = document.querySelector("#back_price");
	
	if(arrv_date.value == '' || arrv_time.value == ''){
		back_container.style.display='none';
		back_price.style.display='none';
	}
	
	
	function booking(){
		alert("금액을 투여해주세요~");
		location.href='insertBooking.do';
	}

</script>
</body>
</html>