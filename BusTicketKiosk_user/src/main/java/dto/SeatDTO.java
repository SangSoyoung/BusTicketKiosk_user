package dto;

public class SeatDTO {
	
	private int seatNo;
	private int booking;
	private int unBookedSeat;
	private int bookedSeat;
	
	public int getSeatNo() {
		return seatNo;
	}
	public void setSeatNo(int seatNo) {
		this.seatNo = seatNo;
	}
	public int getBooking() {
		return booking;
	}
	public void setBooking(int booking) {
		this.booking = booking;
	}
	
	
	public int getUnBookedSeat() {
		return unBookedSeat;
	}
	public void setUnBookedSeat(int unBookedSeat) {
		this.unBookedSeat = unBookedSeat;
	}
	
	public int getBookedSeat() {
		return bookedSeat;
	}
	public void setBookedSeat(int bookedSeat) {
		this.bookedSeat = bookedSeat;
	}
	@Override
	public String toString() {
		return "SeatDTO [seatNo=" + seatNo + ", booking=" + booking + "]";
	}
	
	
}
