<%@page import="dto.TimetableDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.TimetableDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	ArrayList<TimetableDTO> buslist = (ArrayList<TimetableDTO>)request.getAttribute("buslist");
	pageContext.setAttribute("buslist", buslist);
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
<h3>${dpt_date }&nbsp;${dpt_time }시 이후<br> ${arrv_st }행 버스 목록</h3>
예매를 원하는 출발시간을 선택해주세요.
<br><br>
<table border="1">
	<tr>
		<th>출발시간</th>
		<th>도착시간</th>
		<th>잔여석</th>
		<th>등급</th>
		<th>회사</th>
	</tr>
<c:forEach var="b" items="${buslist }">
	<tr>
		<td>
			<a href="seatSelect_dpt.do?
				go_busNo=${b.busNo }&
				go_dtime=${b.ddate }&
				go_atime=${b.adate }&
				go_grade=${b.grade }&
				go_company=${b.company }
			">
			${b.ddate }
			</a>
		</td>
		<td>${b.adate }</td>
		<td>${b.unBookedSeat }</td>
		<td>${b.grade }</td>
		<td>${b.company }</td>
	</tr>
</c:forEach>
</table>

<button class="btnbtn" onclick="location.href='bookingMain_init.jsp'">선택 초기화</button>
<button class="btnbtn" onclick="location.href='bookingMain.jsp'">이전 화면 보기</button>
</body>
</html>