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
import dto.TicketDTO;
import dto.TimetableDTO;


@WebServlet("/timetable_arrv.do")
public class TimeTableController_Arrv extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String dpt_st = (String)session.getAttribute("dpt_st");
		String arrv_st = (String)session.getAttribute("arrv_st");
		String arrv_date = (String)session.getAttribute("arrv_date");
		String arrv_time = (String)session.getAttribute("arrv_time");

		// 편도
		if(arrv_date.isEmpty() || arrv_time.isEmpty()) {
			
			// 가는버스 선택좌석
			TicketDTO gobt = new TicketDTO();
			gobt.setSeatArr(request.getParameterValues("go_seatArr"));
			session.setAttribute("seatArr_dpt", gobt.getSeatArr());
			
			request.getRequestDispatcher("totalPrice.do").forward(request, response);
			
		} else { // 왕복
			
			
			// 가는버스 선택좌석
			TicketDTO gobt = new TicketDTO();
			gobt.setSeatArr(request.getParameterValues("go_seatArr"));
			session.setAttribute("seatArr_dpt", gobt.getSeatArr());
			
			// 오는버스 시간표 선택
			BusDAO bdao = new BusDAO();
			
			ArrayList<TimetableDTO> buslist = new ArrayList<>();
			buslist = bdao.backTimeTable(arrv_date, arrv_time, arrv_st, dpt_st); // dpt_date, dpt_time
			
			request.setAttribute("buslist", buslist);
			request.getRequestDispatcher("arrive_timetable.jsp").forward(request, response);
		}
	}
}
