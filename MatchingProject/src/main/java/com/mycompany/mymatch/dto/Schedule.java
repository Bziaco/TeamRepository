package com.mycompany.mymatch.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Schedule {
	private int sno;
	private String stitle;
	private String scontent;
	private String mid;
	private Date sdate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date sstart;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date send;

	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getStitle() {
		return stitle;
	}
	public void setStitle(String stitle) {
		this.stitle = stitle;
	}
	public String getScontent() {
		return scontent;
	}
	public void setScontent(String scontent) {
		this.scontent = scontent;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public Date getSdate() {
		return sdate;
	}
	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}
	public Date getSstart() {
		return sstart;
	}
	public void setSstart(Date sstart) {
		this.sstart = sstart;
	}
	public Date getSend() {
		return send;
	}
	public void setSend(Date send) {
		this.send = send;
	}
	
	
	
	
}
