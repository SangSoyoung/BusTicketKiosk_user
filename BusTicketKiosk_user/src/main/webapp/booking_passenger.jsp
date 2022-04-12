<%@page import="java.util.ArrayList"%>
<%@page import="dto.TimetableDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	session.setAttribute("ddate", request.getParameter("ddate"));
	session.setAttribute("adate", request.getParameter("adate"));
	session.setAttribute("seat", request.getParameter("seat"));
	session.setAttribute("grade", request.getParameter("grade"));
	session.setAttribute("company", request.getParameter("company"));
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
<h3>탑승인원 선택하기</h3>
<form action="passengerSelect.do" method="get">
<table border="1">
	<tr>
		<th>성인</th><th>중고생</th><th>아동</th>
	</tr>
	<tr>
		<td>
			<select name="adult">
				<option value="0">0</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
			</select>
		</td>
		<td>
			<select name="student">
				<option value="0">0</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
			</select>
		</td>
		<td>
			<select name="kid">
				<option value="0">0</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
			</select>
		</td>
	</tr>
</table>
<input type="submit" class="btnbtn" value="선택 완료">
</form>
<button class="btnbtn" onclick="location.href='bookingMain.jsp'">이전 화면 보기</button>
<button class="btnbtn" onclick="location.href='bookingMain_init.jsp'">선택 초기화</button>
</body>
</html>