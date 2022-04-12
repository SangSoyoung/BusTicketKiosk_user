<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/btn.css">
</head>

<body>
<jsp:include page="../header.jsp" />	
<h2>승차권 예매 확인하기</h2>
예매 번호를 입력해주세요.
<br><br>
<form action="../confirm.do" method="get">
<input type="text" name="bcode"><br>
<input type="submit" class="btnbtn" value="예매 정보 확인">
<input type="button" class="btnbtn" value="이전페이지" onclick="location.href='../index.jsp'">
</form>

<script>


</script>
</body>
</html>