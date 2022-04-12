<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/btn.css">
</head>
<body>
<jsp:include page="header.jsp" />
<h3>&lt;출발일정 선택하기&gt;</h3>
<form action="timeSelect_round.do" method="get">
<table>
<tr>
	<th>출발 날짜</th>
	<td>
		<input type="date" name="dpt_date" value="2022-02-11">
	</td>
</tr>
<tr>
	<th>출발 시간</th>
	<td>
		<select name="dpt_time" id="dpt_time">
			<option value="">선택</option>
			<option value="08:00" selected>08:00 이후</option>
			<option value="09:00">09:00 이후</option>
			<option value="10:00">10:00 이후</option>
			<option value="11:00">11:00 이후</option>
			<option value="12:00">12:00 이후</option>
		</select>
	</td>
</tr>
</table>
<br>
<h3>&lt;오는일정 선택하기&gt;</h3>
<table>
<tr>
	<th>오는 날짜</th>
	<td>
		<input type="date" name="arrv_date" value="2022-02-12">
	</td>
</tr>
<tr>
	<th>오는 시간</th>
	<td>
		<select name="arrv_time" id="arrv_time">
			<option value="">선택</option>
			<option value="08:00" selected>08:00 이후</option>
			<option value="09:00">09:00 이후</option>
			<option value="10:00">10:00 이후</option>
			<option value="11:00">11:00 이후</option>
			<option value="12:00">12:00 이후</option>
		</select>
	</td>
</tr>
</table>
<br>
<input class="btnbtn" type="submit" value="선택완료">
</form>

<button class="btnbtn" onclick="location.href='bookingMain.jsp'">
	이전 화면 보기
</button>
</body>
</html>