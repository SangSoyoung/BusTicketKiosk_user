<%@page import="dto.SeatDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.TimetableDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	pageContext.setAttribute("seatlist", (ArrayList<SeatDTO>)request.getAttribute("seatlist"));
	pageContext.setAttribute("bookedSeat", (Integer)request.getAttribute("bookedSeat"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/btn.css">
<link rel="stylesheet" href="css/seat.css">
</head>
<body>
<jsp:include page="header.jsp" />
<h3>${arrv_date }&nbsp;${back_atime }출발
<br> ${dpt_st }행 버스</h3>
<table border="1">
	<tr>
		<th>예약인원</th>
		<th>잔여석</th>
		<th>등급</th>
		<th>회사</th>
	</tr>
	<tr>
		<td>${pnum }</td>
		<td>${unBookedSeat }</td>
		<td>${back_grade }</td>
		<td>${back_company }</td>
	</tr>
</table>
<h3>좌석 선택</h3>
<form action = "totalPrice.do" method="get" onsubmit="return doCheck();">
<div id="seat">
<c:forEach var="se" items="${seatlist }">
	<c:if test="${se.booking eq 0}">
		<input type="checkbox" name="back_seatArr" value="${se.seatNo }" onclick="checkDisabled(this, checkLimit(this), ${pnum });">
	</c:if>
	<c:if test="${se.booking eq 1}">
		<input type="checkbox" name="back_seatArr" value="${se.seatNo }" onclick="return false" checked disabled>
	</c:if>															
</c:forEach>
</div>
<input type="submit" class="btnbtn" value="선택완료">
</form>
<button class="btnbtn" onclick="location.href='timeTable_dpt.do'">이전 화면 보기</button>
<button class="btnbtn" onclick="location.href='bookingMain_init.jsp'">선택 초기화</button>
<br>
<script>

	// 인원수까지 좌석 선택해야함. 모자르면 알림창
	// 인원수이상은 선택하지 못함.
	// 인원수 이상 선택할 경우, 체크박스 비활성화
	
	// 정해진 개수까지 체크해야함
	function doCheck(){
		var chk = document.getElementsByName("back_seatArr");
		var checked = 0; //예약유 좌석수 
		
		for(i = 0; i < chk.length; i++){
			if(chk[i].checked == true){
				checked += 1;	
			}
		}
		console.log("체크 길이 " + chk.length);
		console.log("예약유 좌석수 : " + ${bookedSeat });
		console.log("예약인원 : " + ${pnum });
		console.log("체크된 갯수 : " + checked);
		
	    if(checked < ${pnum } + ${bookedSeat }){ //예약유 좌석수  	
	        alert("좌석을 마저 선택해주세요.");
	        return false;
	    }
	}
	
	// 정해진 개수 이상은 체크 불가
	var count=0;
	function checkLimit(chk){
		if(chk.checked == true){
	        count++;
	    } else {
	        count--;
	    }
	    if (count <= ${pnum }){
	        return true;
	    } else {
	        count--;
	        return false;
	    }
	}
	
	// 체크 개수 초과시 비활성화
	function checkDisabled(obj, condition, n){
	    if(condition == false){
	        obj.checked = false;
	        alert(n + "석을 초과하였습니다.")
	    }
	}
	
</script>
</body>
</html>