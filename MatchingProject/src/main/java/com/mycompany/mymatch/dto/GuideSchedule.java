package com.mycompany.mymatch.dto;



public class GuideSchedule {
	private int sno;
	private String gid;
	private Member tourist;
	private Schedule schedule;
	
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getGid() {
		return gid;
	}
	public void setGid(String gid) {
		this.gid = gid;
	}
	public Member getTourist() {
		return tourist;
	}
	public void setTourist(Member tourist) {
		this.tourist = tourist;
	}
	public Schedule getSchedule() {
		return schedule;
	}
	public void setSchedule(Schedule schedule) {
		this.schedule = schedule;
	}	
}
