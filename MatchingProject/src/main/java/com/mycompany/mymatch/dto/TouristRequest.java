package com.mycompany.mymatch.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class TouristRequest {
	private int trno;
	private String mid;
	private int bminor;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date requestdate;
	
	public int getTrno() {
		return trno;
	}
	public void setTrno(int trno) {
		this.trno = trno;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getBminor() {
		return bminor;
	}
	public void setBminor(int bminor) {
		this.bminor = bminor;
	}
	public Date getRequestdate() {
		return requestdate;
	}
	public void setRequestdate(Date requestdate) {
		this.requestdate = requestdate;
	}
	
	

	

}
