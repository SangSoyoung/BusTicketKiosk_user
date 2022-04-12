package controller.user.round;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.UserService;


@WebServlet("/city_dpt.do")
public class CityListController_Dpt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setAttribute("clist", new UserService().getCity());
		request.getRequestDispatcher("station/depart_city.jsp").forward(request, response);
	}

}
