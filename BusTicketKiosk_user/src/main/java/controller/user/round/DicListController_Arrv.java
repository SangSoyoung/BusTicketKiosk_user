package controller.user.round;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.UserService;


@WebServlet("/dic_arrv.do")
public class DicListController_Arrv extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("dlist", new UserService().getDic());
		request.getRequestDispatcher("station/arrive_dic.jsp").forward(request, response);
		
		
	}


}
