package com.mycompany.mymatch.dto;

public class Guide {
	private String gid;
	private String glocal;
	private String gintro;
	private String gable;
	private int count;
	private String mname;
	private String savedfile;

	public String getGable() {
		return gable;
	}
	public void setGable(String gable) {
		this.gable = gable;
	}
	public String getGid() {
		return gid;
	}
	public void setGid(String gid) {
		this.gid = gid;
	}
	public String getGlocal() {
		return glocal;
	}
	public void setGlocal(String glocal) {
		this.glocal = glocal;
	}
	public String getGintro() {
		return gintro;
	}
	public void setGintro(String gintro) {
		this.gintro = gintro;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
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
