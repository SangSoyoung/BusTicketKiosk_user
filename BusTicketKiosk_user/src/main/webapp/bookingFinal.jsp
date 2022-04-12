<%@page import="java.util.ArrayList"%>
<%@page import="dto.TimetableDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	
	session.setAttribute("total", (Integer)request.getAttribute("total"));
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/btn.css">
</head>
<body>
<jsp:include page="header.jsp" />
<h3>${dpt_date }&nbsp;${ddate }출발<br> ${arrv_st }행 버스</h3>
<table border="1">
	<tr>
		<th>출발시간</th>
		<th>도착시간</th>
		<th>잔여석</th>
		<th>등급</th>
		<th>회사</th>
	</tr>
	<tr>
		<td>${ddate }</td>
		<td>${adate }</td>
		<td>${seat }</td>
		<td>${grade }</td>
		<td>${company }</td>
	</tr>
</table>
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
<h3>최종 결재 금액</h3>
${total }원
<br>
<button class="btnbtn" onclick="booking();">
예약하기
</button>
<button class="btnbtn" onclick="location.href='seatSelect.do'">
이전 화면 보기
</button>
<button class="btnbtn" onclick="location.href='bookingMain.jsp'">
선택 초기화
</button>
<script>
	function booking(){
		alert("금액을 투여해주세요~");
		location.href='insertBooking.do';
	}

</script>
</body>
</html>