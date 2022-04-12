package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import dto.StationDTO;

public class StationDAO implements IStationDAO {

	@Override
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
	
	
	@Override //** 지역별 : 도시목록
	public ArrayList<StationDTO> getCity() {
		
		ArrayList<StationDTO> clist = new ArrayList<>();
		
		try {
			
			Connection con = getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select city from bus_station GROUP BY city");
			
			while (rs.next()) {
				
				StationDTO st = new StationDTO();
				st.setCity(rs.getString("city"));
				
				clist.add(st);
				//System.out.println(clist.toString());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return clist;
	}

	
	@Override //** 지역별 : 역목록
	public ArrayList<StationDTO> getStation(String city) {
		
		ArrayList<StationDTO> slist = new ArrayList<>();
		
		try {
			
			Connection con = getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select station from bus_station where city='" + city + "'");
			
			while (rs.next()) {
				
				StationDTO st = new StationDTO();
				st.setStation(rs.getString("station"));

				slist.add(st);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return slist;
	}


	@Override //*** 사전순 역목록
	public ArrayList<StationDTO> getDic() {
		
		ArrayList<StationDTO> dlist = new ArrayList<>();
		
		Connection con = getConnection();
		Statement stmt;
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select station from bus_station ORDER BY station");
			
			while(rs.next()) {
				StationDTO st = new StationDTO();
				st.setStation(rs.getString("station"));
				dlist.add(st);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return dlist;
	}


	@Override // 직접검색 역목록
	public ArrayList<StationDTO> getSrch(String txt) {
		
		ArrayList<StationDTO> schlist = new ArrayList<StationDTO>();
		Connection con = getConnection();
		
		try {
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select station from bus_station where station like '%"+ txt +"%'");
		
			while(rs.next()) {
				
				StationDTO st = new StationDTO();
				st.setStation(rs.getString("station"));
				schlist.add(st);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return schlist;
	}
	
	

}
