package com.mycompany.mymatch.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Matching {
	private int matchno;
	private String gid;
	private String mid;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date matchdate;
	private Double score;
	private int bno;
	private String btitle;
	private String bcontent;
	private String bwriter;
	private int bhitcount;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date bdate;
	private String savedfile;
	
	public int getMatchno() {
		return matchno;
	}
	public void setMatchno(int matchno) {
		this.matchno = matchno;
	}
	public String getGid() {
		return gid;
	}
	public void setGid(String gid) {
		this.gid = gid;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public Date getMatchdate() {
		return matchdate;
	}
	public void setMatchdate(Date matchdate) {
		this.matchdate = matchdate;
	}
	public Double getScore() {
		return score;
	}
	public void setScore(Double score) {
		this.score = score;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public String getBwriter() {
		return bwriter;
	}
	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}
	public int getBhitcount() {
		return bhitcount;
	}
	public void setBhitcount(int bhitcount) {
		this.bhitcount = bhitcount;
	}
	public Date getBdate() {
		return bdate;
	}
	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}
	public String getSavedfile() {
		return savedfile;
	}
	public void setSavedfile(String savedfile) {
		this.savedfile = savedfile;
	}
	
	
	
}
