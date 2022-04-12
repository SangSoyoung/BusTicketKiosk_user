package dto;

public class TimetableDTO {
	private String busNo;
	private String dpt_st;
	private String arrv_st;
	private String ddate;
	private String adate;
	private int seat;
	private int unBookedSeat;
	private String grade;
	private String company;

	public String getBusNo() {
		return busNo;
	}
	public void setBusNo(String busNo) {
		this.busNo = busNo;
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
	public String getAdate() {
		return adate;
	}
	public void setAdate(String adate) {
		this.adate = adate;
	}
	public int getSeat() {
		return seat;
	}
	public void setSeat(int seat) {
		this.seat = seat;
	}
	public int getUnBookedSeat() {
		return unBookedSeat;
	}
	public void setUnBookedSeat(int unBookedSeat) {
		this.unBookedSeat = unBookedSeat;
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
	@Override
	public String toString() {
		return "BusDTO [ddate=" + ddate + ", adate=" + adate + ", unBookedSeat=" + unBookedSeat + ", grade=" + grade + ", company="
				+ company + "]";
	}
	
	
}
