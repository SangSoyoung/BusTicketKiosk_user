package test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.sql.Connection;
import java.util.ArrayList;

import org.junit.Test;

import dao.BusDAO;
import dto.TimetableDTO;

public class DAOtest {

	@Test
	public void dbConTest() {
		BusDAO bdao = new BusDAO();
		Connection con = bdao.getConnection();
		
		assertNotNull(con);
	}
	
	@Test
	public void timeTable() {
		BusDAO bdao = new BusDAO();
		ArrayList<TimetableDTO> timeTable = bdao.goTimeTable("2022-01-18", "15:30", "[서울]", "[부산]");
		
		assertEquals(timeTable.size(), 1);
		
	}

}
