package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import dto.SeatDTO;

public class SeatDAO implements ISeatDAO {

	@Override
	public Connection getConnection() {
		
		Connection con = null;
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

		} catch (ClassNotFoundException e) {
			System.out.println("jar 파일을 확인해주세요" + e);
			
		} catch (SQLException e) {
			System.out.println("url, id, pw를 확인해주세요" + e);
		}
		
		return con;
	}

	@Override // 전체 좌석 보기
	public ArrayList<SeatDTO> bookingSeat(String busNo, String date, String time) { 
		
		ArrayList<SeatDTO> seatlist = new ArrayList<>();
		Connection con = getConnection();

		try {
			
			Statement stmt = con.createStatement();
			String busIdf = busNo + "_" + date + "_" + time;
			//System.out.println(busIdf);
			
			String sql = "select * from bus_seat_" + busIdf;
			ResultSet rs = stmt.executeQuery(sql);

			while(rs.next()) {
				SeatDTO seat = new SeatDTO();
				seat.setSeatNo(rs.getInt("seatNo"));
				seat.setBooking(rs.getInt("booking"));
				seatlist.add(seat);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return seatlist;
	}

	
	@Override // 예매무 좌석 수
	public SeatDTO unBookedSeatNum(String busNo, String date, String time) {
		
		SeatDTO se = new SeatDTO();
		Connection con = getConnection();
		
		try {
			String busIdf = busNo + "_" + date + "_" + time;
			//System.out.println(busIdf);
			
			Statement stmt = con.createStatement();
			String sql = "select count(*) as cnt from bus_seat_" + busIdf + " where booking = 0";
			ResultSet rs = stmt.executeQuery(sql);

			rs.next();
			se.setUnBookedSeat(rs.getInt("cnt"));
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return se;
	}

	
	@Override // 예매유 좌석 수
	public SeatDTO bookedSeatNum(String busNo, String date, String time) {
		
		SeatDTO se = new SeatDTO();
		Connection con = getConnection();
		
		try {
			String busIdf = busNo + "_" + date + "_" + time;
			
			Statement stmt = con.createStatement();
			String sql = "select count(*) as cnt from bus_seat_" + busIdf + " where booking = 1";
			ResultSet rs = stmt.executeQuery(sql);

			rs.next();
			se.setBookedSeat(rs.getInt("cnt"));
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return se;
	}
	
	
	@Override // 예매 좌석 저장
	public int UpdateBookingSeat(String[] seatArr, String busNo, String date, String time) {
		
		Connection con = getConnection();
		int result = 0;
		
		try {
			Statement stmt = con.createStatement();
			String busIdf = busNo + "_" + date + "_" + time;
			
			for(int i = 0; i < seatArr.length; i++) {
				
			String sql = " Update bus_seat_" + busIdf + " set booking = 1 where seatNo = '" + seatArr[i] + "'";
			result = stmt.executeUpdate(sql);
			
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override // 버스 잔여석 업데이트
	public int UpdateUnBookedSeat(String busNo, String date, String time) {
		
		Connection con = getConnection();
		int result = 0;
		
		try {
			
			String busIdf = busNo + "_" + date + "_" + time;
			System.out.println(busIdf);

			String sql = "update bus_timetable"
					+ " set unBookedSeat=(select count(*) from bus_seat_" + busIdf + " where booking='0')"
					+ " where busNo='" + busNo
					+ "' and to_char(ddate, 'yyyyMMdd')='" + date
					+ "' and to_char(ddate, 'HH24MI')='" + time + "'";
			
			Statement stmt = con.createStatement();
			result = stmt.executeUpdate(sql);
			
		} catch(Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	
	

}
