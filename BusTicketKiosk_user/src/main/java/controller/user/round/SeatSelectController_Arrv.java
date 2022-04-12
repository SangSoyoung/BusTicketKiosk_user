package controller.user.round;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.SeatDAO;
import dto.SeatDTO;


@WebServlet("/seatSelect_arrv.do")
public class SeatSelectController_Arrv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String _date = (String)session.getAttribute("arrv_date");
		
		String _time = request.getParameter("back_dtime");
		
		String date = _date.replaceAll("-", "");
		String time = _time.replaceAll(":", "");
		
		String busNo = request.getParameter("back_busNo");
		String grade = request.getParameter("back_grade");
		String company = request.getParameter("back_company");
		String back_atime = request.getParameter("back_atime");
		
		session.setAttribute("back_busNo", busNo);
		session.setAttribute("back_dtime", _time);
		session.setAttribute("back_atime", back_atime);
		session.setAttribute("back_grade", grade);
		session.setAttribute("back_company", company);
		
		// 전체 좌석 보기
		ArrayList<SeatDTO> seatlist = new SeatDAO().bookingSeat(busNo, date, time);
		
		// 예약무 좌석수
		SeatDTO se = new SeatDAO().unBookedSeatNum(busNo, date, time);
		int unBookedSeat = se.getUnBookedSeat();
		
		// 예약유 좌석수
		se = new SeatDAO().bookedSeatNum(busNo, date, time);
		int bookedSeat = se.getBookedSeat();
				
		request.setAttribute("bookedSeat", bookedSeat);
		request.setAttribute("unBookedSeat", unBookedSeat);
		request.setAttribute("seatlist", seatlist);
		
		request.getRequestDispatcher("booking_seat_arrive.jsp").forward(request, response);
	}


}
