package com.mycompany.mymatch.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.mymatch.dto.Member;
import com.mycompany.mymatch.service.MatchingService;

@Controller
@RequestMapping("/matching") 
public class MatchingController {  
	@Autowired
	public MatchingService matchingService;
	
	@RequestMapping("/matchList")
	public String match() {
		return "matching/matchList";
	}
	
	@RequestMapping("/tourList")
	public String tourList(HttpSession session, Model model) {
		String gid = (String) session.getAttribute("login");
		List<Member> list = matchingService.getMatchingToureList(gid);
		model.addAttribute("list", list);
		return "matching/tourList";
	}
	
	@RequestMapping("/guideList")
	public String guideList(HttpSession session, Model model) {
		String mid = (String) session.getAttribute("login");
		List<Member> list = matchingService.getMatchingGuideList(mid);
		model.addAttribute("list", list);
		return "matching/guideList";
	}

}
