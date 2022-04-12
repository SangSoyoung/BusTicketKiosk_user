<%@page import="dto.TicketDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.TimetableDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
pageContext.setAttribute("goT", (TicketDTO)request.getAttribute("go_booking"));
pageContext.setAttribute("backT", (TicketDTO)request.getAttribute("back_booking"));
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
<jsp:include page="header.jsp" />
<h3>예약 정보 확인</h3>
왕복 예매가 성공적으로 완료되었습니다.<br>
<div id="go_container">
	<h3>가는길 예약정보</h3>
	<table>
		<tr>
			<th>가는길 예약번호</th>
			<td colspan="2" class="cnt">${goT.bcode }</td>
		</tr>
		<tr>
			<th>출발역</th>
			<td colspan="2" class="cnt">${goT.dpt_st }</td>
		</tr>
		<tr>	
			<th>도착역</th>
			<td colspan="2" class="cnt">${goT.arrv_st }</td>
		</tr>
		<tr>	
			<th>출발시간</th>
			<td colspan="2" class="cnt">${goT.ddate }</td>
		</tr>
		<tr>
			<th>총인원</th>
			<th>등급</th>
			<th>회사</th>
		</tr>
		<tr>
			<td class="cnt">${goT.pnum }</td>
			<td class="cnt">${goT.grade }</td>
			<td class="cnt">${goT.company }</td>
		</tr>
		<tr>
			<td colspan="3">
				성인 : ${goT.adult }인 | 중고생 : ${goT.student }인 | 유아 : ${goT.kid }인
			</td>
		</tr>
		<tr>
			<th>좌석번호</th>
			<td colspan="2" class="cnt">${goT.seatNo }</td>
		</tr>
		<tr>
			<th>티켓가격</th>
			<td colspan="2" class="cnt">${goT.price }원</td>
		</tr>
	</table>
</div>

<input type="hidden" name="arrv_date" value="${arrv_date }">
<input type="hidden" name="arrv_time" value="${back_dtime }">

<div id="back_container">
	<h3>오는길 예약정보</h3>
	<table>
		<tr>
			<th>오는길 예약번호</th>
			<td colspan="2" class="cnt">${backT.bcode }</td>
		</tr>
		<tr>
			<th>출발역</th>
			<td colspan="2" class="cnt">${backT.dpt_st }</td>
		</tr>
		<tr>	
			<th>도착역</th>
			<td colspan="2" class="cnt">${backT.arrv_st }</td>
		</tr>
		<tr>	
			<th>출발시간</th>
			<td colspan="2" class="cnt">${backT.ddate }</td>
		</tr>
		<tr>
			<th>총인원</th>
			<th>등급</th>
			<th>회사</th>
		</tr>
		<tr>
			<td class="cnt">${backT.pnum }</td>
			<td class="cnt">${backT.grade }</td>
			<td class="cnt">${backT.company }</td>
		</tr>
		<tr>
			<td colspan="3">
				성인 : ${backT.adult }인 | 중고생 : ${backT.student }인 | 유아 : ${backT.kid }인
			</td>
		</tr>
		<tr>
			<th>좌석번호</th>
			<td colspan="2" class="cnt">${backT.seatNo }</td>
		</tr>
		<tr>
			<th>티켓가격</th>
			<td colspan="2" class="cnt">${backT.price }원</td>
		</tr>
	</table>
</div>

<h3> 총 결재 금액 : ${total }원</h3>
<br>
<button class="btnbtn" onclick="location.href='getTicket.jsp'">발권하기</button>
<button class="btnbtn" onclick="location.href='index.jsp'">첫 화면 가기</button>

<script>
	
	let back_container = document.querySelector("#back_container");
	
	let arrv_date = document.querySelector("input[name='arrv_date']");
	let arrv_time = document.querySelector("input[name='arrv_time']");
	
	if(arrv_date.value == '' || arrv_time.value == ''){
		back_container.style.display='none';
	}

</script>
</body>
</html>