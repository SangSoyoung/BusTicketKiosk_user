package controller.user.round;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BusDAO;


@WebServlet("/confirm.do")
public class BookingConfirmController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int bcode = Integer.parseInt(request.getParameter("bcode"));

		request.setAttribute("booking", new BusDAO().bookingConfirm(bcode));
		request.getRequestDispatcher("ticket_confirm/confirmBookingData.jsp").forward(request, response);
		
	}

}
