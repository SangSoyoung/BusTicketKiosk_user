<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/btn.css">
<link rel="stylesheet" href="css/main.css">
</head>
<%
	session.invalidate();
%>
<body>
<jsp:include page="header.jsp" />
<h2>승차권 예매하기</h2>
<hr>

<table>
<tr>
	<th>출발역</th>
	<td><button class="bar" onclick="location.href='city_dpt.do'">
		${dpt_st }
	</button></td>
</tr>
<tr>
	<th>도착역</th>
	<td><button class="bar" onclick="location.href='city_arrv.do'">
		${arrv_st }
	</button></td>
</tr>
<tr>
	<th>출발시간</th>
	<td><button class="bar" onclick="location.href='booking_time.jsp'">
		${dpt_date }&nbsp;&nbsp;${dpt_time }
	</button></td>
</tr>
<tr>
	<th>오는시간</th>
	<td><button class="bar" onclick="location.href='booking_time.jsp'">
		${arrv_date }&nbsp;&nbsp;${arrv_time }
	</button></td>
</tr>
<tr>
	<th>탑승인원</th>
	<td><button class="bar" onclick="location.href='booking_passenger.jsp'">
		${pnum }
	</button></td>
</tr>
</table>

<button class="btnbtn" onclick="location.href='index.jsp'">이전 화면 보기</button>
<br><br>


</body>
</html>
