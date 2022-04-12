package controller.user.round;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BusDAO;
import dto.TicketDTO;


@WebServlet("/bookingEnd.do")
public class BookingCompeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		String back_dpt_date = (String)session.getAttribute("arrv_date"); // 출발날짜
		String back_dpt_time = (String)session.getAttribute("back_dtime"); // 출발시간
		
		if(back_dpt_date.isEmpty() || back_dpt_time.isEmpty()) { // 편도
			
			// 가는길 예약정보
			TicketDTO go_booking = new BusDAO().bookingData();
			request.setAttribute("go_booking", go_booking);
			
		} else { // 왕복
			
			// 오는길 예약정보
			TicketDTO back_booking = new BusDAO().bookingData();
			
			// 가는길 예약정보
			TicketDTO go_booking = new BusDAO().bookingData2();
			
			request.setAttribute("back_booking", back_booking);
			request.setAttribute("go_booking", go_booking);
		}
		
		
		request.getRequestDispatcher("bookingComplete.jsp").forward(request, response);
	
	}

	
}
