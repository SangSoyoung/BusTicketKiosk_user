<%@page import="dto.StationDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	ArrayList<StationDTO> slist = (ArrayList<StationDTO>)request.getAttribute("slist");
	pageContext.setAttribute("slist", slist);
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
<jsp:include page="depart_loca_nav.jsp" />

<!-- 지역별 탭 : 역목록 -->
<div id="cont_st" class="tabCont">
	<c:forEach var="s" items="${slist }">
		<a href="select_arrv.do?arrv_st=${s.station }">
			<button>${s.station }</button>
		</a>
	</c:forEach>
	<br><br>
	<a href="city_arrv.do">
		<button>도시보기</button>
	</a>
</div>

<jsp:include page="footer_loca.jsp" />
</body>
</html>