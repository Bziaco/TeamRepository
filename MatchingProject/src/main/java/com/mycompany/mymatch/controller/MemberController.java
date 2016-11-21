package com.mycompany.mymatch.controller;

import java.io.File;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.mymatch.dto.Member;
import com.mycompany.mymatch.service.MemberService;


@Component
@RequestMapping("/member")
public class MemberController {
	@Autowired
	public MemberService memberService;

//--------------------------------------------------------------------------------------------------------------------------		

	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(String mid, String mpassword, HttpSession session, Model model){
		String strResult = "LOGIN_SUCCESS";
		int result = memberService.login(mid, mpassword);
		if(result == MemberService.LOGIN_FAIL_MPASSWORD){
			strResult = "LOGIN_FAIL_MPASSWORD";
		} else if(result == MemberService.LOGIN_FAIL_MID) {
			strResult = "LOGIN_FAIL_MID";
		} else {
			session.setAttribute("login", mid); 
		}
		model.addAttribute("result", strResult);
		return "member/login";
	}
//--------------------------------------------------------------------------------------------------------------------------	
	
	@RequestMapping(value="/findMid", method=RequestMethod.GET)
	public String findMidForm() {
		return "member/findMidForm";
	}
	
	@RequestMapping(value="/findMid", method=RequestMethod.POST)
	public String findMid(String memail, Model model, HttpSession session) {
		String mid = memberService.findMid(memail);
		if(mid == null) {
			model.addAttribute("error", "�씠硫붿씪�씠 議댁옱 �븯吏� �븡�뒿�땲�떎.");
			return "member/findMidForm";
		}
		session.setAttribute("findMid", mid);
		return "redirect:/member/login";
	}
	
//--------------------------------------------------------------------------------------------------------------------------		
	
	
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(Member member, HttpServletRequest request, Model model){
		String strResult = "success";
		try{
			
			System.out.println("mid : " + member.getMid());
			System.out.println("mpassword : " + member.getMpassword());
			System.out.println("mnickname : " + member.getMnickname());
			System.out.println("mname : " + member.getMname());
			System.out.println("mage : " + member.getMage());
			System.out.println("msex : " + member.getMsex());
			System.out.println("memail : " + member.getMemail());
			System.out.println("mlocal :" + member.getMlocal());
			System.out.println("mtel : " + member.getMtel());
			System.out.println("originalfilename: " + member.getMphoto().getOriginalFilename());
			System.out.println("mimetype: " + member.getMphoto().getContentType());
			
			
			String savedfile = new Date().getTime() + member.getMphoto().getOriginalFilename();
			String savePath = request.getServletContext().getRealPath("/WEB-INF/img/photo/" + savedfile);
			member.getMphoto().transferTo(new File(savePath));
			
			member.setOriginalfile(member.getMphoto().getOriginalFilename());
			member.setMimetype(member.getMphoto().getContentType());
			member.setSavedfile(savedfile);

			int result = memberService.join(member);
		} catch(Exception e){
			e.printStackTrace();
			strResult = "fail";
		}
		model.addAttribute("result", strResult);
		return "member/join";
	}
	
//----------------------------------------------------------------------------------------------------------------------------	
	
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		String mid = (String) session.getAttribute("login");
		int result = memberService.logout();
		if(result == MemberService.LOGIN_SUCCESS){
		session.removeAttribute("login");
	}
		return "redirect:/";
	}

	
//-------------------------------------------------------------------------------------------------------------------------------
	
	@RequestMapping("/info")
	public String info(String mpassword, HttpSession session, Model model) {
		String mid = (String) session.getAttribute("login");
		Member member = memberService.getMember(mid);
		model.addAttribute("member", member);
		return "member/info";
	}
	
	@RequestMapping(value="/passwordmodify", method=RequestMethod.POST)
	public String checkPassword(String mpassword, HttpSession session, Model model){
		String mid = (String) session.getAttribute("login");
		int result = memberService.checkPassword(mid, mpassword);
		if(result == MemberService.PASSWORD_SUCCESS) {
			Member member = memberService.getMember(mid);
			model.addAttribute("member", member);
		}
		return "member/passwordmodify";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modify(Member member, Model model, HttpServletRequest request, HttpSession session){
		String strResult = "success";
		try{
		System.out.println("mpassword : " + member.getMpassword());
		System.out.println("mnickname : " + member.getMnickname());
		System.out.println("mname : " + member.getMname());
		System.out.println("mage : " + member.getMage());
		System.out.println("msex : " + member.getMsex());
		System.out.println("memail : " + member.getMemail());
		System.out.println("mlocal :" + member.getMlocal());
		System.out.println("mtel : " + member.getMtel());
		System.out.println("originalfilename: " + member.getMphoto().getOriginalFilename());
		System.out.println("mimetype: " + member.getMphoto().getContentType());

		
		String savedfile = new Date().getTime() + member.getMphoto().getOriginalFilename();
		String savePath = request.getServletContext().getRealPath("/WEB-INF/img/photo/" + savedfile);
		member.getMphoto().transferTo(new File(savePath));
		
		member.setOriginalfile(member.getMphoto().getOriginalFilename());
		member.setMimetype(member.getMphoto().getContentType());
		member.setSavedfile(savedfile);
		
		int result = memberService.modify(member);
		} catch(Exception e){
			e.printStackTrace();
			strResult = "fail";
		}
		model.addAttribute("result", strResult);
		return "member/modify";
	}
}
