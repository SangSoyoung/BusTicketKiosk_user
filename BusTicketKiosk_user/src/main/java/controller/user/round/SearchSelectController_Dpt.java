package controller.user.round;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.StationDAO;
import dto.StationDTO;

@WebServlet("/srchSelect_dpt.do")
public class SearchSelectController_Dpt extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		session.setAttribute("dpt_st", request.getParameter("dpt_st"));
		response.sendRedirect("bookingMain.jsp");
		
	}

}
