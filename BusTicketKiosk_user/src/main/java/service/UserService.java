package service;

import java.util.ArrayList;

import dao.StationDAO;
import dto.StationDTO;

public class UserService {
	// 도시 목록 출력
	public ArrayList<StationDTO> getCity(){
		return new StationDAO().getCity();
	}
	
	// 도시별 역목록 출력
	public ArrayList<StationDTO> getStation(String city){
		return new StationDAO().getStation(city);
	}

	// 사전순 역목록 출력
	public ArrayList<StationDTO> getDic(){
		return new StationDAO().getDic();
	}
	

}
