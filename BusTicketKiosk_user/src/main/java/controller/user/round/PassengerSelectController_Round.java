package controller.user.round;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/passengerSelect.do")
public class PassengerSelectController_Round extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int adult = Integer.parseInt(request.getParameter("adult"));
		int student = Integer.parseInt(request.getParameter("student"));
		int kid = Integer.parseInt(request.getParameter("kid"));
		int pnum =  adult + student + kid;
		
		HttpSession session = request.getSession();
		session.setAttribute("adult", adult);
		session.setAttribute("student", student);
		session.setAttribute("kid", kid);
		session.setAttribute("pnum", pnum);
		
		response.sendRedirect("bookingMain.jsp");
		

	}

}
