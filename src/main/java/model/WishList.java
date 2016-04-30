package model;

import java.util.Date;

public class WishList {
	private String userName;
	private String imdbId;
	private String email;
	private int day,month,year;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getImdbId() {
		return imdbId;
	}

	public void setImdbId(String imdbId) {
		this.imdbId = imdbId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public int getDay() {
		return day;
	}
	public int  getMonth() {
		return month;
	}
	public int getYear() {
		return year;
	}

	
	public void setDate(int day, int month, int year) {
		// TODO Auto-generated method stub
		this.day=day;
		this.month=month;
		this.year=year;
	}

}
