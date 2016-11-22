package com.mycompany.mymatch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dao.MemberDao;
import com.mycompany.mymatch.dto.Member;
import com.mycompany.mymatch.dto.Message;

@Component
public class MemberService {
	@Autowired
	public static final int JOIN_SUCCESS = 0;
	public static final int JOIN_FAIL =1;
	
	public static final int LOGIN_SUCCESS = 0; 
	public static final int LOGIN_FAIL_MID = 1; 
	public static final int LOGIN_FAIL_MPASSWORD = 2;
	
	public static final int LOGOUT_SUCCESS = 0;
	public static final int LOGOUT_FAIL= 1;
	
	public static final int MODIFY_SUCCESS = 0;
	public static final int MODIFY_FAIL = 1;
	
	public static final int WITHDAW_SUCCESS = 0;
	public static final int WITHDRAW_FAIL = 1;
	
	
	public static final int PASSWORD_SUCCESS = 0;
	public static final int PASSWORD_FAIL = 1;
	
	@Autowired
	private MemberDao memberDao;
	
	public int join(Member member) {
		memberDao.insert(member);
		return JOIN_SUCCESS;
	}
	
//--------------------------------------------------------------------------------------------	
	
	public int login(String mid, String mpassword) {
		Member member = memberDao.selectByMid(mid);
		if(member == null) {return LOGIN_FAIL_MID;}
		if(member.getMpassword().equals(mpassword)==false) {return LOGIN_FAIL_MPASSWORD;}
		return LOGIN_SUCCESS;
	}
	

//--------------------------------------------------------------------------------------------		
	
	public int logout() {
		return LOGOUT_SUCCESS;
	}

	
//--------------------------------------------------------------------------------------------		
	
	public String findMpassword(String mid, String memail) {
		Member member = memberDao.selectByMid(mid);
		if(member == null) return null;
		if(member.getMemail().equals(memail)==false) return null;
		return member.getMpassword();
	}

	
//--------------------------------------------------------------------------------------------			
	
	
	public String findMid(String memail) {
		return memberDao.selectByMemail (memail);
	}
	
	
//--------------------------------------------------------------------------------------------			
	
	public Member getMember(String mid) {
		Member member = memberDao.selectByMid(mid);
		return member;
	}
	
	
//--------------------------------------------------------------------------------------------			
	
	
	public int modify(Member member) {
		Member dbMember = memberDao.selectByMid(member.getMid());
		if(member.getMpassword() != null) {
			dbMember.setMpassword(member.getMpassword());
		}
		dbMember.setMnickname(member.getMnickname());
		dbMember.setMname(member.getMname());
		dbMember.setMage(member.getMage());
		dbMember.setMsex(member.getMsex());
		dbMember.setMtel(member.getMtel());
		dbMember.setMemail(member.getMemail());
		dbMember.setMlocal(member.getMlocal());
		if(member.getSavedfile() != null) {
			dbMember.setOriginalfile(member.getOriginalfile());
			dbMember.setSavedfile(member.getSavedfile());
			dbMember.setMimetype(member.getMimetype());
		} else {
			System.out.println(dbMember.getOriginalfile());
		}
		int row = memberDao.update(dbMember);
		if(row !=1) {return MODIFY_FAIL;}
		return MODIFY_SUCCESS;
	}
	
	
//--------------------------------------------------------------------------------------------		
	
	public int withdraw(String mid, String mpassword) {
		Member member = memberDao.selectByMid(mid);
		if(member.getMpassword().equals(mpassword) == false) {return WITHDRAW_FAIL;}
			memberDao.delete(mid);
			return WITHDAW_SUCCESS;
	}
	
	
//--------------------------------------------------------------------------------------------		
	
	
	public boolean isMid(String mid) {
		Member member = memberDao.selectByMid(mid);
		if(member==null) return false;
		return true;
	}

	
	public int checkPassword(String mid, String mpassword) {
		Member member = memberDao.selectByMid(mid);
		if(member.getMpassword().equals(mpassword)) {
			return PASSWORD_SUCCESS;
		} else {
			return PASSWORD_FAIL;
		}
	}

}
