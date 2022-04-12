package dao;

import java.sql.Connection;
import java.util.ArrayList;

import dto.SeatDTO;

public interface ISeatDAO {
	
	// DB 연결
	Connection getConnection();
	
	// 좌석 불러오기
	ArrayList<SeatDTO> bookingSeat(String busNo, String date, String time);
	
	// 예매무 좌석 수 출력
	SeatDTO unBookedSeatNum(String busNo, String date, String time);
	
	// 예매유 좌석 수 출력
	SeatDTO bookedSeatNum(String busNo, String date, String time);
	
	// 예매 좌석 저장
	int UpdateBookingSeat(String[] seatArr, String busNo, String date, String time);
	
	// 버스 잔여석 업데이트
	int UpdateUnBookedSeat(String busNo, String date, String time);

}
