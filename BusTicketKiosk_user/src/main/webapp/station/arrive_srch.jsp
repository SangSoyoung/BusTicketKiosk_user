<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../header.jsp" />
<jsp:include page="arrive_header.jsp" />
<jsp:include page="arrive_loca_nav.jsp" />

<!-- 직접검색 -->
<form action="../srch_arrv.do" method="get">
	역이름 : <input type="text" name="srch">
	<input type="submit" value="검색하기">
</form>

<jsp:include page="footer_loca.jsp" />
</body>
</html>