package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import dto.TicketDTO;
import dto.TimetableDTO;

public class BusDAO implements IBusDAO {
	
	@Override // db 연결
	public Connection getConnection() {
		
		Connection con = null;
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		
		} catch (ClassNotFoundException e) {
			System.out.println("ojdbc8.jar파일을 추가해주세요.");
		} catch (SQLException e) {
			System.out.println("db 연결 정보(주소, id, pw)를 확인해주세요.");
		}
		return con;
	}
	
	
	@Override // 버스 시간표 출력(가는날)
	public ArrayList<TimetableDTO> goTimeTable(String dpt_date, String dpt_time, String dpt_st, String arrv_st){
		
		ArrayList<TimetableDTO> buslist = new ArrayList<>();

		Connection con = getConnection();

		try {
			
			String sql = "select "
					+ "busNo, dpt_st, arrv_st, ddate, adate, seat, unBookedSeat, grade, company "
					+ "from bus_timetable "
					+ "where to_char(ddate, 'yyyy-MM-dd') >= ? "
					+ "and to_char(ddate, 'HH24:MI') >= ? "
					+ "and dpt_st = ? and arrv_st = ?";
			
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dpt_date);
			pstmt.setString(2, dpt_time);
			pstmt.setString(3, dpt_st);
			pstmt.setString(4, arrv_st);
			
			ResultSet rs = pstmt.executeQuery();
			SimpleDateFormat format = new SimpleDateFormat("HH:mm");
			
			while(rs.next()) {

				String ddate = format.format(rs.getDate("ddate"));
				String adate = format.format(rs.getDate("adate"));
				
				TimetableDTO bus = new TimetableDTO();
				bus.setBusNo(rs.getString("busNo"));
				bus.setDpt_st(rs.getString("dpt_st"));
				bus.setDpt_st(rs.getString("arrv_st"));
				bus.setDdate(ddate);
				bus.setAdate(adate);
				bus.setSeat(rs.getInt("seat"));
				bus.setUnBookedSeat(rs.getInt("unBookedSeat"));
				bus.setGrade(rs.getString("grade"));
				bus.setCompany(rs.getString("company"));
				
				buslist.add(bus);
			}
			
			//System.out.println(buslist.toString());
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return buslist;
	}
	
	
	@Override // 버스 시간표 출력(오는날)
	public ArrayList<TimetableDTO> backTimeTable(String arrv_date, String arrv_time, String arrv_st, String dpt_st){
		
		ArrayList<TimetableDTO> buslist = new ArrayList<>();

		Connection con = getConnection();

		try {
			
			String sql = "select "
					+ "busNo, dpt_st, arrv_st, ddate, adate, seat, unBookedSeat, grade, company "
					+ "from bus_timetable "
					+ "where to_char(ddate, 'yyyy-MM-dd') >= ? "
					+ "and to_char(ddate, 'HH24:MI') >= ?"
					+ "and dpt_st = ? and arrv_st = ?";
			
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, arrv_date);
			pstmt.setString(2, arrv_time);
			pstmt.setString(3, arrv_st);
			pstmt.setString(4, dpt_st);
			
			ResultSet rs = pstmt.executeQuery();
			SimpleDateFormat format = new SimpleDateFormat("HH:mm");
			
			while(rs.next()) {

				String ddate = format.format(rs.getDate("ddate"));
				String adate = format.format(rs.getDate("adate"));
				
				TimetableDTO bus = new TimetableDTO();
				bus.setBusNo(rs.getString("busNo"));
				bus.setDpt_st(rs.getString("dpt_st"));
				bus.setDpt_st(rs.getString("arrv_st"));
				bus.setDdate(ddate);
				bus.setAdate(adate);
				bus.setSeat(rs.getInt("seat"));
				bus.setUnBookedSeat(rs.getInt("unBookedSeat"));
				bus.setGrade(rs.getString("grade"));
				bus.setCompany(rs.getString("company"));
				
				buslist.add(bus);
			}
			
			//System.out.println(buslist.toString());
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return buslist;
	}


	@Override // 최종 결재 금액 출력
	public int getPrice(int adult, int student, int kid, String type) {

		int total = 0;
		Connection con = getConnection();
		
		String sql = "select sum((price*?)+(price*0.8*?)+(price*0.5*?)) as total from ticket_price where type=?";
		
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, adult);
			pstmt.setInt(2, student);
			pstmt.setInt(3, kid);
			pstmt.setString(4, type);
			
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			total = rs.getInt("total");
			//System.out.println(total);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return total;
	}


	@Override // 예약 정보 입력
	public int insertBooking(TicketDTO b) {
		
		int result = 0;
		Connection con = getConnection();

		//insert into bus_ticket values (b_seq.NEXTVAL, to_date('2022-01-18 15:00', 'yyyy-MM-dd HH24:MI'), '우등', '태양고속', 2, 1, 0, 3, 26400, 'a1 a2 b1')
		String sql = "insert into bus_ticket values (b_seq.NEXTVAL, ?, ?, to_date(?, 'yyyy-MM-dd HH24:MI'), ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, b.getDpt_st()); // 출발역
			pstmt.setString(2, b.getArrv_st()); // 도착역
			pstmt.setString(3, b.getDdate()); // 출발시간
			pstmt.setString(4, b.getGrade()); // 버스등급
			pstmt.setString(5, b.getCompany()); // 버스회사
			pstmt.setInt(6, b.getAdult()); // 성인수
			pstmt.setInt(7, b.getStudent()); // 학생수
			pstmt.setInt(8, b.getKid()); // 유아수
			pstmt.setInt(9, b.getPnum()); // 총인원
			pstmt.setInt(10, b.getPrice()); // 총금액
			
			// 좌석번호
			String[] seatArr = b.getSeatArr();
			String seatNo = "";
			for(int i = 0; i < seatArr.length; i++) {
				seatNo = seatNo + seatArr[i] + " ";
			}
			
			pstmt.setString(11, seatNo); // 좌석번호
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	
	@Override // 예매 정보 출력(예매 최종 프로세스) - 오는길
	public TicketDTO bookingData() {
		
		TicketDTO b = new TicketDTO();
		Connection con = getConnection();

		try {
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from bus_ticket where bcode = (select max(bcode) from bus_ticket)");
		
			if(rs.next()) {
				b.setBcode(rs.getInt("bcode"));
				b.setDpt_st(rs.getString("dpt_st"));
				b.setArrv_st(rs.getString("arrv_st"));
				b.setDdate(rs.getString("ddate"));
				b.setGrade(rs.getString("grade"));
				b.setCompany(rs.getString("company"));
				b.setAdult(rs.getInt("adult"));
				b.setStudent(rs.getInt("student"));
				b.setKid(rs.getInt("kid"));
				b.setPnum(rs.getInt("Pnum"));
				b.setPrice(rs.getInt("price"));
				b.setSeatNo(rs.getString("seatNo"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return b;
	}


	@Override // 예매 정보 출력(예매 최종 프로세스) - 가는길
	public TicketDTO bookingData2() {
		
		TicketDTO b = new TicketDTO();
		Connection con = getConnection();

		try {
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from bus_ticket where bcode = (select max(bcode)-1 from bus_ticket)");
		
			if(rs.next()) {
				b.setBcode(rs.getInt("bcode"));
				b.setDpt_st(rs.getString("dpt_st"));
				b.setArrv_st(rs.getString("arrv_st"));
				b.setDdate(rs.getString("ddate"));
				b.setGrade(rs.getString("grade"));
				b.setCompany(rs.getString("company"));
				b.setAdult(rs.getInt("adult"));
				b.setStudent(rs.getInt("student"));
				b.setKid(rs.getInt("kid"));
				b.setPnum(rs.getInt("Pnum"));
				b.setPrice(rs.getInt("price"));
				b.setSeatNo(rs.getString("seatNo"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return b;
	}
	
	
	@Override // 예매 정보 출력(내역 확인)
	public TicketDTO bookingConfirm(int bcode) {
		
		TicketDTO b = new TicketDTO();
		Connection con = getConnection();
		
		try {
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from bus_ticket where bcode=" + bcode);
			
			if(rs.next()) {

				b.setBcode(rs.getInt("bcode"));
				b.setDpt_st(rs.getString("dpt_st"));
				b.setArrv_st(rs.getString("arrv_st"));
				b.setDdate(rs.getString("ddate"));
				b.setGrade(rs.getString("grade"));
				b.setCompany(rs.getString("company"));
				b.setAdult(rs.getInt("adult"));
				b.setStudent(rs.getInt("student"));
				b.setKid(rs.getInt("kid"));
				b.setPnum(rs.getInt("Pnum"));
				b.setPrice(rs.getInt("price"));
				b.setSeatNo(rs.getString("seatNo"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return b;
	}


	@Override // 예매 정보 삭제
	public int deleteBooking(int bcode) {
		
		int result = 0;
		
		Connection con = getConnection();
		
		try {
			Statement stmt = con.createStatement();
			result = stmt.executeUpdate("delete from bus_ticket where bcode=" + bcode);

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}
	
	
	
	
}
