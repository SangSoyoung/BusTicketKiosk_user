package test;

import java.sql.Connection;

import dao.SeatDAO;

public class dbConTest {
	public static void main(String[] args) {
		
		SeatDAO mdao = new SeatDAO();
		Connection con = mdao.getConnection();
		
		if(con != null) {
			System.out.println("db연결성공!");
		}
	}
}
