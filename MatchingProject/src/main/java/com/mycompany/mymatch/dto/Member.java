package com.mycompany.mymatch.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Member { //member 회원정보
	private String mid;
	private String mpassword;
	private String mnickname;
	private String mname;
	private int mage;
	private String msex;
	private String memail;
	private String mlocal;
	private String mtel;
	private MultipartFile mphoto;
	private String originalfile;
	private String savedfile;
	private String mimetype;
	private Date mmatchingdate;
	
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpassword() {
		return mpassword;
	}
	public void setMpassword(String mpassword) {
		this.mpassword = mpassword;
	}
	public String getMnickname() {
		return mnickname;
	}
	public void setMnickname(String mnickname) {
		this.mnickname = mnickname;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public int getMage() {
		return mage;
	}
	public void setMage(int mage) {
		this.mage = mage;
	}
	public String getMsex() {
		return msex;
	}
	public void setMsex(String msex) {
		this.msex = msex;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public String getMlocal() {
		return mlocal;
	}
	public void setMlocal(String mlocal) {
		this.mlocal = mlocal;
	}
	public String getMtel() {
		return mtel;
	}
	public void setMtel(String mtel) {
		this.mtel = mtel;
	}
	public String getOriginalfile() {
		return originalfile;
	}
	public void setOriginalfile(String originalfile) {
		this.originalfile = originalfile;
	}
	public String getSavedfile() {
		return savedfile;
	}
	public void setSavedfile(String savedfile) {
		this.savedfile = savedfile;
	}
	public String getMimetype() {
		return mimetype;
	}
	public void setMimetype(String mimetype) {
		this.mimetype = mimetype;
	}
	public MultipartFile getMphoto() {
		return mphoto;
	}
	public void setMphoto(MultipartFile mphoto) {
		this.mphoto = mphoto;
	}
	public Date getMmatchingdate() {
		return mmatchingdate;
	}
	public void setMmatchingdate(Date mmatchingdate) {
		this.mmatchingdate = mmatchingdate;
	}

}
