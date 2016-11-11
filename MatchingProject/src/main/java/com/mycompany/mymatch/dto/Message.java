package com.mycompany.mymatch.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Message {
	private int mno;
	private String mcontent;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date mdate;
	private String mfrom;
	private String mto;
	
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getMcontent() {
		return mcontent;
	}
	public void setMcontent(String mcontent) {
		this.mcontent = mcontent;
	}
	public Date getMdate() {
		return mdate;
	}
	public void setMdate(Date mdate) {
		this.mdate = mdate;
	}
	public String getMfrom() {
		return mfrom;
	}
	public void setMfrom(String mfrom) {
		this.mfrom = mfrom;
	}
	public String getMto() {
		return mto;
	}
	public void setMto(String mto) {
		this.mto = mto;
	}
}
