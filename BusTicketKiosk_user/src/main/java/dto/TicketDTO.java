package dto;

import java.util.Arrays;

public class TicketDTO {
	
	private int bcode;
	private String dpt_st;
	private String arrv_st;
	private String ddate;
	private String grade;
	private String company;
	private int adult;
	private int student;
	private int kid;
	private int pnum;
	private int price;
	private String seatNo; // 예약된 좌석 정보
	private String[] seatArr; // 고객이 선택한 좌석
	
	public int getBcode() {
		return bcode;
	}
	public void setBcode(int bcode) {
		this.bcode = bcode;
	}
	public String getDpt_st() {
		return dpt_st;
	}
	public void setDpt_st(String dpt_st) {
		this.dpt_st = dpt_st;
	}
	public String getArrv_st() {
		return arrv_st;
	}
	public void setArrv_st(String arrv_st) {
		this.arrv_st = arrv_st;
	}
	public String getDdate() {
		return ddate;
	}
	public void setDdate(String ddate) {
		this.ddate = ddate;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public int getAdult() {
		return adult;
	}
	public void setAdult(int adult) {
		this.adult = adult;
	}
	public int getStudent() {
		return student;
	}
	public void setStudent(int student) {
		this.student = student;
	}
	public int getKid() {
		return kid;
	}
	public void setKid(int kid) {
		this.kid = kid;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	public String getSeatNo() {
		return seatNo;
	}
	public void setSeatNo(String seatNo) {
		this.seatNo = seatNo;
	}
	
	public String[] getSeatArr() {
		return seatArr;
	}
	public void setSeatArr(String[] seatArr) {
		this.seatArr = seatArr;
	}
	@Override
	public String toString() {
		return "TicketDTO [bcode=" + bcode + ", dpt_st=" + dpt_st + ", arrv_st=" + arrv_st + ", ddate=" + ddate
				+ ", grade=" + grade + ", company=" + company + ", adult=" + adult + ", student=" + student + ", kid="
				+ kid + ", pnum=" + pnum + ", price=" + price + ", seatNo=" + seatNo + ", seatArr="
				+ Arrays.toString(seatArr) + "]";
	}
	
	
	
	
}
