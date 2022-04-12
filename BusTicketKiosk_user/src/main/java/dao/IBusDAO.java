package dao;

import java.sql.Connection;
import java.util.ArrayList;

import dto.TicketDTO;
import dto.TimetableDTO;

public interface IBusDAO {
	
	// db연결
	Connection getConnection();
	
	// 버스 시간표 출력 (가는날)
	ArrayList<TimetableDTO> goTimeTable(String dpt_date, String dpt_time, String dpt_st, String arrv_st);
	
	// 버스 시간표 출력(오는날)
	ArrayList<TimetableDTO> backTimeTable(String arrv_date, String arrv_time, String arrv_st, String dpt_st);
	
	// 최종 결재 금액 출력
	int getPrice(int adult, int student, int kid, String type);
	
	// 예약 정보 입력
	int insertBooking(TicketDTO b);
	
	// 예매 정보 출력(예매 최종 프로세스) - 가는길
	TicketDTO bookingData();
	
	// 예매 정보 출력(예매 최종 프로세스) - 오는길
	TicketDTO bookingData2();
	
	// 예매 정보 출력(내역 확인)
	TicketDTO bookingConfirm(int bcode);
	
	// 예약 정보 삭제
	int deleteBooking(int bcode);

	
		
}
