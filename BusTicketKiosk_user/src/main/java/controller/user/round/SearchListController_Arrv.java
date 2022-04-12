package controller.user.round;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.StationDAO;
import dto.StationDTO;

@WebServlet("/srch_arrv.do")
public class SearchListController_Arrv extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String srch = request.getParameter("srch");
		StationDAO sdao = new StationDAO();
		ArrayList<StationDTO> schlist = sdao.getSrch(srch);
		
		request.setAttribute("schlist", schlist);
		request.getRequestDispatcher("station/arrive_srchList.jsp").forward(request, response);
		
	}

}
