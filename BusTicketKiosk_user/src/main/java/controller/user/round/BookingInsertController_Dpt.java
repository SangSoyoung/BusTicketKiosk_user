package controller.user.round;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BusDAO;
import dao.SeatDAO;
import dto.TicketDTO;


@WebServlet("/insertBooking.do")
public class BookingInsertController_Dpt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		// 가는 길 - 파라미터
		String go_busNo = (String)session.getAttribute("go_busNo"); // 버스코드
		String go_dpt_date = (String)session.getAttribute("dpt_date"); // 출발날짜
		String go_dpt_time = (String)session.getAttribute("go_dtime"); // 출발시간
		String go_date = go_dpt_date + go_dpt_time; // 출발일정
		String go_dpt_st = (String)session.getAttribute("dpt_st"); // 출발역
		String go_arrv_st = (String)session.getAttribute("arrv_st"); // 도착역
		String go_grade = (String)session.getAttribute("go_grade"); // 등급
		String go_company = (String)session.getAttribute("go_company"); // 회사
		String[] go_seatArr = (String[])session.getAttribute("seatArr_dpt"); // 선택좌석
		
		// 오는 길 - 파라미터
		String back_busNo = (String)session.getAttribute("back_busNo"); // 버스코드
		String back_dpt_date = (String)session.getAttribute("arrv_date"); // 출발날짜
		String back_dpt_time = (String)session.getAttribute("back_dtime"); // 출발시간
		String back_dpt_st = (String)session.getAttribute("arrv_st"); // 출발역
		String back_arrv_st = (String)session.getAttribute("dpt_st"); // 도착역
		String back_date = back_dpt_date + back_dpt_time; // 출발일정
		String back_grade = (String)session.getAttribute("back_grade"); // 등급
		String back_company = (String)session.getAttribute("back_company"); // 회사
		int back_price = (Integer)session.getAttribute("back_price"); // 오는길 금액
		String[] back_seatArr = (String[])session.getAttribute("seatArr_arrv"); // 선택좌석
		
		
		// 편도 예약의 경우
		if(back_dpt_date.isEmpty() || back_dpt_time.isEmpty()) { 
		
			System.out.println("편도예약");
			// 가는길 티켓 //////////////////////////////////////////////////////////
			TicketDTO goT = new TicketDTO();
			
			int go_price = (Integer)session.getAttribute("go_price");
			int adult = (Integer)session.getAttribute("adult"); // 성인
			int student = (Integer)session.getAttribute("student"); // 학생
			int kid = (Integer)session.getAttribute("kid"); // 아동
			
			goT.setDpt_st(go_dpt_st); 
			goT.setArrv_st(go_arrv_st); 
			goT.setDdate(go_date); 
			goT.setGrade(go_grade);
			goT.setCompany(go_company);
			goT.setPrice(go_price); // 가는길 금액
			goT.setSeatArr(go_seatArr); 
			
			goT.setAdult(adult);
			goT.setStudent(student);
			goT.setKid(kid);
			goT.setPnum(adult + student + kid); // 총 인원수
			
			// 좌석 정보 변경
			String date1 = go_dpt_date.replaceAll("-", "");
			String time1 = go_dpt_time.replaceAll(":", "");
			int resultUpdateSeat_go = new SeatDAO().UpdateBookingSeat(go_seatArr, go_busNo, date1, time1);
			
			// 버스 시간표 - 잔여 좌석수 업데이트
			int resultUpdateUnBookedSeat_go = new SeatDAO().UpdateUnBookedSeat(go_busNo, date1, time1);
			
			// 예약 정보 등록
			int resultBooking_go = new BusDAO().insertBooking(goT);
			
			request.setAttribute("result_St_go", resultUpdateSeat_go);
			request.setAttribute("result_UnBkSt_go", resultUpdateUnBookedSeat_go);
			request.setAttribute("result_Bk_go", resultBooking_go);
			
			request.getRequestDispatcher("bookingSuccess_one.jsp").forward(request, response);
		
		
		} else { // 왕복 예약의 경우
			
			System.out.println("왕복예약");
			// 가는길 티켓 //////////////////////////////////////////////////////////
			System.out.println("가는길");
			TicketDTO goT = new TicketDTO();
			
			int go_price = (Integer)session.getAttribute("go_price");
			int adult = (Integer)session.getAttribute("adult"); // 성인
			int student = (Integer)session.getAttribute("student"); // 학생
			int kid = (Integer)session.getAttribute("kid"); // 아동
			
			goT.setDpt_st(go_dpt_st); 
			goT.setArrv_st(go_arrv_st); 
			goT.setDdate(go_date); 
			goT.setGrade(go_grade);
			goT.setCompany(go_company);
			goT.setPrice(go_price); // 가는길 금액
			goT.setSeatArr(go_seatArr); 
			
			goT.setAdult(adult);
			goT.setStudent(student);
			goT.setKid(kid);
			goT.setPnum(adult + student + kid); // 총 인원수
	
			// 좌석 정보 변경
			String date1 = go_dpt_date.replaceAll("-", "");
			String time1 = go_dpt_time.replaceAll(":", "");
			int resultUpdateSeat_go = new SeatDAO().UpdateBookingSeat(go_seatArr, go_busNo, date1, time1);
			// 버스 시간표 - 잔여 좌석수 업데이트(출발)
			int resultUpdateUnBookedSeat_go = new SeatDAO().UpdateUnBookedSeat(go_busNo, date1, time1);
			// 예약 정보 등록
			int resultBooking_go = new BusDAO().insertBooking(goT);
			

			// 오는길 티켓 //////////////////////////////////////////////////////////
			System.out.println("오는길");
			TicketDTO backT = new TicketDTO();
			
			backT.setDpt_st(back_dpt_st); 
			backT.setArrv_st(back_arrv_st); 
			backT.setDdate(back_date); 
			backT.setGrade(back_grade);
			backT.setCompany(back_company);
			backT.setPrice(back_price); // 금액
			backT.setSeatArr(back_seatArr); 
			
			backT.setAdult(adult);
			backT.setStudent(student);
			backT.setKid(kid);
			backT.setPnum(adult + student + kid); // 총 인원수
			
			// 좌석 정보 변경
			String date2 = back_dpt_date.replaceAll("-", "");
			String time2 = back_dpt_time.replaceAll(":", "");
			int resultUpdateSeat_back = new SeatDAO().UpdateBookingSeat(back_seatArr, back_busNo, date2, time2);
			// 버스 시간표 - 잔여 좌석수 업데이트(도착)
			int resultUpdateUnBookedSeat_back = new SeatDAO().UpdateUnBookedSeat(back_busNo, date2, time2);
			// 예약 정보 등록
			int resultBooking_back = new BusDAO().insertBooking(backT);
			
			
			request.setAttribute("result_St_go", resultUpdateSeat_go);
			request.setAttribute("result_UnBkSt_go", resultUpdateUnBookedSeat_go);
			request.setAttribute("result_Bk_go", resultBooking_go);
			
			request.setAttribute("result_Bk_back", resultBooking_back);
			request.setAttribute("result_UnBkSt_back", resultUpdateUnBookedSeat_back);
			request.setAttribute("result_St_back", resultUpdateSeat_back);
			
			request.getRequestDispatcher("bookingSuccess.jsp").forward(request, response);
			
		}
		
	}

}
