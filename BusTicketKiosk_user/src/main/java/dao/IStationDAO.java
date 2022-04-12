package dao;

import java.sql.Connection;
import java.util.ArrayList;

import dto.StationDTO;

public interface IStationDAO {
	
	// db연결
	Connection getConnection();
	
	// 도시목록
	ArrayList<StationDTO> getCity();
	
	// 도시별 역목록
	ArrayList<StationDTO> getStation(String city);
	
	// 사전순 역목록
	ArrayList<StationDTO> getDic();
	
	// 직접검색 역목록
	ArrayList<StationDTO> getSrch(String txt);
	
	
}
