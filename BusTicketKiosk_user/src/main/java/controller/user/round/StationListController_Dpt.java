package controller.user.round;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.StationDTO;
import service.UserService;


@WebServlet("/station_dpt.do")
public class StationListController_Dpt extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		StationDTO st = new StationDTO();
		String city = request.getParameter("city");
		st.setCity(city);
		
		request.setAttribute("slist", new UserService().getStation(city));
		request.getRequestDispatcher("station/depart_station.jsp").forward(request, response);
		
	}
}
