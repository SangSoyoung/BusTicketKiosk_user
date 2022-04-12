package dto;


public class StationDTO {
	private String city;
	private String station;
	
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getStation() {
		return station;
	}
	public void setStation(String station) {
		this.station = station;
	}
	@Override
	public String toString() {
		return "StationDTO [city=" + city + ", station=" + station + "]";
	}
	
}
