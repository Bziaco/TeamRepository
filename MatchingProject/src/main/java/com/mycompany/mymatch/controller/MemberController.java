package com.mycompany.mymatch.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.mymatch.dto.Member;
import com.mycompany.mymatch.dto.Message;
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
		System.out.println("logout");
		session.removeAttribute("login");
		return "member/logout";
	}

	
//-------------------------------------------------------------------------------------------------------------------------------
	
	@RequestMapping(value="/info")
	public String info(Member member, HttpSession session, Model model, HttpServletRequest request) {
		String mid = (String) session.getAttribute("login");
		member = memberService.getMember(mid);
		if(member.getMphoto()!= null && !member.getMphoto().isEmpty()) {
			System.out.println("originalfilename: " + member.getMphoto().getOriginalFilename());
			System.out.println("mimetype: " + member.getMphoto().getContentType());
			
			String savedfile = new Date().getTime() + member.getMphoto().getOriginalFilename();
			String savePath = request.getServletContext().getRealPath("/WEB-INF/img/photo/" + savedfile);
			try {
				member.getMphoto().transferTo(new File(savePath));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			member.setOriginalfile(member.getMphoto().getOriginalFilename());
			member.setMimetype(member.getMphoto().getContentType());
			member.setSavedfile(savedfile);
		}
		model.addAttribute("member", member);
		System.out.println(member.getSavedfile());
		System.out.println(member.getMimetype());
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
		String mid = (String) session.getAttribute("login");	
		member.setMid(mid);
		
		System.out.println("mid : " + member.getMid());
		System.out.println("mpassword : " + member.getMpassword());
		System.out.println("mnickname : " + member.getMnickname());
		System.out.println("mname : " + member.getMname());
		System.out.println("mage : " + member.getMage());
		System.out.println("msex : " + member.getMsex());
		System.out.println("memail : " + member.getMemail());
		System.out.println("mlocal :" + member.getMlocal());
		System.out.println("mtel : " + member.getMtel());
		
		if(member.getMphoto()!= null && !member.getMphoto().isEmpty()) {
			System.out.println("originalfilename: " + member.getMphoto().getOriginalFilename());
			System.out.println("mimetype: " + member.getMphoto().getContentType());
			
			String savedfile = new Date().getTime() + member.getMphoto().getOriginalFilename();
			String savePath = request.getServletContext().getRealPath("/WEB-INF/img/photo/" + savedfile);
			member.getMphoto().transferTo(new File(savePath));
			
			member.setOriginalfile(member.getMphoto().getOriginalFilename());
			member.setMimetype(member.getMphoto().getContentType());
			member.setSavedfile(savedfile);
		}
		
		int result = memberService.modify(member);

		} catch(Exception e){
			e.printStackTrace();
			strResult = "fail";
		}
		model.addAttribute("result", strResult);
		return "member/modify";
	}
	
	
	@RequestMapping("/withdraw")
	public String withdraw(String mid, Member member, HttpSession session){
		mid = (String) session.getAttribute("login");
		member.setMid(mid);
		System.out.println("widthdrawController: " + member.getMid());
		memberService.withdraw(member.getMid());
		
		return "member/withdraw";
	}
}
