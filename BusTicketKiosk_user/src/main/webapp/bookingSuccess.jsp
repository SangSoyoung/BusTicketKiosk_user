<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	int result_Bk_go = (Integer)request.getAttribute("result_Bk_go");
	int result_UnBkSt_go = (Integer)request.getAttribute("result_UnBkSt_go");
	int result_St_go = (Integer)request.getAttribute("result_St_go");
	
	int result_Bk_back = (Integer)request.getAttribute("result_Bk_back");
	int result_UnBkSt_back = (Integer)request.getAttribute("result_UnBkSt_back");
	int result_St_back = (Integer)request.getAttribute("result_St_back");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	// 가는길 티켓
	if ((${result_Bk_go } > 0) && (${result_Bk_back } > 0)){
		if((${result_St_go } > 0) && (${result_St_back } > 0)){
			if(${result_UnBkSt_go } > 0 && (${result_UnBkSt_back } > 0 )){
				alert("예약성공!");
				location.href="bookingEnd.do";
			} else {
				alert("좌석 예약 중 오류가 발생하였습니다. 역무원에게 문의해주세요.");
				console.log("버스 잔여좌석 db update 중 에러발생");
			}
		} else {
			alert("좌석 예약 중 오류가 발생하였습니다. 역무원에게 문의해주세요.");
			console.log("좌석 예약 db update 중 에러발생");
		}
	} else {
		alert("예약완료 진행중 오류가 발생하였습니다. 역무원에게 문의해주세요.");
		console.log("예약 정보 db insert 중 에러발생");
	}
	
</script>
</body>
</html>