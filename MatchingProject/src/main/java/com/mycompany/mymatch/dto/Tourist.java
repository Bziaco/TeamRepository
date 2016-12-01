package com.mycompany.mymatch.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Tourist {
	private String tid;
	private String tlocal;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date tstartdate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date tenddate;
	private String tintro;
	private String mname;
	private String savedfile;
	
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getTlocal() {
		return tlocal;
	}
	public void setTlocal(String tlocal) {
		this.tlocal = tlocal;
	}
	public Date getTstartdate() {
		return tstartdate;
	}
	public void setTstartdate(Date tstartdate) {
		this.tstartdate = tstartdate;
	}
	public Date getTenddate() {
		return tenddate;
	}
	public void setTenddate(Date tenddate) {
		this.tenddate = tenddate;
	}
	public String getTintro() {
		return tintro;
	}
	public void setTintro(String tintro) {
		this.tintro = tintro;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getSavedfile() {
		return savedfile;
	}
	public void setSavedfile(String savedfile) {
		this.savedfile = savedfile;
	}
	
	
	
}
