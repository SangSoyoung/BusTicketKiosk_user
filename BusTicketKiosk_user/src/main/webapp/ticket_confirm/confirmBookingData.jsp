<%@page import="dto.TicketDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.TimetableDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
pageContext.setAttribute("b", (TicketDTO)request.getAttribute("booking"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/booking.css">
<link rel="stylesheet" href="css/btn.css">
</head>
<body>
<jsp:include page="../header.jsp" />
<h3>예약 정보 확인</h3>
예약 정보를 확인해주세요.<br>
<table>
	<!-- 가장 마지막 p.code로 출력 -->
	<tr>
		<th>예약번호</th>
		<td colspan="2" class="cnt">${b.bcode }</td>
	</tr>
	<tr>
		<th>출발역</th>
		<td colspan="2" class="cnt">${b.dpt_st }</td>
	</tr>
	<tr>	
		<th>도착역</th>
		<td colspan="2" class="cnt">${b.arrv_st }</td>
	</tr>
	<tr>	
		<th>출발시간</th>
		<td colspan="2" class="cnt">${b.ddate }</td>
	</tr>
	<tr>
		<th>총인원</th>
		<th>등급</th>
		<th>회사</th>
	</tr>
	<tr>
		<td class="cnt">${b.pnum }</td>
		<td class="cnt">${b.grade }</td>
		<td class="cnt">${b.company }</td>
	</tr>
	<tr>
		<td colspan="3">
			성인 : ${b.adult }인 | 중고생 : ${b.student }인 | 유아 : ${kid }인
		</td>
	</tr>
	<tr>
		<th>좌석번호</th>
		<td colspan="2" class="cnt">${b.seatNo }</td>
	</tr>
	<tr>
		<th>총가격</th>
		<td colspan="2" class="cnt">${b.price }원</td>
	</tr>
</table>
<br>
<button class="btnbtn" onclick="location.href='getTicket.jsp'">발권하기</button>
<button class="btnbtn" onclick="location.href='delete.do?bcode=${b.bcode }'">취소하기</button>
<button class="btnbtn" onclick="location.href='index.jsp'">첫 화면 가기</button>

<script>
	if(document.querySelector('.cnt').innerText == 0){
		alert("예약정보가 없습니다. 예약번호를 다시 확인해주세요~");
		location.href='ticket_confirm/confirmBooking.jsp';
	}
</script>
</body>
</html>