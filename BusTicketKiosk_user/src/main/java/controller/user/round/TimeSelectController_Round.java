package controller.user.round;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/timeSelect_round.do")
public class TimeSelectController_Round extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		session.setAttribute("dpt_date", request.getParameter("dpt_date"));
		session.setAttribute("arrv_date", request.getParameter("arrv_date"));
		session.setAttribute("dpt_time", request.getParameter("dpt_time"));
		session.setAttribute("arrv_time", request.getParameter("arrv_time"));
		response.sendRedirect("bookingMain.jsp");
	
	
	}

}
