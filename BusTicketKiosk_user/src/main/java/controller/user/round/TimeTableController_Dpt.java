package controller.user.round;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BusDAO;
import dto.TimetableDTO;


@WebServlet("/timeTable_dpt.do")
public class TimeTableController_Dpt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String dpt_date = (String)session.getAttribute("dpt_date");
		String dpt_time = (String)session.getAttribute("dpt_time");
		String dpt_st = (String)session.getAttribute("dpt_st");
		String arrv_st = (String)session.getAttribute("arrv_st");
		
		BusDAO bdao = new BusDAO();
		
		ArrayList<TimetableDTO> buslist = new ArrayList<>();
		buslist = bdao.goTimeTable(dpt_date, dpt_time, dpt_st, arrv_st); // dpt_date, dpt_time
		
		request.setAttribute("buslist", buslist);
		request.getRequestDispatcher("depart_timetable.jsp").forward(request, response);
		
	}


}
