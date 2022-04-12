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


@WebServlet("/totalPrice.do")
public class TotalPriceController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session = request.getSession();
		
		// 오는버스 선택좌석
		TicketDTO bcbt = new TicketDTO();
		bcbt.setSeatArr(request.getParameterValues("back_seatArr"));
		session.setAttribute("seatArr_arrv", bcbt.getSeatArr());
		
		
		// 결재 금액(인원수 + 등급)
		int adult = (Integer)session.getAttribute("adult");
		int student = (Integer)session.getAttribute("student");
		int kid = (Integer)session.getAttribute("kid");
		
		String go_grade = (String)session.getAttribute("go_grade"); // 가는버스 등급
		String back_grade = (String)session.getAttribute("back_grade"); // 오는버스 등급
		
		BusDAO dao = new BusDAO();
		int go_price = dao.getPrice(adult, student, kid, go_grade);
		int back_price = dao.getPrice(adult, student, kid, back_grade);
		
		session.setAttribute("go_price", go_price);
		session.setAttribute("back_price", back_price);
		session.setAttribute("total", go_price + back_price);
		request.getRequestDispatcher("bookingTotalPrice.jsp").forward(request, response);
	
	}


}
