package com.mycompany.myweb.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.myweb.dao.memberBoardDao;
import com.mycompany.myweb.dto.Member;

@Component
public class MemberService {
	public static final int JOIN_SUCCESS = 0;
	public static final int JOIN_FIAL = 1;
	
	public static final int LOGIN_SUCCESS = 0;
	public static final int LOGIN_FAIL_MID = 1;
	public static final int LOGIN_FAIL_MPASSWORD = 2;
	
	public static final int LOGOUT_SUCCESS = 0;
	public static final int LOGOUT_FAIL = 1;

	public static final int MODIFY_SUCCESS = 0;
	public static final int MODIFY_FAIL = 1;
	
	public static final int WITHDRAW_SUCCESS = 0;
	public static final int WITHDRAW_FIAL = 1;
	
	//insert는 1또는 예외로 값을 리턴하기 때문에
	//3가지 상태가 있다면 무조건 상수로 정의
	//성공 또는 예외처럼 2가지 경우라면 void로 처리해도 됨
	//무언가 존재하냐 안하냐는 boolean으로 처리
	
	@Autowired
	private memberBoardDao memberDao;

	public int join(Member member){
		if(member.getMid() == null)
			memberDao.insert(member);
		return JOIN_SUCCESS;
	}
	public int login(String mid, String mpassword){
		Member member = memberDao.selectByMid(mid);
		if(member == null) {return LOGIN_FAIL_MID; }
		if(member.getMpassword().equals(mpassword) == false){ return LOGIN_FAIL_MPASSWORD; }

		return LOGIN_SUCCESS;
	}
	//DB에 대한 정보를 지우기 위해 mid값을 받아온다
	//로그인이 되어있는 mid를 알기위해 
	public int logout(String mid){
		return LOGOUT_SUCCESS;
	}
	public String findMPassword(String mid, String memail){
		//selectByMid자체가 id가 있는지 없는지를 검사하는 것이기 때문에 member가 null이라면 id가 없다는 것
		Member member = memberDao.selectByMid(mid);
		if(member == null) return null;
		if(member.getMemail().equals(memail) == false) return null;
		return member.getMpassword();
	}
	public String findMid(String memail){
		return memberDao.selectByMemail(memail);
	}
	public Member info(String mid, String mpassword){
		//String mid = (String) session.getAttribute("login");
		Member member = memberDao.selectByMid(mid);
		if(member.getMpassword().equals(mpassword) == false) return null;
		return member;
	}
	public int modify(Member member, HttpSession session){
		/*String mid = (String) session.getAttribute("login");
		member = memberDao.selectByMid(mid);
		if(member.getMid().equals(mid) == false){ return MODIFY_FAIL; }
		memberDao.update(member);
		return MODIFY_SUCCESS;*/
		Member dbMember = memberDao.selectByMid(member.getMid());
		if(dbMember.getMpassword().equals(member.getMpassword()) == false) { return MODIFY_FAIL; };
		int row = memberDao.update(member);
		if(row != 1){ return MODIFY_FAIL; }
		return MODIFY_SUCCESS;
	}
	public int withdraw(String mid, String mpassword){
		Member member = memberDao.selectByMid(mid);
		if(member.getMpassword().equals(mpassword) == false){ return WITHDRAW_FIAL; }
		memberDao.delete(mid);
		logout(mid);
		return WITHDRAW_SUCCESS;
	}
	public boolean isMid(String mid){
		Member member = memberDao.selectByMid(mid);
		//if(member.getMid().equals(mid) == true){ return false; }
		if(member == null) return false; 
		return true;
	}
}
