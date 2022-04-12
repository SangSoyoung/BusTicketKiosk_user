
<%@page import="dto.StationDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	ArrayList<StationDTO> clist = (ArrayList<StationDTO>)request.getAttribute("clist");
	pageContext.setAttribute("clist", clist);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="css/station.css">
</head>
<body>
<jsp:include page="../header.jsp" />
<jsp:include page="arrive_header.jsp" />
<jsp:include page="arrive_loca_nav.jsp"></jsp:include>
<!-- 지역별 탭 -->
<div id="cont_city" class="tabCont">
	<c:forEach var="c" items="${clist }">
		<a href="station_arrv.do?city=${c.city }">
			<button>${c.city }</button>
		</a>
	</c:forEach>		
</div>
<jsp:include page="footer_loca.jsp" />
</body>
</html>