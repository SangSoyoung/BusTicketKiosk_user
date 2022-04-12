<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("result", request.getAttribute("result"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	if(${result } > 0){
		alert("예약 취소 성공!");
		location.href="ticket_confirm/cancelComplete.jsp";
		
	} else {
		alert("예약 취소 중 오류가 발생하였습니다. 역무원에게 문의해주세요.");
		console.log("예약 취소 db delete 중 에러발생");
		location.href="index.jsp";
	}

</script>
</body>
</html>