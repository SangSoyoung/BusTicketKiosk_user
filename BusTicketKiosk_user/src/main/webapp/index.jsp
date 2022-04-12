<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();
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
	<button class= btnbtn onclick="location.href='bookingMain.jsp'">
		승차권 예매
	</button>
	<br>
	<button class= btnbtn onclick="location.href='ticket_confirm/confirmBooking.jsp'">
		승차권 확인
	</button>
	<br>
	<br>
	<div>
		<button class= btnbtn onclick="location.href='foreign.jsp'">
			foreign language
		</button>
	</div>
</body>
</html>