<%@page import="dto.StationDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	ArrayList<StationDTO> dlist = (ArrayList<StationDTO>)request.getAttribute("dlist");
	pageContext.setAttribute("dlist", dlist);
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
<jsp:include page="arrive_loca_nav.jsp" />

<!-- 사전순 -->
<div id="cont_st" class="tabCont">
	<c:forEach var="d" items="${dlist }">
		<a href="dicSelect_arrv.do?arrv_st=${d.station }">
			<button>${d.station }</button>
		</a>
	</c:forEach>		
</div>

<jsp:include page="footer_loca.jsp" />
</body>
</html>